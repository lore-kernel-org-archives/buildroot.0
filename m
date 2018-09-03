From: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
Date: Mon,  3 Sep 2018 05:03:33 +0300
Subject: [Buildroot] [PATCH 1/1] board: resurrect support for RIoTboard
Message-ID: <20180903020333.23622-1-nikolay.dimitrov@retrohub.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resurrect support for RIoTboard after 2018.02.x deprecation.

Signed-off-by: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
---
 board/embest/riotboard/readme.txt                  | 46 ++++++++++++++++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  6 +++
 configs/riotboard_defconfig                        | 36 +++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 board/embest/riotboard/readme.txt
 create mode 100644 board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 configs/riotboard_defconfig

diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
new file mode 100644
index 0000000000..b7390d0d57
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
+Create 1 partition on the SD-card using your favourite tool. The
+partition should be big enough to hold your rootfs, for example
+128MiB. Here's an example partition layout:
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
+sudo tar xf output/images/rootfs.tar -C /mnt/sdcard/
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
index 0000000000..eee6ea4a95
--- /dev/null
+++ b/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,6 @@
+default buildroot
+
+label buildroot
+kernel /boot/uImage
+devicetree /boot/imx6dl-riotboard.dtb
+append console=ttymxc1,115200 root=/dev/mmcblk1p1 rw
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
new file mode 100644
index 0000000000..45bbd2cbad
--- /dev/null
+++ b/configs/riotboard_defconfig
@@ -0,0 +1,36 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_BOARDNAME="riotboard"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.11.0
