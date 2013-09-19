From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Thu, 19 Sep 2013 13:10:06 +0200
Subject: [Buildroot] [PATCH 1/1] u-boot: allow to pass a custom
	configuration file
Message-ID: <1379589006-28682-1-git-send-email-eric.jarrige@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
---
 boot/uboot/Config.in |   18 ++++++++++++++++++
 boot/uboot/uboot.mk  |    3 +++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1b98339..1358f4a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -71,6 +71,24 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
 endif
 
 choice
+	prompt "U-Boot configuration"
+	default BR2_TARGET_UBOOT_USE_DEFCONFIG
+
+config BR2_TARGET_UBOOT_USE_DEFCONFIG
+	bool "Using default configuration"
+
+config BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	bool "Using a custom configuration file"
+
+endchoice
+
+config BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+	help
+	  Path to the customized U-Boot configuration file
+
+choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 631da6b..8bcf260 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -80,6 +80,9 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
 define UBOOT_CONFIGURE_CMDS
+	$(if $(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),
+		cp -pf $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)) \
+			$(@D)/include/configs/$(UBOOT_BOARD_NAME).h)
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
 		$(UBOOT_BOARD_NAME)_config
-- 
1.7.2.5
