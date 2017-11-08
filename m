From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  8 Nov 2017 22:43:32 +0300
Subject: [Buildroot] [PATCH 1/3] board/orangepi: add support for
 orangepi-pc-plus board
In-Reply-To: <20171108194334.10031-1-geomatsi@gmail.com>
References: <20171108194334.10031-1-geomatsi@gmail.com>
Message-ID: <20171108194334.10031-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This board is a variant of orangepi-pc board. It adds 8GB eMMC and Realtek
RTL8189FTV SDIO WiFi chip. This variant has a separate support in U-Boot
and kernel. So it makes sense to create a separate entry
for this board in buildroot.

Board support package includes the following components:
 - mainline u-boot 2017.09
 - mainline kernel 4.13.11

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-pc-plus/boot.cmd           |  8 +++++
 board/orangepi/orangepi-pc-plus/genimage.cfg       | 36 ++++++++++++++++++++
 .../orangepi/orangepi-pc-plus/linux-extras.config  |  8 +++++
 board/orangepi/orangepi-pc-plus/post-build.sh      |  1 +
 board/orangepi/orangepi-pc-plus/post-image.sh      |  1 +
 board/orangepi/orangepi-pc-plus/readme.txt         | 29 +++++++++++++++++
 configs/orangepi_pc_plus_defconfig                 | 38 ++++++++++++++++++++++
 7 files changed, 121 insertions(+)
 create mode 100644 board/orangepi/orangepi-pc-plus/boot.cmd
 create mode 100644 board/orangepi/orangepi-pc-plus/genimage.cfg
 create mode 100644 board/orangepi/orangepi-pc-plus/linux-extras.config
 create mode 120000 board/orangepi/orangepi-pc-plus/post-build.sh
 create mode 120000 board/orangepi/orangepi-pc-plus/post-image.sh
 create mode 100644 board/orangepi/orangepi-pc-plus/readme.txt
 create mode 100644 configs/orangepi_pc_plus_defconfig

diff --git a/board/orangepi/orangepi-pc-plus/boot.cmd b/board/orangepi/orangepi-pc-plus/boot.cmd
new file mode 100644
index 0000000000..0c75c862e0
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc-plus.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
new file mode 100644
index 0000000000..9ffa1a21ae
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the OrangePi PC Plus
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-orangepi-pc-plus.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
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
+		size = 512M
+	}
+}
diff --git a/board/orangepi/orangepi-pc-plus/linux-extras.config b/board/orangepi/orangepi-pc-plus/linux-extras.config
new file mode 100644
index 0000000000..5e3af2b831
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/linux-extras.config
@@ -0,0 +1,8 @@
+# wireless core
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_CFG80211_WEXT=y
+
+# wireless drivers
+CONFIG_WLAN=y
diff --git a/board/orangepi/orangepi-pc-plus/post-build.sh b/board/orangepi/orangepi-pc-plus/post-build.sh
new file mode 120000
index 0000000000..cd7f11645b
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/post-build.sh
@@ -0,0 +1 @@
+../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc-plus/post-image.sh b/board/orangepi/orangepi-pc-plus/post-image.sh
new file mode 120000
index 0000000000..ae6294fa38
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/post-image.sh
@@ -0,0 +1 @@
+../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc-plus/readme.txt b/board/orangepi/orangepi-pc-plus/readme.txt
new file mode 100644
index 0000000000..49206949c8
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/readme.txt
@@ -0,0 +1,29 @@
+OrangePi PC Plus
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi PC Plus. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_pc_plus_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
new file mode 100644
index 0000000000..ec177286cc
--- /dev/null
+++ b/configs/orangepi_pc_plus_defconfig
@@ -0,0 +1,38 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-pc-plus/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-pc-plus/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc_plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# wireless tools
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
-- 
2.11.0
