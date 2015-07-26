From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 19:59:49 +0200
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <1437932796-16216-1-git-send-email-bas@bmail.ru>
References: <1437932796-16216-1-git-send-email-bas@bmail.ru>
Message-ID: <20150726175949.GI3770@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mikhail, All,

On 2015-07-26 20:46 +0300, kyak spake thusly:
> From: Mikhail Peselnik <bas@bmail.ru>
> 
> These flags need to be set so that the configure script would
> correctly use libICE from cross-toolchain rather than from host.
> Also, the xterm package is missing the freetype2 dependency, as
> noted by Romain Naour.
> 
> This fix is similar to "package/efl/libevas: x-includes and x-libraries
> must be set for cross-compiling" done by Romain Naour on libecore.
> 
> Signed-off-by: Mikhail Peselnik <bas@bmail.ru>

The From filed does not match your Signed-off-by; please fix your git
config with:

    git config --global user.name 'Mikhail Peselnik'
    git config --global user.email 'bas at bmail.ru'

> ---
>  package/xterm/Config.in | 1 +
>  package/xterm/xterm.mk  | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xterm/Config.in b/package/xterm/Config.in
> index e17d2c6..f549df4 100644
> --- a/package/xterm/Config.in
> +++ b/package/xterm/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_XTERM
>  	select BR2_PACKAGE_XLIB_LIBXAW
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_PACKAGE_FREETYPE

This should be a 'select' rather than a 'depends on'.

>  	help
>  	  xterm terminal emulator
>  
> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
> index 56f692d..f7a332d 100644
> --- a/package/xterm/xterm.mk
> +++ b/package/xterm/xterm.mk
> @@ -10,6 +10,9 @@ XTERM_SITE = ftp://invisible-island.net/xterm
>  XTERM_DEPENDENCIES = ncurses xlib_libXaw
>  XTERM_LICENSE = MIT
>  XTERM_LICENSE_FILES = version.c
> -XTERM_CONF_OPTS = --enable-256-color
> -
> +XTERM_CONF_OPTS = --enable-256-color \
> +	--x-includes=$(STAGING_DIR)/usr/include \
> +	--x-libraries=$(STAGING_DIR)/usr/lib \
> +	--with-freetype-cflags=$(STAGING_DIR)/usr/include \

I guess this should instead be: -I$(STAGING_DIR)/usr/include

> +	--with-freetype-libs=$(STAGING_DIR)/usr/lib

And this: -L$(STAGING_DIR)/usr/lib

You may also want to add:

    --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.4.6
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
