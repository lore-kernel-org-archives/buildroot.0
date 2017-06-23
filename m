From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Fri, 23 Jun 2017 17:56:06 +0530
Subject: [Buildroot] [PATCH v5 2/5] board: Add support for Engicam i.CoreM6
	RQS SOM
In-Reply-To: <1498220769-22961-1-git-send-email-jteki@openedev.com>
References: <1498220769-22961-1-git-send-email-jteki@openedev.com>
Message-ID: <1498220769-22961-3-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Add initial support for Engicam i.CoreM6 Quad/Dual/DualLite/Solo RQS
board with below features:
- U-Boot 2017.07-rc1
- Linux 4.11.5
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- Drop _mmc in defconfig
- Update size of vfat partition
- Add sync command after writing mmc 
- Update .gitlab-ci.yml
Changes for v4:
- Update .gitlab-ci.yml
Changes for v3:
- none
Changes for v2:
- Fix genimage.cfg path in readme.txt

 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  1 +
 board/engicam/icorem6_rqs/genimage.cfg      | 39 ++++++++++++++++
 board/engicam/icorem6_rqs/readme.txt        | 69 +++++++++++++++++++++++++++++
 configs/engicam_imx6qdl_icore_rqs_defconfig | 41 +++++++++++++++++
 5 files changed, 151 insertions(+)
 create mode 100644 board/engicam/icorem6_rqs/genimage.cfg
 create mode 100644 board/engicam/icorem6_rqs/readme.txt
 create mode 100644 configs/engicam_imx6qdl_icore_rqs_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 36ef1d1..f1261d5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -90,6 +90,7 @@ ci40_defconfig: *defconfig
 csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
 engicam_imx6qdl_icore_defconfig: *defconfig
+engicam_imx6qdl_icore_rqs_defconfig: *defconfig
 firefly_rk3288_defconfig: *defconfig
 firefly_rk3288_demo_defconfig: *defconfig
 freescale_imx28evk_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 9a8b586..ccf6f67 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -838,6 +838,7 @@ F:	package/keepalived/
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
 F:	configs/engicam_imx6qdl_icore_defconfig
+F:	configs/engicam_imx6qdl_icore_rqs_defconfig
 
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
diff --git a/board/engicam/icorem6_rqs/genimage.cfg b/board/engicam/icorem6_rqs/genimage.cfg
new file mode 100644
index 0000000..967d10b
--- /dev/null
+++ b/board/engicam/icorem6_rqs/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"imx6dl-icore-rqs.dtb",
+			"imx6q-icore-rqs.dtb"
+		}
+	}
+	size = 64M
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
diff --git a/board/engicam/icorem6_rqs/readme.txt b/board/engicam/icorem6_rqs/readme.txt
new file mode 100644
index 0000000..a0bf6f5
--- /dev/null
+++ b/board/engicam/icorem6_rqs/readme.txt
@@ -0,0 +1,69 @@
+*************************************************
+Buildroot for Engicam i.CoreM6 RQS SOM platforms:
+*************************************************
+
+This file documents the Buildroot support for Engicam i.CoreM6 RQS
+SOM platform boards.
+
+i.CoreM6 Quad/Dual/DualLite/Solo RQS SOM Starter kits:
+https://www.engicam.com/vis-prod/101124
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+Build
+=====
+
+First, configure Buildroot for the Engicam i.CoreM6 RQS:
+
+- for i.CoreM6 RQS Quad/Dual/DualLite/Solo:
+
+  make engicam_imx6qdl_icore_rqs_defconfig
+
+Build all components:
+
+  make
+
+You will find the following files in output/images/:
+- for i.CoreM6 Quad/Dual RQS:
+  - imx6q-icore-rqs.dtb
+- for i.CoreM6 DualLite/Solo RQS:
+  - imx6dl-icore-rqs.dtb
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
+  sync
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/engicam/icorem6_rqs/genimage.cfg
+
+Boot the i.CoreM6 RQS boards with SD boot:
+=========================================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- connect 3-wire RS232 serial port J7 on board, and connect with other
+  serial end or USB cable(if serial-to-usb converter used) using
+  a terminal emulator at 115200 bps, 8n1;
+- close JM2 for sd boot.
+- power on the board.
+
+Enjoy!
diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig b/configs/engicam_imx6qdl_icore_rqs_defconfig
new file mode 100644
index 0000000..4d2698d
--- /dev/null
+++ b/configs/engicam_imx6qdl_icore_rqs_defconfig
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
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_rqs_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore-rqs imx6q-icore-rqs"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo RQS Starter Kit"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6_rqs/genimage.cfg"
-- 
2.7.4
