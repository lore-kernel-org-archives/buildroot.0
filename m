From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Tue, 20 Sep 2011 13:19:52 +0200
Subject: [Buildroot] [PATCH 2/2 v3] package: add openocd support
In-Reply-To: <1316289171-21296-1-git-send-email-plagnioj@jcrosoft.com>
References: <1316289171-21296-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <1316517592-11773-1-git-send-email-plagnioj@jcrosoft.com>
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
Hi,

v2:

	xscacle fix

v3:

	force gnu99 as gcc standard

Best Regards,
J.
 package/Config.in                                  |    1 +
 package/openocd/Config.in                          |   29 +++++++++++++++++
 ...s-compilation-host-libsub-was-used-before.patch |   33 ++++++++++++++++++++
 ...002-fix-xscale-uninitialise-breakpoint_pc.patch |   20 ++++++++++++
 package/openocd/openocd-0003-force-gnu99.patch     |   19 +++++++++++
 .../openocd/openocd-0004-force_jimtcl_static.patch |   25 +++++++++++++++
 package/openocd/openocd.mk                         |   32 +++++++++++++++++++
 7 files changed, 159 insertions(+), 0 deletions(-)
 create mode 100644 package/openocd/Config.in
 create mode 100644 package/openocd/openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch
 create mode 100644 package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
 create mode 100644 package/openocd/openocd-0003-force-gnu99.patch
 create mode 100644 package/openocd/openocd-0004-force_jimtcl_static.patch
 create mode 100644 package/openocd/openocd.mk

diff --git a/package/Config.in b/package/Config.in
index 451b271..6574081 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -191,6 +191,7 @@ source "package/memtester/Config.in"
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
diff --git a/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch b/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
new file mode 100644
index 0000000..328241e
--- /dev/null
+++ b/package/openocd/openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch
@@ -0,0 +1,20 @@
+xscale: fix uninitialise breakpoint_pc
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+---
+ src/target/xscale.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: b/src/target/xscale.c
+===================================================================
+--- a/src/target/xscale.c
++++ b/src/target/xscale.c
+@@ -2811,7 +2811,7 @@ static int xscale_analyze_trace(struct t
+    struct xscale_common *xscale = target_to_xscale(target);
+    struct xscale_trace_data *trace_data = xscale->trace.data;
+    int i, retval;
+-   uint32_t breakpoint_pc;
++   uint32_t breakpoint_pc = 0;
+    struct arm_instruction instruction;
+    uint32_t current_pc = 0;  /* initialized when address determined */
+ 	
diff --git a/package/openocd/openocd-0003-force-gnu99.patch b/package/openocd/openocd-0003-force-gnu99.patch
new file mode 100644
index 0000000..106d112
--- /dev/null
+++ b/package/openocd/openocd-0003-force-gnu99.patch
@@ -0,0 +1,19 @@
+force gnu99
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+---
+ configure.in |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -28,6 +28,7 @@ AC_DISABLE_SHARED
+ AC_PROG_LIBTOOL
+ AC_SUBST(LIBTOOL_DEPS)
+ 
++CFLAGS="$CFLAGS -std=gnu99"
+ 
+ dnl configure checks required for Jim files (these are obsolete w/ C99)
+ AC_C_CONST
diff --git a/package/openocd/openocd-0004-force_jimtcl_static.patch b/package/openocd/openocd-0004-force_jimtcl_static.patch
new file mode 100644
index 0000000..7118b57
--- /dev/null
+++ b/package/openocd/openocd-0004-force_jimtcl_static.patch
@@ -0,0 +1,25 @@
+force jimtcl to build static
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
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
