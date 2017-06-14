From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 14 Jun 2017 22:57:08 +0530
Subject: [Buildroot] [PATCH v2 5/5] board: Add support for Engicam GEAM6UL
	SOM
In-Reply-To: <1497461228-25699-1-git-send-email-jteki@openedev.com>
References: <1497461228-25699-1-git-send-email-jteki@openedev.com>
Message-ID: <1497461228-25699-6-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Add initial support for Engicam GEAM6UL SOM board
with below features:
- U-Boot 2017.07-rc1
- Linux 4.11
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- Fix genimage.cfg path in readme.txt

 DEVELOPERS                                |  1 +
 board/engicam/geam6ul/genimage.cfg        | 38 ++++++++++++++++++
 board/engicam/geam6ul/readme.txt          | 65 +++++++++++++++++++++++++++++++
 configs/engicam_imx6ul_geam_mmc_defconfig | 41 +++++++++++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 board/engicam/geam6ul/genimage.cfg
 create mode 100644 board/engicam/geam6ul/readme.txt
 create mode 100644 configs/engicam_imx6ul_geam_mmc_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 6729406..1106d06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -831,6 +831,7 @@ N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
 F:	configs/engicam_imx6qdl_icore_mmc_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_mmc_defconfig
+F:	configs/engicam_imx6ul_geam_mmc_defconfig
 
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
diff --git a/board/engicam/geam6ul/genimage.cfg b/board/engicam/geam6ul/genimage.cfg
new file mode 100644
index 0000000..3b5a31d
--- /dev/null
+++ b/board/engicam/geam6ul/genimage.cfg
@@ -0,0 +1,38 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"imx6ul-geam-kit.dtb"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition SPL {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1024
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot-dtb.img"
+		offset = 69K
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 8M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/engicam/geam6ul/readme.txt b/board/engicam/geam6ul/readme.txt
new file mode 100644
index 0000000..fd75e3a
--- /dev/null
+++ b/board/engicam/geam6ul/readme.txt
@@ -0,0 +1,65 @@
+********************************************
+Buildroot for Engicam GEAM6UL SOM platforms:
+********************************************
+
+This file documents the Buildroot support for all Engicam GEAM6UL
+SOM platform boards.
+
+i.CoreM6 GEAM6UL SOM Starter kits:
+https://www.engicam.com/vis-prod/101115
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+Build
+=====
+
+First, configure Buildroot for the Engicam GEAM6UL SOM:
+
+- for i.CoreM6 Quad/Dual:
+
+  make engicam_imx6ul_geam_mmc_defconfig
+
+Build all components:
+
+  make
+
+You will find the following files in output/images/:
+  - imx6ul-geam-kit.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - SPL
+  - u-boot-dtb.img
+  - uImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/engicam/geam6ul/genimage.cfg
+
+Boot the GEAM6UL boards with SD boot:
+====================================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- connect 3-wire RS232 serial port J28 on board, and connect with other
+  serial end or USB cable(if serial-to-usb converter used) using
+  a terminal emulator at 115200 bps, 8n1;
+- close JM3 for sd boot.
+- power on the board.
+
+Enjoy!
diff --git a/configs/engicam_imx6ul_geam_mmc_defconfig b/configs/engicam_imx6ul_geam_mmc_defconfig
new file mode 100644
index 0000000..b5574e1
--- /dev/null
+++ b/configs/engicam_imx6ul_geam_mmc_defconfig
@@ -0,0 +1,41 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_geam_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-geam-kit"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam GEAM6UL Starter Kit"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/geam6ul/genimage.cfg"
-- 
2.7.4
