From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Sun, 10 Dec 2017 18:09:09 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
Message-ID: <1512925749-708-1-git-send-email-johannes.schmitz1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The size of the uboot environment (which is in bytes -> help text
updated) as well as the padding bytes have to be exactly correct in
order to generate an image with the correct CRC checksum that can be
read by the target during boot. Hence we add the option to specify the
padding byte which is used by mkenvimage and updated the help texts to
inform the user about the importance of these parameters.

Also cleaned up and reindented all mkenvimage parameters.

Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
---
 boot/uboot/Config.in | 11 +++++++++--
 boot/uboot/uboot.mk  | 10 ++++++----
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8215912..b52fb81 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -400,8 +400,15 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
 config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	string "Size of environment"
 	help
-	  Size of envronment, can be prefixed with 0x for hexadecimal
-	  values.
+	  Size of environment in bytes, can be prefixed with 0x for hexadecimal
+	  values. Needs to match exactly for correct CRC checksum calculation.
+
+config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
+	hex "Padding byte"
+	default 0x00
+	help
+	  The byte used for padding at the end of the environment image.
+	  Needs to be correct for correct CRC checksum calculation.
 
 config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
 	bool "Environment has two copies"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a1fac7d..8796e8d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -251,10 +251,12 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
 		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
-			$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
-			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-			$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
-			-o $(BINARIES_DIR)/uboot-env.bin -)
+			$(HOST_DIR)/bin/mkenvimage \
+				$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
+				$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
+				-p $(BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE) \
+				-s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+				-o $(BINARIES_DIR)/uboot-env.bin -)
 	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
 		$(HOST_DIR)/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
 			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
-- 
2.7.4
