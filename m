From: Michael Walle <michael@walle.cc>
Date: Sun, 10 May 2020 15:31:06 +0200
Subject: [Buildroot] [PATCH] board: Add Kontron SMARC-sAL28 support
Message-ID: <20200510133106.25067-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Walle <michael.walle@kontron.com>

Now that upstream supports this board add buildroot support for it, too.

This supports:
 - upstream linux kernel, 5.7-rc4 for now. Once 5.7 is released and
   buildroot will switch to this kernel
     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
   can be removed.
 - building an image which can be installed to eMMC or SD card.
 - upstream u-boot patches are pending, therefore no support for
   building a bootloader for now.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 DEVELOPERS                               |  2 ++
 board/kontron/smarc-sal28/boot.cmd       |  8 ++++++++
 board/kontron/smarc-sal28/genimage.cfg   | 10 ++++++++++
 board/kontron/smarc-sal28/linux.fragment | 14 ++++++++++++++
 board/kontron/smarc-sal28/post-build.sh  |  9 +++++++++
 configs/kontron_smarc_sal28_defconfig    | 18 ++++++++++++++++++
 6 files changed, 61 insertions(+)
 create mode 100644 board/kontron/smarc-sal28/boot.cmd
 create mode 100644 board/kontron/smarc-sal28/genimage.cfg
 create mode 100644 board/kontron/smarc-sal28/linux.fragment
 create mode 100755 board/kontron/smarc-sal28/post-build.sh
 create mode 100644 configs/kontron_smarc_sal28_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab15d4..c3f4ce8133 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1837,6 +1837,8 @@ F:	package/jasper/
 F:	package/libstrophe/
 
 N:	Michael Walle <michael@walle.cc>
+F:	board/kontron/smarc-sal28/
+F:	configs/kontron_smarc_sal28_defconfig
 F:	package/libavl/
 
 N:	Micha? ?yszczek <michal.lyszczek@bofc.pl>
diff --git a/board/kontron/smarc-sal28/boot.cmd b/board/kontron/smarc-sal28/boot.cmd
new file mode 100644
index 0000000000..391d12cc4b
--- /dev/null
+++ b/board/kontron/smarc-sal28/boot.cmd
@@ -0,0 +1,8 @@
+setenv bootargs root=/dev/mmcblk${devnum}p1 rootwait ${extrabootargs}
+if test -z "${dtb}"; then
+	setenv dtb fsl-ls1028a-kontron-sl28.dtb
+fi
+
+load ${devtype} ${devnum} ${kernel_addr_r} /boot/Image
+load ${devtype} ${devnum} ${fdt_addr_r} /boot/${dtb}
+booti ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
new file mode 100644
index 0000000000..301d2a52d8
--- /dev/null
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -0,0 +1,10 @@
+image sdcard-emmc.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		offset = 2M
+		image = rootfs.ext4
+	}
+}
diff --git a/board/kontron/smarc-sal28/linux.fragment b/board/kontron/smarc-sal28/linux.fragment
new file mode 100644
index 0000000000..748f96ab7a
--- /dev/null
+++ b/board/kontron/smarc-sal28/linux.fragment
@@ -0,0 +1,14 @@
+CONFIG_NET_DSA=m
+CONFIG_NET_DSA_TAG_OCELOT=m
+CONFIG_NET_DSA_MSCC_FELIX=m
+CONFIG_CAN_FLEXCAN=m
+CONFIG_FSL_ENETC=y
+CONFIG_FSL_ENETC_VF=y
+CONFIG_FSL_ENETC_HW_TIMESTAMPING=y
+CONFIG_MSCC_OCELOT_SWITCH=m
+CONFIG_PCIE_DW_PLAT_HOST=y
+CONFIG_GPIO_MPC8XXX=y
+CONFIG_SND_SOC_FSL_SAI=m
+CONFIG_SND_SOC_WM8904=m
+CONFIG_RTC_DRV_RV8803=y
+CONFIG_COMMON_CLK_FSL_SAI=y
diff --git a/board/kontron/smarc-sal28/post-build.sh b/board/kontron/smarc-sal28/post-build.sh
new file mode 100755
index 0000000000..08ad1d30c0
--- /dev/null
+++ b/board/kontron/smarc-sal28/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOARD_DIR="$(dirname $0)"
+
+# There is a BR2_TARGET_UBOOT_BOOT_SCRIPT option but it is only available
+# if we are building u-boot :( Therefore, create the bootsript manually for
+# now.
+$MKIMAGE -C none -T script -d $BOARD_DIR/boot.cmd $TARGET_DIR/boot/boot.scr
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
new file mode 100644
index 0000000000..51c56caae1
--- /dev/null
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -0,0 +1,18 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/kontron/smarc-sal28/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="v5.7-rc4"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/kontron/smarc-sal28/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.20.1
