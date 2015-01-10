From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:23 +0100
Subject: [Buildroot] [PATCH v2 4/8] boot/uboot: Add uboot-menuconfig and
	friends
In-Reply-To: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420897647-25001-5-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the uboot-menuconfig and friends make targets.

uboot-update-config is not supported since U-Boot uses up to three .config 
files (.config, spl/.config, tpl/.config) for board configuration. Furthermore
U-Boot provides its own custom defconfig format.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - Retain backward compatibility (Thomas)
---
 boot/uboot/uboot.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index aa2936f..30dcc49 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -182,6 +182,20 @@ endif
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
+ifeq ($(BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG),y)
+uboot-menuconfig uboot-xconfig uboot-gconfig uboot-nconfig: uboot-configure
+	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
+	rm -f $(UBOOT_DIR)/.stamp_{built,target_installed,images_installed}
+uboot-savedefconfig: uboot-configure
+	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
+ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
+uboot-update-defconfig: uboot-savedefconfig
+	cp -f $(UBOOT_DIR)/defconfig $(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)
+else
+uboot-update-defconfig: ;
+endif # BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
+endif # BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
+
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 
-- 
2.2.1
