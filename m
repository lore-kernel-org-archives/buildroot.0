From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 3 Feb 2015 00:00:11 +0100
Subject: [Buildroot] [PATCH 15/16] package/vim: add default vimrc
In-Reply-To: <1421684056-5266-16-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-16-git-send-email-maxtram95@gmail.com>
Message-ID: <CAHXCMM+ZREk+19uv9zARWU7O26BP5u11R=PoTQ8BkkKeSh3mMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxim,

On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> Support /etc/vim/vimrc as system-wide vimrc file. Add some default
> sample vimrc.
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/vim/vim.mk | 11 +++++++++++
>  package/vim/vimrc  | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 package/vim/vimrc
>
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index da84d14..992e41b 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -28,6 +28,12 @@ VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
>  VIM_LICENSE = Charityware
>  VIM_LICENSE_FILES = README.txt
>
> +define VIM_VIMRC_HOOK
> +       echo '#define SYS_VIMRC_FILE "/etc/vim/vimrc"' >> $(@D)/src/feature.h
> +endef
> +
> +VIM_PRE_CONFIGURE_HOOKS += VIM_VIMRC_HOOK
> +
>  define VIM_INSTALL_TARGET_CMDS
>         cd $(@D)/src; \
>                 $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
> @@ -51,6 +57,11 @@ define VIM_INSTALL_VI_SYMLINK
>  endef
>  VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VI_SYMLINK
>
> +define VIM_INSTALL_VIMRC
> +       $(INSTALL) -D -m 644 package/vim/vimrc $(TARGET_DIR)/etc/vim/vimrc
> +endef
> +VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_VIMRC
> +
>  ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
>  VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
>  VIM_POST_INSTALL_TARGET_HOOKS += VIM_REMOVE_DOCS
> diff --git a/package/vim/vimrc b/package/vim/vimrc
> new file mode 100644
> index 0000000..bfc2087
> --- /dev/null
> +++ b/package/vim/vimrc
> @@ -0,0 +1,14 @@
> +set nocompatible
> +
> +set ai
> +set background=dark
> +set backspace=indent,eol,start
> +set nomodeline
> +set ruler
> +
> +set ignorecase smartcase incsearch hlsearch
> +
> +syntax on
> +
> +filetype plugin on
> +filetype indent on
> --
> 2.2.1
>

I'm usually not so fond of this kind fo config... just for comfort
IMHO ;-) but since this one is fairly short:

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
