From: Mike Harmony <mike.harmony@snapav.com>
Date: Fri, 22 Sep 2017 10:59:46 -0400
Subject: [Buildroot] [PATCH 1/1] Added support for LeMaker BananaPi M2 Plus
	board.
Message-ID: <1506092386-15175-1-git-send-email-mike.harmony@snapav.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Harmony <mike.harmony@snapav.com>
---
 DEVELOPERS                         |  4 ++++
 board/lemaker/m2-plus/boot.cmd     |  7 +++++++
 board/lemaker/m2-plus/genimage.cfg | 33 +++++++++++++++++++++++++++++++++
 configs/bananapi_m2_plus_defconfig | 26 ++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 board/lemaker/m2-plus/boot.cmd
 create mode 100644 board/lemaker/m2-plus/genimage.cfg
 create mode 100644 configs/bananapi_m2_plus_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ed5fa3d..0551b88 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1262,6 +1262,10 @@ N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
 
+N:	Mike Harmony <mike.harmony@snapav.com>
+F:	board/lemaker/m2-plus/
+F:	configs/bananapi_m2_plus_defconfig
+
 N:	Nathan Lynch <ntl@pobox.com>
 F:	package/chrony/
 
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
diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
new file mode 100644
index 0000000..59dae1b
--- /dev/null
+++ b/configs/bananapi_m2_plus_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_KERNEL_HEADERS_4_13=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/lemaker/m2-plus/genimage.cfg board/bananapi/m2-plus/boot.cmd"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-bananapi-m2-plus"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Sinovoip_BPI_M2_Plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/lemaker/m2-plus/boot.cmd"
+BR2_PACKAGE_HOST_GENEXT2FS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.4
