From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 21:49:08 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi4_64: new defconfig
Message-ID: <20191208204240.80C3B7FCB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3236182552a33da2cf25ca429e52325941f088a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This configuration builds a 64bit image for RaspberryPi 4.

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                 |  1 +
 DEVELOPERS                                     |  4 +++
 board/raspberrypi/genimage-raspberrypi4-64.cfg | 30 ++++++++++++++++++++
 board/raspberrypi4-64                          |  1 +
 configs/raspberrypi4_64_defconfig              | 39 ++++++++++++++++++++++++++
 5 files changed, 75 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6deb97351b..cf3382732f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -297,6 +297,7 @@ raspberrypi2_defconfig: { extends: .defconfig }
 raspberrypi3_64_defconfig: { extends: .defconfig }
 raspberrypi3_defconfig: { extends: .defconfig }
 raspberrypi3_qt5we_defconfig: { extends: .defconfig }
+raspberrypi4_64_defconfig: { extends: .defconfig }
 raspberrypi4_defconfig: { extends: .defconfig }
 raspberrypi_defconfig: { extends: .defconfig }
 riotboard_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index d5fd6e0e93..9eb62a2f83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -236,6 +236,10 @@ F:	package/python-bottle/
 F:	package/sqlcipher/
 F:	package/stress/
 
+N:	Arthur Courtel <arthur.courtel@smile.fr>
+F:	board/raspberrypi/genimage-raspberrypi4-64.cfg
+F:	configs/raspberrypi4_64_defconfig
+
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/collectd/
 F:	package/libuv/
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
index 0000000000..f013c4382c
--- /dev/null
+++ b/configs/raspberrypi4_64_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
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
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
