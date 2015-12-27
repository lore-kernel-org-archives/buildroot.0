From: Cam Hutchison <camh@xdna.net>
Date: Sun, 27 Dec 2015 00:04:31 -0000
Subject: [Buildroot] buildroot support for OrangePI PC
References: <56748758.7040908@mind.be> <1450948540529.50320.154990@webmail2>
Message-ID: <52e7.567f2b0f.b045b@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Eelco Chaudron" <echaudron@xiot.nl> writes:

>I decided to do some work on the OrangePI PC and I have a basic Linux 4.4 setup running.
>It boots, and I have serial access to the board.

Cool. I'll look over it.

>Cam if you could share your 3.4 repo (and or 4.4 if it has better OrangePI support) I
>can get started with this too.

I haven't made a start yet, so I have no repo to share.


>diff --git a/board/orangepi/orangepipc/boot.cmd b/board/orangepi/orangepipc/boot.cmd
>new file mode 100644
>index 0000000..7d61e7b
>--- /dev/null
>+++ b/board/orangepi/orangepipc/boot.cmd
>@@ -0,0 +1,8 @@
>+setenv fdt_high ffffffff
>+
>+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
>+
>+fatload mmc 0 $kernel_addr_r uImage
>+fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc.dtb
>+
>+bootm $kernel_addr_r - $fdt_addr_r
>diff --git a/board/orangepi/orangepipc/genimage.cfg b/board/orangepi/orangepipc/genimage.cfg
>new file mode 100644
>index 0000000..43c2249
>--- /dev/null
>+++ b/board/orangepi/orangepipc/genimage.cfg
>@@ -0,0 +1,36 @@
>+# Minimal SD card image for the OrangePi PC
>+#
>+
>+image boot.vfat {
>+ vfat {
>+ files = {
>+ "uImage",
>+ "sun8i-h3-orangepi-pc.dtb",
>+ "boot.scr"
>+ }
>+ }
>+ size = 10M
>+}
>+
>+image sdcard.img {
>+ hdimage {
>+ }
>+
>+ partition u-boot {
>+ in-partition-table = "no"
>+ image = "u-boot-sunxi-with-spl.bin"
>+ offset = 8192
>+ }
>+
>+ partition boot {
>+ partition-type = 0xC
>+ bootable = "true"
>+ image = "boot.vfat"
>+ }
>+
>+ partition rootfs {
>+ partition-type = 0x83
>+ image = "rootfs.ext4"
>+ size = 512M
>+ }
>+}
>diff --git a/board/orangepi/orangepipc/post-build.sh b/board/orangepi/orangepipc/post-build.sh
>new file mode 100755
>index 0000000..9f115cb
>--- /dev/null
>+++ b/board/orangepi/orangepipc/post-build.sh
>@@ -0,0 +1,14 @@
>+#!/bin/sh
>+# post-build.sh for OrangePi PC taken from CubieBoard's post-build.sh
>+# 2013, Carlo Caione <<carlo.caione@gmail.com>>
>+
>+BOARD_DIR="$(dirname $0)"
>+MKIMAGE=$HOST_DIR/usr/bin/mkimage
>+BOOT_CMD=$BOARD_DIR/boot.cmd
>+BOOT_CMD_H=$BINARIES_DIR/boot.scr
>+
>+# U-Boot script
>+if [ -e $MKIMAGE -a -e $BOOT_CMD ];
>+then
>+	$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
>+fi
>diff --git a/board/orangepi/orangepipc/post-image.sh b/board/orangepi/orangepipc/post-image.sh
>new file mode 100755
>index 0000000..05f6b70
>--- /dev/null
>+++ b/board/orangepi/orangepipc/post-image.sh
>@@ -0,0 +1,16 @@
>+#!/bin/bash
>+
>+GENIMAGE_CFG="board/orangepi/orangepipc/genimage.cfg"
>+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>+
>+rm -rf "${GENIMAGE_TMP}"
>+
>+genimage \
>+ --rootpath "${TARGET_DIR}" \
>+ --tmppath "${GENIMAGE_TMP}" \
>+ --inputpath "${BINARIES_DIR}" \
>+ --outputpath "${BINARIES_DIR}" \
>+ --config "${GENIMAGE_CFG}"
>+
>+RET=${?}
>+exit ${RET}

These two lines are unnecessary. The script will exit with the exit code
of the last command run.

However I find it safer to add a "set -e" to the top of the script so that
it will terminate early if any of the commands fail. This stops the script
proceeding based on previous incomplete operations. With "set -e" the script
will exit with the error code of the command that failed.

>diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
>new file mode 100644
>index 0000000..cd349c5
>--- /dev/null
>+++ b/configs/orangepipc_defconfig
>@@ -0,0 +1,26 @@
>+BR2_arm=y
>+BR2_cortex_a7=y
>+BR2_ARM_FPU_NEON_VFPV4=y
>+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
>+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
>+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
>+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
>+BR2_LINUX_KERNEL=y
>+BR2_LINUX_KERNEL_CUSTOM_GIT=y
>+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="<https://github.com/jwrdegoede/linux-sunxi.git>"

Those angled brackets in the URL look wrong. Does that really work?

>+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a516ac6dda21e6f5edceecd08b475b16e360656b"
>+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
>+BR2_LINUX_KERNEL_DTS_SUPPORT=y
>+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
>+BR2_TARGET_ROOTFS_EXT2=y
>+BR2_TARGET_ROOTFS_EXT2_4=y
>+# BR2_TARGET_ROOTFS_TAR is not set
>+BR2_TARGET_UBOOT=y
>+BR2_TARGET_UBOOT_BOARDNAME="orangepi_pc"
>+BR2_TARGET_UBOOT_CUSTOM_GIT=y
>+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="<http://git.denx.de/u-boot.git>"

Ditto here.

>+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="4832e17787acb29734d895751bc7a594908aecc6"
>+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
>+BR2_PACKAGE_HOST_GENIMAGE=y

>On 18 December 2015 23:23:20 +01:00, Arnout Vandecappelle <arnout@mind.be> wrote:

>> On 18-12-15 14:22, Eelco Chaudron wrote:
>> 
>> > Hi All,
>> > 
>> > Was wondering if anyone has started working on OrangePi PC board support?
>> > 
>> Not that I know of. But it should be quite similar to the cubieboard I think.
>> 
>> If you make a defconfig for it, consider using genimage rather than a custom
>> script like mkcubiecard.
>> 
>> Regards,
>> Arnout
>> 
>> 
>> -- 
>> Arnout Vandecappelle arnout at mind be
>> Senior Embedded Software Architect +32-16-286500
>> Essensium/Mind <http://www.mind.be>
>> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
>> LinkedIn profile: <http://www.linkedin.com/in/arnoutvandecappelle>
>> GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>> 
