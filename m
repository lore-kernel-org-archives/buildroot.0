From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 22 Feb 2016 07:27:56 +0100
Subject: [Buildroot] [PATCH v2] configs/olimex_imx233_olinuxino: switch to
	u-boot
In-Reply-To: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
Message-ID: <1456122476-6210-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mxs-bootlets broke somewhere in between toolchain version bumps.
Directly boot u-boot, as this is supported now, but it requires updated partitioning (see readme.txt)
Drop mxs-bootlets patches, they aren't needed anymore.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Tested-by: Phil Eichinger <phil@zankapfel.net>
---
Changes v1 -> v2:
 - Drop BR2_GLOBAL_PATCH_DIR (suggested by Baruch Siach)

 .../mxs-bootlets/mxs-bootlets-01-olinuxino.patch   | 122 ---------------------
 board/olimex/imx233_olinuxino/readme.txt           |  30 +++--
 configs/olimex_imx233_olinuxino_defconfig          |  39 ++-----
 3 files changed, 32 insertions(+), 159 deletions(-)
 delete mode 100644 board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch

diff --git a/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch b/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch
deleted file mode 100644
index 54c3ca0..0000000
--- a/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-Forward-ported patch from https://github.com/koliqi/imx23-olinuxino
-for mxs-bootlets-10.12.01
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura imx-bootlets-src-10.12.01/linux_prep/board/imx23_olinuxino_dev.c imx-bootlets-src-10.12.01-olinuxino/linux_prep/board/imx23_olinuxino_dev.c
---- imx-bootlets-src-10.12.01/linux_prep/board/imx23_olinuxino_dev.c	1969-12-31 21:00:00.000000000 -0300
-+++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/board/imx23_olinuxino_dev.c	2013-05-17 15:07:33.282961551 -0300
-@@ -0,0 +1,54 @@
-+/*
-+ * Platform specific data for the IMX23_OLINUXINO development board
-+ *
-+ * Fadil Berisha <fadil.r.berisha@gmail.com>
-+ *
-+ * Copyright 2008 SigmaTel, Inc
-+ * Copyright 2008 Embedded Alley Solutions, Inc
-+ * Copyright 2009-2010 Freescale Semiconductor, Inc. All Rights Reserved.
-+ *
-+ * This file is licensed under the terms of the GNU General Public License
-+ * version 2. This program is licensed "as is" without any warranty of any
-+ * kind, whether express or implied.
-+ *
-+ * http://www.opensource.org/licenses/gpl-license.html
-+ * http://www.gnu.org/copyleft/gpl.html
-+ */
-+#include <setup.h>
-+#include <keys.h>
-+#include <lradc_buttons.h>
-+
-+/************************************************
-+ * LRADC keyboard data *
-+ ************************************************/
-+int lradc_keypad_ch = LRADC_CH0;
-+int lradc_vddio_ch = LRADC_CH6;
-+
-+struct lradc_keycode lradc_keycodes[] = {
-+ { 100, KEY4 },
-+ { 306, KEY5 },
-+ { 601, KEY6 },
-+ { 932, KEY7 },
-+ { 1260, KEY8 },
-+ { 1424, KEY9 },
-+ { 1707, KEY10 },
-+ { 2207, KEY11 },
-+ { 2525, KEY12 },
-+ { 2831, KEY13 },
-+ { 3134, KEY14 },
-+ { -1, 0 },
-+};
-+
-+/************************************************
-+ * Magic key combinations for Armadillo *
-+ ************************************************/
-+u32 magic_keys[MAGIC_KEY_NR] = {
-+ [MAGIC_KEY1] = KEY4,
-+ [MAGIC_KEY2] = KEY6,
-+ [MAGIC_KEY3] = KEY10,
-+};
-+
-+/************************************************
-+ * Default command line *
-+ ************************************************/
-+char cmdline_def[] = "console=ttyAMA0,115200";
-diff -Nura imx-bootlets-src-10.12.01/linux_prep/cmdlines/imx23_olinuxino_dev.txt imx-bootlets-src-10.12.01-olinuxino/linux_prep/cmdlines/imx23_olinuxino_dev.txt
---- imx-bootlets-src-10.12.01/linux_prep/cmdlines/imx23_olinuxino_dev.txt	1969-12-31 21:00:00.000000000 -0300
-+++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/cmdlines/imx23_olinuxino_dev.txt	2013-05-17 15:07:49.663496106 -0300
-@@ -0,0 +1,3 @@
-+console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait
-+console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait
-+console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait
-diff -Nura imx-bootlets-src-10.12.01/linux_prep/core/setup.c imx-bootlets-src-10.12.01-olinuxino/linux_prep/core/setup.c
---- imx-bootlets-src-10.12.01/linux_prep/core/setup.c	2010-11-04 04:35:38.000000000 -0300
-+++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/core/setup.c	2013-05-17 15:08:39.246114205 -0300
-@@ -84,6 +84,8 @@
- #include "../../mach-mx28/includes/registers/regsrtc.h"
- #elif defined(STMP378X)
- #include "../../mach-mx23/includes/registers/regsrtc.h"
-+#elif defined(IMX23_OLINUXINO)
-+#include "../../mach-mx23/includes/registers/regsrtc.h"
- #endif
-
- #define NAND_SECONDARY_BOOT          0x00000002
-diff -Nura imx-bootlets-src-10.12.01/linux_prep/include/mx23/platform.h imx-bootlets-src-10.12.01-olinuxino/linux_prep/include/mx23/platform.h
---- imx-bootlets-src-10.12.01/linux_prep/include/mx23/platform.h	2010-11-04 04:35:38.000000000 -0300
-+++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/include/mx23/platform.h	2013-05-17 15:09:21.006476997 -0300
-@@ -19,6 +19,8 @@
-
- #if defined (BOARD_STMP378X_DEV)
- #define	MACHINE_ID	0xa45
-+#elif defined (BOARD_IMX23_OLINUXINO_DEV)
-+#define MACHINE_ID	0x1009
- #else
- #error "Allocate a machine ID for your board"
- #endif
-diff -Nura imx-bootlets-src-10.12.01/linux_prep/Makefile imx-bootlets-src-10.12.01-olinuxino/linux_prep/Makefile
---- imx-bootlets-src-10.12.01/linux_prep/Makefile	2010-11-04 04:35:38.000000000 -0300
-+++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/Makefile	2013-05-17 15:09:53.554539143 -0300
-@@ -69,6 +69,11 @@
- HW_OBJS = $(LRADC_OBJS)
- CFLAGS += -DMX28 -DBOARD_MX28_EVK
- endif
-+ifeq ($(BOARD), imx23_olinuxino_dev)
-+ARCH = mx23
-+HW_OBJS = $(LRADC_OBJS)
-+CFLAGS += -DIMX23_OLINUXINO -DBOARD_IMX23_OLINUXINO_DEV
-+endif
-
- # Generic code
- CORE_OBJS = entry.o resume.o cmdlines.o setup.o keys.o
-diff -Nura imx-bootlets-src-10.12.01/Makefile imx-bootlets-src-10.12.01-olinuxino/Makefile
---- imx-bootlets-src-10.12.01/Makefile	2010-11-04 04:35:38.000000000 -0300
-+++ imx-bootlets-src-10.12.01-olinuxino/Makefile	2013-05-17 15:23:53.709956619 -0300
-@@ -16,6 +16,9 @@
- ifeq ($(BOARD), iMX28_EVK)
- ARCH = mx28
- endif
-+ifeq ($(BOARD), imx23_olinuxino_dev)
-+ARCH = mx23
-+endif
-
- all: build_prep gen_bootstream
-
diff --git a/board/olimex/imx233_olinuxino/readme.txt b/board/olimex/imx233_olinuxino/readme.txt
index 1c36a61..39dec77 100644
--- a/board/olimex/imx233_olinuxino/readme.txt
+++ b/board/olimex/imx233_olinuxino/readme.txt
@@ -6,10 +6,11 @@ one or more of: hostapd, iw, wireless_tools and/or wpa_supplicant.
 It also pulls up the console on the serial port, not on TV output.
 
 You'll need a spare MicroSD card with Freescale's special partition layout.
-This is basically two partitions:
+This is basically three partitions:
 
-1) Type 53, the bootstrap + bootloader/kernel partition, should be 16MB.
-2) Anything you like, for this example an ext2 partition, type 83 (linux).
+1) Type 53, the u-boot partition, should be 16MB.
+2) VFAT, place Kernel as uImage there
+3) Anything you like, for this example an ext2 partition, type 83 (linux).
 
 Assuming you see your MicroSD card as /dev/sdc you'd need to do, as root
 and from the buildroot project top level directory:
@@ -43,15 +44,28 @@ and from the buildroot project top level directory:
    p
    2
    <ENTER>
+   +5M
+   t
+   2
+   4
+   n
+   p
+   3
+   <ENTER>
    <ENTER>
    w
 
 4. Fill up the first (bootstrap + kernel) partition
-   # dd if=output/images/imx23_olinuxino_dev_linux.sb bs=512 of=/dev/sdc1 seek=4
+   # dd if=output/images/u-boot.sd bs=512 of=/dev/sdc1
+
+5. Create VFAT Filesystem
+   # mkfs.vfat /dev/sdc2
+
+6. Mount and copy output/images/uImage.imx23-olinuxino to the VFAT partition, rename to uImage
 
-5. Fill up the second (filesystem) partition
-   # dd if=output/images/rootfs.ext2 of=/dev/sdc2 bs=512
+7. Fill up the third (filesystem) partition
+   # dd if=output/images/rootfs.ext2 of=/dev/sdc3 bs=512
 
-6. Remove the MicroSD card from your linux PC and put it into your olinuxino.
+8. Remove the MicroSD card from your linux PC and put it into your olinuxino.
 
-7. Boot! You're done!
+9. Boot! You're done!
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 2184ad8..d27909f 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -1,40 +1,15 @@
-# Architecture
 BR2_arm=y
-BR2_arm926t=y
-
-# Patches (mxs-bootlets)
-BR2_GLOBAL_PATCH_DIR="board/olimex/imx233_olinuxino"
-
-# System
-BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
-
-# Bootloader
-BR2_TARGET_MXS_BOOTLETS=y
-BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR="board/olimex/imx233_olinuxino"
-BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD=y
-BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
-
-# Kernel
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.18.config"
-BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
+BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
-
-# For automatic firmware loading
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-
-# Firmware for WiFi
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010=y
 BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
@@ -42,3 +17,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
 BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
 BR2_PACKAGE_ZD1211_FIRMWARE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
+BR2_TARGET_UBOOT_FORMAT_SD=y
-- 
2.1.4
