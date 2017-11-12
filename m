From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 12 Nov 2017 23:16:45 +0300
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new board
In-Reply-To: <20171112201646.15558-1-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
Message-ID: <20171112201646.15558-5-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add MacchiatoBin board by SolidRun. This board is based on Marvell
Armada 8040 SoC. Board support package includes the following
two options: mainline and vendor BSPs.

Mainline BSP:
- Marvell ATF v1.3-armada-17.10 and its dependencies
- mainline U-Boot v2017.09
- mainline Linux kernel v4.13.11

Marvell BSP with more hardware support enabled:
- Marvell ATF v1.3-armada-17.10 and its dependencies
- vendor U-Boot based on v2017.03
- Marvell Linux kernel based v4.4.52

More details about this board are available on wiki:
- http://wiki.macchiatobin.net

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/solidrun/macchiatobin/genimage.cfg         | 16 ++++++
 board/solidrun/macchiatobin/readme.txt           | 70 ++++++++++++++++++++++++
 configs/solidrun_macchiatobin_mainline_defconfig | 46 ++++++++++++++++
 configs/solidrun_macchiatobin_marvell_defconfig  | 48 ++++++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 board/solidrun/macchiatobin/genimage.cfg
 create mode 100644 board/solidrun/macchiatobin/readme.txt
 create mode 100644 configs/solidrun_macchiatobin_mainline_defconfig
 create mode 100644 configs/solidrun_macchiatobin_marvell_defconfig

diff --git a/board/solidrun/macchiatobin/genimage.cfg b/board/solidrun/macchiatobin/genimage.cfg
new file mode 100644
index 0000000000..fdcda368a2
--- /dev/null
+++ b/board/solidrun/macchiatobin/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition uboot {
+		in-partition-table = "no"
+		image = "flash-image.bin"
+		offset = 0x200000
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		offset = 0x2200000
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
new file mode 100644
index 0000000000..7bab5aca3c
--- /dev/null
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -0,0 +1,70 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the MacchiatoBin board based on Marvell Armada
+8040 SoC. Documentation for the board hardware and software
+is available on wiki: http://wiki.macchiatobin.net
+
+This default configuration will bring-up the board and allow
+access through the serial console.
+
+How to build
+============
+
+There are two build options. The first option is mainline BSP:
+ - Linux v4.13.11
+ - U-Boot v2017.09
+
+The second option is vendor BSP which enables more hardware.
+Marvell BSP is based on the following Linux and U-Boot versions:
+ - Linux v4.4.52
+ - U-Boot v2017.03
+Sources are available on Marvell GitHub page:
+   https://github.com/MarvellEmbeddedProcessors
+
+To use mainline BSP run the following commands:
+    $ make solidrun_macchiatobin_mainline_defconfig
+    $ make
+
+To use vendor BSP run the following commands:
+    $ make solidrun_macchiatobin_marvell_defconfig
+    $ make
+
+Note: you will need access to the internet to download
+all the required sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image
+called "sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in MacchiatoBin board and power it up.
+The console is on the serial line, 115200 8N1.
+
+Note that MacchiatoBin board can be setup to load bootloader
+from different sources including eMMC, SPI flash, and SD card.
+Make sure to properly configure DIP switches SW1 and SW2
+according to information available on wiki.
+
+By default U-Boot will use environment from SPI flash. If SPI flash
+is empty or it keeps legacy environment which is incompatible with
+up-to-date mainline U-Boot and kernel, then the following
+commands can be used to boot the board:
+
+=> env default -f -a
+=> setenv bootargs console=ttyS0,115200 root=/dev/mmcblk1p1 rw rootwait
+=> setenv bootdelay 2
+=> setenv fdt_addr 0x1000000
+=> setenv fdt_high 0xffffffffffffffff
+=> setenv fdt_name boot/armada-8040-mcbin.dtb
+=> setenv kernel_addr 0x2000000
+=> setenv image_name boot/Image
+=> setenv bootcmd 'mmc dev 1; ext4load mmc 1:1 $kernel_addr $image_name; ext4load mmc 1:1 $fdt_addr $fdt_name; booti $kernel_addr - $fdt_addr'
+=> boot
diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
new file mode 100644
index 0000000000..ab82865a0d
--- /dev/null
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+
+#
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_TARGET_GENERIC_HOSTNAME="mcbin"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+
+BR2_TARGET_ARMADA_FIRMWARE=y
+BR2_TARGET_ARMADA_FIRMWARE_IMAGE="mrvl_scp_bl2_8040.img"
+BR2_TARGET_ARMADA_FIRMWARE_VERSION="binaries-marvell-armada-17.10"
+
+BR2_TARGET_ARMADA_DDR=y
+BR2_TARGET_ARMADA_DDR_VERSION="mv_ddr-armada-17.10"
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# rootfs
+BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
new file mode 100644
index 0000000000..f47df89fb3
--- /dev/null
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -0,0 +1,48 @@
+BR2_aarch64=y
+
+#
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TARGET_GENERIC_HOSTNAME="mcbin"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+
+BR2_TARGET_ARMADA_FIRMWARE=y
+BR2_TARGET_ARMADA_FIRMWARE_IMAGE="mrvl_scp_bl2_8040.img"
+BR2_TARGET_ARMADA_FIRMWARE_VERSION="binaries-marvell-armada-17.10"
+
+BR2_TARGET_ARMADA_DDR=y
+BR2_TARGET_ARMADA_DDR_VERSION="mv_ddr-armada-17.10"
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/u-boot-marvell"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2017.03-armada-17.10"
+BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/linux-marvell"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-4.4.52-armada-17.10"
+BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v8_lsp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# rootfs
+BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
-- 
2.11.0
