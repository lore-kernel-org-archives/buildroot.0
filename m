From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:54:29 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for the Atmel
	SAMA5D3 Xplained board
Message-ID: <20140629085439.1D8309BBA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54a653f649d131f8a038fc1314383b60294ad351
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/xplained/readme.txt  |   73 ++++++++++++++++++++++++++++++++++++++
 configs/atmel_xplained_defconfig |   28 ++++++++++++++
 2 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
new file mode 100644
index 0000000..e29a116
--- /dev/null
+++ b/board/atmel/xplained/readme.txt
@@ -0,0 +1,73 @@
+Atmel SAMA5D3 Xplained board
+============================
+
+This document explains how to set up a basic Buildroot system on the
+Atmel SAMA5D3 Xplained board, whose main site is
+http://www.atmel.com/tools/ATSAMA5D3-XPLD.aspx. Additional details can
+also be found on the http://www.at91.com/linux4sam/bin/view/Linux4SAM/
+web site.
+
+Note that the default Buildroot configuration is prepared to boot from
+an SD card: the first stage bootloader, second stage bootloader,
+kernel image and root filesystem are all located on the SD card. Some
+adjustements in the bootloader configuration will be needed to boot
+from NAND flash.
+
+Configuring and building Buildroot
+----------------------------------
+
+  make atmel_xplained_defconfig
+  make
+
+Preparing the SD card
+---------------------
+
+The SD card must be partitionned with at least two partitions: one
+FAT16 partition for the bootloaders, kernel image and Device Tree
+blob, and one ext4 partition for the root filesystem. To partition the
+SD card:
+
+sudo sfdisk -uM /dev/mmcblk0 <<EOF
+,64,6
+;
+EOF
+
+This creates a 64 MB partition for the FAT16 filesystem (type 6) and
+uses the rest for the ext4 filesystem used for the root filesystem.
+
+Then, format both partitions:
+
+sudo mkfs.msdos -n boot /dev/mmcblk0p1
+sudo mkfs.ext4 -L rootfs -O ^huge_file /dev/mmcblk0p2
+
+ Note: the -O ^huge_file option is needed to avoid enabling the huge
+ files features of ext4 (to support files larges than 2 TB), which
+ needs the kernel option CONFIG_LBDAF to be enabled.
+
+Mount both partitions (if not done automatically by your system):
+
+sudo mount /dev/mmcblk0p1 /media/boot
+sudo mount /dev/mmcblk0p2 /media/rootfs
+
+Copy the bootloaders, kernel image and Device Tree blob to the first
+partition:
+
+cp output/images/sama5d3_xplained-sdcardboot-uboot-3.6.2.bin /media/boot/boot.bin
+cp output/images/u-boot.bin /media/boot/u-boot.bin
+cp output/images/zImage /media/boot/zImage
+cp output/images/at91-sama5d3_xplained.dtb /media/boot/at91-sama5d3_xplained.dtb
+
+Extract the root filesystem to the second partition:
+
+sudo tar -C /media/rootfs -xf output/images/rootfs.tar
+
+Unmount both partitions:
+
+sudo umount /media/boot
+sudo umount /media/rootfs
+
+Insert your SD card in your Xplained board, and enjoy. The default
+U-Boot environment will properly load the kernel and Device Tree blob
+from the first partition of the SD card, so everything works
+automatically.
+
diff --git a/configs/atmel_xplained_defconfig b/configs/atmel_xplained_defconfig
new file mode 100644
index 0000000..8c06489
--- /dev/null
+++ b/configs/atmel_xplained_defconfig
@@ -0,0 +1,28 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a5=y
+
+# Toolchain configuration
+BR2_ARM_EABIHF=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.15"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+
+# Kernel configuration
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained"
+
+# First stage bootloader
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
+
+# Second stage bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="sama5d3_xplained_mmc"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.04"
