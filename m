From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Wed, 13 Aug 2008 12:44:00 +0100
Subject: [Buildroot] [PATCH] Update i2c-tools to use new
	Makefile.autotools.in
Message-ID: <1218627840.12419.0.camel@lnx32dtp04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update i2c-tools to Makefile.autotools.in

 i2c-tools.mk |   47 ++++++++++++-----------------------------------
 1 file changed, 12 insertions(+), 35 deletions(-)

Signed-off-by: daniel.j.laird <daniel.j.laird@nxp.com>

diff -urN buildroot.orig/package/i2c-tools/i2c-tools.mk buildroot/package/i2c-tools/i2c-tools.mk
--- buildroot.orig/package/i2c-tools/i2c-tools.mk	2008-08-13 10:44:43.000000000 +0100
+++ buildroot/package/i2c-tools/i2c-tools.mk	2008-08-12 11:58:12.000000000 +0100
@@ -6,45 +6,22 @@
 I2C_TOOLS_VERSION:=3.0.1
 I2C_TOOLS_SOURCE:=i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE:=http://dl.lm-sensors.org/i2c-tools/releases/
-I2C_TOOLS_DIR:=$(BUILD_DIR)/i2c-tools-$(I2C_TOOLS_VERSION)
-I2C_TOOLS_BINARY:=tools/i2cdetect
-I2C_TOOLS_TARGET_BINARY:=usr/bin/i2cdetect
+I2C_TOOLS_AUTORECONF = NO
+I2C_TOOLS_INSTALL_STAGING = YES
+I2C_TOOLS_CONF_ENV =
+I2C_TOOLS_CONF_OPT =
+I2C_TOOLS_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
+I2C_TOOLS_DEPENDENCIES =
 
-$(DL_DIR)/$(I2C_TOOLS_SOURCE):
-	$(WGET) -P $(DL_DIR) $(I2C_TOOLS_SITE)/$(I2C_TOOLS_SOURCE)
+$(eval $(call AUTOTARGETS,package,i2c-tools))
 
-$(I2C_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(I2C_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(I2C_TOOLS_DIR) package/i2c-tools/ i2c-tools-$(I2C_TOOLS_VERSION)\*.patch
+$(I2C_TOOLS_TARGET_CONFIGURE):
 	touch $@
 
-$(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY): $(I2C_TOOLS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(I2C_TOOLS_DIR)
-
-$(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY): $(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY)
-	$(INSTALL) -m 755 -d $(@D)
+$(I2C_TOOLS_TARGET_INSTALL_TARGET):
 	for i in i2cdump i2cget i2cset i2cdetect; \
 	do \
-		$(INSTALL) -m 755 $(<D)/$$i $(@D); \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$$i; \
+		$(INSTALL) -m 755 $(I2C_TOOLS_DIR)/tools/$$i $(TARGET_DIR)/usr/bin; \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$$i; \
 	done
-
-i2c-tools: uclibc $(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY)
-
-i2c-tools-source: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
-
-i2c-tools-clean:
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,i2cdump i2cget i2cset i2cdetect)
-	-$(MAKE) -C $(I2C_TOOLS_DIR) clean
-
-i2c-tools-dirclean:
-	rm -rf $(I2C_TOOLS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_I2C_TOOLS)),y)
-TARGETS+=i2c-tools
-endif
+	touch $@
