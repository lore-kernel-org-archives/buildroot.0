From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 00:08:43 +0100
Subject: [Buildroot] [git commit] liboil: remove deprecated
Message-ID: <20111108231132.A17F98EF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bb17cd44168ee55573330d0288a8b349dfbc498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 -
 package/liboil/Config.in                           |    7 ---
 package/liboil/liboil-0.3.15-arm-vfp.patch         |   16 --------
 ...boil-0.3.15-fixes-arm-softfloat-build.patch.arm |   39 -------------------
 package/liboil/liboil-0.3.15-no-examples.patch     |   34 ----------------
 package/liboil/liboil.mk                           |   41 --------------------
 6 files changed, 0 insertions(+), 138 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 52fe824..4b5e5d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -351,7 +351,6 @@ source "package/libev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
-source "package/liboil/Config.in"
 source "package/libsigc/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
diff --git a/package/liboil/Config.in b/package/liboil/Config.in
deleted file mode 100644
index ad7a3d8..0000000
--- a/package/liboil/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBOIL
-	bool "liboil"
-	depends on BR2_DEPRECATED
-	help
-	  Library of simple functions that are optimized for various CPUs.
-
-	  http://liboil.freedesktop.org/
diff --git a/package/liboil/liboil-0.3.15-arm-vfp.patch b/package/liboil/liboil-0.3.15-arm-vfp.patch
deleted file mode 100644
index 815c9bb..0000000
--- a/package/liboil/liboil-0.3.15-arm-vfp.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff --git a/configure.ac b/configure.ac
-index 06a0ac9..b8d1640 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -158,7 +158,10 @@ if test x$HAVE_GCC_ASM = xyes -a x$HAVE_POWERPC = xyes ; then
-     true)
- fi
- 
--if test x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes ; then
-+AC_ARG_ENABLE(vfp,
-+  AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
-+  enable_vfp=$enableval,enable_vfp=yes)
-+if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
-   AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
-     [LIBOIL_CFLAGS="$LIBOIL_CFLAGS -mfpu=vfp"],
-     true)
diff --git a/package/liboil/liboil-0.3.15-fixes-arm-softfloat-build.patch.arm b/package/liboil/liboil-0.3.15-fixes-arm-softfloat-build.patch.arm
deleted file mode 100644
index c9a2be3..0000000
--- a/package/liboil/liboil-0.3.15-fixes-arm-softfloat-build.patch.arm
+++ /dev/null
@@ -1,39 +0,0 @@
-Patch generated from:
-http://cgit.freedesktop.org/liboil/commit/?id=227782d45d14ca0d68ee73b54eab71c1582dcbfa
-
-From 227782d45d14ca0d68ee73b54eab71c1582dcbfa Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <adrian.bunk@movial.com>
-Date: Wed, 09 Sep 2009 13:31:40 +0000
-Subject: fix ARM -mfloat-abi=soft builds
-
-If __SOFTFP__ is defined, VFP support is not available
-even when __VFP_FP__ is defined.
----
-diff --git a/liboil/arm/math_vfp.c b/liboil/arm/math_vfp.c
-index ffd3981..0bed96e 100644
---- a/liboil/arm/math_vfp.c
-+++ b/liboil/arm/math_vfp.c
-@@ -30,7 +30,7 @@
- #include <liboil/liboilclasses.h>
- #include <liboil/liboilfunction.h>
- 
--#if __VFP_FP__
-+#if defined(__VFP_FP__) && !defined(__SOFTFP__)
- 
- extern void vfp_add_f32 (float *d, const float *s1, const float *s2, int n);
- extern void vfp_add_f64 (double *d, const double *s1, const double *s2, int n);
-diff --git a/liboil/arm/math_vfp_asm.S b/liboil/arm/math_vfp_asm.S
-index ea68dba..ae5c803 100644
---- a/liboil/arm/math_vfp_asm.S
-+++ b/liboil/arm/math_vfp_asm.S
-@@ -24,7 +24,7 @@
-  * SUCH DAMAGE.
-  */
- 
--#if __VFP_FP__
-+#if defined(__VFP_FP__) && !defined(__SOFTFP__)
- /* 
- ** compile with -mcpu=arm1136j-s -mfpu=vfp -mfloat-abi=softfp
- **
---
-cgit v0.8.3-6-g21f6
diff --git a/package/liboil/liboil-0.3.15-no-examples.patch b/package/liboil/liboil-0.3.15-no-examples.patch
deleted file mode 100644
index a79b5e7..0000000
--- a/package/liboil/liboil-0.3.15-no-examples.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-[patch] liboil: don't build examples
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile.am |    2 +-
- Makefile.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: liboil-0.3.15/Makefile.am
-===================================================================
---- liboil-0.3.15.orig/Makefile.am
-+++ liboil-0.3.15/Makefile.am
-@@ -1,7 +1,7 @@
- 
- AUTOMAKE_OPTIONS = foreign
- 
--SUBDIRS = liboil testsuite examples doc
-+SUBDIRS = liboil testsuite doc
- 
- EXTRA_DIST = COPYING autogen.sh gtk-doc.make HACKING BUG-REPORTING
- 
-Index: liboil-0.3.15/Makefile.in
-===================================================================
---- liboil-0.3.15.orig/Makefile.in
-+++ liboil-0.3.15/Makefile.in
-@@ -259,7 +259,7 @@
- sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- AUTOMAKE_OPTIONS = foreign
--SUBDIRS = liboil testsuite examples doc
-+SUBDIRS = liboil testsuite doc
- EXTRA_DIST = COPYING autogen.sh gtk-doc.make HACKING BUG-REPORTING
- DISTCHECK_CONFIGURE_FLAGS = --enable-gtk-doc
- pkgconfig_DATA = liboil-$(LIBOIL_MAJORMINOR).pc
diff --git a/package/liboil/liboil.mk b/package/liboil/liboil.mk
deleted file mode 100644
index 16f6d13..0000000
--- a/package/liboil/liboil.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-#############################################################
-#
-# liboil
-#
-#############################################################
-LIBOIL_VERSION = 0.3.15
-LIBOIL_SOURCE = liboil-$(LIBOIL_VERSION).tar.gz
-LIBOIL_SITE = http://liboil.freedesktop.org/download
-LIBOIL_AUTORECONF = YES
-LIBOIL_INSTALL_STAGING = YES
-LIBOIL_INSTALL_TARGET = YES
-
-# Checking if unaligned memory access works correctly cannot be done when cross
-# compiling. For the following architectures there is no information available
-# in the configure script.
-ifeq ($(BR2_avr32),y)
-LIBOIL_CONF_ENV = as_cv_unaligned_access=no
-endif
-ifeq ($(BR2_x86_64),y)
-LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
-endif
-
-LIBOIL_CONF_OPT+=--with-gnu-ld
-
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBOIL_GLIB_DEP = libglib2
-endif
-
-ifeq ($(BR2_VFP_FLOAT),y)
-LIBOIL_CONF_OPT+=--enable-vfp
-endif
-
-LIBOIL_DEPENDENCIES = $(LIBOIL_GLIB_DEP)
-
-define LIBOIL_TARGET_CLEANUP
-	rm -f $(TARGET_DIR)/usr/bin/oil-bugreport
-endef
-
-LIBOIL_POST_INSTALL_TARGET_HOOKS += LIBOIL_TARGET_CLEANUP
-
-$(eval $(call AUTOTARGETS))
