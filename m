From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 19 Mar 2019 00:21:05 +0100
Subject: [Buildroot] [PATCH v2 4/8] boot/arm-trusted-firmware: support
 alternate image files
In-Reply-To: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1552951269-16967-4-git-send-email-etienne.carriere@linaro.org>
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
Changes v1 -> v2:
 - No change

---
 boot/arm-trusted-firmware/Config.in               | 20 ++++++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 14 +++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 9a152b9..bb88760 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -121,6 +121,26 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32
 
 endchoice
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES
+	bool "Use custom binary boot image filenames"
+	help
+	  If not set, build generates the boot image files with the
+	  generic filename that is images with .bin extension. These
+	  are copied to the output images/ directory.
+
+	  If enabled, use BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGES
+	  to list the generated file names.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES
+	string "Binary boot image filenames"
+	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES
+	help
+	  This is used when TF-A platform generates boot image files
+	  with custom file names. When so, this should list the path
+	  of the generated files location relatively to the package
+	  build root directory. These files are copied to the output
+	  images/ directory.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 68be00d..45c2311 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -135,6 +135,18 @@ define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
 endef
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES),y)
+define ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL
+	$(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES)), \
+		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/ \
+	)
+endef
+else
+define ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL
+	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
+endef
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
@@ -143,7 +155,7 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
-	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
+	$(ARM_TRUSTED_FIRMWARE_BL_IMAGES_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
-- 
1.9.1
