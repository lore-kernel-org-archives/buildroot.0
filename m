From: Maxime Chevallier <chevalliersebmax@gmail.com>
Date: Mon, 25 Sep 2017 00:05:33 +0200
Subject: [Buildroot] [PATCH 1/1] [RFC] mvebu_espressobin-88f3720 : Add
	support for espressobin
In-Reply-To: <1506290733-6042-1-git-send-email-chevalliersebmax@gmail.com>
References: <1506290733-6042-1-git-send-email-chevalliersebmax@gmail.com>
Message-ID: <1506290733-6042-2-git-send-email-chevalliersebmax@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the Globalscale 'Espressobin' board based
on Marvell Armada 3720.

This board has a dual Cortex-A53, 1GB DDR3, USBs, ethernets,
and some GPIO ports. More informations on the vendor site :
http://espressobin.net/tech-spec/

This config uses the mainline linux support for the board and
the buildroot toolchain using glibc, since uclibc does not
support aarch64.

Mainline device-tree does not include SDCard support yet, so USB
is the preferred way to boot the image, using the default pre-flashed
u-boot on SPI NOR.

Signed-off-by: Maxime Chevallier <chevalliersebmax@gmail.com>
---
 DEVELOPERS                                  |  4 ++
 board/globalscale/espressobin/genimage.cfg  | 11 +++++
 board/globalscale/espressobin/readme.txt    | 76 +++++++++++++++++++++++++++++
 configs/mvebu_espressobin-88f3720_defconfig | 29 +++++++++++
 4 files changed, 120 insertions(+)
 create mode 100644 board/globalscale/espressobin/genimage.cfg
 create mode 100644 board/globalscale/espressobin/readme.txt
 create mode 100644 configs/mvebu_espressobin-88f3720_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e34802f..5036ac2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1208,6 +1208,10 @@ F:	package/python-wsaccel/
 N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
+N:	Maxime Chevallier <chevalliersebmax@gmail.com>
+F:	configs/mvebu_espressobin-88f3720_defconfig
+F:	board/globalscale/espressobin/
+
 N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 F:	package/babeld/
 F:	package/dante/
diff --git a/board/globalscale/espressobin/genimage.cfg b/board/globalscale/espressobin/genimage.cfg
new file mode 100644
index 0000000..664f81b
--- /dev/null
+++ b/board/globalscale/espressobin/genimage.cfg
@@ -0,0 +1,11 @@
+# Minimal image
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/globalscale/espressobin/readme.txt b/board/globalscale/espressobin/readme.txt
new file mode 100644
index 0000000..fc9140e
--- /dev/null
+++ b/board/globalscale/espressobin/readme.txt
@@ -0,0 +1,76 @@
+Espressobin
+===========
+
+This is the basic support for the Espressobin by globalscale technologies,
+based on the Marvell Armada 3720.
+
+This support is based on the mainline linux kernel.
+
+
+How to build
+============
+
+1 - Use default configuration for espressobin :
+
+make mvebu_espressobin-88f3720_defconfig
+
+2 - Build the system
+
+make
+
+This generates the kernel image, the devicetree binary, the rootfs as a
+tar.gz, and a filesystem image containing everything : sdcard.img (this name
+is misleading though, see Limitations).
+
+Build artifacts are located in output/images.
+
+How to boot
+===========
+
+To boot, you need an UART connection, using the on-board micro-usb port
+at 115200 bauds.
+
+NOTE : As of today, booting from SDCard is not fully supported (rootfs cannot
+be located on SCard).
+
+## From USB Stick ############################################################
+
+As of right now, this is the easiest way to boot the system, since the SDCard
+support is not fully mainlined. It uses the pre-flashed u-boot on the SPI NOR
+to load the kernel, device-tree and rootfs from a USB stick.
+
+The on-board jumpers must be configured to select the SPI NOR as a boot source.
+
+1 - Flash rootfs image on usb drive (Be careful to select the correct drive)
+
+sudo dd if=sdcard.img of=/dev/sdX bs=1M
+sync
+
+2 - Boot from SPI NOR, interrupt boot by pressing Enter
+
+3 - Setup the bootusb u-boot script :
+
+setenv fdt_addr 0x1800000
+setenv fdt_name boot/armada-3720-espressobin.dtb
+setenv bootusb 'usb start; ext4load usb 0:1 $kernel_addr $image_name; ext4load usb 0:1 $fdt_addr $fdt_name; setenv bootargs $console root=/dev/sda1 rw rootwait; booti $kernel_addr - $fdt_addr'
+run bootusb
+
+Limitations
+===========
+
+Since the buildroot support for the espressobin is based on mainline
+linux, especially regarding device-tree, the current functionnalities
+for espressobin are limited.
+
+Namely, the mainline device-tree does not include support for sdcards yet, which
+means the kernel is not able to load a rootfs located on a SDCard.
+
+Todo
+====
+
+- Add bootloader generation
+
+- Use a custom devicetree to have SDcard support (or wait for support in mainline linux tree)
+
+- When SDcard support is working, add generation of sdcard image including bootloader, and
+  document the on-board jumper configuration needed for sdcard boot.
diff --git a/configs/mvebu_espressobin-88f3720_defconfig b/configs/mvebu_espressobin-88f3720_defconfig
new file mode 100644
index 0000000..394c881
--- /dev/null
+++ b/configs/mvebu_espressobin-88f3720_defconfig
@@ -0,0 +1,29 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_GEN=4
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# uClibc does not support aarch64 yet.
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+
+# Image generation
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
-- 
2.7.4
