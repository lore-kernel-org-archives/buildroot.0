From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:41:37 +0100
Subject: [Buildroot] [git commit] boards: add FriendlyARM Nanopi NEO
Message-ID: <20161103204140.472FE81945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bcdddf7ebb38afe72f0ae2a98ff24a5a80e3974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The FriendlyARM Nanopi NEO is a 4x4cm?? board with an Allwiner H3 SoC:
  - quad-core Cortex-A7 @1.2GHz
  - 256 or 512MiB of DDR
  - uSDCard as only storage option
  - 3x USB 2.0 host (one socket, two on expansion pin-holes)
  - 1x USB 2.0 OTG (also used as power source)
  - 10/100 etehrnet MAC
  - GPIOs, SPI, I2c...

Support for the Nanopi NEO in U-Boot and Linux is very recent, so much
so that we have to use an -rc tag for U-Boot and a special Linux tree.

As for Linux, I pushed a git tree on Github with a single tag that
matches what is currently queued in the sunxi-next queued for 4.10,
based on 4.9-rc3. All those commits are from Maxime's tree, the
maintainer for most sunxi stuff.

This also means that we can't use the Linux headers from the kernel
being built (which is what we usually do) because those report 4.9,
while Buildroot currently knows only of 4.8 at best. So this is what we
use.

Unfortunately, support for the ethernet MAC and the USB OTG are not yet
upstream, but are being actively worked on.

The Nanopi NEO is very similar to the Orangepi PC, so I was able to
scanvenge most of its configuration. ;-)

Thanks Maxime for your help on IRC! :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/nanopi-neo/boot.cmd      |  8 ++++++++
 board/nanopi-neo/genimage.cfg  | 34 +++++++++++++++++++++++++++++++++
 board/nanopi-neo/post-build.sh | 12 ++++++++++++
 board/nanopi-neo/post-image.sh | 15 +++++++++++++++
 board/nanopi-neo/readme.txt    | 43 ++++++++++++++++++++++++++++++++++++++++++
 configs/nanopi_neo_defconfig   | 42 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 154 insertions(+)

diff --git a/board/nanopi-neo/boot.cmd b/board/nanopi-neo/boot.cmd
new file mode 100644
index 0000000..7874057
--- /dev/null
+++ b/board/nanopi-neo/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-neo.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/nanopi-neo/genimage.cfg b/board/nanopi-neo/genimage.cfg
new file mode 100644
index 0000000..ad43d31
--- /dev/null
+++ b/board/nanopi-neo/genimage.cfg
@@ -0,0 +1,34 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-nanopi-neo.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+		size = 1040384 # 1MB - 8192
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 32M
+	}
+}
diff --git a/board/nanopi-neo/post-build.sh b/board/nanopi-neo/post-build.sh
new file mode 100755
index 0000000..e6791e7
--- /dev/null
+++ b/board/nanopi-neo/post-build.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+# post-build.sh for Nanopi NEO, based on the Orange Pi PC
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+# 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+BOARD_DIR="$( dirname "${0}" )"
+MKIMAGE="${HOST_DIR}/usr/bin/mkimage"
+BOOT_CMD="${BOARD_DIR}/boot.cmd"
+BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
+
+# U-Boot script
+"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"
diff --git a/board/nanopi-neo/post-image.sh b/board/nanopi-neo/post-image.sh
new file mode 100755
index 0000000..740386e
--- /dev/null
+++ b/board/nanopi-neo/post-image.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# post-image.sh for Nanopi NEO, based on the Orange Pi PC
+
+BOARD_DIR="$( dirname "${0}" )"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/nanopi-neo/readme.txt b/board/nanopi-neo/readme.txt
new file mode 100644
index 0000000..95fc628
--- /dev/null
+++ b/board/nanopi-neo/readme.txt
@@ -0,0 +1,43 @@
+Intro
+=====
+
+The instructions herein are valid for the FriendlyARM NanoPi NEO,
+both the 256MiB and 512MiB versions. They should also work the the
+NanoPi NEO Air, but this is untested so far.
+
+The FriendlyARM Nanopi NEO is a 4x4cm?? board with an Allwiner H3 SoC:
+  - quad-core Cortex-A7 @1.2GHz
+  - 256 or 512MiB of DDR
+  - uSDCard as only storage option
+  - 3x USB 2.0 host (one socket, two on expansion pin-holes)
+  - 1x USB 2.0 OTG (also used as power source)
+  - 10/100 ethernet MAC
+  - GPIOs, SPI, I2c...
+
+Support for the Nanopi NEO in U-Boot and Linux is very recent, so
+much so that we have to use an -rc tag for U-Boot and a special
+Linux tree.
+
+Unfortunately, support for the ethernet MAC and the USB OTG are not
+yet upstream, but are being actively worked on.
+
+
+How to build
+============
+
+    $ make nanopi_neo_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+You will then obtain an image ready to be written to your micro SDcard:
+
+    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+Notes:
+  - replace 'sdX' with the actual device with your micro SDcard,
+  - you may need to be root to do that (use 'sudo').
+
+Insert the micro SDcard in your NanoPi NEO and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
new file mode 100644
index 0000000..2f4ea37
--- /dev/null
+++ b/configs/nanopi_neo_defconfig
@@ -0,0 +1,42 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Cannot use same headers as the kernel, because kernel is 4.9
+# and we only know 4.8 at best so far
+BR2_KERNEL_HEADERS_4_8=y
+
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi-neo/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi-neo/post-image.sh"
+
+# Use a special kernel tree until all support finally lands upstream
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/yann-morin-1998/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.9-rc3-sunxi-next-2016-11-02"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
+
+# Use an -rc tag because the defconfig is very recent
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11-rc3"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+
+# Build an sdcard image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=32768
+BR2_TARGET_ROOTFS_EXT2_INODES=8192
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
