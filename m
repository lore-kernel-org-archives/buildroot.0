From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 10 Oct 2013 11:05:45 +0100
Subject: [Buildroot] [PATCH] uboot: support -p option for mkenvimage
Message-ID: <1381399545-30713-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/uboot/Config.in | 6 ++++++
 boot/uboot/uboot.mk  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 998cda2..c341670 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -242,6 +242,12 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	  Size of envronment, can be prefixed with 0x for hexadecimal
 	  values.
 
+config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
+	string "Padding byte"
+	default "0xff"
+	help
+	  Pad the image with the specified byte.
+
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dc8e26f..77cad6a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -117,6 +117,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
 		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+		-p $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE)) \
 		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 endef
 
-- 
1.8.1.2
