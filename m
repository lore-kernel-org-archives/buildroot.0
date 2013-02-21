From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 19:35:55 +0100
Subject: [Buildroot] [PATCH 01/13] libenca: new package
In-Reply-To: <9e6a6ffdeccd0105acb1491396ad28a8775cf322.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <9e6a6ffdeccd0105acb1491396ad28a8775cf322.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <201302211935.55764.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

I'm eager to see the following patch(es) finally adding XBMC! ;-)

On Thursday 21 February 2013 Maxime Hadjinlian wrote:
> Extremely Naive Charset Analyser.

[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index 3d7866a..e56c13f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -569,6 +569,7 @@ source "package/liblog4c-localtime/Config.in"
>  endmenu
>  
>  menu "Text and terminal handling"
> +source "package/libenca/Config.in"
>  source "package/enchant/Config.in"
>  source "package/libfribidi/Config.in"
>  source "package/icu/Config.in"

Order alphabetically, even taking account of the 'lib' prefix, please.
The order should be:
    enchant
    libenca
    libfribidi

[--SNIP--]
> diff --git a/package/libenca/libenca-1.9-dont-build-tools.patch b/package/libenca/libenca-1.9-dont-build-tools.patch
> new file mode 100644
> index 0000000..16c3747

Please, format patches as you would for commit message.
Do not forget to also SoB the patches.

[--SNIP--]
> diff --git a/package/libenca/libenca-1.9-fix-clean.patch b/package/libenca/libenca-1.9-fix-clean.patch
> new file mode 100644
> index 0000000..9c6f097
> --- /dev/null
> +++ b/package/libenca/libenca-1.9-fix-clean.patch
> @@ -0,0 +1,22 @@
> +--- libenca-1.9.orig/src/Makefile.in	2011-07-23 20:19:28.744327998 -0400
> ++++ libenca-1.9/src/Makefile.in	2011-07-23 20:22:47.894327936 -0400
> +@@ -694,7 +694,7 @@
> + 	cd $(DESTDIR)$(bindir); \
> + 	inst1=`echo enca | sed '$(transform)'`; \
> + 	inst2=`echo enconv | sed '$(transform)'`; \
> +-	$(LN_S) $$inst1$(EXEEXT) $$inst2$(EXEEXT)
> ++	ln -sf $$inst1$(EXEEXT) $$inst2$(EXEEXT)
> + 
> + uninstall-hook:
> + 	inst=`echo enconv | sed '$(transform)'`; \
> +--- libenca-1.9.orig/Makefile.in	2011-07-23 20:19:28.746327999 -0400
> ++++ libenca-1.9/Makefile.in	2011-07-23 20:36:48.742327668 -0400
> +@@ -768,7 +768,7 @@
> + 	cd $(DESTDIR)$(man1dir); \
> + 	inst1=`echo enca | sed '$(transform)'`.1; \
> + 	inst2=`echo enconv | sed '$(transform)'`.1; \
> +-	$(LN_S) $$inst1 $$inst2
> ++	$(LN_S)f $$inst1 $$inst2

Please, be consistent. In src/Makefile.in, you hard-code 'ln -sf', while
in Makefile.in, you use '$(LN_S)f' (which I find dubious, I'd rather that
you use '$(LN_S) -f'

> diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
> new file mode 100644
> index 0000000..e9dba18
> --- /dev/null
> +++ b/package/libenca/libenca.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# libenca
> +#
> +#############################################################
> +
> +LIBENCA_VERSION = 1.9
> +LIBENCA_SITE = http://dl.cihar.com/enca
> +LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.bz2
> +LIBENCA_INSTALL_STAGING = YES
> +LIBENCA_LICENSE = GPLv2
> +LIBENCA_LICENSE_FILES = COPYING
> +
> +LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes
> +LIBENCA_CONF_ENV += ac_cv_file__dev_urandom=yes
> +LIBENCA_CONF_ENV += ac_cv_file__dev_arandom=no
> +LIBENCA_CONF_ENV += ac_cv_file__dev_srandom=no
> +LIBENCA_CONF_ENV += yeti_cv_func_scanf_modif_size_t=yes

Please explain that yeti one.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
