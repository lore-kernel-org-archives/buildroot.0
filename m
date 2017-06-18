From: Chakra Divi <2chakrass@gmail.com>
Date: Sun, 18 Jun 2017 23:53:09 +0530
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_board=3A_Moved_nanopi-neo_under?=
	=?utf-8?q?_friendlyarm?=
Message-ID: <1497810189-22010-1-git-send-email-chakra@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the vendor folder friendlyarm is created,
moved board nanopi-neo also under vendor
folder.

Signed-off-by: Chakra Divi <chakra@openedev.com>
---
- Moved nanopi-neo under friendly arm
- Yann E. MORIN, can you please help test these Changes

 board/friendlyarm/nanopi-neo/boot.cmd      |    8 ++++++
 board/friendlyarm/nanopi-neo/genimage.cfg  |   34 ++++++++++++++++++++++
 board/friendlyarm/nanopi-neo/post-build.sh |   12 ++++++++
 board/friendlyarm/nanopi-neo/post-image.sh |   15 ++++++++++
 board/friendlyarm/nanopi-neo/readme.txt    |   42 ++++++++++++++++++++++++++++
 board/nanopi-neo/boot.cmd                  |    8 ------
 board/nanopi-neo/genimage.cfg              |   34 ----------------------
 board/nanopi-neo/post-build.sh             |   12 --------
 board/nanopi-neo/post-image.sh             |   15 ----------
 board/nanopi-neo/readme.txt                |   42 ----------------------------
 configs/nanopi_neo_defconfig               |    4 +--
 11 files changed, 113 insertions(+), 113 deletions(-)
 create mode 100644 board/friendlyarm/nanopi-neo/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-neo/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo/post-build.sh
 create mode 100755 board/friendlyarm/nanopi-neo/post-image.sh
 create mode 100644 board/friendlyarm/nanopi-neo/readme.txt
 delete mode 100644 board/nanopi-neo/boot.cmd
 delete mode 100644 board/nanopi-neo/genimage.cfg
 delete mode 100755 board/nanopi-neo/post-build.sh
 delete mode 100755 board/nanopi-neo/post-image.sh
 delete mode 100644 board/nanopi-neo/readme.txt

diff --git a/board/friendlyarm/nanopi-neo/boot.cmd b/board/friendlyarm/nanopi-neo/boot.cmd
new file mode 100644
index 0000000..7874057
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-neo.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
new file mode 100644
index 0000000..ad43d31
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
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
diff --git a/board/friendlyarm/nanopi-neo/post-build.sh b/board/friendlyarm/nanopi-neo/post-build.sh
new file mode 100755
index 0000000..e6791e7
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/post-build.sh
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
diff --git a/board/friendlyarm/nanopi-neo/post-image.sh b/board/friendlyarm/nanopi-neo/post-image.sh
new file mode 100755
index 0000000..740386e
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/post-image.sh
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
diff --git a/board/friendlyarm/nanopi-neo/readme.txt b/board/friendlyarm/nanopi-neo/readme.txt
new file mode 100644
index 0000000..539df54
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/readme.txt
@@ -0,0 +1,42 @@
+Intro
+=====
+
+The instructions herein are valid for the FriendlyARM NanoPi NEO,
+both the 256MiB and 512MiB versions. They should also work for the
+NanoPi NEO Air, but this is untested so far.
+
+The FriendlyARM Nanopi NEO is a 4x4cm? board with an Allwiner H3 SoC:
+  - quad-core Cortex-A7 @1.2GHz
+  - 256 or 512MiB of DDR
+  - uSDCard as only storage option
+  - 3x USB 2.0 host (one socket, two on expansion pin-holes)
+  - 1x USB 2.0 OTG (also used as power source)
+  - 10/100 ethernet MAC
+  - GPIOs, SPI, I2c...
+
+Support for the Nanopi NEO in U-Boot and Linux is very recent, so only
+core, basic features are available.
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
diff --git a/board/nanopi-neo/boot.cmd b/board/nanopi-neo/boot.cmd
deleted file mode 100644
index 7874057..0000000
--- a/board/nanopi-neo/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-neo.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/nanopi-neo/genimage.cfg b/board/nanopi-neo/genimage.cfg
deleted file mode 100644
index ad43d31..0000000
--- a/board/nanopi-neo/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-nanopi-neo.dtb",
-			"boot.scr"
-		}
-	}
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 32M
-	}
-}
diff --git a/board/nanopi-neo/post-build.sh b/board/nanopi-neo/post-build.sh
deleted file mode 100755
index e6791e7..0000000
--- a/board/nanopi-neo/post-build.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-# post-build.sh for Nanopi NEO, based on the Orange Pi PC
-# 2013, Carlo Caione <carlo.caione@gmail.com>
-# 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-BOARD_DIR="$( dirname "${0}" )"
-MKIMAGE="${HOST_DIR}/usr/bin/mkimage"
-BOOT_CMD="${BOARD_DIR}/boot.cmd"
-BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
-
-# U-Boot script
-"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"
diff --git a/board/nanopi-neo/post-image.sh b/board/nanopi-neo/post-image.sh
deleted file mode 100755
index 740386e..0000000
--- a/board/nanopi-neo/post-image.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-# post-image.sh for Nanopi NEO, based on the Orange Pi PC
-
-BOARD_DIR="$( dirname "${0}" )"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/board/nanopi-neo/readme.txt b/board/nanopi-neo/readme.txt
deleted file mode 100644
index 539df54..0000000
--- a/board/nanopi-neo/readme.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Intro
-=====
-
-The instructions herein are valid for the FriendlyARM NanoPi NEO,
-both the 256MiB and 512MiB versions. They should also work for the
-NanoPi NEO Air, but this is untested so far.
-
-The FriendlyARM Nanopi NEO is a 4x4cm? board with an Allwiner H3 SoC:
-  - quad-core Cortex-A7 @1.2GHz
-  - 256 or 512MiB of DDR
-  - uSDCard as only storage option
-  - 3x USB 2.0 host (one socket, two on expansion pin-holes)
-  - 1x USB 2.0 OTG (also used as power source)
-  - 10/100 ethernet MAC
-  - GPIOs, SPI, I2c...
-
-Support for the Nanopi NEO in U-Boot and Linux is very recent, so only
-core, basic features are available.
-
-Unfortunately, support for the ethernet MAC and the USB OTG are not
-yet upstream, but are being actively worked on.
-
-
-How to build
-============
-
-    $ make nanopi_neo_defconfig
-    $ make
-
-Note: you will need access to the internet to download the required
-sources.
-
-You will then obtain an image ready to be written to your micro SDcard:
-
-    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
-
-Notes:
-  - replace 'sdX' with the actual device with your micro SDcard,
-  - you may need to be root to do that (use 'sudo').
-
-Insert the micro SDcard in your NanoPi NEO and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index fbc0902..a227052 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_FPU_VFPV4=y
 
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi-neo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi-neo/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/friendlyarm/nanopi-neo/post-image.sh"
 
 # Linux headers same as kernel, a 4.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
-- 
1.7.9.5
