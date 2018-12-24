From: kostap at marvell.com <kostap@marvell.com>
Date: Mon, 24 Dec 2018 15:19:04 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add support for custom DT name
Message-ID: <20181224131904.20891-1-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

Some u-boot default configuration files could be shared between
targets and used for building images for multiple board types.
The only difference between such builds is the DTB embedded in
in the boot image for each specific platform.
This approach is widely used by Marvell, having the same u-boot
configuration file for the entire SoC family, but allowing builds
of multiple target flavors by supplying the device tree name through
make command parameter DEVICE_TREE=xxx
This patch adds such capability to uboot module of the buildroot.
The custome DT name could be  defined by
BR2_TARGET_UBOOT_CUSTOM_DTS_NAME entry.

Change-Id: I69e193339b0369a736bdf98491b9914d24a54e17
Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index ac6f8bc8c1..c67994229a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -529,4 +529,12 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 
 endif
 
+config BR2_TARGET_UBOOT_CUSTOM_DTS_NAME
+	string "Device Tree Source name"
+	help
+	  The value of u-boot DEVICE_TREE for usage with the selected board
+	  configuration file. Allows sharing of the same u-boot configuration
+	  for building images for different platforms/boards.
+
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cbdfee6ac3..a0342ec6c8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -135,6 +135,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+UBOOT_CUSTOM_DTS_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_NAME))
+ifneq ($(UBOOT_CUSTOM_DTS_NAME),)
+UBOOT_MAKE_OPTS += DEVICE_TREE=$(UBOOT_CUSTOM_DTS_NAME)
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
-- 
2.17.1
