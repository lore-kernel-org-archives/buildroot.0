From: Schenk Michael <michael.schenk@noser.com>
Date: Fri, 15 Nov 2019 07:51:01 +0000
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add pattern
 based copy for ATF as already used for u-boot
Message-ID: <1573804220-8890-1-git-send-email-michael.schenk@noser.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds support for different platforms where the
binaries have different extensions.

Signed-off-by: Michael Schenk <michael.schenk@noser.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index beb95fb..78c0301 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -135,4 +135,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
 	help
 	  Enable this option to build ATF with DEBUG=1.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
+	string "Binary boot images"
+	default "*.bin"
+	help
+	  Names of generated image files that are installed in the
+	  output images/ directory.
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index a7814e5..e528686 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -146,7 +146,9 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
-	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
+	$(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
+		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
+	)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
-- 
2.7.4
