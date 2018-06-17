From: Danny Milosavljevic <dannym@scratchpost.org>
Date: Sun, 17 Jun 2018 02:49:00 +0200
Subject: [Buildroot] [PATCH 1/1] Added support for Sinovoip BananaPi M2
 Ultra board.
Message-ID: <20180617004900.1413-1-dannym@scratchpost.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danny Milosavljevic <dannym@scratchpost.org>
---
 board/sinovoip/m2-ultra/boot.cmd     |  7 +++++++
 board/sinovoip/m2-ultra/genimage.cfg | 33 +++++++++++++++++++++++++++++++++
 configs/bananapi_m2_ultra_defconfig  | 27 +++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 board/sinovoip/m2-ultra/boot.cmd
 create mode 100644 board/sinovoip/m2-ultra/genimage.cfg
 create mode 100644 configs/bananapi_m2_ultra_defconfig

diff --git a/board/sinovoip/m2-ultra/boot.cmd b/board/sinovoip/m2-ultra/boot.cmd
new file mode 100644
index 0000000000..9c24eabff6
--- /dev/null
+++ b/board/sinovoip/m2-ultra/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-r40-bananapi-m2-ultra.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/sinovoip/m2-ultra/genimage.cfg b/board/sinovoip/m2-ultra/genimage.cfg
new file mode 100644
index 0000000000..675253af23
--- /dev/null
+++ b/board/sinovoip/m2-ultra/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-r40-bananapi-m2-ultra.dtb",
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
diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
new file mode 100644
index 0000000000..a86d5923c6
--- /dev/null
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sinovoip/m2-ultra/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=n
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-r40-bananapi-m2-ultra"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=n
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapi_M2_Ultra"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/sinovoip/m2-ultra/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
