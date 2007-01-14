From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 19:38:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  hwdata
Message-ID: <20070114033803.65644485BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 19:38:02 -0800 (Sat, 13 Jan 2007)
New Revision: 17283

Log:
Add new 'hwdata' package which we will need for D-Bus and HAL.


Added:
   trunk/buildroot/package/hwdata/
   trunk/buildroot/package/hwdata/Config.in
   trunk/buildroot/package/hwdata/hwdata.mk


Changeset:
Added: trunk/buildroot/package/hwdata/Config.in
===================================================================
--- trunk/buildroot/package/hwdata/Config.in	                        (rev 0)
+++ trunk/buildroot/package/hwdata/Config.in	2007-01-14 03:38:02 UTC (rev 17283)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HWDATA
+	bool "hwdata"
+	default n
+	help
+	  Various hardware identification and configuration data, such as
+	  the pci.ids database, or the XFree86/xorg Cards database.

Added: trunk/buildroot/package/hwdata/hwdata.mk
===================================================================
--- trunk/buildroot/package/hwdata/hwdata.mk	                        (rev 0)
+++ trunk/buildroot/package/hwdata/hwdata.mk	2007-01-14 03:38:02 UTC (rev 17283)
@@ -0,0 +1,50 @@
+#############################################################
+#
+# hwdata
+#
+#############################################################
+HWDATA_VERSION:=0.191
+HWDATA_SOURCE:=hwdata_$(HWDATA_VERSION).orig.tar.gz
+HWDATA_PATCH:=hwdata_$(HWDATA_VERSION)-1.diff.gz
+HWDATA_SITE:=http://ftp.debian.org/debian/pool/main/h/hwdata/
+HWDATA_CAT:=$(ZCAT)
+HWDATA_DIR:=$(BUILD_DIR)/hwdata-$(HWDATA_VERSION)
+HWDATA_BINARY:=pci.ids
+HWDATA_TARGET_BINARY:=usr/share/hwdata/pci.ids
+
+$(DL_DIR)/$(HWDATA_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(HWDATA_SITE)/$(HWDATA_SOURCE)
+
+$(DL_DIR)/$(HWDATA_PATCH):
+	 $(WGET) -P $(DL_DIR) $(HWDATA_SITE)/$(HWDATA_PATCH)
+
+hwdata-source: $(DL_DIR)/$(HWDATA_SOURCE) $(DL_DIR)/$(HWDATA_PATCH)
+
+$(HWDATA_DIR)/.unpacked: $(DL_DIR)/$(HWDATA_SOURCE) $(DL_DIR)/$(HWDATA_PATCH)
+	$(HWDATA_CAT) $(DL_DIR)/$(HWDATA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(HWDATA_DIR) $(DL_DIR) $(HWDATA_PATCH)
+	touch $(HWDATA_DIR)/.unpacked
+
+$(TARGET_DIR)/$(HWDATA_TARGET_BINARY): $(HWDATA_DIR)/.unpacked
+	mkdir -p -m 755 $(TARGET_DIR)/usr/share/hwdata
+	cp -a $(HWDATA_DIR)/pci.ids $(TARGET_DIR)/usr/share/hwdata
+	cp -a $(HWDATA_DIR)/usb.ids $(TARGET_DIR)/usr/share/hwdata
+	-touch -c $(TARGET_DIR)/usr/share/hwdata/*
+
+hwdata: uclibc $(TARGET_DIR)/$(HWDATA_TARGET_BINARY)
+
+hwdata-clean:
+	rm -rf $(TARGET_DIR)/usr/share/hwdata
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+
+hwdata-dirclean:
+	rm -rf $(HWDATA_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_HWDATA)),y)
+TARGETS+=hwdata
+endif
