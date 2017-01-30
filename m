From: Lionel Flandrin <lionel@svkt.org>
Date: Mon, 30 Jan 2017 11:33:26 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: Add support for Altera mkpimage
	generation
In-Reply-To: <20170130103326.14427-1-lionel@svkt.org>
References: <20170128112720.umcchfeyyc7i6rdo@localhost.localdomain>
 <20170130103326.14427-1-lionel@svkt.org>
Message-ID: <20170130103326.14427-2-lionel@svkt.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This image format is used by Altera's SoC FPGAs BootROMs.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
---
 boot/uboot/Config.in | 30 ++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  | 12 ++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4e629c0ef..30db8d8b4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -255,6 +255,36 @@ config BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE
 
 endif
 
+config BR2_TARGET_UBOOT_FORMAT_MKPIMAGE
+       bool "u-boot-dtb.mkpimage (Altera SoC BootROMs)"
+       help
+          Altera's mkpimage format used on their SoCs.
+
+if BR2_TARGET_UBOOT_FORMAT_MKPIMAGE
+
+choice
+       prompt "mkpimage header"
+       default BR2_TARGET_UBOOT_FORMAT_MKPIMAGE_V1
+       help
+         Select the header format for mkpimage
+
+config BR2_TARGET_UBOOT_FORMAT_MKPIMAGE_V0
+       bool "Arria/Cyclone V (v0)"
+       help
+         Header version 1, used by the Arria V and Cyclone V SoCs
+
+config BR2_TARGET_UBOOT_FORMAT_MKPIMAGE_V1
+       bool "Arria 10 (v1)"
+       help
+         Header version 1, used by the Arria10 SoC
+endchoice
+
+config BR2_TARGET_UBOOT_FORMAT_MKPIMAGE_VERSION
+       int
+       default 0 if BR2_TARGET_UBOOT_FORMAT_MKPIMAGE_V0
+       default 1 if BR2_TARGET_UBOOT_FORMAT_MKPIMAGE_V1
+endif
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b9d54454..7637349fa 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -104,6 +104,18 @@ UBOOT_MAKE_TARGET += u-boot.sb
 UBOOT_DEPENDENCIES += host-elftosb host-openssl
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_MKPIMAGE),y)
+define UBOOT_ALTERA_MKPIMAGE
+       $(HOST_DIR)/usr/bin/mkpimage \
+               -v $(BR2_TARGET_UBOOT_FORMAT_MKPIMAGE_VERSION) \
+               -o $(BINARIES_DIR)/u-boot-dtb.mkpimage \
+               $(@D)/u-boot-dtb.bin
+endef
+UBOOT_MAKE_TARGET += u-boot-dtb.bin
+UBOOT_DEPENDENCIES += host-mkpimage
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_ALTERA_MKPIMAGE
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 endif
-- 
2.11.0
