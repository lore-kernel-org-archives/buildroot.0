From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Thu,  7 May 2020 18:45:19 +0200
Subject: [Buildroot] [PATCH v2] configs/bananapi_m2_zero: new defconfig
In-Reply-To: <20200413171831.12079-1-vincent.stehle@laposte.net>
References: <20200413171831.12079-1-vincent.stehle@laposte.net>
Message-ID: <20200507164520.8299-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Banana Pi M2 Zero [1] is a board from Sinovoip, based on the Allwinner
H2+ SoC.

It is similar to the other Banana Pi M2* boards, from which this
configuration is inspired.

[1]: http://www.banana-pi.org/m2z.html

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---

Changes since v1:
- Bump Linux version

 DEVELOPERS                                   |  2 ++
 board/bananapi/bananapi-m2-zero/boot.cmd     |  7 ++++
 board/bananapi/bananapi-m2-zero/genimage.cfg | 33 +++++++++++++++++++
 board/bananapi/bananapi-m2-zero/readme.txt   | 34 ++++++++++++++++++++
 configs/bananapi_m2_zero_defconfig           | 31 ++++++++++++++++++
 5 files changed, 107 insertions(+)
 create mode 100644 board/bananapi/bananapi-m2-zero/boot.cmd
 create mode 100644 board/bananapi/bananapi-m2-zero/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m2-zero/readme.txt
 create mode 100644 configs/bananapi_m2_zero_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab15d4..ef450c3ad9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2592,6 +2592,8 @@ F:	package/nss-myhostname/
 F:	package/utp_com/
 
 N:	Vincent Stehl? <vincent.stehle@laposte.net>
+F:	board/bananapi/bananapi-m2-zero/
+F:	configs/bananapi_m2_zero_defconfig
 F:	package/i7z/
 F:	package/msr-tools/
 F:	package/pixz/
diff --git a/board/bananapi/bananapi-m2-zero/boot.cmd b/board/bananapi/bananapi-m2-zero/boot.cmd
new file mode 100644
index 0000000000..081450935b
--- /dev/null
+++ b/board/bananapi/bananapi-m2-zero/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h2-plus-bananapi-m2-zero.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m2-zero/genimage.cfg b/board/bananapi/bananapi-m2-zero/genimage.cfg
new file mode 100644
index 0000000000..e41f1f9392
--- /dev/null
+++ b/board/bananapi/bananapi-m2-zero/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h2-plus-bananapi-m2-zero.dtb",
+			"boot.scr"
+		}
+	}
+	size = 64M
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
+	}
+}
diff --git a/board/bananapi/bananapi-m2-zero/readme.txt b/board/bananapi/bananapi-m2-zero/readme.txt
new file mode 100644
index 0000000000..9edd477f11
--- /dev/null
+++ b/board/bananapi/bananapi-m2-zero/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+Buildroot environment for the Bananapi M2 Zero. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Bananapi M2 Zero link:
+http://www.banana-pi.org/m2z.html
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+  $ make bananapi_m2_zero_defconfig
+  $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sync
+
+Insert the micro SDcard in your Bananapi M2 Zero and power it up. The console
+is on the Debug UART on the CON3 header, with serial settings 115200 8N1.
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
new file mode 100644
index 0000000000..4711cb70db
--- /dev/null
+++ b/configs/bananapi_m2_zero_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Bananapi M2 Zero"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-zero/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.7"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-bananapi-m2-zero"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="bananapi_m2_zero"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-zero/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+# U-boot needs python3
+BR2_PACKAGE_HOST_PYTHON3=y
-- 
2.26.2
