From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 28 Oct 2015 09:09:43 +0100
Subject: [Buildroot] [PATCH v2 1/2] zbar: new package
In-Reply-To: <1445940469-27154-1-git-send-email-sv99@inbox.ru>
References: <1445940469-27154-1-git-send-email-sv99@inbox.ru>
Message-ID: <CAGm1_ktTUgBqdatW7UaonAqoT_4KPJqRvHJbiNwcTuXR2yOvPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 27, 2015 at 11:07 AM, Viacheslav Volkov <sv99@inbox.ru> wrote:
> QR and barcode scanner library and gst-plugins-bad.
>
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> ---
>  package/Config.in                     |  1 +
>  package/zbar/0001-zbar-autoconf.patch | 16 ++++++++++++++++
>  package/zbar/Config.in                |  7 +++++++
>  package/zbar/zbar.mk                  | 22 ++++++++++++++++++++++
>  4 files changed, 46 insertions(+)
>  create mode 100644 package/zbar/0001-zbar-autoconf.patch
>  create mode 100644 package/zbar/Config.in
>  create mode 100644 package/zbar/zbar.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 10ff94e..778b1e1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -854,6 +854,7 @@ menu "Graphics"
>         source "package/webkit/Config.in"
>         source "package/webkitgtk24/Config.in"
>         source "package/webp/Config.in"
> +       source "package/zbar/Config.in"
>         source "package/zxing-cpp/Config.in"
>  endmenu
>
> diff --git a/package/zbar/0001-zbar-autoconf.patch b/package/zbar/0001-zbar-autoconf.patch
> new file mode 100644
> index 0000000..159f75e
> --- /dev/null
> +++ b/package/zbar/0001-zbar-autoconf.patch
> @@ -0,0 +1,16 @@
> +diff --git a/configure.ac b/configure.ac
> +index 256aedb..5aa5689 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3,10 +3,11 @@ AC_PREREQ([2.61])
> + AC_INIT([zbar], [0.10], [spadix at users.sourceforge.net])
> + AC_CONFIG_AUX_DIR(config)
> + AC_CONFIG_MACRO_DIR(config)
> +-AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
> ++AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-portability foreign subdir-objects std-options dist-bzip2])
> + AC_CONFIG_HEADERS([include/config.h])
> + AC_CONFIG_SRCDIR(zbar/scanner.c)
> + LT_PREREQ([2.2])
> ++m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
> + LT_INIT([dlopen win32-dll])
> + LT_LANG([Windows Resource])
> diff --git a/package/zbar/Config.in b/package/zbar/Config.in
> new file mode 100644
> index 0000000..98bea66
> --- /dev/null
> +++ b/package/zbar/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_ZBAR
> +       bool "zbar"
> +    select BR2_PACKAGE_LIBV4L
> +       help
> +           QR and barcode scanner
> +
> +               http://zbar.sourceforge.net/

Fix indentation.

> diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
> new file mode 100644
> index 0000000..91527a1
> --- /dev/null
> +++ b/package/zbar/zbar.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# zbar
> +#
> +#############################################################
> +
> +#ZBAR_VERSION = 0.10
> +#ZBAR_SITE = http://downloads.sourceforge.net/project/zbar/zbar/$(ZBAR_VERSION)
> +ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
> +ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))

decide for version and remove commented lines

> +ZBAR_INSTALL_STAGING = YES
> +ZBAR_AUTORECONF = YES
> +ZBAR_DEPENDENCIES = libv4l
> +ZBAR_CONF_OPTS = --without-imagemagick --without-qt --without-gtk --without-python --without-x --without-jpeg --enable-shared=yes

add license info

> +
> +ZBAR_POST_BUILD_HOOKS += ZBAR_INSTALL_FIXUP
> +
> +define ZBAR_INSTALL_FIXUP
> +       touch $(@D)/doc/man/zbarcam.1
> +endef
> +
> +$(eval $(autotools-package))
> --
> 2.6.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
