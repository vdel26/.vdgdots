" don't bother with vi compatibility
set nocompatible
" (required for Vundle)
filetype off


" set the runtime path to include Vundle and initialize (required for Vundle)
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle mangage Vundle (required for Vundle)
Bundle 'gmarik/vundle'


" Bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
Bundle 'ervandew/supertab'
Bundle 'fxn/vim-monochrome'
Bundle 'itchyny/lightline.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'nginx.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'digitaltoad/vim-jade'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"


" Automatically detect file types (required for Vundle)
filetype plugin indent on


" enable syntax highlighting
syntax enable


" colors
set background=dark
colorscheme base16-default


set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set cursorline
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set hls                                                      " highlight search results
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=2                                                " actual tabs occupy 2 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full


" mouse related stuff
set mouse=a
set ttyfast                                                  " Optimize for fast terminal connections


" keybindings
let mapleader = ','
let g:ctrlp_working_path_mode = 'ra'
nmap <leader>t :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>a :Ag<SPACE>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" create :Ag command
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" conf is nginx
autocmd BufRead,BufNewFile *.conf set filetype=nginx

