From: Clemens Gruber <clemens.gruber@pqgruber.com>
Date: Sun,  4 Mar 2018 18:18:15 +0100
Subject: [Buildroot] [PATCH next] uboot: support external DTB in U-Boot
 images
Message-ID: <20180304171815.35061-1-clemens.gruber@pqgruber.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows signed FIT images to be verified with the public key in the DTB.
The public key is stored in the bootloader image, which must have been
verified by the previous stage in the trust chain, before loading it.

Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
---
 boot/uboot/Config.in | 14 ++++++++++++++
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 264f343767..620aa02bb9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -460,6 +460,20 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 	  To use this device tree source file, the U-Boot configuration
 	  file must refer to it.
 
+config BR2_TARGET_UBOOT_EXT_DTB
+	bool "External DTB"
+	help
+	  Put an external DTB in the U-Boot image. Used to store public
+	  keys for verifying signed FIT images.
+
+config BR2_TARGET_UBOOT_EXT_DTB_PATH
+	string "Path to external DTB"
+	depends on BR2_TARGET_UBOOT_EXT_DTB
+	help
+	  Path to external DTB to be put in the U-Boot image.
+	  Prepend ${TOPDIR}/ to specify paths relative to the top
+	  buildroot source directory.
+
 endif
 
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d2f241cd8b..469673bebf 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -134,6 +134,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_TARGET_UBOOT_EXT_DTB),y)
+UBOOT_MAKE_OPTS += \
+	EXT_DTB="$(call qstrip,$(BR2_TARGET_UBOOT_EXT_DTB_PATH))"
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
-- 
2.16.2
