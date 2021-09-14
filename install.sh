#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/tmux.conf.local $HOME/.tmux.conf.local
ln -s $(pwd)/vimrc $HOME/.vimrc
# ln -s $(pwd)/vim $HOME/.vim
# ln -s $(pwd)/emacs $HOME/.emacs
# ln -s $(pwd)/screenrc $HOME/.screenrc
rm -f $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/bash_profile $HOME/.bash_profile

ln -s $(pwd)/ohmyzsh-plugins/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

sudo apt-get --assume-yes install silversearcher-ag bat jq
# vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

sudo chsh -s "$(which zsh)" "$(whoami)"
