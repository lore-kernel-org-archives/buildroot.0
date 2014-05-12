From: imrehg at gmail.com <imrehg@gmail.com>
Date: Mon, 12 May 2014 13:50:07 +0800
Subject: [Buildroot] [PATCH 1/1] Adding support for the VIA VAB-600
	Springboard
In-Reply-To: <1399873807-9355-1-git-send-email-imrehg@gmail.com>
References: <1399873807-9355-1-git-send-email-imrehg@gmail.com>
Message-ID: <1399873807-9355-2-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gergely Imreh <imrehg@gmail.com>

Add defconfig for the Springboard, as well as a readme with instructions
to prepare an SD card and flash a system with buildroot.

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 board/via/springboard/readme.txt  | 82 +++++++++++++++++++++++++++++++++++++++
 configs/via_springboard_defconfig | 12 ++++++
 2 files changed, 94 insertions(+)
 create mode 100644 board/via/springboard/readme.txt
 create mode 100644 configs/via_springboard_defconfig

diff --git a/board/via/springboard/readme.txt b/board/via/springboard/readme.txt
new file mode 100644
index 0000000..009e99b
--- /dev/null
+++ b/board/via/springboard/readme.txt
@@ -0,0 +1,82 @@
+VIA VAB-600 Springboard
+=======================
+
+The Springboard is a VIA Cortex-A9 SoC on Pico-ITX form factor board.
+http://www.viaspringboard.com/
+
+This configuration is intended as a base image.
+
+
+Installation
+============
+
+These instructions are based on the available Linux Board Support Package (BSP)
+contents for the Springboard.
+
+
+Compile buildroot
+-----------------
+
+The buildroot rootfs is built by:
+
+    make via_springboard_defconfig
+    make
+
+The required result is "output/images/rootfs.tar.gz"
+
+
+Download the Linux Development Package
+-----------------------------------------
+
+The Linux Development package is at
+http://www.viaspringboard.com/via-vab-600-springboard-software-development-packages.html
+
+It contains resources prepared to flash a new system onto the Springboard (a Debian system),
+as well as the kernel source, tool chain, and evaluation guide.
+
+The file is "SpringBoard_Linux_Development_Package_v1.00.00.zip"
+Extract the contents of the file somewhere on your system.
+
+This is used for the Linux kernel image (3.0.8, uzImage.bin).
+
+
+Prepare an SD Card
+-------------------
+
+1. Prepare an SD card (at least 2GB), and format with FAT partition.
+
+2. From the "EVK/Update_Package" directory copy "scriptcmd" and the "bspinst/" directory
+   ontp the SD card.
+
+3. Remove the existing ".tgz" files from the SD card's "bpinst/packages" directory.
+
+4. Copy buildroot's rootfs.tar.gz to the SD card's "bpinst/packages/rootfs.tgz", make
+   sure it has a "tgz" extension! (The rootfs will be installed from here and the stock
+   install script appears to only handle ".tgz" extensions correctly at the moment).
+
+5. in "bpinst/bspinst.cfg" find the line:
+   "setenv wmt.display.param 4:6:1:1920:1080:60"
+   This is the screen setting. If your display is npot 1920x1080, update this line to have
+   the correct resolution. Eg. for 1280x1024 display at 75Hz should read:
+   "setenv wmt.display.param 4:6:1:1280:1024:75"
+   (without the quotes, of course) 
+
+5. Plug in the SD card to the Springboard SD card slot, and power up the board
+
+6. After a few seconds, the automatic update of the eMMC storage should start. Wait
+   until that's finished. If the screen is scrambled at that time, just wait ~5 minutes
+   just to be super-safe until going to the next step.
+
+7. Press the SD Card to remove it. The Springboard should shut down automatically. Power
+   on again to start with the new images. If the screen is still scrabled on this boot,
+   check step 5. and update the display settings, and reflash.
+
+8. If everything works well, you should arrive to the login prompt, and can get started.
+   Springboard <3 Buildroot!
+
+
+Advanced
+========
+
+If you want to modify the kernel, the Linux Development Package has the whole source code
+of the BSP kernel, as well as the toolchain and documentation how to do modifications.
diff --git a/configs/via_springboard_defconfig b/configs/via_springboard_defconfig
new file mode 100644
index 0000000..265b877
--- /dev/null
+++ b/configs/via_springboard_defconfig
@@ -0,0 +1,12 @@
+BR2_arm=y
+BR2_cortex_a9=y
+
+# Kernel Header Options
+BR2_KERNEL_HEADERS_3_0=y
+
+# getty options
+BR2_TARGET_GENERIC_GETTY_PORT="tty0"
+
+# initramfs needs a Linux kernel to be built
+BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
-- 
1.9.2
