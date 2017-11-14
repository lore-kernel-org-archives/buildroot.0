From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 14 Nov 2017 20:29:40 -0200
Subject: [Buildroot] [PATCH] libgdiplus: bump to version 5.4
Message-ID: <1510698580-4210-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, enable giflib if selected by the user and remove patch already
applied upstream.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...01-Fix-compile-error-when-cross-compiling.patch | 35 ----------------------
 package/libgdiplus/libgdiplus.hash                 |  2 +-
 package/libgdiplus/libgdiplus.mk                   | 11 ++++---
 3 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch

diff --git a/package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch b/package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch
deleted file mode 100644
index db67d467df42..000000000000
--- a/package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From daf96b07c02734dceaf3c3b78c10e4e758b74d9e Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Fri, 18 Dec 2015 15:08:58 -0200
-Subject: [PATCH 1/1] Fix compile error when cross-compiling.
-
-When cross-compiling with libjpeg enabled, we can get errors like the
-following when linking:
-
-sh-linux-gnu-gcc: ERROR: unsafe header/library path used in
-cross-compilation: '/lib'
-
-That's because there is an error in the configure script that are not
-generating ldflags correctly, and are trying to link with -L/lib.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 772d5fc9d87a..58d55ade48e3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -223,7 +223,7 @@ AC_ARG_WITH([libjpeg],
-         jpeg_ok=no)
-       AC_MSG_RESULT($jpeg_ok)
-       if test "$jpeg_ok" = yes; then
--        JPEG='jpeg'; LIBJPEG='-L${libjpeg_prefix}/lib -ljpeg'
-+        JPEG='jpeg'; LIBJPEG="-L${libjpeg_prefix}/lib -ljpeg"
-       else
-         AC_MSG_WARN(*** JPEG loader will not be built (JPEG header file not found) ***)
-       fi
---
-1.9.1
-
diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
index f7fdcb58a46c..740fefd986a1 100644
--- a/package/libgdiplus/libgdiplus.hash
+++ b/package/libgdiplus/libgdiplus.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 98f8a8e58ed22e136c4ac6eaafbc860757f5a97901ecc0ea357e2b6e4cfa2be5 libgdiplus-4.2.tar.gz
+sha256 ce31da0c6952c8fd160813dfa9bf4a9a871bfe7284e9e3abff9a8ee689acfe58 libgdiplus-5.4.tar.gz
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index 7d564b6cd916..eb1858574dd8 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGDIPLUS_VERSION = 4.2
+LIBGDIPLUS_VERSION = 5.4
 LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
 
 # Although there is a LICENSE file thas specifies LGPL or MPL-1.1,
@@ -21,9 +21,12 @@ LIBGDIPLUS_AUTORECONF = YES
 
 LIBGDIPLUS_DEPENDENCIES = xlib_libXft libglib2 cairo libpng host-pkgconf
 
-# API changes in recent versions of libgif makes it incompatible with
-# this version of libgdiplus, so we are disabling it for now.
-LIBGDIPLUS_CONF_OPTS = --without-libgif
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+LIBGDIPLUS_CONF_OPTS += --with-libgif
+LIBGDIPLUS_DEPENDENCIES += giflib
+else
+LIBGDIPLUS_CONF_OPTS += --without-libgif
+endif
 
 # there is a bug in the configure script that enables pango support
 # when passing --without-pango, so let's just not use it
-- 
1.9.1
