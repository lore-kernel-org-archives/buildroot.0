From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:00 +0100
Subject: [Buildroot] [PATCH 03/14] boot/uboot.mk: Add uboot-menuconfig and
	friends
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-4-git-send-email-jkrause@posteo.de>
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
 boot/uboot/uboot.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 17565e4..72603e0 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -177,6 +177,7 @@ endif
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
+
 # Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 
@@ -214,4 +215,19 @@ endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
 endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 endif # filter source
+
+uboot-menuconfig uboot-xconfig uboot-gconfig uboot-nconfig: uboot-configure
+	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_FLAGS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
+	rm -f $(UBOOT_DIR)/.stamp_{built,target_installed,images_installed}
+
+uboot-savedefconfig: uboot-configure
+	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_FLAGS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
+
+ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
+uboot-update-defconfig: uboot-savedefconfig
+	cp -f $(UBOOT_DIR)/defconfig $(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)
+else
+uboot-update-defconfig: ;
+endif
+
 endif # BR2_TARGET_UBOOT
-- 
2.1.3
