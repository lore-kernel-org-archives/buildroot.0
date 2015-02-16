From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Mon, 16 Feb 2015 02:28:26 +0200
Subject: [Buildroot] [PATCH 1/1] board: add support for RIoTboard
Message-ID: <1424046506-17740-1-git-send-email-picmaster@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a small development board, based on Freescale IMX6 Solo SoC
(single core ARM Cortex-A9). The board has excellent support in mainline
U-Boot and Linux.

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
---
 board/embest/riotboard/readme.txt |   53 +++++++++++++++++++++++++++++++++++++
 configs/riotboard_defconfig       |   30 +++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 board/embest/riotboard/readme.txt
 create mode 100644 configs/riotboard_defconfig

diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
new file mode 100644
index 0000000..cde5469
--- /dev/null
+++ b/board/embest/riotboard/readme.txt
@@ -0,0 +1,53 @@
+Buildroot for Embest RIoTboard
+==============================
+
+1. Compiling buildroot
+----------------------
+make distclean
+make riotboard_defconfig
+make
+
+2. Installing buildroot
+-----------------------
+Prepare an SD-card and plug it into your card reader. Create 2 partitions on the
+card using your favourite tool. Partition 1 should be around 32MiB, partition 2
+should be big enough to hold your rootfs:
+
+   Device Boot      Start         End      Blocks   Id  System
+/dev/sdX1            2048       67583       32768   83  Linux
+/dev/sdX2           67584      329727      131072   83  Linux
+
+Format the partitions with your favourite filesystem:
+
+sudo mkfs.ext2 /dev/sdX1
+sudo mkfs.ext2 /dev/sdX2
+
+Copy the kernel and device tree blob on partition 1:
+
+sudo mount /dev/sdX1 /mnt/sdcard/
+sudo cp -v uImage /mnt/sdcard/
+suco cp -v imx6dl-riotboard.dtb /mnt/sdcard/dtb
+sudo umount /dev/sdX1
+
+Then deploy your rootfs on partition 2:
+
+sudo mount /dev/sdX2 /mnt/sdcard/
+tar xf rootfs.tar -C /mnt/sdcard/
+sudo umount /dev/sdX2
+
+3. Running buildroot
+--------------------
+Position the board so you can read the label "RIoTboard on the right side of
+SW1 DIP switches. Now configure SW1 swiches from left to right like this:
+
+10100101 (1 means ON position, 0 means OFF position)
+
+Now plug your prepared SD card in J6 SDcard slot. Connect a serial console
+(115200, 8, N, 1) to J18. Connect a 5V power supply to the board and break
+the boot sequence. Change your root device in U-Boot:
+
+setenv mmcroot mmcroot=/dev/mmcblk0p2 rw
+saveenv
+reset
+
+Enjoy!
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
new file mode 100644
index 0000000..ebcee69
--- /dev/null
+++ b/configs/riotboard_defconfig
@@ -0,0 +1,30 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+
+# toolchain
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+
+# rootfs
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_2r1=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_VERSION="2015.01"
+BR2_TARGET_UBOOT_BOARDNAME="riotboard"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# kernel headers
+BR2_KERNEL_HEADERS_3_18=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
-- 
1.7.10.4
