From: Mike Harmony <mike.harmony@snapav.com>
Date: Wed, 23 Aug 2017 08:45:42 -0400
Subject: [Buildroot] [PATCH 1/1] Added support for LeMaker BananaPi M2 Plus
	board.
Message-ID: <1503492342-3805-1-git-send-email-mike.harmony@snapav.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Harmony <mike.harmony@snapav.com>
---
 DEVELOPERS                          |  4 ++++
 board/lemaker/m2-plus/boot.cmd      |  7 +++++++
 board/lemaker/m2-plus/genimage.cfg  | 33 +++++++++++++++++++++++++++++++++
 board/lemaker/m2-plus/post-build.sh | 12 ++++++++++++
 configs/bananapi_m2_plus_defconfig  | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+)
 create mode 100644 board/lemaker/m2-plus/boot.cmd
 create mode 100644 board/lemaker/m2-plus/genimage.cfg
 create mode 100755 board/lemaker/m2-plus/post-build.sh
 create mode 100644 configs/bananapi_m2_plus_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index f3944e2..465293e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1234,6 +1234,10 @@ N:	Micha? ?yszczek <michal.lyszczek@bofc.pl>
 F:	board/altera/socrates_cyclone5/
 F:	configs/socrates_cyclone5_defconfig
 
+N:	Mike Harmony <mike.harmony@snapav.com>
+F:	board/lemaker/m2-plus/
+F:	configs/bananapi_m2_plus_defconfig
+
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
diff --git a/board/lemaker/m2-plus/boot.cmd b/board/lemaker/m2-plus/boot.cmd
new file mode 100644
index 0000000..d22464a
--- /dev/null
+++ b/board/lemaker/m2-plus/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-bananapi-m2-plus.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/lemaker/m2-plus/genimage.cfg b/board/lemaker/m2-plus/genimage.cfg
new file mode 100644
index 0000000..cde0669
--- /dev/null
+++ b/board/lemaker/m2-plus/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-bananapi-m2-plus.dtb",
+			"boot.scr"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+		size = 1040384 # 1MB - 8192
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/lemaker/m2-plus/post-build.sh b/board/lemaker/m2-plus/post-build.sh
new file mode 100755
index 0000000..fb4b6e9
--- /dev/null
+++ b/board/lemaker/m2-plus/post-build.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+# Remove all but the brcmfmac43362 firmware files
+find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
new file mode 100644
index 0000000..c2bae51
--- /dev/null
+++ b/configs/bananapi_m2_plus_defconfig
@@ -0,0 +1,33 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_KERNEL_HEADERS_4_12=y
+BR2_BINUTILS_VERSION_2_27_X=y
+BR2_GCC_VERSION_5_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/lemaker/m2-plus/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/lemaker/m2-plus/genimage.cfg board/bananapi/m2-plus/boot.cmd"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://git.kernel.org/torvalds/t/linux-4.13-rc5.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-bananapi-m2-plus"
+BR2_PACKAGE_IPERF3=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Sinovoip_BPI_M2_Plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENEXT2FS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=61440
-- 
2.7.4
