From: Troy Dack <troy@dack.com.au>
Date: Sun, 15 May 2016 09:33:09 +1000
Subject: [Buildroot] [PATCH 2/3] OrangePi Plus files required to generate SD
	card image and a self extracting fel-boot command for booting
	from RAM using USB-OTG and sunxi-fel
In-Reply-To: <1463268790-1076-1-git-send-email-troy@dack.com.au>
References: <1463268790-1076-1-git-send-email-troy@dack.com.au>
Message-ID: <1463268790-1076-3-git-send-email-troy@dack.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Troy Dack <troy@dack.com.au>
---
 board/orangepi/orangepi_plus/boot-fel.cmd    |  4 +++
 board/orangepi/orangepi_plus/boot-sdcard.cmd |  8 +++++
 board/orangepi/orangepi_plus/boot.cmd        |  4 +++
 board/orangepi/orangepi_plus/decompress      | 21 +++++++++++
 board/orangepi/orangepi_plus/genimage.cfg    | 35 ++++++++++++++++++
 board/orangepi/orangepi_plus/payload.sh      | 21 +++++++++++
 board/orangepi/orangepi_plus/post-build.sh   | 15 ++++++++
 board/orangepi/orangepi_plus/post-image.sh   | 54 ++++++++++++++++++++++++++++
 board/orangepi/orangepi_plus/readme.txt      | 35 ++++++++++++++++++
 9 files changed, 197 insertions(+)
 create mode 100644 board/orangepi/orangepi_plus/boot-fel.cmd
 create mode 100644 board/orangepi/orangepi_plus/boot-sdcard.cmd
 create mode 100644 board/orangepi/orangepi_plus/boot.cmd
 create mode 100644 board/orangepi/orangepi_plus/decompress
 create mode 100644 board/orangepi/orangepi_plus/genimage.cfg
 create mode 100644 board/orangepi/orangepi_plus/payload.sh
 create mode 100755 board/orangepi/orangepi_plus/post-build.sh
 create mode 100755 board/orangepi/orangepi_plus/post-image.sh
 create mode 100644 board/orangepi/orangepi_plus/readme.txt

diff --git a/board/orangepi/orangepi_plus/boot-fel.cmd b/board/orangepi/orangepi_plus/boot-fel.cmd
new file mode 100644
index 0000000..50e80a3
--- /dev/null
+++ b/board/orangepi/orangepi_plus/boot-fel.cmd
@@ -0,0 +1,4 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk rootwait
+
+bootm $kernel_addr_r $ramdisk_addr_r $fdt_addr_r
diff --git a/board/orangepi/orangepi_plus/boot-sdcard.cmd b/board/orangepi/orangepi_plus/boot-sdcard.cmd
new file mode 100644
index 0000000..5fe9920
--- /dev/null
+++ b/board/orangepi/orangepi_plus/boot-sdcard.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r uImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-plus.dtb
+
+bootm $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi_plus/boot.cmd b/board/orangepi/orangepi_plus/boot.cmd
new file mode 100644
index 0000000..50e80a3
--- /dev/null
+++ b/board/orangepi/orangepi_plus/boot.cmd
@@ -0,0 +1,4 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk rootwait
+
+bootm $kernel_addr_r $ramdisk_addr_r $fdt_addr_r
diff --git a/board/orangepi/orangepi_plus/decompress b/board/orangepi/orangepi_plus/decompress
new file mode 100644
index 0000000..5f10737
--- /dev/null
+++ b/board/orangepi/orangepi_plus/decompress
@@ -0,0 +1,21 @@
+#!/bin/bash
+echo ""
+echo "Self Extracting sunxi-fel USB boot"
+echo ""
+
+export TMPDIR=`mktemp -d /tmp/selfextract.XXXXXX`
+
+ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`
+
+tail -n+$ARCHIVE $0 | tar xjv -C $TMPDIR
+
+CDIR=`pwd`
+cd $TMPDIR
+./fel-boot.sh
+
+cd $CDIR
+rm -rf $TMPDIR
+
+exit 0
+
+__ARCHIVE_BELOW__
diff --git a/board/orangepi/orangepi_plus/genimage.cfg b/board/orangepi/orangepi_plus/genimage.cfg
new file mode 100644
index 0000000..c607b9e
--- /dev/null
+++ b/board/orangepi/orangepi_plus/genimage.cfg
@@ -0,0 +1,35 @@
+# Minimal SD card image for the OrangePi PC
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"sun8i-h3-orangepi-plus.dtb",
+			"boot-sdcard.scr"
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
+		size = 512M
+	}
+}
diff --git a/board/orangepi/orangepi_plus/payload.sh b/board/orangepi/orangepi_plus/payload.sh
new file mode 100644
index 0000000..ca247fd
--- /dev/null
+++ b/board/orangepi/orangepi_plus/payload.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+cd ${BINARIES_DIR}
+tar czf .tar ./*
+
+if [ -e "payload.tar" ]; then
+    gzip payload.tar
+
+    if [ -e "payload.tar.gz" ]; then
+        cat decompress payload.tar.gz > selfextract.bsx
+    else
+        echo "payload.tar.gz does not exist"
+        exit 1
+    fi
+else
+    echo "payload.tar does not exist"
+    exit 1
+fi
+
+echo "selfextract.bsx created"
+exit 0
+
diff --git a/board/orangepi/orangepi_plus/post-build.sh b/board/orangepi/orangepi_plus/post-build.sh
new file mode 100755
index 0000000..9885453
--- /dev/null
+++ b/board/orangepi/orangepi_plus/post-build.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# post-build.sh for OrangePi Plus
+# based on OrangePi PC by Carlo Caione <carlo.caione@gmail.com>
+# 2016, Troy Dack <troy@dack.com.au>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+
+for F in fel sdcard; do
+	BOOT_CMD=$BOARD_DIR/boot-$F.cmd
+	BOOT_CMD_H=$BINARIES_DIR/boot-$F.scr
+	# U-Boot script
+	$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
+done
+
diff --git a/board/orangepi/orangepi_plus/post-image.sh b/board/orangepi/orangepi_plus/post-image.sh
new file mode 100755
index 0000000..2be26a8
--- /dev/null
+++ b/board/orangepi/orangepi_plus/post-image.sh
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname ${BR2_CONFIG})/$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+echo ">>> Generating fel-boot.bsx self-extracting boot image"
+# Create fel-boot.sh
+cat > ${BINARIES_DIR}/fel-boot.sh <<__EOF__
+#!/bin/bash
+
+SUNXI_TOOLS=${HOST_DIR}
+BINARIES_DIR=${BINARIES_DIR}
+
+sudo \${SUNXI_TOOLS}/usr/bin/sunxi-fel -v -p \\
+	uboot \${BINARIES_DIR}\\u-boot-sunxi-with-spl.bin \\
+	write 0x42000000 \${BINARIES_DIR}\\uImage \\
+	write 0x43000000 \${BINARIES_DIR}\\sun8i-h3-orangepi-plus.dtb \\
+	write 0x43100000 \${BINARIES_DIR}\\boot-fel.scr \\
+	write 0x43300000 \${BINARIES_DIR}\\rootfs.cpio.uboot
+__EOF__
+chmod +x ${BINARIES_DIR}/fel-boot.sh
+
+# Create self-extracting fel-boot.bsx
+tar cjf ${BINARIES_DIR}/payload.tar.bz2 -C ${BINARIES_DIR} \
+	u-boot-sunxi-with-spl.bin \
+	uImage \
+	sun8i-h3-orangepi-plus.dtb \
+	boot-fel.scr \
+	rootfs.cpio.uboot \
+	fel-boot.sh
+
+if [ -e "${BINARIES_DIR}/payload.tar.bz2" ]; then
+    cat ${BOARD_DIR}/decompress ${BINARIES_DIR}/payload.tar.bz2 > ${BINARIES_DIR}/fel-boot.bsx
+    rm ${BINARIES_DIR}/payload.tar.bz2
+else
+    echo "${BINARIES_DIR}/payload.tar.bz2 does not exist"
+    exit 1
+fi
+chmod +x ${BINARIES_DIR}/fel-boot.bsx
+
+echo ">>> Generating SD card image"
+# Generate SD Card image
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+
+exit $?
diff --git a/board/orangepi/orangepi_plus/readme.txt b/board/orangepi/orangepi_plus/readme.txt
new file mode 100644
index 0000000..818cfa5
--- /dev/null
+++ b/board/orangepi/orangepi_plus/readme.txt
@@ -0,0 +1,35 @@
+OrangePi Plus
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi PC. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_plus_defconfig
+
+Compile everything and build the self extracting initrd FEL boot image:
+
+    $ make
+
+Booting
+=======
+
+Once the build process is finished you will have a script called 
+"fel-boot.bsx" in the output/images/ directory.
+
+Make sure sunxi-tools/sunxi-fel is in your current PATH if they are
+not installed.
+
+Connect your OrangePi Plus via the OSB-OTG port and put it into FEL
+mode by pressing the FEL button. Run fel-boot.bsx and the OrangePi
+Plus will boot from the compiled image.
+
+  $ sudo fel-boot.bsx
+
-- 
2.7.4
