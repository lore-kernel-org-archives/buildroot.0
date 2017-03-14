From: Jagan Teki <jagan@openedev.com>
Date: Tue, 14 Mar 2017 16:31:06 +0530
Subject: [Buildroot] [PATCH 2/2] board: Add support for Engicam i.CoreM6 Quad
In-Reply-To: <1489489266-23161-1-git-send-email-jagan@openedev.com>
References: <1489489266-23161-1-git-send-email-jagan@openedev.com>
Message-ID: <1489489266-23161-2-git-send-email-jagan@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Add initial support for Engicam i.CoreM6 Quad board with
below features:
- U-Boot 2017.03 with mmc boot
- Linux 4.10.1
- Default packages from buildroot

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 DEVELOPERS                    |  4 ++++
 board/engicam/readme.txt      | 38 ++++++++++++++++++++++++++++++++++++++
 configs/imx6q_icore_defconfig | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 board/engicam/readme.txt
 create mode 100644 configs/imx6q_icore_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e08b65d..fd46232 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -788,6 +788,10 @@ F:	package/angularjs/
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
+N:	Jagan Teki <jagan@amarulasolutions.com>
+F:	board/engicam/
+F:	configs/imx6q_icore_defconfig
+
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
 F:	package/cairomm/
diff --git a/board/engicam/readme.txt b/board/engicam/readme.txt
new file mode 100644
index 0000000..55fdf53
--- /dev/null
+++ b/board/engicam/readme.txt
@@ -0,0 +1,38 @@
+Buildroot build:
+----------------
+
+- Building for i.CoreM6 Quad/Dual Starter Kit
+
+$ make ARCH=arm imx6q_icore_defconfig
+$ make ARCH=arm menuconfig
+$ make ARCH=arm CROSS_COMPILE=arm-unknown-linux-gnueabi- -j 12
+
+images copy:
+-----------
+
+$ cd output/images
+
+- Flash the SPL image into the micro SD card:
+
+$ sudo dd if=SPL of=/dev/mmcblk0 bs=1k seek=1; sync
+
+- Flash the u-boot-dtb.img image into the micro SD card:
+
+$ sudo dd if=u-boot-dtb.img of=/dev/mmcblk0 bs=1k seek=69; sync
+
+- Copy output/images/uImage to mmc card first partition
+
+- Copy output/images/imx6q-icore.dtb to mmc card first partition
+
+- Copy output/images/rootfs.tar.xz to mmc card second partition and untar there.
+
+MMC Boot:
+--------
+
+Jumpers: JM3 Closed
+
+- Connect the Serial cable between the Starter Kit and the PC for the console.
+(J28 is the Linux Serial console connector)
+
+- Insert the micro SD card in the board, power it up and U-Boot messages should
+come up and then Linux will autoboot.
diff --git a/configs/imx6q_icore_defconfig b/configs/imx6q_icore_defconfig
new file mode 100644
index 0000000..9c3ff4b
--- /dev/null
+++ b/configs/imx6q_icore_defconfig
@@ -0,0 +1,33 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_TAR_XZ=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_LATEST_VERSION=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_LATEST_VERSION=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-icore"
-- 
1.9.1
