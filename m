From: Arthur Courtel <arthur.courtel@smile.fr>
Date: Fri, 29 Nov 2019 17:02:08 +0100
Subject: [Buildroot] [PATCH 1/1] configs: add raspberrypi4 64bits defconfig
Message-ID: <20191129160208.3520611-2-arthur.courtel@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This configuration builds a 64bit image for RaspberryPi 4.

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
---
 .../raspberrypi/genimage-raspberrypi4-64.cfg  | 30 +++++++++++++++++++
 board/raspberrypi/post-image.sh               |  4 +--
 board/raspberrypi4-64                         |  1 +
 configs/raspberrypi4_64_defconfig             | 24 +++++++++++++++
 4 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 board/raspberrypi/genimage-raspberrypi4-64.cfg
 create mode 120000 board/raspberrypi4-64
 create mode 100644 configs/raspberrypi4_64_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
new file mode 100644
index 0000000000..3c480e98f0
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2711-rpi-4-b.dtb",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
+      "rpi-firmware/overlays",
+      "Image"
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
index bf9af5dc60..e79141f142 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -15,7 +15,7 @@ do
 			echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
-# fixes rpi3 ttyAMA0 serial console
+# fixes rpi3/4 ttyAMA0 serial console
 dtoverlay=pi3-miniuart-bt
 __EOF__
 		fi
@@ -35,7 +35,7 @@ __EOF__
 		if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
 			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
 
-# enable rpi3 ttyS0 serial console
+# enable rpi3/4 ttyS0 serial console
 enable_uart=1
 __EOF__
 		fi
diff --git a/board/raspberrypi4-64 b/board/raspberrypi4-64
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi4-64
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
new file mode 100644
index 0000000000..3d30fb05f5
--- /dev/null
+++ b/configs/raspberrypi4_64_defconfig
@@ -0,0 +1,24 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay --aarch64"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.23.0
