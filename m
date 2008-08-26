From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 26 Aug 2008 07:01:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/i2c-tools
Message-ID: <20080826140137.EB84E3C80A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-26 07:01:37 -0700 (Tue, 26 Aug 2008)
New Revision: 23207

Log:
reverse changes to i2c-tools.mk until I tidy it up (get clean working for example)
Still feel a good change to make as some of the suggestions recently made it look
like Makefile.autotools.in might add support for installing a list of binaries etc
and this would benefit this package.



Modified:
   trunk/buildroot/package/i2c-tools/i2c-tools.mk


Changeset:
Modified: trunk/buildroot/package/i2c-tools/i2c-tools.mk
===================================================================
--- trunk/buildroot/package/i2c-tools/i2c-tools.mk	2008-08-26 13:45:39 UTC (rev 23206)
+++ trunk/buildroot/package/i2c-tools/i2c-tools.mk	2008-08-26 14:01:37 UTC (rev 23207)
@@ -6,22 +6,45 @@
 I2C_TOOLS_VERSION:=3.0.1
 I2C_TOOLS_SOURCE:=i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE:=http://dl.lm-sensors.org/i2c-tools/releases/
-I2C_TOOLS_AUTORECONF = NO
-I2C_TOOLS_INSTALL_STAGING = YES
-I2C_TOOLS_CONF_ENV =
-I2C_TOOLS_CONF_OPT =
-I2C_TOOLS_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
-I2C_TOOLS_DEPENDENCIES =
+I2C_TOOLS_DIR:=$(BUILD_DIR)/i2c-tools-$(I2C_TOOLS_VERSION)
+I2C_TOOLS_BINARY:=tools/i2cdetect
+I2C_TOOLS_TARGET_BINARY:=usr/bin/i2cdetect
 
-$(eval $(call AUTOTARGETS,package,i2c-tools))
+$(DL_DIR)/$(I2C_TOOLS_SOURCE):
+	$(WGET) -P $(DL_DIR) $(I2C_TOOLS_SITE)/$(I2C_TOOLS_SOURCE)
 
-$(I2C_TOOLS_TARGET_CONFIGURE):
+$(I2C_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
+	$(BZCAT) $(DL_DIR)/$(I2C_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(I2C_TOOLS_DIR) package/i2c-tools/ i2c-tools-$(I2C_TOOLS_VERSION)\*.patch
 	touch $@
 
-$(I2C_TOOLS_TARGET_INSTALL_TARGET):
+$(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY): $(I2C_TOOLS_DIR)/.unpacked
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(I2C_TOOLS_DIR)
+
+$(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY): $(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY)
+	$(INSTALL) -m 755 -d $(@D)
 	for i in i2cdump i2cget i2cset i2cdetect; \
 	do \
-		$(INSTALL) -m 755 $(I2C_TOOLS_DIR)/tools/$$i $(TARGET_DIR)/usr/bin; \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$$i; \
+		$(INSTALL) -m 755 $(<D)/$$i $(@D); \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$$i; \
 	done
-	touch $@
+
+i2c-tools: uclibc $(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY)
+
+i2c-tools-source: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
+
+i2c-tools-clean:
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,i2cdump i2cget i2cset i2cdetect)
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
