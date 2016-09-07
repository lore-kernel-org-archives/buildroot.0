From: Georges Savoundararadj <savoundg@gmail.com>
Date: Wed,  7 Sep 2016 15:29:08 -0700
Subject: [Buildroot] [PATCH v2 1/5] freescale: genimage: Factorize scripts
In-Reply-To: <20160709064004.8844-1-savoundg@gmail.com>
References: <20160709064004.8844-1-savoundg@gmail.com>
Message-ID: <20160907222912.26002-1-savoundg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the boards imx6ulevk, imx6sabresd, mx25pdk, mx51evk, mx53loco,
warpboard:
* Replace genimage.cfg with a common Freescale genimage template named
  genimage.cfg.template because they all use the same layout.  The only
  difference comes from the device tree blobs.
* Replace each post-image.sh script with a generic post-image.sh script
  which is able to generate the right genimage.cfg depending on:
** the image type (zImage or uImage) from BR2_LINUX_KERNEL_UIMAGE
** the device tree blobs from BR2_LINUX_KERNEL_INTREE_DTS_NAME
** the rootfs type (ext2, ext3 or ext4) from BR2_TARGET_ROOTFS_EXT2
* Fix the readme.txt files accordingly

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - Rebase to 565fdbd6641ab2883cb9d6a1a9f8de82a71839b2
  - Add warpboard

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
---
 .../genimage.cfg => common/genimage.cfg.template}  | 13 ++--
 board/freescale/common/post-image.sh               | 71 ++++++++++++++++++++++
 board/freescale/imx25pdk/post-image.sh             | 14 -----
 board/freescale/imx25pdk/readme.txt                |  2 +-
 board/freescale/imx51evk/genimage.cfg              | 41 -------------
 board/freescale/imx51evk/post-image.sh             | 14 -----
 board/freescale/imx51evk/readme.txt                |  2 +-
 board/freescale/imx53loco/genimage.cfg             | 42 -------------
 board/freescale/imx53loco/post-image.sh            | 14 -----
 board/freescale/imx6ulevk/genimage.cfg             | 41 -------------
 board/freescale/imx6ulevk/post-image.sh            | 14 -----
 board/freescale/imx6ulevk/readme.txt               |  2 +-
 board/freescale/imx7dsdb/genimage.cfg              | 41 -------------
 board/freescale/imx7dsdb/post-image.sh             | 14 -----
 board/freescale/imx7dsdb/readme.txt                |  2 +-
 board/freescale/warpboard/genimage.cfg             | 41 -------------
 board/freescale/warpboard/post-image.sh            | 14 -----
 configs/freescale_imx6ulevk_defconfig              |  2 +-
 configs/freescale_imx7dsabresd_defconfig           |  2 +-
 configs/mx25pdk_defconfig                          |  2 +-
 configs/mx51evk_defconfig                          |  2 +-
 configs/mx53loco_defconfig                         |  2 +-
 configs/warpboard_defconfig                        |  2 +-
 23 files changed, 87 insertions(+), 307 deletions(-)
 rename board/freescale/{imx25pdk/genimage.cfg => common/genimage.cfg.template} (58%)
 create mode 100755 board/freescale/common/post-image.sh
 delete mode 100755 board/freescale/imx25pdk/post-image.sh
 delete mode 100644 board/freescale/imx51evk/genimage.cfg
 delete mode 100755 board/freescale/imx51evk/post-image.sh
 delete mode 100644 board/freescale/imx53loco/genimage.cfg
 delete mode 100755 board/freescale/imx53loco/post-image.sh
 delete mode 100644 board/freescale/imx6ulevk/genimage.cfg
 delete mode 100755 board/freescale/imx6ulevk/post-image.sh
 delete mode 100644 board/freescale/imx7dsdb/genimage.cfg
 delete mode 100755 board/freescale/imx7dsdb/post-image.sh
 delete mode 100644 board/freescale/warpboard/genimage.cfg
 delete mode 100755 board/freescale/warpboard/post-image.sh

diff --git a/board/freescale/imx25pdk/genimage.cfg b/board/freescale/common/genimage.cfg.template
similarity index 58%
rename from board/freescale/imx25pdk/genimage.cfg
rename to board/freescale/common/genimage.cfg.template
index 9386e32..3adb12a 100644
--- a/board/freescale/imx25pdk/genimage.cfg
+++ b/board/freescale/common/genimage.cfg.template
@@ -1,17 +1,16 @@
-# Minimal SD card image for the Freescale's i.MX25 PDK board
+# Minimal SD card image for the Freescale boards Template
 #
-# We mimic the .sdcard Freescale's image format for i.MX25:
+# We mimic the .sdcard Freescale's image format:
 # * the SD card must have 1 kB free space at the beginning,
 # * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
+# * a FAT partition at offset 8 MB is containing zImage/uImage and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
 #
 
 image boot.vfat {
   vfat {
     files = {
-      "imx25-pdk.dtb",
-      "zImage"
+      %FILES%
     }
   }
   size = 16M
@@ -36,6 +35,6 @@ image sdcard.img {
 
   partition rootfs {
     partition-type = 0x83
-    image = "rootfs.ext4"
+    image = %ROOTFS%
   }
 }
diff --git a/board/freescale/common/post-image.sh b/board/freescale/common/post-image.sh
new file mode 100755
index 0000000..6b22cf2
--- /dev/null
+++ b/board/freescale/common/post-image.sh
@@ -0,0 +1,71 @@
+#!/usr/bin/env bash
+
+#
+# dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
+# in ${BR_CONFIG}, then prints the corresponding list of file names for the
+# genimage configuration file
+#
+dtb_list()
+{
+	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+
+	for dt in $DTB_LIST; do
+		echo -n "\"$dt.dtb\", "
+	done
+}
+
+#
+# linux_image extracts the Linux image format from BR2_LINUX_KERNEL_UIMAGE in
+# ${BR_CONFIG}, then prints the corresponding file name for the genimage
+# configuration file
+#
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
+		echo "\"uImage\""
+	else
+		echo "\"zImage\""
+	fi
+}
+
+#
+# fstype extracts the type of the filesystem generated from BR_TARGET_ROOTFS_EXT2_*
+# in ${BR_CONFIG}, then prints the extension
+#
+fstype()
+{
+	if grep -Eq "^BR2_TARGET_ROOTFS_EXT2_4=y$" ${BR2_CONFIG}; then
+		echo "ext4"
+	elif grep -Eq "^BR2_TARGET_ROOTFS_EXT2_3=y$" ${BR2_CONFIG}; then
+		echo "ext3"
+	else
+		echo "ext2"
+	fi
+}
+
+main()
+{
+	local FILES="$(dtb_list) $(linux_image)"
+	local ROOTFS="\"rootfs.$(fstype)\""
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+	sed -e "s/%FILES%/${FILES}/" \
+	    -e "s/%ROOTFS%/${ROOTFS}/" \
+		board/freescale/common/genimage.cfg.template > ${GENIMAGE_CFG}
+
+	rm -rf "${GENIMAGE_TMP}"
+
+	genimage \
+		--rootpath "${TARGET_DIR}" \
+		--tmppath "${GENIMAGE_TMP}" \
+		--inputpath "${BINARIES_DIR}" \
+		--outputpath "${BINARIES_DIR}" \
+		--config "${GENIMAGE_CFG}"
+
+	rm -f ${GENIMAGE_CFG}
+
+	exit $?
+}
+
+main $@
diff --git a/board/freescale/imx25pdk/post-image.sh b/board/freescale/imx25pdk/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/freescale/imx25pdk/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/board/freescale/imx25pdk/readme.txt b/board/freescale/imx25pdk/readme.txt
index a154b99..df7c617 100644
--- a/board/freescale/imx25pdk/readme.txt
+++ b/board/freescale/imx25pdk/readme.txt
@@ -40,7 +40,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/imx25pdk/genimage.cfg.
+board/freescale/common/genimage.cfg.template.
 
 Boot the i.MX25 PDK board
 =========================
diff --git a/board/freescale/imx51evk/genimage.cfg b/board/freescale/imx51evk/genimage.cfg
deleted file mode 100644
index a44ed30..0000000
--- a/board/freescale/imx51evk/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-# Minimal SD card image for the Freescale's i.MX51 EVK board
-#
-# We mimic the .sdcard Freescale's image format for i.MX51:
-# * the microSD card must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx51-babbage.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.imx"
-    offset = 1024
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/freescale/imx51evk/post-image.sh b/board/freescale/imx51evk/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/freescale/imx51evk/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/board/freescale/imx51evk/readme.txt b/board/freescale/imx51evk/readme.txt
index 6639a92..bf739fd 100644
--- a/board/freescale/imx51evk/readme.txt
+++ b/board/freescale/imx51evk/readme.txt
@@ -40,7 +40,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/imx51evk/genimage.cfg.
+board/freescale/common/genimage.cfg.template.
 
 Boot the i.MX51 EVK board
 =========================
diff --git a/board/freescale/imx53loco/genimage.cfg b/board/freescale/imx53loco/genimage.cfg
deleted file mode 100644
index b56c168..0000000
--- a/board/freescale/imx53loco/genimage.cfg
+++ /dev/null
@@ -1,42 +0,0 @@
-# Minimal microSD card image for the Freescale's i.MX53 QSB board
-#
-# We mimic the .sdcard Freescale's image format for i.MX53:
-# * the microSD card must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx53-qsb.dtb",
-      "imx53-qsrb.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.imx"
-    offset = 1024
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/freescale/imx53loco/post-image.sh b/board/freescale/imx53loco/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/freescale/imx53loco/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/board/freescale/imx6ulevk/genimage.cfg b/board/freescale/imx6ulevk/genimage.cfg
deleted file mode 100644
index b58193a..0000000
--- a/board/freescale/imx6ulevk/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-# Minimal microSD card image for the Freescale's i.MX6UL EVK board
-#
-# We mimic the .sdcard Freescale's image format for i.MX6UL:
-# * the microSD card must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx6ul-14x14-evk.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.imx"
-    offset = 1024
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/freescale/imx6ulevk/post-image.sh b/board/freescale/imx6ulevk/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/freescale/imx6ulevk/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 462715c..98de277 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -43,7 +43,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/imx6ulevk/genimage.cfg.
+board/freescale/common/genimage.cfg.template.
 
 Boot the i.MX6UL EVK board
 =========================
diff --git a/board/freescale/imx7dsdb/genimage.cfg b/board/freescale/imx7dsdb/genimage.cfg
deleted file mode 100644
index aa6ae9e..0000000
--- a/board/freescale/imx7dsdb/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-# Minimal microSD card image for the Freescale's i.MX7D SDB board
-#
-# We mimic the .sdcard Freescale's image format for i.MX7D:
-# * the microSD card must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx7d-sdb.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.imx"
-    offset = 1024
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/freescale/imx7dsdb/post-image.sh b/board/freescale/imx7dsdb/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/freescale/imx7dsdb/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/board/freescale/imx7dsdb/readme.txt b/board/freescale/imx7dsdb/readme.txt
index c72e9a9..9aeeb16 100644
--- a/board/freescale/imx7dsdb/readme.txt
+++ b/board/freescale/imx7dsdb/readme.txt
@@ -40,7 +40,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/imx7dsdb/genimage.cfg.
+board/freescale/common/genimage.cfg.template.
 
 Boot the i.MX7D SDB board
 =========================
diff --git a/board/freescale/warpboard/genimage.cfg b/board/freescale/warpboard/genimage.cfg
deleted file mode 100644
index a22aa2a..0000000
--- a/board/freescale/warpboard/genimage.cfg
+++ /dev/null
@@ -1,41 +0,0 @@
-# Minimal SD card image for the Warp board
-#
-# We mimic the .sdcard Freescale's image format for i.MX6SL:
-# * the microSD card must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx6sl-warp.dtb",
-      "zImage"
-    }
-  }
-  size = 16M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.imx"
-    offset = 1024
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-    offset = 8M
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/freescale/warpboard/post-image.sh b/board/freescale/warpboard/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/freescale/warpboard/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index 5a18c1d..fb860b5 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -31,6 +31,6 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # filesystem / image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx6ulevk/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index 6768041..311f8ac 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -33,4 +33,4 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx7dsdb/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
index d682f0f..645fe8a 100644
--- a/configs/mx25pdk_defconfig
+++ b/configs/mx25pdk_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx25pdk/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index bc72e06..1fca282 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx51evk/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 286b719..94ac818 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx53loco/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 19425b3..5e9c051 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -42,7 +42,7 @@ BR2_PACKAGE_HOST_DFU_UTIL=y
 BR2_PACKAGE_HOST_IMX_USB_LOADER=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/warpboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-- 
2.9.3
