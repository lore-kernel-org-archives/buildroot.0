From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Mar 2017 23:13:44 +0100
Subject: [Buildroot] [PATCH v1] WIP: configs/raspberrypi0w_defconfig: new
	board
Message-ID: <20170320221344.9747-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Raspberry Pi Zero W (same as Pi Zero with
additional wireless and bluetooth support [1]).

According to [2] has the same serial console vs. bluetooth
problem as the Pi 3. Try the same fix (load pi3-miniuart-bt overlay).

[1] https://www.raspberrypi.org/products/pi-zero-w
[2] http://lists.busybox.net/pipermail/buildroot/2017-March/187295.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Untested (even not compile tested) because of lack of hardware...
---
 board/raspberrypi0w             |  1 +
 configs/raspberrypi0w_defconfig | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 120000 board/raspberrypi0w
 create mode 100644 configs/raspberrypi0w_defconfig

diff --git a/board/raspberrypi0w b/board/raspberrypi0w
new file mode 120000
index 000000000..fcdafc81e
--- /dev/null
+++ b/board/raspberrypi0w
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
new file mode 100644
index 000000000..bd2f7af9d
--- /dev/null
+++ b/configs/raspberrypi0w_defconfig
@@ -0,0 +1,35 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+BR2_ARM_EABIHF=y
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935c7ce84c982a26f567a03a58a1537424569938"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+
+# Build the DTBs for A/B from the kernel sources: the zero is the same
+# as the A+ model, just in a different form-factor
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b-plus bcm2708-rpi-0-w"
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
-- 
2.11.0
