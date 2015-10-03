From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 3 Oct 2015 17:22:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] yad: new package
In-Reply-To: <1439486647-7872-1-git-send-email-james.knight@rockwellcollins.com>
References: <1439486647-7872-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <561000C4.9090004@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

a 0.31.1 version is available and it doesn't need the patch for the 
no-html stuff because it's already upstreamed.

Could you please send a new version of your patch?

Thanks,

Vincent.

On 13/08/15 18:24, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v1 -> v2:
>    - Increment to version 0.29.0 (with updated hash and patch fix).
>    - Removed complex gtk library selection. Defaults to libgtk3, if
>       available; elsewise, uses libgtk2 (suggested from comments by
>       Baruch Siach, Thomas Petazzoni and Peter Korsgaard).
> ---
>   package/Config.in                         |  1 +
>   package/yad/001-no-html-compile-fix.patch | 19 +++++++++++++++++++
>   package/yad/Config.in                     | 13 +++++++++++++
>   package/yad/yad.hash                      |  2 ++
>   package/yad/yad.mk                        | 24 ++++++++++++++++++++++++
>   5 files changed, 59 insertions(+)
>   create mode 100644 package/yad/001-no-html-compile-fix.patch
>   create mode 100644 package/yad/Config.in
>   create mode 100644 package/yad/yad.hash
>   create mode 100644 package/yad/yad.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 47d14d7..2472e79 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -292,6 +292,7 @@ comment "X applications"
>   	source "package/xscreensaver/Config.in"
>   	source "package/xterm/Config.in"
>   	source "package/xvkbd/Config.in"
> +	source "package/yad/Config.in"
>
>   comment "X libraries and helper libraries"
>   	source "package/libsexy/Config.in"
> diff --git a/package/yad/001-no-html-compile-fix.patch b/package/yad/001-no-html-compile-fix.patch
> new file mode 100644
> index 0000000..ebe9ff0
> --- /dev/null
> +++ b/package/yad/001-no-html-compile-fix.patch
> @@ -0,0 +1,19 @@
> +diff -Naur a/src/main.c b/src/main.c
> +--- a/src/main.c	2015-07-15 08:21:53.000000000 -0400
> ++++ b/src/main.c	2015-08-13 11:44:20.832548393 -0400
> +@@ -765,6 +765,7 @@
> +         ret = yad_print_run ();
> +         break;
> +
> ++#ifdef HAVE_HTML
> +       case YAD_MODE_HTML:
> +         /* Webkit doesn't handle focus for child dialogs when gtk_dialog_run() is used */
> +         /* FIXME: maybe this solution must be expanded to all dialogs */
> +@@ -775,6 +776,7 @@
> +
> +         gtk_main ();
> +         break;
> ++#endif
> +
> +       default:
> +         dialog = create_dialog ();
> diff --git a/package/yad/Config.in b/package/yad/Config.in
> new file mode 100644
> index 0000000..1e6776b
> --- /dev/null
> +++ b/package/yad/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_YAD
> +	bool "yad"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  YAD (yet another dialog) is a tool for create graphical dialogs
> +	  from shell scripts.
> +
> +	  http://sourceforge.net/projects/yad-dialog/
> +
> +comment "yad needs libgtk2 or libgtk3"
> +	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3
> diff --git a/package/yad/yad.hash b/package/yad/yad.hash
> new file mode 100644
> index 0000000..92b26cb
> --- /dev/null
> +++ b/package/yad/yad.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 81ac5241edff6181f6ead779b04ada7f1202d1866938da1507502da0ebf059b7 yad-0.29.0.tar.xz
> diff --git a/package/yad/yad.mk b/package/yad/yad.mk
> new file mode 100644
> index 0000000..da02ae2
> --- /dev/null
> +++ b/package/yad/yad.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# yad
> +#
> +################################################################################
> +
> +YAD_VERSION = 0.29.0
> +YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
> +YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
> +YAD_LICENSE = GPLv3
> +YAD_LICENSE_FILES = COPYING
> +YAD_DEPENDENCIES = host-intltool host-pkgconf libglib2
> +
> +YAD_CONF_OPTS = --enable-html=no
> +
> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> +YAD_DEPENDENCIES += libgtk3
> +YAD_CONF_OPTS += --with-gtk=gtk3
> +else
> +YAD_DEPENDENCIES += libgtk2
> +YAD_CONF_OPTS += --with-gtk=gtk2
> +endif
> +
> +$(eval $(autotools-package))
>
