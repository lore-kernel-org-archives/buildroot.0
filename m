From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:35 +0100
Subject: [Buildroot] [PATCH 04/39] olsr: rework on top of the generic
	infrastructure
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f32a8b02a74eb9600550078786a240e9742c22e7.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.mk |   60 +++++++++++++++----------------------------------
 1 files changed, 19 insertions(+), 41 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 9107653..75d5d66 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -9,55 +9,33 @@ OLSR_VERSION_MINOR=6
 OLSR_VERSION:=$(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
 OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
-OLSR_DIR:=$(BUILD_DIR)/olsrd-$(OLSR_VERSION)
-OLSR_CAT:=$(BZCAT)
 OLSR_BINARY:=olsrd
 OLSR_TARGET_BINARY:=usr/sbin/olsrd
 #OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
 OLSR_PLUGINS=dot_draw dyn_gw secure
 OLSR_TARGET_PLUGIN=usr/lib/
 
-$(DL_DIR)/$(OLSR_SOURCE):
-	$(call DOWNLOAD,$(OLSR_SITE),$(OLSR_SOURCE))
-
-olsr-source: $(DL_DIR)/$(OLSR_SOURCE)
-
-olsr-unpacked: $(OLSR_DIR)/.unpacked
-$(OLSR_DIR)/.unpacked: $(DL_DIR)/$(OLSR_SOURCE)
-	$(OLSR_CAT) $(DL_DIR)/$(OLSR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OLSR_DIR) olsrd $(OLSR_PLUGINS)
-
-$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
-	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
-	cp -dpf $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
-	cp -R $(OLSR_DIR)/lib/*/olsrd_*.so* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
-	mkdir -p $(TARGET_DIR)/etc/init.d
-	cp -dpf package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/
-	test -r $(TARGET_DIR)/etc/olsrd.conf || \
-		cp -dpf $(OLSR_DIR)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so*
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-olsr: $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
-
-olsr-clean:
+define OLSR_BUILD_CMDS
+ $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) olsrd $(OLSR_PLUGINS)
+endef
+
+define OLSR_INSTALL_TARGET_CMDS
+ cp -dpf $(@D)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+ cp -R $(@D)/lib/*/olsrd_*.so* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
+ mkdir -p $(TARGET_DIR)/etc/init.d
+ cp -dpf package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/
+ test -r $(TARGET_DIR)/etc/olsrd.conf || \
+   cp -dpf $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
+ -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so*
+ $(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+endef
+
+define OLSR_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY) \
 		$(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so* \
 		$(TARGET_DIR)/etc/init.d/S50olsr \
 		$(TARGET_DIR)/etc/olsrd.conf
-	-$(MAKE) -C $(OLSR_DIR) clean
+	-$(MAKE) -C $(@D) clean
+endef
 
-olsr-dirclean:
-	rm -rf $(OLSR_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_OLSR),y)
-TARGETS+=olsr $(OLSR_PLUGINS)
-endif
+$(eval $(call GENTARGETS,package,olsr))
-- 
1.6.3.3
