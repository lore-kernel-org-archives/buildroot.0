From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 22 Mar 2019 10:58:15 +0100
Subject: [Buildroot] [PATCH v3 1/4] boot/arm-trusted-firmware: support
 alternate image files
Message-ID: <20190322095818.19914-1-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some platform may generate specific boot image files instead of
the generic files *.bin  when building TF-A package. This change
introduces new configuration directive for the arm-trusted-firmware
boot package.

BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES is boolean.
When disabled, install boot image files are .../*.bin.
When enabled, BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES shall
lists the names of the generated boot image files.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
 - Replace BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES and
   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES with unique config
   BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGE_NAMES.

Changes v1 -> v2:
 - No change
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index beb95fbf06..f4ed430aec 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -124,6 +124,13 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	  gets built before ATF, and that the appropriate BL33
 	  variable pointing to u-boot.bin is passed when building ATF.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGE_NAMES
+        string "Image names"
+        default "*.bin"
+        help
+	  File names of the generated boot images to be copied to
+	  output directory images/.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES
 	string "Additional ATF build variables"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 9a23e3d336..c3625cd986 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -136,6 +136,12 @@ define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
 endef
 endif
 
+define ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL
+        $(foreach f, $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGE_NAMES)),
+		echo $(f) && $(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f)
+        )
+endef
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
@@ -144,7 +150,7 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
-	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
+	$(ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
-- 
2.17.1
