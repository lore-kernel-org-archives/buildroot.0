From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 27 Mar 2017 22:24:38 +0200
Subject: [Buildroot] [PATCH] leptonica: fix static build issue
Message-ID: <1490646278-27878-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

leptonica configure script does not use pkg-config to find the TIFF library,
so it doesn't know about the transitive dependencies of the TIFF library.
Switching to PKG_CHECK_MODULES() to discover the library solves the issue.

Fixes:
http://autobuild.buildroot.net/results/8dd2bcc41e861bdd324dd081e39925964d1ac428
http://autobuild.buildroot.net/results/ec7366d69b00625b652915fa58e3143f1bdcaf62
http://autobuild.buildroot.net/results/0cd74312a39e3bc59d15789a4c0a891f0f417b8c
http://autobuild.buildroot.net/results/35f9a0f2db30dd62733142f0fcfa72699452583f
http://autobuild.buildroot.net/results/f7ea889b2fb96ff7de492e282820c800187573cb

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 ...ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch | 42 ++++++++++++++++++++++
 package/leptonica/leptonica.mk                     |  6 ++++
 2 files changed, 48 insertions(+)
 create mode 100644 package/leptonica/0001-configure.ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch

diff --git a/package/leptonica/0001-configure.ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch b/package/leptonica/0001-configure.ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch
new file mode 100644
index 0000000..5b48341
--- /dev/null
+++ b/package/leptonica/0001-configure.ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch
@@ -0,0 +1,42 @@
+From 40427bd4ec62fe12e6dc3a8cc61b9d644be98c96 Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Sun, 26 Mar 2017 10:18:22 +0200
+Subject: [PATCH] configure.ac: Use PKG_CHECK_MODULES to check libtiff
+ availability
+
+When built statically, leptonica is not able to find specified
+libtiff function that will determine whether library is available
+or not.
+Using PKG_CHECK_MODULES fixes the issue.
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ configure.ac | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e64cde6..52a9e0e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,13 +66,12 @@ AS_IF([test "x$with_giflib" != xno],
+ 
+ AM_CONDITIONAL([HAVE_LIBGIF], [test "x$ac_cv_lib_gif_DGifOpenFileHandle" = xyes])
+ 
+-AS_IF([test "x$with_libtiff" != xno],
+-  AC_CHECK_LIB([tiff], [TIFFOpen],
+-    AC_DEFINE([HAVE_LIBTIFF], 1, [Define to 1 if you have libtiff.]) AC_SUBST([LIBTIFF_LIBS], [-ltiff]),
+-    AS_IF([test "x$with_libtiff" = xyes], AC_MSG_ERROR([libtiff support requested but library not found])),
+-    ${LIBM} ${ZLIB_LIBS} ${JPEG_LIBS}
++if test "x$with_libtiff" != xno; then
++  PKG_CHECK_MODULES([LIBTIFF], [libtiff-4],
++    AC_DEFINE([HAVE_LIBTIFF], 1, [Define to 1 if you have libtiff.]),
++    AS_IF([test "x$with_libtiff" = xyes], AC_MSG_ERROR([libtiff support requested but library not found]))
+   )
+-)
++fi
+ 
+ AS_IF([test "x$with_libwebp" != xno],
+   AC_CHECK_LIB([webp], [WebPGetInfo],
+-- 
+2.5.0
+
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 37e5219..aa8274d 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -10,6 +10,12 @@ LEPTONICA_LICENSE = BSD-2c
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
 LEPTONICA_INSTALL_STAGING = YES
 
+# we patch configure.ac
+LEPTONICA_AUTORECONF = YES
+
+# PKG_CHECK_MODULES() is used in configure.ac patch
+LEPTONICA_DEPENDENCIES = host-pkgconf
+
 LEPTONICA_CONF_OPTS += --disable-programs
 
 ifeq ($(BR2_PACKAGE_GIFLIB),y)
-- 
2.5.0
