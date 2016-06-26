From: Andi Shyti <andi.shyti@gmail.com>
Date: Sun, 26 Jun 2016 17:07:42 +0300
Subject: [Buildroot] [PATCH 2/2] board: add support for the Odroid XU4 board
In-Reply-To: <1466950062-31783-1-git-send-email-andi@etezian.org>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
Message-ID: <1466950062-31783-3-git-send-email-andi@etezian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Odroid XU4 board is released by hardkernel and has a Samsunx
5422 SoC.

The board is supported both by mainline Linux Kernel and mainline
u-boot. For the latter a boot.cmd script is provided which needs
to be converted to boot.scr

It requires the odroid boot firmware that contains the previous
stages of boot earlier than u-boot

Signed-off-by: Andi Shyti <andi@etezian.org>
---
 board/odroid-xu4/boot.cmd    |  10 +++
 board/odroid-xu4/readme.txt  | 165 +++++++++++++++++++++++++++++++++++++++++++
 configs/odroid-xu4_defconfig |  10 +++
 3 files changed, 185 insertions(+)
 create mode 100644 board/odroid-xu4/boot.cmd
 create mode 100644 board/odroid-xu4/readme.txt
 create mode 100644 configs/odroid-xu4_defconfig

diff --git a/board/odroid-xu4/boot.cmd b/board/odroid-xu4/boot.cmd
new file mode 100644
index 0000000..2fb4c16
--- /dev/null
+++ b/board/odroid-xu4/boot.cmd
@@ -0,0 +1,10 @@
+setenv kernelname zImage;
+setenv boot_kernel "setenv bootargs \"${console} root=/dev/mmcblk${mmcrootdev}p${mmcrootpart} rootfstype=${rootfstype} rootwait ${opts}\";
+load mmc ${mmcbootdev}:${mmcbootpart} 0x40007FC0 '${kernelname}';
+if load mmc ${mmcbootdev}:${mmcbootpart} 40800000 ${fdtfile}; then
+	bootz 0x40007FC0 - 40800000;
+else
+	echo Warning! Booting without DTB: '${fdtfile}'!;
+	bootz 0x40007FC0 -;
+fi;"
+run boot_kernel;
\ No newline at end of file
diff --git a/board/odroid-xu4/readme.txt b/board/odroid-xu4/readme.txt
new file mode 100644
index 0000000..be8113b
--- /dev/null
+++ b/board/odroid-xu4/readme.txt
@@ -0,0 +1,165 @@
+Odroid XU-4 board with Samsung Exynos 5422 SoC
+
+Introduction
+------------
+
+The Odroid XU 4 board is developed and shipped by Hrdkernel (hardkernel.com). It
+uses the Samsung Exynos 5422 Soc.
+
+Odroid boot process
+-------------------
+
+The odroid boot process requires three stages of boot plus trust zone:
+
+    boot level 1
+
+        |
+        V
+
+    boot level 2
+
+        |
+        V
+
+     u-boot
+
+and they need to be raw copied to the SD card in the following order:
+
+    +----------------+----------------+
+    | boot level 1   | 1 block        |
+    +----------------+----------------+
+    | boot level 2   | 31 block       |
+    +----------------+----------------+
+    | u-boot         | 63 block       |
+    +----------------+----------------+
+    | trust zone     | 2111 block     |
+    +----------------+----------------+
+    | boot partition | 4096 block     |
+    +----------------+----------------+
+    | rootfs         |                |
+    +----------------+----------------+
+
+How to build buildroot
+----------------------
+
+Forst of all configure the buildroot environment:
+
+ $ make odroid-xu4_defconfig
+
+If needed personalize the build
+
+ $ make menuconfig
+
+then hit
+
+ $ make
+
+At the end of the build you should get in the output/images directory the
+following files:
+
+ - bl1.bin.hardkernel
+	Level 1 boot loader
+
+ - bl2.bin.hardkernel.1mb_uboot
+	Level 2 boot loader
+
+ - exynos5422-odroidxu4.dtb
+	Linux Kernel Device Tree blop
+
+ - rootfs.tar
+	Compressed root file system image
+
+ - tzsw.bin.hardkernel
+	ARM Truzt Zone
+
+ - u-boot.bin
+	u-boot image
+
+ - zImage
+	Linux Kernel Image
+
+Set up the bootloader
+---------------------
+
+I will assume you will use an sd card which will have as mount point /dev/sdb.
+The above images need to be flashed to the SD card to specific addresses, as
+follows:
+
+ # dd if=bl1.bin.hardkernel of=/dev/sdb seek=1 bs=512
+ # dd if=bl2.bin.hardkernel.1mb_uboot of=/dev/sdb seek=31 bs=512
+ # dd if=u-boot.bin of=/dev/sdb seek=63 bs=512
+ # dd if=tzsw.bin.hardkernel of=/dev/sdb seek=2111 bs=512
+
+With the above we should be able to boot up to the u-boot bootloader.
+
+Set up the SD card
+------------------
+
+The SD card will need to partitions, which you can make with your favourite
+partitioner. At the end it should look like this:
+
+Device         Boot  Start      End  Sectors  Size Id Type
+/dev/sdb1             4096   135167   131072   64M  b W95 FAT32
+/dev/sdb2           135168 15523839 15388672  7.3G 83 Linux
+
+IMPORTANT: Please note that the first partition starts at the block 4096 instead
+of the default 2048. This is due to the sizes of the binaries we flased earlier,
+which go over the 2048 block, therefore, you need to start the first partition
+at a further location, e.g. 4096.
+
+Now format the two partitions, the first as vfat FS type, the second as EXT3 or
+EXT4:
+
+ # mkfs.vfat /dev/sdb1
+ # mkfs.ext4 /dev/sdb2
+
+Finalize the SD card
+--------------------
+
+Now it's time to move Kernel and File System to the SD card. We will start from
+the Kernel partition.
+
+First mount it:
+
+ # mount /dev/sdb1/ /mnt/
+
+and copy kernel and dtb
+
+ # cp <buildroot>/output/images/zImage /mnt/
+ # cp <buildroot>/output/images/exynos5422-odroidxu4.dtb /mnt/
+
+umount the partition
+
+ # sync
+ # umount /dev/sdb1
+
+Mount the rootfs partition:
+
+ # mount /dev/sdb2 /mnt/
+ # tar
+ # cp <buildroot>/output/images/rootfs.tar -C /mnt/
+
+Umount the partition
+
+ # sync
+ # umount /dev/sdb2
+
+The SD card is ready, you can boot now your Odroid XU-4.
+
+Automate u-boot commands
+------------------------
+
+In order to avoid customizing u-boot from the u-boot system at boot time, you
+can use the boot.cmd file in board/odroid-xu4.
+
+Jut run
+
+ $ mkimage -A arm -T script -C none -d boot.cmd boot.scr
+
+the output is an u-boot readable binary which needs to be copied in the first
+partition of the SD card:
+
+ # mount /dev/sdb1 /mnt/
+ # cp boot.scr /mnt/sdb1
+ # sync
+ # umount /dev/sdb1
diff --git a/configs/odroid-xu4_defconfig b/configs/odroid-xu4_defconfig
new file mode 100644
index 0000000..5eca993
--- /dev/null
+++ b/configs/odroid-xu4_defconfig
@@ -0,0 +1,10 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_KERNEL_HEADERS_4_6=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="exynos"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
+BR2_PACKAGE_ODROID_XU_BL=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="odroid-xu3"
-- 
2.8.1
