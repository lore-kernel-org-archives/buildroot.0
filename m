From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 19 May 2021 23:51:15 +0200
Subject: [Buildroot] [PATCH/next v1 6/6] board/raspberrypi: add Compute
 Module 4/IO Board support (64 Bit)
In-Reply-To: <20210519215115.21684-1-ps.report@gmx.net>
References: <20210519215115.21684-1-ps.report@gmx.net>
Message-ID: <20210519215115.21684-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../genimage-raspberrypicm4io-64.cfg          | 30 ++++++++++++++
 board/raspberrypi/readme.txt                  |  4 ++
 board/raspberrypicm4io-64                     |  1 +
 configs/raspberrypicm4io_64_defconfig         | 41 +++++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 board/raspberrypi/genimage-raspberrypicm4io-64.cfg
 create mode 120000 board/raspberrypicm4io-64
 create mode 100644 configs/raspberrypicm4io_64_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
new file mode 100644
index 0000000000..32a7ca897d
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2711-rpi-cm4.dtb",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
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
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 2032bf80ed..62cb248633 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -52,6 +52,10 @@ For model CM4 (on IO Board):
 
   $ make raspberrypicm4io_defconfig
 
+or for CM4 (on IO Board - 64 bit):
+
+  $ make raspberrypicm4io_64_defconfig
+
 Build the rootfs
 ----------------
 
diff --git a/board/raspberrypicm4io-64 b/board/raspberrypicm4io-64
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypicm4io-64
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
new file mode 100644
index 0000000000..66a9332fe5
--- /dev/null
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
+
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Required tool to flash CM4 eMMC memory
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
-- 
2.31.1
