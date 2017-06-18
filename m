From: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
Date: Sun, 18 Jun 2017 21:44:04 +0200
Subject: [Buildroot] [PATCH 1/1] rpi0w: added support for Raspberry Pi Zero W
Message-ID: <1497815044-11215-1-git-send-email-yves.deweerdt.linux@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

added a new config file for the Raspberry Pi Zero W
- added new folder for raspberrypi0w
- included the overlays in the genimage config
- add pi3-miniuart-bt overlay to the config
- add enable_uart to the config

Signed-off-by: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
---
 board/raspberrypi/genimage-raspberrypi0w.cfg | 32 +++++++++++++++++++++++++
 board/raspberrypi/post-image.sh              |  9 +++++++
 board/raspberrypi0w                          |  1 +
 configs/raspberrypi0w_defconfig              | 35 ++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
 create mode 120000 board/raspberrypi0w
 create mode 100644 configs/raspberrypi0w_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypi0w.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
new file mode 100644
index 0000000..9fab44f
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi0w.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2708-rpi-b-plus.dtb",
+      "bcm2708-rpi-0-w.dtb",
+      "rpi-firmware/bootcode.bin",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
+      "rpi-firmware/overlays",
+      "zImage"
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index de97299..4ae199a 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -15,6 +15,15 @@ case "${2}" in
 dtoverlay=pi3-miniuart-bt
 __EOF__
 	fi
+
+	# Enable uart console
+	if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+# enable rpi3 ttyS0 serial console
+enable_uart=1
+__EOF__
+	fi
 	;;
 	--aarch64)
 	# Run a 64bits kernel (armv8)
diff --git a/board/raspberrypi0w b/board/raspberrypi0w
new file mode 120000
index 0000000..fcdafc8
--- /dev/null
+++ b/board/raspberrypi0w
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
new file mode 100644
index 0000000..20e792d
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
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5e4ee836560d4c0371e109bf469e1ad808ae7a44"
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
2.7.4
