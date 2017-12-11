From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Mon, 11 Dec 2017 19:47:08 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
Message-ID: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated the help text for the size of the uboot environment. The size of
the uboot environment, which is given in bytes, needs to be exactly
correct in order to calculate the CRC checksum as expected and
re-calculated by uboot during the target boot process. Otherwise the
environment is ignored during boot due to CRC mismatch.

Additionally, add the missing option to specify the padding byte which
is used by the mkenvimage -p parameter.

Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
---
 boot/uboot/Config.in | 13 +++++++++++--
 boot/uboot/uboot.mk  | 10 ++++++----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2829d2c..32e283a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -413,8 +413,17 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
 config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	string "Size of environment"
 	help
-	  Size of envronment, can be prefixed with 0x for hexadecimal
-	  values.
+	  Size of environment in bytes, can be prefixed with 0x for
+	  hexadecimal values. Needs to match exactly for correct CRC
+	  checksum calculation as re-calculated by uboot during each
+	  target boot. If a CRC mismatch occurs during boot the
+	  environment will be ignored.
+
+config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
+	hex "Padding byte"
+	default 0x00
+	help
+	  The byte used for padding at the end of the environment image.
 
 config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
 	bool "Environment has two copies"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3917599..43fdde4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -256,10 +256,12 @@ define UBOOT_INSTALL_IMAGES_CMDS
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
