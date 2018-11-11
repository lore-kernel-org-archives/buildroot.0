From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun, 11 Nov 2018 17:11:01 +0100
Subject: [Buildroot] [PATCH] uboot: add support for bundling ATF BL31 in ELF
 format into U-Boot
Message-ID: <20181111161101.4209-1-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rockchip's rk3328 encapsulates the BL31 part of ATP but it needs
image in ELF format. This is extension to
2c4809e6088660dc71de9de8cee0bba312aafbe4

This commit introduces a BR_TARGET_UBOOT_NEEDS_ATF_BL31_ELF variable
to achieve this.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
Tested-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 7 +++++++
 boot/uboot/Config.in                              | 7 +++++++
 boot/uboot/uboot.mk                               | 4 ++++
 3 files changed, 18 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 23f493653d..99b67b126d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -94,6 +94,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RESET_TO_BL31=1
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
 endif
 
+ifeq ($(BR_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
+define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
+	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf $(BINARIES_DIR)/
+endef
+endif
+
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
@@ -104,6 +110,7 @@ endef
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
+	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
 
 # Configuration check
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ac6f8bc8c1..ffcdc45269 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -179,6 +179,13 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	  variable pointing to ATF's BL31 binary, is passed during the
 	  Buildroot build.
 
+config BR_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
+	bool "U-Boot needs bl31.elf"
+	depends on BR2_TARGET_UBOOT_NEEDS_ATF_BL31
+	help
+		Uses bl31.elf instead of bl31.bin image.  This is needed by some
+		platforms (like rk3328) to generate valid uboot.itb with ATF
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cbdfee6ac3..1aa6c72c8e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -137,8 +137,12 @@ UBOOT_MAKE_OPTS += \
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
+ifeq ($(BR_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
+UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
+else
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
 endif
+endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
-- 
2.18.1
