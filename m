From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  3 May 2018 18:23:34 +0200
Subject: [Buildroot] [PATCH v3 2/5] arm-trusted-firmware: generate
 atf-uboot.ub image of bl31.bin
In-Reply-To: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1525364617-23633-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot SPL for the Xilinx ZynqMP SoCs needs ATF in this format to load
it.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v2 -> v3 (Thomas):
 - Make the option not ZynqMP-specific
 - Simplify the grep+sed expression to extract the entry point address
 - Rather than hooks, just use directly BUILD_CMDS and INSTALL_IMAGES_CMDS
 - Use $(INSTALL), not install

Changes v1 -> v2: none.
---
 boot/arm-trusted-firmware/Config.in               |  8 ++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 7aef87cb746c..885d93e62f47 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -71,6 +71,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	  typically used on platforms where another bootloader (e.g
 	  U-Boot) encapsulates ATF BL31.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT
+	bool "Build BL31 U-Boot image"
+	select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
+	help
+	  Generates a U-Boot image named atf-uboot.ub containing
+	  bl31.bin.  This is used for example by the Xilinx version of
+	  U-Boot SPL to load ATF on the ZynqMP SoC.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 212bb5049f2b..054a000a1dd3 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -75,15 +75,36 @@ ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT),y)
+define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_BUILD
+# Get the entry point address from the elf.
+	BASE_ADDR=$$($(TARGET_READELF) -h $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf | \
+	             sed -r '/^  Entry point address:\s*(.*)/!d; s//\1/') && \
+	$(HOST_DIR)/bin/mkimage \
+		-A arm64 -O arm-trusted-firmware -C none \
+		-a $${BASE_ADDR} -e $${BASE_ADDR} \
+		-d $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31.bin \
+		$(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub
+endef
+define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL
+	$(INSTALL) -m 0644 $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/atf-uboot.ub \
+		$(BINARIES_DIR)/atf-uboot.ub
+endef
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RESET_TO_BL31=1
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
 			$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
+	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_BUILD)
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
+	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
 endef
 
 # Configuration check
-- 
2.7.4
