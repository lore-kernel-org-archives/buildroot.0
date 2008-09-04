From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 18:35:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  eeprog
Message-ID: <20080904013535.3D22C3C6EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 18:35:34 -0700 (Wed, 03 Sep 2008)
New Revision: 23314

Log:
Added eeprog package from gustavoz


Added:
   trunk/buildroot/package/eeprog/
   trunk/buildroot/package/eeprog/Config.in
   trunk/buildroot/package/eeprog/eeprog.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-09-04 01:19:52 UTC (rev 23313)
+++ trunk/buildroot/package/Config.in	2008-09-04 01:35:34 UTC (rev 23314)
@@ -242,6 +242,7 @@
 source "package/dm/Config.in"
 source "package/dmraid/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/fuse/Config.in"

Added: trunk/buildroot/package/eeprog/Config.in
===================================================================
--- trunk/buildroot/package/eeprog/Config.in	                        (rev 0)
+++ trunk/buildroot/package/eeprog/Config.in	2008-09-04 01:35:34 UTC (rev 23314)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EEPROG
+	bool "eeprog"
+	help
+	  Simple tool to read/write i2c eeprom chips.
+
+	  http://codesink.org/eeprog.html

Added: trunk/buildroot/package/eeprog/eeprog.mk
===================================================================
--- trunk/buildroot/package/eeprog/eeprog.mk	                        (rev 0)
+++ trunk/buildroot/package/eeprog/eeprog.mk	2008-09-04 01:35:34 UTC (rev 23314)
@@ -0,0 +1,46 @@
+#############################################################
+#
+# eeprog
+#
+#############################################################
+EEPROG_VERSION:=0.7.6
+EEPROG_SOURCE:=eeprog-$(EEPROG_VERSION).tar.gz
+EEPROG_SITE:=http://codesink.org/download
+EEPROG_DIR:=$(BUILD_DIR)/eeprog-$(EEPROG_VERSION)
+EEPROG_BINARY:=eeprog
+EEPROG_TARGET_BINARY:=usr/sbin/eeprog
+
+$(DL_DIR)/$(EEPROG_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(EEPROG_SITE)/$(EEPROG_SOURCE)
+
+eeprog-source: $(DL_DIR)/$(EEPROG_SOURCE)
+
+$(EEPROG_DIR)/.unpacked: $(DL_DIR)/$(EEPROG_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(EEPROG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(EEPROG_DIR) package/eeprog/ eeprog\*.patch
+	touch $(EEPROG_DIR)/.unpacked
+
+$(EEPROG_DIR)/$(EEPROG_BINARY): $(EEPROG_DIR)/.unpacked
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(EEPROG_DIR)
+	$(STRIPCMD) $(EEPROG_DIR)/$(EEPROG_BINARY)
+
+$(TARGET_DIR)/$(EEPROG_TARGET_BINARY): $(EEPROG_DIR)/$(EEPROG_BINARY)
+	$(INSTALL) -m 0755 -D $(EEPROG_DIR)/$(EEPROG_BINARY) $(TARGET_DIR)/$(EEPROG_TARGET_BINARY)
+
+eeprog: uclibc $(TARGET_DIR)/$(EEPROG_TARGET_BINARY)
+
+eeprog-clean:
+	rm -f $(TARGET_DIR)/$(EEPROG_TARGET_BINARY)
+	-$(MAKE) -C $(EEPROG_DIR) clean
+
+eeprog-dirclean:
+	rm -rf $(EEPROG_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_EEPROG)),y)
+TARGETS+=eeprog
+endif
