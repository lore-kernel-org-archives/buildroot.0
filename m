From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Thu, 20 Dec 2012 13:47:18 +0100
Subject: [Buildroot] [PATCH 2/2] uboot: integrate mkenvimage.
In-Reply-To: <1356007638-18476-1-git-send-email-rebillout@syscom.ch>
References: <1356007638-18476-1-git-send-email-rebillout@syscom.ch>
Message-ID: <1356007638-18476-2-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit provides configuration options to automatically generate a
binary environment image for U-Boot.
Two options are available (and mandatory):
 * the location of a text file describing U-Boot environment.
 * the size of the environment.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 boot/uboot/Config.in |   21 +++++++++++++++++++++
 boot/uboot/uboot.mk  |   16 ++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d8458d9..06f6b5a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -208,4 +208,25 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  u-boot build. For most platform it is u-boot-spl.bin
 	  but not always. It is MLO on OMAP for example.
 
+menuconfig BR2_TARGET_UBOOT_ENVIMAGE
+	bool "Environment image"
+	help
+	  Generate a valid binary environment image from a text file
+	  describing the key=value pairs of the environment.
+
+if BR2_TARGET_UBOOT_ENVIMAGE
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
+       string "Source file for environment"
+       help
+         Text file describing the environment.
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
+       string "Size of environment"
+       help
+         Size of envronment, can be prefixed with 0x for hexadecimal
+	 values.
+       
+endif # BR2_TARGET_UBOOT_ENVIMAGE
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 619f2e1..89a9096 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -104,6 +104,9 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
+	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
+		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 endef
 
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
@@ -125,6 +128,19 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
+# we NEED a environment settings unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
+$(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
+endif
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
+$(error Please provide Uboot environment size (BR2_TARGET_UBOOT_OMAP_IFT_CONFIG setting))
+endif
+endif
+UBOOT_DEPENDENCIES += host-uboot-tools
+endif
+
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
-- 
1.7.10.4
