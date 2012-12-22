From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sun, 23 Dec 2012 00:04:19 +0100
Subject: [Buildroot] [RFC 1/2] barebox: Build barebox in separate directory.
In-Reply-To: <1356217460-20232-1-git-send-email-marek.belisko@open-nandra.com>
References: <1356217460-20232-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1356217460-20232-2-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is necessary when we would like to add support for building also barebox
xloader (MLO).

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 boot/barebox/barebox.mk |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index a025d5f..16110b9 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -54,9 +54,12 @@ else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
 BAREBOX_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
 endif
 
+BAREBOX_BUILD_DIR = barebox
+
 define BAREBOX_CONFIGURE_CMDS
+	mkdir -p $(@D)/$(BAREBOX_BUILD_DIR)
 	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig O=$(BAREBOX_BUILD_DIR)
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
@@ -68,11 +71,11 @@ endif
 
 define BAREBOX_BUILD_CMDS
 	$(BAREBOX_BUILD_BAREBOXENV_CMDS)
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) O=$(BAREBOX_BUILD_DIR)
 endef
 
 define BAREBOX_INSTALL_IMAGES_CMDS
-	cp $(@D)/barebox.bin $(BINARIES_DIR)
+	cp $(@D)/$(BAREBOX_BUILD_DIR)/barebox.bin $(BINARIES_DIR)
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
@@ -97,15 +100,15 @@ barebox-menuconfig barebox-xconfig barebox-gconfig barebox-nconfig: barebox-conf
 	rm -f $(BAREBOX_DIR)/.stamp_{built,target_installed,images_installed}
 
 barebox-savedefconfig: barebox-configure
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) O=$(BAREBOX_BUILD_DIR) \
 		$(subst barebox-,,$@)
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-barebox-update-config: barebox-configure $(BAREBOX_DIR)/.config
-	cp -f $(BAREBOX_DIR)/.config $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+barebox-update-config: barebox-configure $(BAREBOX_DIR)/$(BAREBOX_BUILD_DIR)/.config
+	cp -f $(BAREBOX_DIR)/$(BAREBOX_BUILD_DIR)/.config $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
 
 barebox-update-defconfig: barebox-savedefconfig
-	cp -f $(BAREBOX_DIR)/defconfig $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+	cp -f $(BAREBOX_DIR)/$(BAREBOX_BUILD_DIR)/defconfig $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
 else
 barebox-update-config: ;
 barebox-update-defconfig: ;
-- 
1.7.10.4
