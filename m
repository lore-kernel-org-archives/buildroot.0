From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] i2c-tools: convert to the generic
	package infrastructure
Message-ID: <20091216153100.6805577738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc71ad7d5a46c1223fc7933362aab26e49137f98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/i2c-tools.mk |   44 +++++++--------------------------------
 1 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 5d28e1d..d419524 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -6,45 +6,17 @@
 I2C_TOOLS_VERSION:=3.0.2
 I2C_TOOLS_SOURCE:=i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE:=http://dl.lm-sensors.org/i2c-tools/releases/
-I2C_TOOLS_DIR:=$(BUILD_DIR)/i2c-tools-$(I2C_TOOLS_VERSION)
-I2C_TOOLS_BINARY:=tools/i2cdetect
-I2C_TOOLS_TARGET_BINARY:=usr/bin/i2cdetect
 
-$(DL_DIR)/$(I2C_TOOLS_SOURCE):
-	$(call DOWNLOAD,$(I2C_TOOLS_SITE),$(I2C_TOOLS_SOURCE))
+define I2C_TOOLS_BUILD_CMDS
+ $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-$(I2C_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(I2C_TOOLS_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(I2C_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(I2C_TOOLS_DIR) package/i2c-tools/ i2c-tools-$(I2C_TOOLS_VERSION)\*.patch
-	touch $@
-
-$(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY): $(I2C_TOOLS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(I2C_TOOLS_DIR)
-
-$(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY): $(I2C_TOOLS_DIR)/$(I2C_TOOLS_BINARY)
-	$(INSTALL) -m 755 -d $(@D)
+define I2C_TOOLS_INSTALL_TARGET_CMDS
 	for i in i2cdump i2cget i2cset i2cdetect; \
 	do \
-		$(INSTALL) -m 755 $(<D)/$$i $(@D); \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$$i; \
+		$(INSTALL) -m 755 $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$$i; \
 	done
+endef
 
-i2c-tools: $(TARGET_DIR)/$(I2C_TOOLS_TARGET_BINARY)
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
-ifeq ($(BR2_PACKAGE_I2C_TOOLS),y)
-TARGETS+=i2c-tools
-endif
+$(eval $(call GENTARGETS,package,i2c-tools))
-- 
1.6.3.3
