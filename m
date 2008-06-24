From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Jun 2008 02:55:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  i2c-tools
Message-ID: <20080624095538.13B913C658@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-24 02:55:37 -0700 (Tue, 24 Jun 2008)
New Revision: 22487

Log:
package/i2c-tools: I2C tools package

This package contains a heterogeneous set of I2C tools for Linux: a bus
probing tool, a chip dumper, register-level access helpers, EEPROM decoding
scripts, and more.

Based on patch by Michel (BusError).


Added:
   trunk/buildroot/package/i2c-tools/
   trunk/buildroot/package/i2c-tools/Config.in
   trunk/buildroot/package/i2c-tools/i2c-tools.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-06-24 08:36:37 UTC (rev 22486)
+++ trunk/buildroot/package/Config.in	2008-06-24 09:55:37 UTC (rev 22487)
@@ -258,6 +258,7 @@
 source "package/hotplug/Config.in"
 endif
 source "package/hwdata/Config.in"
+source "package/i2c-tools/Config.in"
 source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/libaio/Config.in"

Added: trunk/buildroot/package/i2c-tools/Config.in
===================================================================
--- trunk/buildroot/package/i2c-tools/Config.in	                        (rev 0)
+++ trunk/buildroot/package/i2c-tools/Config.in	2008-06-24 09:55:37 UTC (rev 22487)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_I2C_TOOLS
+    bool "i2c-tools"
+    default n
+    help
+        Heterogeneous set of I2C tools for Linux
+
+        This package contains a heterogeneous set of I2C tools for Linux:
+        a bus probing tool, a chip dumper, register-level access helpers,
+        EEPROM decoding scripts, and more.
+
+        http://www.lm-sensors.org

Added: trunk/buildroot/package/i2c-tools/i2c-tools.mk
===================================================================
--- trunk/buildroot/package/i2c-tools/i2c-tools.mk	                        (rev 0)
+++ trunk/buildroot/package/i2c-tools/i2c-tools.mk	2008-06-24 09:55:37 UTC (rev 22487)
@@ -0,0 +1,53 @@
+#############################################################
+#
+# i2c-tools
+#
+#############################################################
+I2C_TOOLS_VERSION:=3.0.1
+I2C_TOOLS_SOURCE:=i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
+I2C_TOOLS_SITE:=http://dl.lm-sensors.org/i2c-tools/releases/
+I2C_TOOLS_DIR:=$(BUILD_DIR)/i2c-tools-$(I2C_TOOLS_VERSION)
+I2C_TOOLS_BINARY:=tools/i2cdetect
+I2C_TOOLS_TARGET_BINARY:=usr/bin/i2cdetect
+
+$(DL_DIR)/$(I2C_TOOLS_SOURCE):
+	$(WGET) -P $(DL_DIR) $(I2C_TOOLS_SITE)/$(I2C_TOOLS_SOURCE)
+
+$(I2C_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
+	$(BZCAT) $(DL_DIR)/$(I2C_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(I2C_TOOLS_DIR) package/i2c-tools/ i2c-tools-$(I2C_TOOLS_VERSION)\*.patch
+	touch $@
+
+$(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY): $(I2C_TOOLS_DIR)/.unpacked
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(I2C_TOOLS_DIR)
+
+$(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY): $(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY)
+	$(INSTALL) -m 755 -d $(@D)
+	for i in i2cdump i2cget i2cset i2cdetect; \
+	do \
+		$(INSTALL) -m 755 $(<D)/$$i $(@D); \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$$i; \
+	done
+
+i2c-tools: uclibc $(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY)
+
+i2c-tools-source: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
+
+i2c-tools-clean:
+	for i in i2cdump i2cget i2cset i2cdetect; \
+	do \
+		rm -f $(TARGET_DIR)/usr/bin/$$i; \
+	done
+	-$(MAKE) -C $(I2C_TOOLS_DIR) clean
+
+i2c-tools-dirclean:
+	rm -rf $(I2C_TOOLS_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_I2C_TOOLS)),y)
+TARGETS+=i2c-tools
+endif
