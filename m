From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 13:45:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/lftp: bump to version 4.9.1
In-Reply-To: <20200117214530.2565320-1-fontaine.fabrice@gmail.com>
References: <20200117214530.2565320-1-fontaine.fabrice@gmail.com>
Message-ID: <20200118124514.GY22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-01-17 22:45 +0100, Fabrice Fontaine spake thusly:
> - Remove first patch and use --with-readline-lib as a slightly updated
>   version of this patch has been merged with:
>   https://github.com/lavv17/lftp/commit/af9fde5f93730d6803e8d9fdef2c58583b62c749
> - Remove autoreconf as it does not seem needed anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, along with mbedtls, cppzmq, and jpeg-turbo, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-fix-static-link-with-readline.patch  | 40 -------------------
>  package/lftp/lftp.hash                        |  6 +--
>  package/lftp/lftp.mk                          |  6 +--
>  3 files changed, 5 insertions(+), 47 deletions(-)
>  delete mode 100644 package/lftp/0001-fix-static-link-with-readline.patch
> 
> diff --git a/package/lftp/0001-fix-static-link-with-readline.patch b/package/lftp/0001-fix-static-link-with-readline.patch
> deleted file mode 100644
> index 339239668e..0000000000
> --- a/package/lftp/0001-fix-static-link-with-readline.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -fix static link with readline
> -
> -When readline is static library, we need to link against ncurses
> -because readline needs ncurses. It is because, dependent library's
> -symbols are not resolved when static library is built. Those symbols
> -are resolved program tries to link with static library.
> -
> -We can't pass linker flags for ncurses by setting LIBS environment
> -variable via <PKG>_CONF_ENV because it looks like build system is not
> -taking that into account and even though it would have been, order of
> -linking is important.
> -
> -We can't also pass linker flags for ncurses via --with-readline-libs
> -conf options because it causes lftp_LIB_READLINE macro to take readline
> -headers from host machine if available. To use --with-readline-libs
> -we need to set --with-readline=yes and --with-readline-inc to include
> -dir. But when --with-readline=yes, readline_prefix is computed based
> -on if headers can be found in /usr/local or /usr. If readline is
> -installed on host machine, then configure fails since we are using
> -headers for host machine. If headers are not found in /usr/local or /usr
> -then only path specified --with-readline-inc is taken into account.
> -So specifying linker flags for ncurses via --with-readline-libs will
> -not work in all cases.
> -
> -So it looks like, updating linker flags directly is only option to fix
> -static link issue against readline.
> -
> -Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> -
> ---- lftp-4.7.3/m4/lftp_lib_readline.m4.old	2016-08-08 19:49:12.217596470 +0530
> -+++ lftp-4.7.3/m4/lftp_lib_readline.m4	2016-08-08 19:49:46.265596398 +0530
> -@@ -108,7 +108,7 @@ AC_DEFUN([lftp_LIB_READLINE],
> - 	    readline_include_dir="$readline_include_dir/readline"
> - 	fi
> -         readline_ld_flags="-L$readline_prefix/lib"
> --        readline_lib_flags="-lreadline"
> -+        readline_lib_flags="-lreadline -lncurses"
> -         run_readline_test="yes"
> -     elif test "$readline_requested" = "yes"; then
> -         if test -n "$readline_include_dir" -a -n "$readline_lib_flags"; then
> diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
> index 3efa8bfff1..a2f60f95b0 100644
> --- a/package/lftp/lftp.hash
> +++ b/package/lftp/lftp.hash
> @@ -1,7 +1,7 @@
> -# From http://lftp.yar.ru/ftp/lftp-4.9.0.md5sum
> -md5 6e3268506895a446a6c83b6387534070  lftp-4.9.0.tar.xz
> +# From http://lftp.yar.ru/ftp/lftp-4.9.1.md5sum
> +md5 3da57b1960b1416e89a532c54a67a936  lftp-4.9.1.tar.xz
>  # Locally calculated after checking gpg signature
> -sha256 0b3b659e1969a31827a25861c01ccf71ac6d3f20ee256bdf6999d653e031a24e  lftp-4.9.0.tar.xz
> +sha256 5969fcaefd102955dd882f3bcd8962198bc537224749ed92f206f415207a024b  lftp-4.9.1.tar.xz
>  
>  # Hash for license file:
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
> index cb5785668e..9c568da677 100644
> --- a/package/lftp/lftp.mk
> +++ b/package/lftp/lftp.mk
> @@ -4,19 +4,17 @@
>  #
>  ################################################################################
>  
> -LFTP_VERSION = 4.9.0
> +LFTP_VERSION = 4.9.1
>  LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
>  LFTP_SITE = http://lftp.yar.ru/ftp
>  LFTP_LICENSE = GPL-3.0+
>  LFTP_LICENSE_FILES = COPYING
> -# Needed so that our libtool patch applies properly, and for patch
> -# 0001-fix-static-link-with-readline.patch.
> -LFTP_AUTORECONF = YES
>  LFTP_DEPENDENCIES = readline zlib host-pkgconf
>  
>  # Help lftp finding readline and zlib
>  LFTP_CONF_OPTS = \
>  	--with-readline=$(STAGING_DIR)/usr \
> +	--with-readline-lib="`$(PKG_CONFIG_HOST_BINARY) --libs readline`" \
>  	--with-zlib=$(STAGING_DIR)/usr
>  
>  ifneq ($(BR2_STATIC_LIBS),y)
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
