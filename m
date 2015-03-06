From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:52:01 +0100
Subject: [Buildroot] [git commit] board: add support for RIoTboard
Message-ID: <20150307100623.2A4C2804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c9aa3218339ce8d896adfc5facd812b1fffa889
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small development board, based on Freescale IMX6 Solo SoC
(single core ARM Cortex-A9). The board has excellent support in mainline
U-Boot and Linux.

Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/embest/riotboard/readme.txt                  |   46 ++++++++++++++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |    6 +++
 configs/riotboard_defconfig                        |   34 ++++++++++++++
 3 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
new file mode 100644
index 0000000..8c31bbe
--- /dev/null
+++ b/board/embest/riotboard/readme.txt
@@ -0,0 +1,46 @@
+Buildroot for Embest RIoTboard
+==============================
+
+1. Compiling buildroot
+----------------------
+
+make riotboard_defconfig
+make
+
+2. Installing buildroot
+-----------------------
+
+Prepare an SD-card and plug it into your card reader. Write the bootloader to
+your SD-card:
+
+sudo dd if=output/images/u-boot.imx of=/dev/sdX bs=1k seek=1
+
+Create 1 partition on the SD-card using your favourite tool. The partition
+should be big enough to hold your rootfs, for example 128MiB. Here's how an
+example of such partition layout:
+
+   Device Boot      Start         End      Blocks   Id  System
+/dev/sdX1            2048      264191      131072   83  Linux
+
+Format the SD-card partition with your favourite filesystem:
+
+sudo mkfs.ext2 /dev/sdX1
+
+Deploy your rootfs to the SD-card:
+
+sudo mkdir /mnt/sdcard/
+sudo mount /dev/sdX1 /mnt/sdcard/
+sudo tar xf rootfs.tar -C /mnt/sdcard/
+sudo umount /dev/sdX1
+
+3. Running buildroot
+--------------------
+
+Position the board so you can read the label "RIoTboard" on the right side of
+SW1 DIP switches. Configure the SW1 swiches like this:
+
+10100101 (1 means ON position, 0 means OFF position)
+
+Now plug your prepared SD-card in slot J6. Connect a serial console (115200, 8,
+N, 1) to header J18. Connect a 5V/1A power supply to the board and enjoy your
+new toy.
diff --git a/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf b/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000..c7d32e0
--- /dev/null
+++ b/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,6 @@
+default buildroot
+
+label buildroot
+kernel /boot/uImage
+devicetree /boot/imx6dl-riotboard.dtb
+append console=ttymxc1,115200 root=/dev/mmcblk0p1 rw
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
new file mode 100644
index 0000000..034bf40
--- /dev/null
+++ b/configs/riotboard_defconfig
@@ -0,0 +1,34 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_EABIHF=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+
+# rootfs
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_2r1=y
+BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_VERSION="2015.01"
+BR2_TARGET_UBOOT_BOARDNAME="riotboard"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# kernel headers
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
