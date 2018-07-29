From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Jul 2018 21:25:26 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libva: bump version to 2.2.0
Message-ID: <20180729192528.5819-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved its github repo to github.com/intel/, updated URLs, for
reference see upstream PR 198. Also updated project URL.

Added patch to fix build without stack-protector support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added configure check for -fstack-protector (Thomas)

 package/libva/0001-check-ssp.patch | 64 ++++++++++++++++++++++++++++++
 package/libva/Config.in            |  2 +-
 package/libva/libva.hash           |  6 +--
 package/libva/libva.mk             |  6 ++-
 4 files changed, 72 insertions(+), 6 deletions(-)
 create mode 100644 package/libva/0001-check-ssp.patch

diff --git a/package/libva/0001-check-ssp.patch b/package/libva/0001-check-ssp.patch
new file mode 100644
index 0000000000..ce4c42f89b
--- /dev/null
+++ b/package/libva/0001-check-ssp.patch
@@ -0,0 +1,64 @@
+From c60ac5bc4f95c8d1ce3d44aa1dfad8636dbe3bee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 29 Jul 2018 00:16:25 +0200
+Subject: [PATCH] Check for -fstack-protector
+
+Not all toolchains provide support for -fstack-protector. This patch
+provides a configure check to avoid build errors like
+
+/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
+/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
+
+Patch sent upstream as PR 226.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac   | 16 ++++++++++++++++
+ va/Makefile.am |  5 ++++-
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b0b88361..da1908cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -209,6 +209,22 @@ if test "$ac_cv_have_gnuc_visibility_attribute" = "yes"; then
+               [Defined to 1 if GCC visibility attribute is supported])
+ fi
+ 
++# Check for -fstack-protector
++ssp_cc=yes
++if test "X$CC-cc" != "X"; then
++    AC_MSG_CHECKING([whether ${CC-cc} accepts -fstack-protector])
++    ssp_old_cflags="$CFLAGS"
++    CFLAGS="$CFLAGS -fstack-protector"
++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[alloca(100);]])], [], [ssp_cc=no])
++    AC_MSG_RESULT([$ssp_cc])
++    if test "X$ssp_cc" = "Xno"; then
++        CFLAGS="$ssp_old_cflags"
++    else
++        AC_DEFINE([ENABLE_SSP_CC], 1, [Define if SSP C support is enabled.])
++    fi
++fi
++AM_CONDITIONAL(USE_SSP, test "$ssp_cc" = "yes")
++
+ # Check for DRM (mandatory)
+ LIBDRM_VERSION=libdrm_version
+ PKG_CHECK_MODULES([DRM], [libdrm >= $LIBDRM_VERSION])
+diff --git a/va/Makefile.am b/va/Makefile.am
+index 5b6d49ab..0e94d0ff 100644
+--- a/va/Makefile.am
++++ b/va/Makefile.am
+@@ -77,9 +77,12 @@ libva_ldflags = \
+ 
+ libva_cflags = \
+ 	-Wall			\
+-	-fstack-protector	\
+ 	$(NULL)
+ 
++if USE_SSP
++libva_cflags += -fstack-protector
++endif
++
+ lib_LTLIBRARIES			= libva.la
+ libvaincludedir			= ${includedir}/va
+ libvainclude_HEADERS		= $(libva_source_h)
diff --git a/package/libva/Config.in b/package/libva/Config.in
index 08eb16b487..e4e351f98a 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBVA
 	  prevailing coding standards today (MPEG-2, MPEG-4 ASP/H.263,
 	  MPEG-4 AVC/H.264, and VC-1/VMW3).
 
-	  https://01.org/linuxmedia/vaapi
+	  https://01.org/vaapi
 
 comment "libva needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index ed707095f0..72347a4f2d 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/01org/libva/releases
-sha1 9ecde2b6c9deda16e895a0b00b8aef3a765acb4c  libva-2.1.0.tar.bz2
+# From https://github.com/intel/libva/releases
+sha1 5b19d2fbf532f14e24c3bedb4074238a1d7f1686  libva-2.2.0.tar.bz2
 # Locally computed
-sha256 f3fa953a11d3210c3a4ee79031abdbe0863d5ce13d9b3f93f315f1eec60a4b0f  libva-2.1.0.tar.bz2
+sha256 6f6ca04c785544d30d315ef130a6aeb9435b75f934d7fbe0e4e9ba6084ce4ef2  libva-2.2.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 79956a9d8e..7c129f4d97 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.1.0
+LIBVA_VERSION = 2.2.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
-LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
+LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
+# 0001-check-ssp.patch
+LIBVA_AUTORECONF = YES
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
 
 # libdrm is a hard-dependency
-- 
2.18.0
