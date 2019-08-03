From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:31:55 +0200
Subject: [Buildroot] [git commit] configs/hifive_unleashed: new defconfig
Message-ID: <20190803083010.479B07F966@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86531fae3e3c7ea59430cd0f86260d20fafa9b16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the HiFive Unleashed board. This includes
building the firmware, kernel and rootFS for the HiFive Unleashed.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[Thomas:
 - fix the directory name hifive_unleased -> hifive-unleashed
 - drop from readme.txt the instructions about manually flashing each
   partition, since we have a full SD card image
 - drop the custom post-image.sh script]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  2 +
 board/sifive/hifive-unleashed/genimage.cfg         | 17 +++++
 .../sifive/hifive-unleashed/linux.config.fragment  | 16 +++++
 board/sifive/hifive-unleashed/readme.txt           | 75 ++++++++++++++++++++++
 configs/hifive_unleashed_defconfig                 | 40 ++++++++++++
 6 files changed, 151 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b04bb74381..2fabb9601b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -187,6 +187,7 @@ friendlyarm_nanopi_neo2_defconfig: { extends: .defconfig }
 galileo_defconfig: { extends: .defconfig }
 grinn_chiliboard_defconfig: { extends: .defconfig }
 grinn_liteboard_defconfig: { extends: .defconfig }
+hifive_unleashed_defconfig: { extends: .defconfig }
 imx23evk_defconfig: { extends: .defconfig }
 imx6-sabreauto_defconfig: { extends: .defconfig }
 imx6-sabresd_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 9b576361f2..02d0815ecf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -123,7 +123,9 @@ F:	package/kvazaar/
 F:	package/v4l2loopback/
 
 N:	Alistair Francis <alistair@alistair23.me>
+F:	board/sifive/
 F:	boot/opensbi/
+F:	configs/hifive_unleashed_defconfig
 F:	package/xen/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
diff --git a/board/sifive/hifive-unleashed/genimage.cfg b/board/sifive/hifive-unleashed/genimage.cfg
new file mode 100644
index 0000000000..8eebc52355
--- /dev/null
+++ b/board/sifive/hifive-unleashed/genimage.cfg
@@ -0,0 +1,17 @@
+image sdcard.img {
+	hdimage {
+		gpt = true
+	}
+
+	partition bootloader {
+		image = "fw_payload.bin"
+		offset = 1M
+		size = 32M
+		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+	}
+}
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/hifive-unleashed/linux.config.fragment
new file mode 100644
index 0000000000..f4f384088a
--- /dev/null
+++ b/board/sifive/hifive-unleashed/linux.config.fragment
@@ -0,0 +1,16 @@
+CONFIG_HZ_100=y
+CONFIG_CMDLINE="earlycon=sbi root=/dev/mmcblk0p2 rootwait"
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_SERIAL_SIFIVE=y
+CONFIG_SERIAL_SIFIVE_CONSOLE=y
+CONFIG_SPI=y
+CONFIG_SPI_SIFIVE=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_MMC=y
+CONFIG_MMC_SPI=y
+CONFIG_CLK_U54_PRCI=y
+CONFIG_CLK_GEMGXL_MGMT=y
+CONFIG_PWM=y
+CONFIG_PWM_SIFIVE=y
diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
new file mode 100644
index 0000000000..8d3fa6357f
--- /dev/null
+++ b/board/sifive/hifive-unleashed/readme.txt
@@ -0,0 +1,75 @@
+SiFive HiFive Unleashed
+=======================
+
+This file describes how to use the pre-defined Buildroot
+configuration for the SiFive HiFive Unleashed board.
+
+Further information about the HiFive Unleashed board can be found
+at https://www.sifive.com/boards/hifive-unleashed
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  $ make hifive_unleashed_defconfig
+
+Customise the build as necessary:
+
+  $ make menuconfig
+
+Start the build:
+
+  $ make
+
+Result of the build
+===================
+
+Once the build has finished you will have the following files:
+
+    output/images/
+    +-- fw_jump.bin
+    +-- fw_jump.elf
+    +-- fw_payload.bin
+    +-- fw_payload.elf
+    +-- Image
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+
+
+Creating a bootable SD card with genimage
+=========================================
+
+Buildroot builds a SD card image for you. All you need to do is dd the
+image to your SD card, which can be done with the following command:
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=4096
+
+Booting the SD card on the board
+================================
+
+Make sure that the all DIP switches are set to the off position for
+default boot mode (MSEL mode = 1111), insert the SD card and power
+up the board.
+
+Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
+
+See the 'SiFive HiFive Unleashed Getting Started Guide' for
+more details (https://www.sifive.com/documentation).
+
+You will get a warning reported by fdisk when you examine the SD card.
+This is because the genimage.cfg file doesn't specify the SD card size
+(as people will naturally have different sized cards), so the
+secondary GPT header is placed after the rootfs rather than at the end
+of the disk where it is expected to be.
+
+You will see something like this at boot time:
+
+[    2.318722] GPT:Primary header thinks Alt. header is not at the end of the disk.
+[    2.325390] GPT:190496 != 122142719
+[    2.328843] GPT:Alternate GPT header not at the end of the disk.
+[    2.334824] GPT:190496 != 122142719
+[    2.338302] GPT: Use GNU Parted to correct GPT errors.
+[    2.343456]  mmcblk0: p1 p2
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
new file mode 100644
index 0000000000..24576570da
--- /dev/null
+++ b/configs/hifive_unleashed_defconfig
@@ -0,0 +1,40 @@
+# Architecture
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVF=y
+BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_64=y
+BR2_RISCV_ABI_LP64D=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage.cfg"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Linux headers same as kernel, a 5.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/alistair23/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="hifive-unleashed-5.1"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_IMAGE=y
+
+# Bootloader
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_PLAT="sifive/fu540"
+BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
+
+# Host tools
+BR2_PACKAGE_HOST_GENIMAGE=y
