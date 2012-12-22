From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sun, 23 Dec 2012 00:04:20 +0100
Subject: [Buildroot] [RFC 2/2] barebox: Add possibility to build also
	barebox xloader (MLO).
In-Reply-To: <1356217460-20232-1-git-send-email-marek.belisko@open-nandra.com>
References: <1356217460-20232-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1356217460-20232-3-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This add config option for user to select defconfig or custom xloader config.
Barebox have xloader defconfig for:
phycard_a_xl2_xload_defconfig
pcm049_xload_defconfig
archosg9_xload_defconfig
phycard_a_l1_xload_defconfig
omap3530_beagle_xload_defconfig
panda_xload_defconfig

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 boot/barebox/Config.in  |   28 ++++++++++++++++++++++++++++
 boot/barebox/barebox.mk |   28 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 95f330f..bb20542 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -99,4 +99,32 @@ config BR2_TARGET_BAREBOX_BAREBOXENV
 	help
 	  Install bareboxenv tool in target.
 
+choice
+	prompt "Barebox xloader configuration"
+	default BR2_TARGET_BAREBOX_XLOADER_NONE
+
+config BR2_TARGET_BAREBOX_XLOADER_NONE
+	bool "None"
+
+config BR2_TARGET_BAREBOX_XLOADER_USE_DEFCONFIG
+	bool "Using defconfig"
+
+config BR2_TARGET_BAREBOX_XLOADER_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_BOARD_XLOADER_DEFCONFIG
+	string "board xloader defconfig"
+	depends on BR2_TARGET_BAREBOX_XLOADER_USE_DEFCONFIG
+	help
+	  Name of the board for which Barebox xloader should be built, without
+	  the _defconfig suffix (can be used for pandaboard, beagleboard ...).
+
+config BR2_TARGET_BAREBOX_XLOADER_CUSTOM_CONFIG_FILE
+	string "Xloader configuration file path"
+	depends on BR2_TARGET_BAREBOX_XLOADER_USE_CUSTOM_CONFIG
+	help
+	  Path to the barebox custom xloader configuration file.
+
 endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 16110b9..199b708 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -56,7 +56,33 @@ endif
 
 BAREBOX_BUILD_DIR = barebox
 
+ifneq ($(BR2_TARGET_BAREBOX_XLOADER_NONE),y)
+ifeq ($(BR2_TARGET_BAREBOX_XLOADER_USE_DEFCONFIG),y)
+BAREBOX_XLOADER_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_XLOADER_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_BAREBOX_XLOADER_USE_CUSTOM_CONFIG),y)
+BAREBOX_XLOADER_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_XLOADER_CUSTOM_CONFIG_FILE)
+endif
+
+BAREBOX_XLOADER_BUILD_DIR = MLO
+
+define BAREBOX_XLOADER_CONFIGURE_CMDS
+	mkdir -p $(@D)/$(BAREBOX_XLOADER_BUILD_DIR)
+	cp $(BAREBOX_XLOADER_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_xload_defconfig
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_xload_defconfig O=$(BAREBOX_XLOADER_BUILD_DIR)
+endef
+
+define BAREBOX_XLOADER_BUILD_CMDS
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) O=$(BAREBOX_XLOADER_BUILD_DIR)
+endef
+
+define BAREBOX_XLOADER_INSTALL_IMAGES_CMDS
+	cp $(@D)/$(BAREBOX_XLOADER_BUILD_DIR)/MLO $(BINARIES_DIR)
+endef
+
+endif
+
 define BAREBOX_CONFIGURE_CMDS
+	$(BAREBOX_XLOADER_CONFIGURE_CMDS)
 	mkdir -p $(@D)/$(BAREBOX_BUILD_DIR)
 	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
 	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig O=$(BAREBOX_BUILD_DIR)
@@ -70,11 +96,13 @@ endef
 endif
 
 define BAREBOX_BUILD_CMDS
+	$(BAREBOX_XLOADER_BUILD_CMDS)
 	$(BAREBOX_BUILD_BAREBOXENV_CMDS)
 	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) O=$(BAREBOX_BUILD_DIR)
 endef
 
 define BAREBOX_INSTALL_IMAGES_CMDS
+	$(BAREBOX_XLOADER_INSTALL_IMAGES_CMDS)
 	cp $(@D)/$(BAREBOX_BUILD_DIR)/barebox.bin $(BINARIES_DIR)
 endef
 
-- 
1.7.10.4
