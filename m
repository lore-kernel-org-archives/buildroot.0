From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Date: Mon, 25 Apr 2016 09:49:15 -0400
Subject: [Buildroot] [PATCH v2 1/1] configs: add defconfig for TS-4800
Message-ID: <1461592155-9979-1-git-send-email-damien.riegel@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

This patch adds support for the TS-4800 SoM manufactured by Technologic
Systems based on the Freescale i.MX515 SoC.

The TS-4800 is supported by mainline Linux as of 4.5. There are two
patches for U-Boot. The first one modifies the default environment to
more sane values. The second defines an errata that seems to affect the
board. These patches will be sent upstream and hopefully they will be
removed from Buildroot at some point.

mbrboot.bin is a MBR routine which was extracted from the image provided
by Technologic Systems. Basically, it scans every partition with the
0xda type and copies the first file to a given offset, and then jump
where the first file was copied to start its execution. In our case, we
use it to load u-boot. This routine is loaded by the companion FPGA and
the board won't be able to boot if this is missing.

A post-image script is provided to generate an image that can be "dd"
directly to an SD card.

More details on the board here:
  http://wiki.embeddedarm.com/wiki/TS-4800

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
Changes in v2:
 - Updated the U-Boot patch which modified CONFIG_LOADADDR to remove that
   change. The patch now updates the environment to be able to boot a
   device tree and does only that.


 board/technologic/ts4800/genimage.cfg              |  37 ++++++++++++++
 board/technologic/ts4800/linux.fragment            |   3 ++
 board/technologic/ts4800/mbrboot.bin               | Bin 0 -> 446 bytes
 ...800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch |  36 +++++++++++++
 .../uboot/ts4800-patch-env-to-boot-dts.patch       |  56 +++++++++++++++++++++
 board/technologic/ts4800/post-image.sh             |  25 +++++++++
 configs/ts4800_defconfig                           |  27 ++++++++++
 7 files changed, 184 insertions(+)
 create mode 100644 board/technologic/ts4800/genimage.cfg
 create mode 100644 board/technologic/ts4800/linux.fragment
 create mode 100644 board/technologic/ts4800/mbrboot.bin
 create mode 100644 board/technologic/ts4800/patches/uboot/ts4800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch
 create mode 100644 board/technologic/ts4800/patches/uboot/ts4800-patch-env-to-boot-dts.patch
 create mode 100755 board/technologic/ts4800/post-image.sh
 create mode 100644 configs/ts4800_defconfig

diff --git a/board/technologic/ts4800/genimage.cfg b/board/technologic/ts4800/genimage.cfg
new file mode 100644
index 0000000..33564c3
--- /dev/null
+++ b/board/technologic/ts4800/genimage.cfg
@@ -0,0 +1,37 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"imx51-ts4800.dtb"
+		}
+	}
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition mbrboot {
+		in-partition-table = "no"
+		image = "mbrboot.bin"
+		offset = 0
+	}
+
+	partition uboot {
+		partition-type = 0xda
+		image = "u-boot.bin"
+		size = 8M
+	}
+
+	partition kernel {
+		partition-type = 0xC
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 256M
+	}
+}
diff --git a/board/technologic/ts4800/linux.fragment b/board/technologic/ts4800/linux.fragment
new file mode 100644
index 0000000..0451c86
--- /dev/null
+++ b/board/technologic/ts4800/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_TOUCHSCREEN_TS4800=y
+CONFIG_TS4800_WATCHDOG=y
+CONFIG_TS4800_IRQ=y
diff --git a/board/technologic/ts4800/mbrboot.bin b/board/technologic/ts4800/mbrboot.bin
new file mode 100644
index 0000000000000000000000000000000000000000..4defb935e2a037517911a11e23c5916c6081e9c8
GIT binary patch
literal 446
zcmd^%F$%&!6htRRVUY;hibzTe(G;R$l?w;~J%C5>02U!?8PLW`$#!1ALL`VsNU at cb
zf5Sr1I~Z55;WUq7n76-0iX~%d%s7E_syLhqJ|`3V3?5H?H&P~+*#eQm{Gj at Im#V<C
z=m>SkB(;G0#Sz5pP+o6>O10o|h9JXR%h(oVGM`wrrmR*#BmM1Z&(GnmWZU_=r}WD6
o`cQ8GPmc|xusIEMXGtiVnkQg)HL!~{-<t5T0kG{<${PQi51aE=0ssI2

literal 0
HcmV?d00001

diff --git a/board/technologic/ts4800/patches/uboot/ts4800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch b/board/technologic/ts4800/patches/uboot/ts4800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch
new file mode 100644
index 0000000..5d4fc04
--- /dev/null
+++ b/board/technologic/ts4800/patches/uboot/ts4800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch
@@ -0,0 +1,36 @@
+From dd52f1df6da0c03c8a8367385a375d6abdf67b0b Mon Sep 17 00:00:00 2001
+From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
+Date: Thu, 21 Apr 2016 11:49:31 -0400
+Subject: [PATCH] ts4800: add CONFIG_SYS_FSL_ERRATUM_ESDHC_A001
+
+This commit fixes the MMC data transactions timeout problem on the
+TS4800.
+
+The changes introduced in the commit e978a31 on the timeout calculation
+for the MMC data transactions has revealed there is something wrong with
+the timeout setting of the eSDHC controller used in the IMX51.
+
+The IMX51 seems to be concerned by this erratum and without this change
+the MMC driver is unable to do any transactions.
+
+Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
+---
+ include/configs/ts4800.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/configs/ts4800.h b/include/configs/ts4800.h
+index fcc9d80..5e5e4d3 100644
+--- a/include/configs/ts4800.h
++++ b/include/configs/ts4800.h
+@@ -63,6 +63,8 @@
+ #define CONFIG_FSL_ESDHC
+ #define CONFIG_SYS_FSL_ESDHC_ADDR	MMC_SDHC1_BASE_ADDR
+ 
++#define CONFIG_SYS_FSL_ERRATUM_ESDHC_A001
++
+ #define CONFIG_MMC
+ 
+ #define CONFIG_CMD_MMC
+-- 
+2.5.0
+
diff --git a/board/technologic/ts4800/patches/uboot/ts4800-patch-env-to-boot-dts.patch b/board/technologic/ts4800/patches/uboot/ts4800-patch-env-to-boot-dts.patch
new file mode 100644
index 0000000..1ffed5c
--- /dev/null
+++ b/board/technologic/ts4800/patches/uboot/ts4800-patch-env-to-boot-dts.patch
@@ -0,0 +1,56 @@
+From 7a1d0e483b628f4db3383b09226f7c9561db9653 Mon Sep 17 00:00:00 2001
+From: Damien Riegel <damien.riegel@savoirfairelinux.com>
+Date: Mon, 2 Nov 2015 09:43:21 -0500
+Subject: [PATCH] ts4800: update environment to boot with device tree
+
+This commit updates the environment variables to be able to boot with a
+device tree. The expected partition layout on the SD card is:
+ - partition 1: type 0xDA, contains u-boot.bin
+ - partition 2: type 0xC (fat), contains zImage and device tree
+ - partition 3: type 0x83, root filesystem.
+
+Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
+---
+ include/configs/ts4800.h | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/include/configs/ts4800.h b/include/configs/ts4800.h
+index fcc9d80..b369b27 100644
+--- a/include/configs/ts4800.h
++++ b/include/configs/ts4800.h
+@@ -106,19 +106,28 @@
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+ 	"script=boot.scr\0" \
+-	"image=uImage\0" \
++	"image=zImage\0" \
++	"fdt_file=imx51-ts4800.dtb\0" \
++	"fdt_addr=0x90fe0000\0" \
+ 	"mmcdev=0\0" \
+-	"mmcpart=1\0" \
+-	"mmcargs=setenv bootargs root=/dev/mmcblk0p2 rootwait rw\0" \
++	"mmcpart=2\0" \
++	"mmcroot=/dev/mmcblk0p3 rootwait rw\0" \
++	"mmcargs=setenv bootargs root=${mmcroot}\0" \
+ 	"addtty=setenv bootargs ${bootargs} console=ttymxc0,${baudrate}\0" \
+ 	"loadbootscript=" \
+ 		"fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};\0" \
+ 	"bootscript=echo Running bootscript from mmc ...; " \
+ 		"source\0" \
+ 	"loadimage=fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image};\0" \
++	"loadfdt=fatload mmc ${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}\0" \
+ 	"mmcboot=echo Booting from mmc ...; " \
+ 		"run mmcargs addtty; " \
+-                "bootm; "
++		"if run loadfdt; then " \
++			"bootz ${loadaddr} - ${fdt_addr}; " \
++		"else " \
++			"echo ERR: cannot load FDT; " \
++		"fi; "
++
+ 
+ #define CONFIG_BOOTCOMMAND \
+ 	"mmc dev ${mmcdev}; if mmc rescan; then " \
+-- 
+2.5.0
+
diff --git a/board/technologic/ts4800/post-image.sh b/board/technologic/ts4800/post-image.sh
new file mode 100755
index 0000000..5ac345a
--- /dev/null
+++ b/board/technologic/ts4800/post-image.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Copyright (C) 2015 Savoir-faire Linux
+# Post image generation script.
+
+IDIR="$1"
+
+BOARD_DIR="board/technologic/ts4800"
+GENIMAGE_CFG_DEFAULT="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_CFG=${2:-$GENIMAGE_CFG_DEFAULT}
+GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
+
+cp -f ${BOARD_DIR}/mbrboot.bin ${IDIR}/
+
+${HOST_DIR}/usr/bin/genimage \
+        --config ${GENIMAGE_CFG} \
+        --rootpath ${TARGET_DIR} \
+        --tmppath ${GENIMAGE_TMP} \
+        --inputpath $IDIR \
+        --outputpath $IDIR
+
+ret=${?}
+rm -rf ${GENIMAGE_TMP}
+exit ${ret}
+
diff --git a/configs/ts4800_defconfig b/configs/ts4800_defconfig
new file mode 100644
index 0000000..401d7b3
--- /dev/null
+++ b/configs/ts4800_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_FPU_NEON=y
+BR2_GLOBAL_PATCH_DIR="$(TOPDIR)/board/technologic/ts4800/patches/"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_BINUTILS_VERSION_2_24_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4800/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(TOPDIR)/board/technologic/ts4800/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-ts4800"
+BR2_PACKAGE_BUSYBOX_WATCHDOG=y
+BR2_PACKAGE_FBTERM=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="ts4800"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_SQUASHFS=y
-- 
2.5.0
