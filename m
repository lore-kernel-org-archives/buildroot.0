From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Nov 2012 10:14:35 +0100
Subject: [Buildroot] [PATCH 07/33] fluxbox: fix build against imlib2
In-Reply-To: <1353543503-8952-8-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:17:57 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-8-git-send-email-s.martin49@gmail.com>
Message-ID: <878v9sfzpg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> * fix missing dependency
 Samuel> * set imlib2 prefix at configure time
 Samuel> * fix configure script to take account of the imlib2 prefix if any

Ehh, fluxbox doesn't select imlib2 in it's Config.in and it looks like
it's an optional dependency:

From configure.in:

dnl Check whether to use imlib2
IMLIB2=false
AC_MSG_CHECKING([whether to have Imlib2 (pixmap themes) support])
AC_ARG_ENABLE(imlib2,
    AC_HELP_STRING([--enable-imlib2],
                   [Imlib2 (pixmap themes) support ([default=yes])]), ,
                   [enable_imlib2=yes])

So all of this should only be done if BR2_PACKAGE_IMLIB2 is enabled.

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/fluxbox/fluxbox-fix-configure.patch | 19 +++++++++++++++++++

Please consider sending this patch upstream.


 Samuel>  package/fluxbox/fluxbox.mk                  |  7 ++++---
 Samuel>  2 files changed, 23 insertions(+), 3 deletions(-)
 Samuel>  create mode 100644 package/fluxbox/fluxbox-fix-configure.patch

 Samuel> diff --git a/package/fluxbox/fluxbox-fix-configure.patch b/package/fluxbox/fluxbox-fix-configure.patch
 Samuel> new file mode 100644
 Samuel> index 0000000..a739f08
 Samuel> --- /dev/null
 Samuel> +++ b/package/fluxbox/fluxbox-fix-configure.patch
 Samuel> @@ -0,0 +1,19 @@
 Samuel> +Avoid to call the imlib2-config that may be installed on the host system
 Samuel> +(even when --with-imlib2-prefix or  --with-imlib2-exec-prefix is passed to
 Samuel> +the configure script), which totally screws up the resulting linker flags.
 Samuel> +
 Samuel> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> +
 Samuel> +--- fluxbox-1.3.2.orig/configure.in	2012-10-21 16:11:59.445749396 +0200
 Samuel> ++++ fluxbox-1.3.2/configure.in	2012-10-21 16:35:27.658390856 +0200
 Samuel> +@@ -443,8 +443,8 @@ if test x$enable_imlib2 = "xyes"; then
 Samuel> +       [
 Samuel> +          IMLIB2=true
 Samuel> +          AC_DEFINE(HAVE_IMLIB2, [], [Imlib2 support])
 Samuel> +-         IMLIB2_LIBS=`imlib2-config --libs`
 Samuel> +-         IMLIB2_CFLAGS=`imlib2-config --cflags`
 Samuel> ++         IMLIB2_LIBS=`$IMLIB2_CONFIG --libs`
 Samuel> ++         IMLIB2_CFLAGS=`$IMLIB2_CONFIG --cflags`
 Samuel> +          LIBS="$LIBS $IMLIB2_LIBS"
 Samuel> +          CXXFLAGS="$CXXFLAGS $IMLIB2_CFLAGS"
 Samuel> +        ], [ AC_MSG_RESULT(no)]
 Samuel> diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
 Samuel> index 15136c9..bb34379 100644
 Samuel> --- a/package/fluxbox/fluxbox.mk
 Samuel> +++ b/package/fluxbox/fluxbox.mk
 Samuel> @@ -7,11 +7,12 @@
 Samuel>  FLUXBOX_VERSION = 1.3.2
 Samuel>  FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
 Samuel>  FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
 Samuel> -
 Samuel> +FLUXBOX_AUTORECONF = YES
 Samuel>  FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 Samuel> -		   --x-libraries=$(STAGING_DIR)/usr/lib
 Samuel> +		   --x-libraries=$(STAGING_DIR)/usr/lib \
 Samuel> +		   --with-imlib2-prefix=$(STAGING_DIR)/usr
 
 Samuel> -FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 Samuel> +FLUXBOX_DEPENDENCIES = imlib2 xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 Samuel>  define FLUXBOX_INSTALL_XSESSION_FILE
 Samuel>  	[ -f $(TARGET_DIR)/root/.xsession ] || $(INSTALL) -m 0755 -D \
 Samuel> -- 
 Samuel> 1.8.0

 Samuel> _______________________________________________
 Samuel> buildroot mailing list
 Samuel> buildroot at busybox.net
 Samuel> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
