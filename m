From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:07 -0700
Subject: [Buildroot] [PATCH 16/18] lm-sensors: convert to gentargets and
	bump to 3.1.2
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-16-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/lm-sensors/lm-sensors.mk |   65 +++++++++++--------------------------
 1 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 1844f75..22008a4 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -3,58 +3,33 @@
 # lm-sensors
 #
 #############################################################
-LM_SENSORS_VERSION:=3.0.2
-LM_SENSORS_SOURCE:=lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
-LM_SENSORS_SITE:=http://dl.lm-sensors.org/lm-sensors/releases
-LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
-LM_SENSORS_CAT:=$(BZCAT)
-LM_SENSORS_BINARY:=prog/sensors/sensors
-LM_SENSORS_TARGET_BINARY:=usr/bin/sensors
+LM_SENSORS_VERSION = 3.1.2
+LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
+LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
+LM_SENSORS_BINARY = prog/sensors/sensors
+LM_SENSORS_TARGET_BINARY = usr/bin/sensors
 
-$(DL_DIR)/$(LM_SENSORS_SOURCE):
-	$(call DOWNLOAD,$(LM_SENSORS_SITE),$(LM_SENSORS_SOURCE))
+define LM_SENSORS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH) -C $(@D)
+endef
 
-$(LM_SENSORS_DIR)/.unpacked: $(DL_DIR)/$(LM_SENSORS_SOURCE)
-	$(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LM_SENSORS_DIR) package/lm-sensors/ lm-sensors\*.patch
-	touch $@
-
-$(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY): $(LM_SENSORS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH)\
-		-C $(LM_SENSORS_DIR)
-
-$(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY): $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
+define LM_SENSORS_INSTALL_TARGET_CMDS
 	if [ ! -f $(TARGET_DIR)/etc/sensors.conf ]; then \
-		cp -dpf $(LM_SENSORS_DIR)/etc/sensors.conf.eg \
-			$(TARGET_DIR)/etc/sensors.conf; \
-		$(SED) '/^#/d' -e '/^[[:space:]]*$$/d' \
-			$(TARGET_DIR)/etc/sensors.conf; \
+		cp -dpf $(@D)/etc/sensors.conf.eg $(TARGET_DIR)/etc/sensors.conf; \
+		$(SED) '/^#/d' -e '/^[[:space:]]*$$/d' $(TARGET_DIR)/etc/sensors.conf; \
 	fi
-	cp -dpf $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY) $@
-	cp -dpf $(LM_SENSORS_DIR)/lib/libsensors.so* \
-		$(LM_SENSORS_DIR)/lib/libsensors.a $(TARGET_DIR)/usr/lib/
+	cp -dpf $(@D)/$(LM_SENSORS_BINARY) $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
+	cp -dpf $(@D)/lib/libsensors.so* \
+		$(@D)/lib/libsensors.a $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/lib/libsensors.so*
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-lm-sensors-source: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(LM_SENSORS_PATCH_FILE)
-
-lm-sensors-unpacked: $(LM_SENSORS_DIR)/.unpacked
-
-lm-sensors: $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
+endef
 
-lm-sensors-clean:
-	-$(MAKE) -C $(LM_SENSORS_DIR) clean
+define LM_SENSORS_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
 	rm -f $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY) \
 		$(TARGET_DIR)/usr/lib/libsensors* \
 		$(TARGET_DIR)/etc/sensors.conf
+endef
 
-lm-sensors-dirclean:
-	rm -rf $(LM_SENSORS_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
-TARGETS+=lm-sensors
-endif
+$(eval $(call GENTARGETS,package,lm-sensors))
-- 
1.7.3
