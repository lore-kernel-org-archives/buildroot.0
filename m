From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:47:52 +0200
Subject: [Buildroot] [git commit] gd: bump to version 2.1.0
Message-ID: <20140414204922.D384F9BF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6f86d593c6875ab99057030a3b27c5490b8eac6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop obsolete/applied patches. Refresh the rest, and add sequence numbers.

Add a patch fixing build against uClibc when UCLIBC_HAS_LONG_DOUBLE_MATH is
missing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...gdlib-config.patch => gd-01-gdlib-config.patch} |    4 +-
 .../gd/{gd-no-zlib.patch => gd-02-no-zlib.patch}   |    4 +-
 .../gd/gd-03-gd_bmp-fix-build-with-uClibc.patch    |   50 ++++++++++++++++++++
 package/gd/gd-fontconfig.patch                     |   28 -----------
 package/gd/gd-iconv.patch                          |   17 -------
 package/gd/gd-libpng-config.patch                  |   30 ------------
 package/gd/gd-maxcolors.patch                      |   20 --------
 package/gd/gd.mk                                   |   35 ++------------
 8 files changed, 59 insertions(+), 129 deletions(-)

diff --git a/package/gd/gd-gdlib-config.patch b/package/gd/gd-01-gdlib-config.patch
similarity index 94%
rename from package/gd/gd-gdlib-config.patch
rename to package/gd/gd-01-gdlib-config.patch
index bfff88b..7756bf1 100644
--- a/package/gd/gd-gdlib-config.patch
+++ b/package/gd/gd-01-gdlib-config.patch
@@ -16,8 +16,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  	echo @LDFLAGS@
  	;;
      --libs)
--	echo @LIBS@ @LIBICONV@
-+	echo @LIBS@
+-	echo -lgd @LIBS@ @LIBICONV@
++	echo -lgd @LIBS@
  	;;
      --cflags|--includes)
  	echo -I at includedir@
diff --git a/package/gd/gd-no-zlib.patch b/package/gd/gd-02-no-zlib.patch
similarity index 96%
rename from package/gd/gd-no-zlib.patch
rename to package/gd/gd-02-no-zlib.patch
index cb265b2..65cf7f8 100644
--- a/package/gd/gd-no-zlib.patch
+++ b/package/gd/gd-02-no-zlib.patch
@@ -12,8 +12,8 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 
 Index: gd-2.0.35/gd_gd2.c
 ===================================================================
---- gd-2.0.35.orig/gd_gd2.c
-+++ gd-2.0.35/gd_gd2.c
+--- gd-2.0.35.orig/src/gd_gd2.c
++++ gd-2.0.35/src/gd_gd2.c
 @@ -1068,4 +1068,34 @@
    fprintf (stderr, "GD2 support is not available - no libz\n");
    return NULL;
diff --git a/package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch b/package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch
new file mode 100644
index 0000000..89bc391
--- /dev/null
+++ b/package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch
@@ -0,0 +1,50 @@
+From ea2a03e983acf34a1320b460dcad43b7e0b0b14f Mon Sep 17 00:00:00 2001
+Message-Id: <ea2a03e983acf34a1320b460dcad43b7e0b0b14f.1397134306.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 10 Apr 2014 15:49:13 +0300
+Subject: [PATCH] gd_bmp: fix build with uClibc
+
+Some architectures (like ARM) don't have the long double variants of math
+functions under uClibc. Add a local ceill definition in this case.
+
+Patch status: reported upstream, 
+https://bitbucket.org/libgd/gd-libgd/issue/123/build-failure-agains-uclibc-arm
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ src/gd_bmp.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/gd_bmp.c b/src/gd_bmp.c
+index 0fc021909f1b..11b3ec1baa01 100644
+--- a/src/gd_bmp.c
++++ b/src/gd_bmp.c
+@@ -25,6 +25,11 @@
+ #include "gdhelpers.h"
+ #include "bmp.h"
+ 
++#include <features.h>
++#if defined (__UCLIBC__) && !defined(__UCLIBC_HAS_LONG_DOUBLE_MATH__)
++#define NO_LONG_DOUBLE
++#endif
++
+ static int compress_row(unsigned char *uncompressed_row, int length);
+ static int build_rle_packet(unsigned char *row, int packet_type, int length, unsigned char *data);
+ 
+@@ -42,6 +47,13 @@ static int bmp_read_rle(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info);
+ 
+ #define BMP_DEBUG(s)
+ 
++#ifdef NO_LONG_DOUBLE
++long double ceill(long double x)
++{
++	return (long double) ceil((double) x);
++}
++#endif
++
+ static int gdBMPPutWord(gdIOCtx *out, int w)
+ {
+ 	/* Byte order is little-endian */
+-- 
+1.9.1
+
diff --git a/package/gd/gd-fontconfig.patch b/package/gd/gd-fontconfig.patch
deleted file mode 100644
index 651fbec..0000000
--- a/package/gd/gd-fontconfig.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Patch from Gentoo:
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/gd/files/gd-2.0.35-fontconfig.patch?view=log
-
-fix from upstream
-
-http://bugs.gentoo.org/363367
-
-# HG changeset patch
-# User tabe
-# Date 1239812355 0
-# Node ID 3ea283efcdafcb2acc1dd0ace1d3d48da6d8cec8
-# Parent  4f29a877875f63cee5a64e7bea406a61882a565e
-fixed FS#199
-
-199, Fixed useFontConfig() to work as documented (Ethan Merritt)
- 
-diff -r 4f29a877875f -r 3ea283efcdaf gdft.c
---- a/gdft.c	Sat Apr 04 12:00:37 2009 +0000
-+++ b/gdft.c	Wed Apr 15 16:19:15 2009 +0000
-@@ -1659,7 +1659,7 @@
- BGD_DECLARE(int) gdFTUseFontConfig(int flag)
- {
- #ifdef HAVE_LIBFONTCONFIG
--	fontConfigFlag = 1;
-+	fontConfigFlag = flag;
- 	return 1;
- #else
- 	return 0;
diff --git a/package/gd/gd-iconv.patch b/package/gd/gd-iconv.patch
deleted file mode 100644
index 821f5cb..0000000
--- a/package/gd/gd-iconv.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Seems gd is using an ancient gettext for m4 sources which has issues.
-Idea from OpenWRT patch and general knowledge on the internetweb.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura gd-2.0.35.orig/configure.ac gd-2.0.35/configure.ac
---- gd-2.0.35.orig/configure.ac	2012-12-15 08:36:07.165683957 -0300
-+++ gd-2.0.35/configure.ac	2012-12-15 08:42:59.354213570 -0300
-@@ -61,7 +61,7 @@
- AC_HEADER_STDC
- AC_CHECK_HEADERS([errno.h limits.h stddef.h stdlib.h string.h unistd.h])
- 
--AM_ICONV
-+m4_pattern_allow([AM_ICONV])
- # if test -n "$LIBICONV" ; then
- #   LIBS="$LIBS $LIBICONV"
- # fi
diff --git a/package/gd/gd-libpng-config.patch b/package/gd/gd-libpng-config.patch
deleted file mode 100644
index cf8b92e..0000000
--- a/package/gd/gd-libpng-config.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Call the libpng12-confg and libpng-config specified by
-$LIBPNG12_CONFIG and $LIBPNG_CONFIG variables that are set by
-ac_cv_path_LIBPNG12_CONFIG and ac_cv_path_LIBPNG_CONFIG. This is
-important for cross compiler that need to get the staging settings
-instead of the host settings.
-
-Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
-
-diff -Nura gd-2.0.35.orig/configure.ac gd-2.0.35/configure.ac
---- gd-2.0.35.orig/configure.ac	2013-01-18 02:00:59.000000000 +0100
-+++ gd-2.0.35/configure.ac	2013-01-18 02:01:44.000000000 +0100
-@@ -353,14 +353,14 @@
-   AC_PATH_PROG([LIBPNG12_CONFIG], [libpng12-config])
-   AC_PATH_PROG([LIBPNG_CONFIG], [libpng-config])
-   if test -n "$LIBPNG12_CONFIG"; then
--    libpng_CPPFLAGS=`libpng12-config --cflags`
-+    libpng_CPPFLAGS=`$LIBPNG12_CONFIG --cflags`
-     # should be --ldopts, but it's currently broken
--    libpng_LDFLAGS=`libpng12-config --ldflags`
-+    libpng_LDFLAGS=`$LIBPNG12_CONFIG --ldflags`
-     libpng_LDFLAGS=`echo " $libpng_LDFLAGS" | sed 's/ -l[[^ ]][[^ ]]*//g'`
-   elif test -n "$LIBPNG_CONFIG"; then
--    libpng_CPPFLAGS=`libpng-config --cflags`
-+    libpng_CPPFLAGS=`$LIBPNG_CONFIG --cflags`
-     # should be --ldopts, but it's currently broken
--    libpng_LDFLAGS=`libpng-config --ldflags`
-+    libpng_LDFLAGS=`$LIBPNG_CONFIG --ldflags`
-     libpng_LDFLAGS=`echo " $libpng_LDFLAGS" | sed 's/ -l[[^ ]][[^ ]]*//g'`
-   elif test -d "$withval"; then
-     libpng_CPPFLAGS="-I$withval/include"
diff --git a/package/gd/gd-maxcolors.patch b/package/gd/gd-maxcolors.patch
deleted file mode 100644
index 161cf19..0000000
--- a/package/gd/gd-maxcolors.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Patch from Gentoo:
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/gd/files/gd-2.0.35-maxcolors.patch?view=log
-
-http://bugs.gentoo.org/292130
-
-fix in usptream repo already
-
---- gd-2.0.35/gd_gd.c
-+++ gd-2.0.35/gd_gd.c
-@@ -44,6 +44,10 @@
- 	    {
- 	      goto fail1;
- 	    }
-+	  if (im->colorsTotal > gdMaxColors)
-+	    {
-+		   goto fail1;
-+		 }
- 	}
-       /* Int to accommodate truecolor single-color transparency */
-       if (!gdGetInt (&im->transparent, in))
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 146ad6f..f4d54ab 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-GD_VERSION = 2.0.35
-GD_SOURCE = gd-$(GD_VERSION).tar.bz2
-GD_SITE = http://distfiles.gentoo.org/distfiles
-# needed because of configure.ac timestamp
-GD_AUTORECONF = YES
+GD_VERSION = 2.1.0
+GD_SOURCE = libgd-$(GD_VERSION).tar.xz
+GD_SITE = https://bitbucket.org/libgd/gd-libgd/downloads/
 GD_INSTALL_STAGING = YES
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
@@ -16,11 +14,6 @@ GD_LICENSE_FILES = COPYING
 GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPT = --without-x --disable-rpath
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_PREFER_STATIC_LIB),yy)
-# add -pthread when linking executables statically
-GD_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
-endif
-
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 GD_DEPENDENCIES += fontconfig
 GD_CONF_OPT += --with-fontconfig
@@ -28,7 +21,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 GD_DEPENDENCIES += freetype
-GD_CONF_ENV += ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+GD_CONF_OPT += --with-freetype=$(STAGING_DIR)/usr
 else
 GD_CONF_OPT += --without-freetype
 endif
@@ -40,9 +33,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 GD_DEPENDENCIES += libpng
-GD_CONF_OPT += --with-png
-GD_CONF_ENV += ac_cv_path_LIBPNG12_CONFIG=""
-GD_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
+GD_CONF_OPT += --with-png=$(STAGING_DIR)/usr
 else
 GD_CONF_OPT += --without-png
 endif
@@ -56,22 +47,6 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 GD_DEPENDENCIES += zlib
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-GD_DEPENDENCIES += gettext
-else
-# configure.ac has newer timestamp than aclocal.m4 / configure, so we need
-# to autoreconf to regenerate them (or set configure.ac timestamp to older
-# than them) to make the Makefile happy.
-# configure.ac refers to AM_ICONV which we only have if gettext is enabled,
-# so add a dummy definition elsewise
-define GD_FIXUP_ICONV
-	echo 'm4_ifndef([AM_ICONV],[m4_define([AM_ICONV],[:])])' \
-		>> $(@D)/acinclude.m4
-endef
-
-GD_PRE_CONFIGURE_HOOKS += GD_FIXUP_ICONV
-endif
-
 GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
 GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
 GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL)	+= gd2copypal
