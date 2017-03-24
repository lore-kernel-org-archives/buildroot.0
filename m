From: Rodrigo Rebello <rprebello@gmail.com>
Date: Thu, 23 Mar 2017 23:23:42 -0300
Subject: [Buildroot] [PATCH] vnstat: bump to version 1.17
Message-ID: <20170324022342.31541-1-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove patch that has been merged upstream, disable AUTORECONF
since we're no longer patching configure.ac and get rid of hack
involving the install target as the 'install-data-hook' in Makefile.am
now avoids running 'vnstat --showconfig' on the host in case of
cross-compilation.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 ...ure.ac-add-option-to-disable-image-output.patch | 51 ----------------------
 package/vnstat/vnstat.hash                         |  2 +-
 package/vnstat/vnstat.mk                           | 10 +----
 3 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch

diff --git a/package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch b/package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch
deleted file mode 100644
index e46ef0788..000000000
--- a/package/vnstat/0001-configure.ac-add-option-to-disable-image-output.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8a4a9b82d4f8fd39db8417fd06d969505fde9d0a Mon Sep 17 00:00:00 2001
-From: Rodrigo Rebello <rprebello@gmail.com>
-Date: Tue, 22 Dec 2015 18:02:22 -0200
-Subject: [PATCH 1/1] configure.ac: add option to disable image output
-
-Even when the gd library is present, it may be desirable to not build
-'vnstati' as image output is an optional feature.
-
-Also, when testing for the gd library, use gdImagePng() instead of
-gdImageLine() since it's possible that the installed gd library doesn't
-have PNG support. In such cases, the test in the configure script passed
-(because gdImageLine() is always present), but the build failed with:
-
-  src/vnstati.o: In function `writeoutput':
-  vnstati.c:(.text+0x3fc): undefined reference to `gdImagePng'
-  collect2: error: ld returned 1 exit status
-
-Upstream status: accepted, not yet released.
-https://github.com/vergoh/vnstat/pull/35
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- configure.ac | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index be3d449..89f71ef 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -13,10 +13,16 @@ AM_PROG_CC_C_O
- AC_PROG_MAKE_SET
- AC_PROG_MKDIR_P
- 
-+AC_ARG_ENABLE([image-output], [
-+AS_HELP_STRING([--disable-image-output], [disable PNG image output])])
-+
- # Checks for libraries.
- AC_CHECK_LIB([m], [pow])
--AC_CHECK_LIB([gd], [gdImageLine], [IMAGELIBS=-lgd])
--AC_SUBST([IMAGELIBS])
-+
-+AS_IF([test "x$enable_image_output" != "xno"], [
-+AC_CHECK_LIB([gd], [gdImagePng], [IMAGELIBS=-lgd])
-+AC_SUBST([IMAGELIBS])])
-+
- AM_CONDITIONAL([HAVE_LIBGD], [test "$IMAGELIBS" = "-lgd"])
- PKG_CHECK_MODULES([CHECK], [check >= 0.9.6], [], [AC_MSG_NOTICE([testcases can not be execute without check installed])])
- AM_CONDITIONAL([HAVE_CHECK], [test "$CHECK_LIBS"])
--- 
-2.1.4
-
diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 82ee8c02b..1f515290c 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c3814b5baa8b627198a8debfe1dce4b4346a342523818cc8668a5497971dbc39	vnstat-1.15.tar.gz
+sha256	18e4c53576ca9e1ef2f0e063a6d83b0c44e3b1cf008560d658745df5c9aa7971	vnstat-1.17.tar.gz
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 576f240a2..f3e74a747 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 1.15
+VNSTAT_VERSION = 1.17
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPLv2
 VNSTAT_LICENSE_FILES = COPYING
 VNSTAT_DEPENDENCIES = host-pkgconf
-# We're patching configure.ac, so we need to autoreconf
-VNSTAT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 VNSTAT_DEPENDENCIES += gd
@@ -19,10 +17,4 @@ else
 VNSTAT_CONF_OPTS = --disable-image-output
 endif
 
-# vnStat declares an 'install-data-hook' rule that tries to run
-# 'vnstat --showconfig' on the host to generate a default config file.
-# That obviously doesn't work when cross-compiling, so avoid it
-# entirely.
-VNSTAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
-
 $(eval $(autotools-package))
-- 
2.11.0
