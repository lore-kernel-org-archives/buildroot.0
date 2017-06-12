From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:16:49 +0200
Subject: [Buildroot] [git commit] board: Add support for Engicam i.CoreM6
	Quad/Dual boards
Message-ID: <20170612211727.4591B80429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3a63da1631295ea71f860e6a85e0ca78c350f7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for Engicam i.CoreM6 Quad/Dual board
with below features:
- U-Boot 2017.05
- Linux 4.11
- Default packages from buildroot

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                            |  4 +++
 board/engicam/genimage.cfg            | 38 ++++++++++++++++++++
 board/engicam/readme.txt              | 66 +++++++++++++++++++++++++++++++++++
 configs/engicam_imx6q_icore_defconfig | 41 ++++++++++++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d8b410..8939987 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -827,6 +827,10 @@ F:	package/angularjs/
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
+N:	Jagan Teki <jagan@amarulasolutions.com>
+F:	board/engicam/
+F:	configs/engicam_imx6q_icore_defconfig
+
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
 F:	package/cairomm/
diff --git a/board/engicam/genimage.cfg b/board/engicam/genimage.cfg
new file mode 100644
index 0000000..43c81cf
--- /dev/null
+++ b/board/engicam/genimage.cfg
@@ -0,0 +1,38 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"imx6q-icore.dtb"
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
diff --git a/board/engicam/readme.txt b/board/engicam/readme.txt
new file mode 100644
index 0000000..eb7503f
--- /dev/null
+++ b/board/engicam/readme.txt
@@ -0,0 +1,66 @@
+*****************************************
+Buildroot for Engicam i.MX6 SOM platforms:
+*****************************************
+
+This file documents the Buildroot support for all Engicam i.MX6 SOM
+platform boards.
+
+i.CoreM6 Quad/Dual SOM Starter kits:
+https://www.engicam.com/vis-prod/101120
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+Build
+=====
+
+First, configure Buildroot for the Engicam i.MX SOM's:
+
+- for i.CoreM6 Quad/Dual:
+
+  make engicam_imx6q_icore_defconfig
+
+Build all components:
+
+  make
+
+You will find the following files in output/images/:
+- for i.CoreM6 Quad/Dual:
+  - imx6q-icore.dtb
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
+board/engicam/genimage.cfg
+
+Boot the i.CoreM6 boards with SD boot:
+=====================================
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
diff --git a/configs/engicam_imx6q_icore_defconfig b/configs/engicam_imx6q_icore_defconfig
new file mode 100644
index 0000000..63454ee
--- /dev/null
+++ b/configs/engicam_imx6q_icore_defconfig
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
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
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-icore"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual Starter Kit"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/genimage.cfg"
