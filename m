From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  9 Dec 2017 22:30:07 +0100
Subject: [Buildroot] [PATCH 9/9] boards/zynq: use genimage to generate a
 bootable SD card image
In-Reply-To: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1512855007-1834-10-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Run-time tested on ZedBoard, build-tested on the other boards]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 board/zynq/genimage.cfg         | 25 +++++++++++++++++++++++++
 board/zynq/post-image.sh        |  2 ++
 board/zynq/readme.txt           | 14 +++++++-------
 configs/zynq_microzed_defconfig |  1 +
 configs/zynq_zc706_defconfig    |  1 +
 configs/zynq_zed_defconfig      |  1 +
 6 files changed, 37 insertions(+), 7 deletions(-)
 create mode 100644 board/zynq/genimage.cfg

diff --git a/board/zynq/genimage.cfg b/board/zynq/genimage.cfg
new file mode 100644
index 000000000000..76e61c3a0987
--- /dev/null
+++ b/board/zynq/genimage.cfg
@@ -0,0 +1,25 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.bin",
+			"u-boot.img",
+			"devicetree.dtb",
+			"uImage"
+		}
+		file uramdisk.image.gz {
+			image = "rootfs.cpio.uboot"
+		}
+	}
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+}
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 449f4a23725a..d7dde97b72ce 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -9,3 +9,5 @@ FIRST_DT=$(sed -n \
            ${BR2_CONFIG})
 
 ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
+
+support/scripts/genimage.sh -c board/zynq/genimage.cfg
diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index c5506fe9668c..162734963a27 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -14,13 +14,13 @@ Steps to create a working system for a Zynq board:
     make zynq_microzed_defconfig  (MicroZed)
 2) make
 3) All needed files will be available in the output/images directory.
-   Create a FAT32 partition at the beginning of your SD Card and copy files:
-     - boot.bin
-     - u-boot.img
-     - uImage
-     - uramdisk.image.gz (should be renamed from rootfs.cpio.uboot)
-     - devicetree.dtb (should be renamed from zynq-***.dtb)
-   into your SD card
+   The sdcard.img file is a complete bootable image ready to be written
+   on the boot medium. To install it, simply copy the image to an SD
+   card:
+
+       # dd if=output/images/sdcard.img of=/dev/sdX
+
+   Where 'sdX' is the device node of the uSD.
 4) boot your board
 
 You can alter the booting procedure by creating a file uEnv.txt
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index c6685a4bc189..98879cada04d 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -28,3 +28,4 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 0bb8e3ba3d89..ffd5bce748d5 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -28,3 +28,4 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index cfcfdff11c90..62525f7db8b1 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -28,3 +28,4 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
