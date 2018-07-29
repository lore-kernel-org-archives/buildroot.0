From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Jul 2018 21:25:27 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/libva-intel-driver: bump version
 to 2.2.0
In-Reply-To: <20180729192528.5819-1-bernd.kuhls@t-online.de>
References: <20180729192528.5819-1-bernd.kuhls@t-online.de>
Message-ID: <20180729192528.5819-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved its github repo to github.com/intel/, updated URLs, for
reference see upstream PR 371. Also updated project URL.

Added patch to fix build without stack-protector support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added configure check for -fstack-protector (Thomas)

 .../libva-intel-driver/0001-check-ssp.patch   | 65 +++++++++++++++++++
 package/libva-intel-driver/Config.in          |  2 +-
 .../libva-intel-driver.hash                   |  6 +-
 .../libva-intel-driver/libva-intel-driver.mk  |  6 +-
 4 files changed, 73 insertions(+), 6 deletions(-)
 create mode 100644 package/libva-intel-driver/0001-check-ssp.patch

diff --git a/package/libva-intel-driver/0001-check-ssp.patch b/package/libva-intel-driver/0001-check-ssp.patch
new file mode 100644
index 0000000000..c801ed3148
--- /dev/null
+++ b/package/libva-intel-driver/0001-check-ssp.patch
@@ -0,0 +1,65 @@
+From bf08643583520b763150af9ed20166b7fe272fd5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 29 Jul 2018 20:55:23 +0200
+Subject: [PATCH] Check for -fstack-protector
+
+Not all toolchains provide support for -fstack-protector. This patch
+provides a configure check to avoid build errors like
+
+/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
+/home/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/6.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
+
+Patch sent upstream as PR 408.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac    | 17 +++++++++++++++++
+ src/Makefile.am |  5 ++++-
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c76060c7..5471aee7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -86,6 +86,23 @@ AC_SEARCH_LIBS([dlopen], [dl], [], [
+   AC_MSG_ERROR([unable to find the dlopen() function])
+ ])
+ 
++
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
+ dnl Check for recent enough DRM
+ LIBDRM_VERSION=libdrm_version
+ PKG_CHECK_MODULES([DRM], [libdrm >= $LIBDRM_VERSION libdrm_intel])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index c26293dd..5c52658a 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -35,9 +35,12 @@ AM_CPPFLAGS = \
+ driver_cflags = \
+ 	-Wall			\
+ 	-fvisibility=hidden	\
+-	-fstack-protector	\
+ 	$(NULL)
+ 
++if USE_SSP
++driver_cflags += -fstack-protector
++endif
++
+ driver_ldflags = \
+ 	-avoid-version		\
+ 	-no-undefined		\
diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index 120f152c96..53c5b366c3 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	help
 	  VA-API back-end driver for Intel graphics chips
 
-	  https://01.org/linuxmedia/vaapi
+	  https://01.org/vaapi
 
 comment "libva intel driver needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index dbe5d67fb4..0509ff8d60 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,5 @@
-# From https://github.com/01org/intel-vaapi-driver/releases
-sha1 a40c6bd89b71b547986bf9f9fa2533bb50cf269e intel-vaapi-driver-2.1.0.tar.bz2
+# From https://github.com/intel/intel-vaapi-driver/releases
+sha1 0934f97ddcaf4e633f59d049226723239b645b33  intel-vaapi-driver-2.2.0.tar.bz2
 # Locally computed
-sha256 ecfaf2ccc4b9af7340e002d2ef807d1e33051d4992f1983f5f4d60e516f86bdf  intel-vaapi-driver-2.1.0.tar.bz2
+sha256 e8a5f54694eb76aad42653b591030b8a53b1513144c09a80defb3d8d8c875c18  intel-vaapi-driver-2.2.0.tar.bz2
 sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index dd1903024f..48564ca488 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.1.0
+LIBVA_INTEL_DRIVER_VERSION = 2.2.0
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
-	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
+	https://github.com/intel/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
+# 0001-check-ssp.patch
+LIBVA_INTEL_DRIVER_AUTORECONF = YES
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
2.18.0
