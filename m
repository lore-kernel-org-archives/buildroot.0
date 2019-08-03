From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 11:06:44 +0200
Subject: [Buildroot] [git commit] board/raspberrypi: add support for the new
 pi4
Message-ID: <20190803090406.303BE81052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa1ce849f3061fab282aa78ebff3cc30abb08f4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is based on the pi3 defconfig. There is currently no 64-bit support
since the upstream kernel does not build in this configuration.

Signed-off-by: Michael Cullen <michael@michaelcullen.name>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi4.cfg | 30 +++++++++++++++++++++++
 board/raspberrypi/readme.txt                |  8 +++++-
 board/raspberrypi4                          |  1 +
 configs/raspberrypi4_defconfig              | 38 +++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
new file mode 100644
index 0000000000..4e4742f3ef
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi4.cfg
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
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 9f91581054..69c9f9b20a 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -8,6 +8,7 @@ These instructions apply to all models of the Raspberry Pi:
   - the "enhanced" models A+ and B+,
   - the model B2 (aka Raspberry Pi 2)
   - the model B3 (aka Raspberry Pi 3).
+  - the model B4 (aka Raspberry Pi 4).
 
 How to build it
 ===============
@@ -34,6 +35,10 @@ For model 3 B and B+:
 
   $ make raspberrypi3_defconfig
 
+For model 4 B:
+
+  $ make raspberrypi4_defconfig
+
 Build the rootfs
 ----------------
 
@@ -57,6 +62,7 @@ After building, you should obtain this tree:
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
+    +-- bcm2711-rpi-4-b.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
@@ -72,7 +78,7 @@ After building, you should obtain this tree:
 [1] Not all of them will be present, depending on the RaspberryPi
     model you are using.
 
-[2] Only for the Raspberry Pi 3 Model (overlay pi3-miniuart-bt is needed
+[2] Only for the Raspberry Pi 3/4 Models (overlay pi3-miniuart-bt is needed
     to enable the RPi3 serial console otherwise occupied by the bluetooth
     chip). Alternative would be to disable the serial console in cmdline.txt
     and /etc/inittab.
diff --git a/board/raspberrypi4 b/board/raspberrypi4
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi4
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
new file mode 100644
index 0000000000..a15a729e73
--- /dev/null
+++ b/configs/raspberrypi4_defconfig
@@ -0,0 +1,38 @@
+BR2_arm=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_NEON_VFPV4=y
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
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,eb0360356344d8ba633e61936c794aa46a02397f)/linux-eb0360356344d8ba633e61936c794aa46a02397f.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
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
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
