From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 08:37:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libaio
Message-ID: <20070728153712.3B630A4678@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 08:37:11 -0700 (Sat, 28 Jul 2007)
New Revision: 19290

Log:
Add libaio package

Added:
   trunk/buildroot/package/libaio/
   trunk/buildroot/package/libaio/Config.in
   trunk/buildroot/package/libaio/libaio.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-28 15:30:20 UTC (rev 19289)
+++ trunk/buildroot/package/Config.in	2007-07-28 15:37:11 UTC (rev 19290)
@@ -214,6 +214,7 @@
 endif
 source "package/hwdata/Config.in"
 source "package/iostat/Config.in"
+source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/libusb/Config.in"
 source "package/lvm2/Config.in"

Added: trunk/buildroot/package/libaio/Config.in
===================================================================
--- trunk/buildroot/package/libaio/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libaio/Config.in	2007-07-28 15:37:11 UTC (rev 19290)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBAIO
+	bool "libaio"
+	default n
+	help
+	  Library for doing asynchronous I/O

Added: trunk/buildroot/package/libaio/libaio.mk
===================================================================
--- trunk/buildroot/package/libaio/libaio.mk	                        (rev 0)
+++ trunk/buildroot/package/libaio/libaio.mk	2007-07-28 15:37:11 UTC (rev 19290)
@@ -0,0 +1,50 @@
+#############################################################
+#
+# libaio
+#
+#############################################################
+LIBAIO_VERSION=0.3.106-avr32
+LIBAIO_SOURCE=libaio-$(LIBAIO_VERSION).tar.bz2
+LIBAIO_SITE=http://avr32linux.org/twiki/pub/Main/LibAio/
+LIBAIO_DIR=$(BUILD_DIR)/libaio-$(LIBAIO_VERSION)
+LIBAIO_SOVER=1.0.1
+
+LIBAIO_ARCH:=$(ARCH)
+LIBAIO_MAKEOPTS:= $(TARGET_CONFIGURE_OPTS) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) -nostdlib -nostartfiles -I. -fPIC" LDFLAGS="$(TARGET_LDFLAGS)"
+
+$(DL_DIR)/$(LIBAIO_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBAIO_SITE)/$(LIBAIO_SOURCE)
+
+$(LIBAIO_DIR)/.unpacked: $(DL_DIR)/$(LIBAIO_SOURCE)
+	$(BZCAT) $(DL_DIR)/$(LIBAIO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBAIO_DIR) package/libaio libaio\*.patch
+	touch $@
+
+$(LIBAIO_DIR)/src/libaio.so.$(LIBAIO_SOVER): $(LIBAIO_DIR)/.unpacked
+	$(MAKE) -C $(LIBAIO_DIR) $(LIBAIO_MAKEOPTS)
+
+$(STAGING_DIR)/usr/lib/libaio.so: $(LIBAIO_DIR)/src/libaio.so.$(LIBAIO_SOVER)
+	$(MAKE) -C $(LIBAIO_DIR) $(LIBAIO_MAKEOPTS) prefix=$(STAGING_DIR)/usr install
+
+$(TARGET_DIR)/usr/lib/libaio.so: $(STAGING_DIR)/usr/lib/libaio.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libaio.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libaio.so
+
+libaio: uclibc $(TARGET_DIR)/usr/lib/libaio.so
+
+libaio-source: $(DL_DIR)/$(LIBAIO_SOURCE)
+
+libaio-clean:
+	-$(MAKE) -C $(LIBAIO_DIR) $(LIBAIO_MAKEOPTS) clean
+
+libaio-dirclean:
+	rm -rf $(LIBAIO_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBAIO)),y)
+TARGETS+=libaio
+endif
