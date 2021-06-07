From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:18:12 -0000
Subject: [Buildroot] [git commit] board/raspberrypi: add Compute Module 4/IO
 Board support
Message-ID: <20210607144655.CBD258B398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fb6962bf02c489142793122054b57a00cf556e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/genimage-raspberrypicm4io.cfg | 30 ++++++++++++++++++
 board/raspberrypi/readme.txt                    | 34 ++++++++++++++++++++
 board/raspberrypicm4io                          |  1 +
 configs/raspberrypicm4io_defconfig              | 41 +++++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/board/raspberrypi/genimage-raspberrypicm4io.cfg b/board/raspberrypi/genimage-raspberrypicm4io.cfg
new file mode 100644
index 0000000000..5a42bcfbb4
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypicm4io.cfg
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
index 2a876f9ae4..2032bf80ed 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -9,6 +9,7 @@ These instructions apply to all models of the Raspberry Pi:
   - the model B2 (aka Raspberry Pi 2)
   - the model B3 (aka Raspberry Pi 3).
   - the model B4 (aka Raspberry Pi 4).
+  - the model CM4 (aka Raspberry Pi Compute Module 4 and IO Board).
 
 How to build it
 ===============
@@ -47,6 +48,10 @@ or for model 4 B (64 bit):
 
   $ make raspberrypi4_64_defconfig
 
+For model CM4 (on IO Board):
+
+  $ make raspberrypicm4io_defconfig
+
 Build the rootfs
 ----------------
 
@@ -71,6 +76,7 @@ After building, you should obtain this tree:
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
     +-- bcm2711-rpi-4-b.dtb         [1]
+    +-- bcm2711-rpi-cm4.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
@@ -105,3 +111,31 @@ Insert the SDcard into your Raspberry Pi, and power it up. Your new system
 should come up now and start two consoles: one on the serial port on
 the P1 header, one on the HDMI output where you can login using a USB
 keyboard.
+
+How to write to CM4 eMMC memory
+===============================
+
+For CM4 modules without eMMC memory see above for booting from SD card,
+for CM4 moduels with eMMC memory proceed as following:
+
+- fit jumper on IO Board header J2 to disable eMMC boot
+- connect IO Board micro USB port (J11 USB slave) to your host linux system
+- power up CM4/IO Board (lsusb command should show a '0a5c:2711 Broadcom Corp.
+  BCM2711 Boot' device)
+- run 'sudo ./host/bin/rpiboot', output should look like the following:
+    Waiting for BCM2835/6/7/2711...
+    Loading embedded: bootcode4.bin
+    Sending bootcode.bin
+    Successful read 4 bytes
+    Waiting for BCM2835/6/7/2711...
+    Loading embedded: bootcode4.bin
+    Second stage boot server
+    Loading embedded: start4.elf
+    File read: start4.elf
+    Second stage boot server done
+
+- a USB mass storage device should show up (the CM4 eMMC memory), proceed
+  as described above to copy sdcard.img to it
+- power down CM4/IO Board
+- remove jumper on IO Board header J2 to re-enable eMMC boot
+- power up CM4/IO Board
diff --git a/board/raspberrypicm4io b/board/raspberrypicm4io
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypicm4io
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
new file mode 100644
index 0000000000..cba07a9064
--- /dev/null
+++ b/configs/raspberrypicm4io_defconfig
@@ -0,0 +1,41 @@
+BR2_arm=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_NEON_VFPV4=y
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
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-cm4"
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
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
