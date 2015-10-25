From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 25 Oct 2015 20:33:56 +0100
Subject: [Buildroot] [PATCH 4/4] beaglebone: adds barebox bootloader
	defconfig
In-Reply-To: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
Message-ID: <1445801636-7554-5-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Builds barebox x-loader (MLO) and the barebox bootloader.
* Barebox integrates a perfectly good device-tree for the bbb, so no dtb is
  being generated with the kernel.
---
 configs/beaglebone_barebox_defconfig | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 configs/beaglebone_barebox_defconfig

diff --git a/configs/beaglebone_barebox_defconfig b/configs/beaglebone_barebox_defconfig
new file mode 100644
index 0000000..d34a5bc
--- /dev/null
+++ b/configs/beaglebone_barebox_defconfig
@@ -0,0 +1,38 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABIHF=y
+
+# system
+BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
+
+# filesystem
+BR2_PACKAGE_AM33X_CM3=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.12.10"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
+
+# bootloader
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="am335x"
+BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE=y
+BR2_TARGET_BAREBOX_IMAGE_FILE="barebox-am33xx-beaglebone.img"
+BR2_TARGET_BAREBOX_XLOAD=y
+BR2_TARGET_BAREBOX_XLOAD_BOARD_DEFCONFIG="am335x_mlo"
+BR2_TARGET_BAREBOX_XLOAD_USE_SPECIFIC_IMAGE=y
+BR2_TARGET_BAREBOX_XLOAD_IMAGE_FILE="barebox-am33xx-beaglebone-mlo.img"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_LATEST_VERSION=y
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
2.1.4
