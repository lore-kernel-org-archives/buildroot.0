From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Sat, 17 Jun 2017 17:45:56 +0530
Subject: [Buildroot] [PATCH 2/3] Board: Add Bananapi M2 Plus support
In-Reply-To: <1497701756-1404-1-git-send-email-jteki@openedev.com>
References: <1497701756-1404-1-git-send-email-jteki@openedev.com>
Message-ID: <1497701756-1404-2-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Add initial support for bananapi M2 Plus board with below features:
- U-Boot 2017.07-rc1
- Linux 4.11.5
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 DEVELOPERS                                   |  1 +
 board/bananapi/bananapi-m2-plus/boot.cmd     |  7 ++++++
 board/bananapi/bananapi-m2-plus/genimage.cfg | 33 +++++++++++++++++++++++++
 board/bananapi/bananapi-m2-plus/readme.txt   | 34 ++++++++++++++++++++++++++
 configs/bananapi_m2_plus_defconfig           | 36 ++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+)
 create mode 100644 board/bananapi/bananapi-m2-plus/boot.cmd
 create mode 100644 board/bananapi/bananapi-m2-plus/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m2-plus/readme.txt
 create mode 100644 configs/bananapi_m2_plus_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 341933f..4ccdc26 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -830,6 +830,7 @@ F:	package/keepalived/
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/bananapi/
 F:	board/engicam/
+F:	configs/bananapi_m2_plus_defconfig
 F:	configs/bananapi_m64_defconfig
 F:	configs/engicam_imx6qdl_icore_mmc_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_mmc_defconfig
diff --git a/board/bananapi/bananapi-m2-plus/boot.cmd b/board/bananapi/bananapi-m2-plus/boot.cmd
new file mode 100644
index 0000000..d22464a
--- /dev/null
+++ b/board/bananapi/bananapi-m2-plus/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-bananapi-m2-plus.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m2-plus/genimage.cfg b/board/bananapi/bananapi-m2-plus/genimage.cfg
new file mode 100644
index 0000000..cde0669
--- /dev/null
+++ b/board/bananapi/bananapi-m2-plus/genimage.cfg
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
diff --git a/board/bananapi/bananapi-m2-plus/readme.txt b/board/bananapi/bananapi-m2-plus/readme.txt
new file mode 100644
index 0000000..f699727
--- /dev/null
+++ b/board/bananapi/bananapi-m2-plus/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Bananapi M2 Plus. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Bananapi M2 Plus link:
+http://www.banana-pi.org/m2plus.html
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make bananapi_m2_plus_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+  $ sudo sync
+
+Insert the micro SDcard in your Bananapi M2 Plus and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/bananapi_m2_plus_defconfig b/configs/bananapi_m2_plus_defconfig
new file mode 100644
index 0000000..7d8baa9
--- /dev/null
+++ b/configs/bananapi_m2_plus_defconfig
@@ -0,0 +1,36 @@
+BR2_aarch64=y
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Sinovoip_BPI_M2_Plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-bananapi-m2-plus"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Plus"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-plus/genimage.cfg board/bananapi/bananapi-m2-plus/boot.cmd"
-- 
2.7.4
