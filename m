From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Feb 2021 18:28:47 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/lcms2: fix static building
 with tiff"
Message-ID: <20210215172848.1084947-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 7e4f054d2347708c9e22fe84c1d5f374d5b343cd.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-fix-static-linking-with-tiff.patch | 37 -------------------
 package/lcms2/lcms2.mk                        |  4 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 package/lcms2/0001-configure.ac-fix-static-linking-with-tiff.patch

diff --git a/package/lcms2/0001-configure.ac-fix-static-linking-with-tiff.patch b/package/lcms2/0001-configure.ac-fix-static-linking-with-tiff.patch
deleted file mode 100644
index 9b7ad7c506..0000000000
--- a/package/lcms2/0001-configure.ac-fix-static-linking-with-tiff.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 49eed94b8a1d3fda2d00f0120e14c4d78cc5e840 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Feb 2021 09:28:39 +0100
-Subject: [PATCH] configure.ac: fix static linking with tiff
-
-Use pkg-config to retrieve the dependencies of tiff (e.g. xz) to fix
-the following static build failure:
-
-libtool: link: /home/buildroot/autobuild/run/instance-2/output-1/host/bin/xtensa-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -static -fvisibility=hidden -static -static -o tificc tificc.o ../common/xgetopt.o ../common/vprf.o  ../../src/.libs/liblcms2.a -ltiff -ljpeg -lz -lm -lpthread
-/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libtiff.a(tif_lzma.o): in function `LZMAEncode':
-tif_lzma.c:(.text+0x168): undefined reference to `lzma_code'
-
-Fixes:
- - http://autobuild.buildroot.org/results/07c5ca780bcdbfcd7cad6502345f1553ce17bdc3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mm2/Little-CMS/pull/244]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b3c8f2b..96440fe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -330,7 +330,7 @@ then
- 	AC_MSG_RESULT(no -- some components failed test)
- 	have_tiff='no (failed tests)'
-     else
--	LIB_TIFF='-ltiff'
-+	PKG_CHECK_MODULES(PC_TIFF,libtiff-4,LIB_TIFF=$PC_TIFF_LIBS,LIB_TIFF='-ltiff')
- 	LIBS="$LIB_TIFF $LIBS"
- 	AC_DEFINE(HasTIFF,1,Define if you have TIFF library)
- 	AC_MSG_RESULT(yes)
--- 
-2.29.2
-
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 3797c857cb..862fdd5896 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -11,8 +11,6 @@ LCMS2_LICENSE_FILES = COPYING
 LCMS2_CPE_ID_VENDOR = littlecms
 LCMS2_CPE_ID_PRODUCT = little_cms
 LCMS2_INSTALL_STAGING = YES
-# We're patching configure.ac
-LCMS2_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LCMS2_CONF_OPTS += --with-jpeg
@@ -23,7 +21,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LCMS2_CONF_OPTS += --with-tiff
-LCMS2_DEPENDENCIES += host-pkgconf tiff
+LCMS2_DEPENDENCIES += tiff
 else
 LCMS2_CONF_OPTS += --without-tiff
 endif
-- 
2.30.0
