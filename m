From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 11:00:04 +0200
Subject: [Buildroot] [git commit] configs/odroidxu4: new defconfig
Message-ID: <20181021085833.0740188118@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26034b8663f8c084ec9100f429d8ff6c046a9fa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch provides support for the board Odroid XU4. It uses a recent
4.14 kernel released by Hardkernel, and the current u-boot 2017.05
also from Hardkernel.

Signed-off-by: Pierre CROKAERT <pct@crookies.net>
[Thomas:
 - Update DEVELOPERS file
 - Update .gitlab-ci.yml file
 - Simplify the boot.ini script
 - Add missing BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14 option
 - Add BR2_PACKAGE_HOST_DOSFSTOOLS and BR2_PACKAGE_HOST_MTOOLS since a
   VFAT filesystem is generated
 - Keep the default root filesystem size, since it is sufficient.
 - Reduce the size of the VFAT filesystem]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                           |  1 +
 DEVELOPERS                               |  4 +++
 board/hardkernel/odroidxu4/boot.ini      | 38 ++++++++++++++++++++++
 board/hardkernel/odroidxu4/genimage.cfg  | 54 ++++++++++++++++++++++++++++++++
 board/hardkernel/odroidxu4/post-image.sh | 24 ++++++++++++++
 board/hardkernel/odroidxu4/readme.txt    | 37 ++++++++++++++++++++++
 configs/odroidxu4_defconfig              | 27 ++++++++++++++++
 7 files changed, 185 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d6a2319ba0..b5528c8c47 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -168,6 +168,7 @@ nitrogen6x_defconfig: *defconfig
 nitrogen7_defconfig: *defconfig
 nitrogen8m_defconfig: *defconfig
 odroidc2_defconfig: *defconfig
+odroidxu4_defconfig: *defconfig
 olimex_a10_olinuxino_lime_defconfig: *defconfig
 olimex_a13_olinuxino_defconfig: *defconfig
 olimex_a20_olinuxino_lime2_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 3bcbf817f0..0d28cdff2a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1727,6 +1727,10 @@ F:	package/lttng-tools/
 F:	package/python-ipython/
 F:	package/liburcu/
 
+N:	Pierre Crokaert <pct@crookies.net>
+F:	board/hardkernel/odroidxu4/
+F:	configs/odroidxu4_defconfig
+
 N:	Pierre Ducroquet <pinaraf@pinaraf.info>
 F:	package/kf5/
 
diff --git a/board/hardkernel/odroidxu4/boot.ini b/board/hardkernel/odroidxu4/boot.ini
new file mode 100644
index 0000000000..87ac7ac135
--- /dev/null
+++ b/board/hardkernel/odroidxu4/boot.ini
@@ -0,0 +1,38 @@
+ODROIDXU-UBOOT-CONFIG
+
+# U-Boot Parameters
+setenv initrd_high "0xffffffff"
+setenv fdt_high "0xffffffff"
+
+setenv macaddr "00:1e:06:61:7a:39"
+setenv bootrootfs "console=tty1 root=/dev/mmcblk1p2 rootwait rw fsck.repair=yes net.ifnames=0"
+setenv bootcmd "load mmc 0:1 0x40008000 zImage; load mmc 0:1 0x44000000 exynos5422-odroidxu4.dtb; bootz 0x40008000 - 0x44000000"
+setenv vout "hdmi"
+setenv governor "performance"
+setenv HPD "true"
+
+#  TMDS data amplitude control.
+setenv hdmi_tx_amp_lvl  "31"
+
+#  TMDS data amplitude fine control for each channel.
+setenv hdmi_tx_lvl_ch0      "3"
+setenv hdmi_tx_lvl_ch1      "3"
+setenv hdmi_tx_lvl_ch2      "3"
+
+#  TMDS data pre-emphasis level control.
+setenv hdmi_tx_emp_lvl      "6"
+
+#  TMDS clock amplitude control.
+setenv hdmi_clk_amp_lvl     "31"
+
+#  TMDS data source termination resistor control.
+setenv hdmi_tx_res      "0"
+
+setenv hdmi_phy_control "hdmi_tx_amp_lvl=${hdmi_tx_amp_lvl} hdmi_tx_lvl_ch0=${hdmi_tx_lvl_ch0} hdmi_tx_lvl_ch1=${hdmi_tx_lvl_ch1} hdmi_tx_lvl_ch2=${hdmi_tx_lvl_ch2} hdmi_tx_emp_lvl=${hdmi_tx_emp_lvl} hdmi_clk_amp_lvl=${hdmi_clk_amp_lvl} hdmi_tx_res=${hdmi_tx_res} HPD=${HPD} vout=${vout}"
+
+# final boot args
+setenv bootargs "${bootrootfs} ${videoconfig} smsc95xx.macaddr=${macaddr} governor=${governor} ${hdmi_phy_control}"
+
+# Boot the board
+boot
+
diff --git a/board/hardkernel/odroidxu4/genimage.cfg b/board/hardkernel/odroidxu4/genimage.cfg
new file mode 100644
index 0000000000..e6b85cf2fa
--- /dev/null
+++ b/board/hardkernel/odroidxu4/genimage.cfg
@@ -0,0 +1,54 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.ini",
+			"zImage",
+			"exynos5422-odroidxu4.dtb"
+		}
+	}
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition bl1 {
+		in-partition-table = "no"
+		image = "bl1.bin.hardkernel"
+		offset = 512
+		size = 15360
+	}
+
+	partition bl2 {
+		in-partition-table = "no"
+		image = "bl2.bin.hardkernel.720k_uboot"
+		offset = 15872
+		size = 16384
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-dtb.bin"
+		offset = 32256
+		size = 720k
+	}
+
+	partition tzsw {
+		in-partition-table = "no"
+		image = "tzsw.bin.hardkernel"
+		offset = 769536
+		size = 256k
+	}
+
+	partition vfat {
+		partition-type = 0xC
+		image = "boot.vfat"
+		offset = 2097152
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/hardkernel/odroidxu4/post-image.sh b/board/hardkernel/odroidxu4/post-image.sh
new file mode 100755
index 0000000000..025906cd09
--- /dev/null
+++ b/board/hardkernel/odroidxu4/post-image.sh
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
+
+# The bl1.bin.hardkernel file provided by the uboot hardkernel repository is overwritten
+# by the bl2.bin.hardkernel in the sd_fusing.sh script because it is too big.
+# In order to implement this in genimage, we need to truncate the bl1.bin file
+# so that it does not exceed the available place.
+# An issue has been filled about this: https://github.com/hardkernel/u-boot/issues/45
+truncate -s 15360 ${BINARIES_DIR}/bl1.bin.hardkernel
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
diff --git a/board/hardkernel/odroidxu4/readme.txt b/board/hardkernel/odroidxu4/readme.txt
new file mode 100644
index 0000000000..e3cba8b0c1
--- /dev/null
+++ b/board/hardkernel/odroidxu4/readme.txt
@@ -0,0 +1,37 @@
+Odroid XU-4 board with Samsung Exynos 5422 SoC
+
+How to build it
+===============
+
+  $ make odroidxu4_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
+
+Result of the build
+-------------------
+
+After building, you should obtain all output files in output/images/
+
+
+How to write the SD card or eMMC
+================================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the SDcard into your ODROID-XU4, and power it up. Your new system
+should come up now.
+
diff --git a/configs/odroidxu4_defconfig b/configs/odroidxu4_defconfig
new file mode 100644
index 0000000000..69958e1387
--- /dev/null
+++ b/configs/odroidxu4_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidxu4/post-image.sh"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.14.16-104"
+BR2_LINUX_KERNEL_DEFCONFIG="odroidxu4"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="odroid-xu4"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="sd_fuse/bl1.bin.hardkernel sd_fuse/bl2.bin.hardkernel.720k_uboot sd_fuse/tzsw.bin.hardkernel "
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
