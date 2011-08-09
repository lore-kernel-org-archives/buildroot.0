From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue,  9 Aug 2011 19:39:21 +0200
Subject: [Buildroot] [PATCH 2/2] package: add openocd support
In-Reply-To: <1312911561-23942-1-git-send-email-plagnioj@jcrosoft.com>
References: <1312911561-23942-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <1312911561-23942-2-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with only the following Adapters
 - FTDI FT2xxx/FT4xxx
 - J-Link (Segger and Atmel SAM-ICE)
 - Versaloon-Link JTAG Adapter

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Patrice Vilchez <patrice.vilchez@atmel.com>
---
 package/Config.in                                  |    1 +
 package/openocd/Config.in                          |   29 +++++++++++++++++
 ...s-compilation-host-libsub-was-used-before.patch |   33 ++++++++++++++++++++
 package/openocd/openocd-force_jimtcl_static.patch  |   22 +++++++++++++
 package/openocd/openocd.mk                         |   32 +++++++++++++++++++
 5 files changed, 117 insertions(+), 0 deletions(-)
 create mode 100644 package/openocd/Config.in
 create mode 100644 package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
 create mode 100644 package/openocd/openocd-force_jimtcl_static.patch
 create mode 100644 package/openocd/openocd.mk

diff --git a/package/Config.in b/package/Config.in
index 1747620..299c004 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -190,6 +190,7 @@ source "package/memtester/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
+source "package/openocd/Config.in"
 source "package/pciutils/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sdparm/Config.in"
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
new file mode 100644
index 0000000..bf92819
--- /dev/null
+++ b/package/openocd/Config.in
@@ -0,0 +1,29 @@
+menuconfig BR2_PACKAGE_OPENOCD
+	bool "OpenOCD"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  OpenOCD - Open On-Chip Debugger
+
+	  http://openocd.berlios.de/web/
+
+if BR2_PACKAGE_OPENOCD
+
+comment "Adapters"
+
+config BR2_PACKAGE_OPENOCD_FT2XXX
+	bool "FT2xxx/FT4xxx Based JTAG Programmer"
+	select BR2_PACKAGE_LIBFTDI
+	help
+	  Enable building support for FT2232 based devices
+	  using the libftdi driver, opensource alternate of FTD2XX
+
+config BR2_PACKAGE_OPENOCD_JLINK
+	bool "Segger J-Link JTAG Programmer"
+	help
+	  Segger J-Link JTAG Programmer and clone such as Atmel SAM-ICE
+
+config BR2_PACKAGE_OPENOCD_VSLLINK
+	bool "Versaloon-Link JTAG Programmr"
+
+endif # BR2_PACKAGE_OPENOCD
diff --git a/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch b/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
new file mode 100644
index 0000000..99ff04e
--- /dev/null
+++ b/package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
@@ -0,0 +1,33 @@
+From 3728c4af7f6303ccedab56ec220797f8f290580e Mon Sep 17 00:00:00 2001
+From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Date: Wed, 10 Aug 2011 00:17:29 +0800
+Subject: [PATCH] fix cross compilation: host libsub was used before
+
+tested in buildroot
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+---
+ configure.in |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index dfa1e8f..cfe2218 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1046,8 +1046,11 @@ build_usb=no
+ if test $build_jlink = yes -o $build_vsllink = yes -o $build_usbprog = yes -o \
+   $build_rlink = yes -o $build_ulink = yes -o $build_armjtagew = yes
+ then
+-  AC_CHECK_HEADERS([usb.h],[],
+-  [AC_MSG_ERROR([usb.h is required to build some OpenOCD driver(s)])])
++  dnl check for libusb
++  PKG_CHECK_MODULES(LIBUSB, libusb >= 0.1.11)
++  CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
++  LDFLAGS="$LFFLAGS $LIBUSB_LDFLAGS"
++  LIBS="$LIBS $LIBUSB_LIBS"
+   build_usb=yes
+ fi
+ 
+-- 
+1.7.5.4
+
diff --git a/package/openocd/openocd-force_jimtcl_static.patch b/package/openocd/openocd-force_jimtcl_static.patch
new file mode 100644
index 0000000..80446c8
--- /dev/null
+++ b/package/openocd/openocd-force_jimtcl_static.patch
@@ -0,0 +1,22 @@
+---
+ jimtcl/auto.def |    5 -----
+ 1 file changed, 5 deletions(-)
+
+Index: b/jimtcl/auto.def
+===================================================================
+--- a/jimtcl/auto.def
++++ b/jimtcl/auto.def
+@@ -148,13 +148,8 @@ if {[opt-bool references]} {
+     msg-result "Enabling references"
+     define JIM_REFERENCES
+ }
+-if {[opt-bool shared with-jim-shared]} {
+-    msg-result "Building shared library"
+-    define JIM_LIBTYPE shared
+-} else {
+     msg-result "Building static library"
+     define JIM_LIBTYPE static
+-}
+ if {[opt-bool install-jim]} {
+     define install_jim 1
+ } else {
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
new file mode 100644
index 0000000..74585d3
--- /dev/null
+++ b/package/openocd/openocd.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# openocd
+#
+#############################################################
+OPENOCD_VERSION:=0.5.0
+OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
+OPENOCD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
+
+OPENOCD_AUTORECONF = YES
+OPENOCD_CONF_OPT = \
+	--oldincludedir=$(STAGING_DIR)/usr/include \
+	--includedir=$(STAGING_DIR)/usr/include \
+	--disable-doxygen-html \
+	--enable-dummy
+
+OPENOCD_DEPENDENCIES = libusb-compat
+
+# Adapters
+ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
+OPENOCD_CONF_OPT += --enable-ft2232_libftdi
+endif
+
+ifeq ($(BR2_PACKAGE_OPENOCD_JLINK),y)
+OPENOCD_CONF_OPT += --enable-jlink
+endif
+
+ifeq ($(BR2_PACKAGE_OPENOCD_VSLLINK),y)
+OPENOCD_CONF_OPT += --enable-vsllink
+endif
+
+$(eval $(call AUTOTARGETS,package,openocd))
-- 
1.7.5.4
