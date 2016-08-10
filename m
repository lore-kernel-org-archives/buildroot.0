From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:06:07 +0200
Subject: [Buildroot] [PATCH 11/11] Update README file for Aria G25 named
	"readme.txt"
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-13-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Improve instructions for configuring and building Buildroot
- Add more documentation about AT91bootstrap and Linux kernel for Aria G25

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/aria-g25/readme.txt | 71 ++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/board/acmesystems/aria-g25/readme.txt b/board/acmesystems/aria-g25/readme.txt
index 734ccd2..ae674b7 100644
--- a/board/acmesystems/aria-g25/readme.txt
+++ b/board/acmesystems/aria-g25/readme.txt
@@ -1,51 +1,54 @@
-Build instructions
-==================
+Acme Systems Aria G25
 
-As a regular user configure and then build:
+Intro
+=====
 
-$ make acmesystems_aria_g25_128mb_defconfig (128MB RAM variant)
-  or...
-$ make acmesystems_aria_g25_256mb_defconfig (256MB RAM variant)
+Buildroot configuration for Aria G25.
+This default configuration, based on AT91bootstrap v3.8.5 and 
+Linux Kernel image v4.4.16, allow you to build a minimal root filesystem
+which includes the support for the serial console.
+The default configuration for Aria G25 includes the getty program that
+enables you to log in through the serial console ttyS0.
+After the boot, to log in at the getty prompt use the following credentials:
+Username: root
+Password: acmesystems
 
-$ make
+You can find additional informations, tutorials and a very comprehensive
+documentation on http://www.acmesystems.it/aria.
+
+Build instructions
+==================
 
-Writing to the MicroSD card
-===========================
+To build an image for the Aria G25 choose the configuration
+corresponding to the Aria variant.
 
-Assuming your Aria G25 baseboard has a MicroSD socket, for example with
-the Terra baseboard, you'll need a blank MicroSD (obviously) initialized
-in a particular way to be able to boot from it.
+For 128MB RAM variant type:
 
-Assuming the card is seen as /dev/sdb in your PC/laptop/other device
-you'll need to run the following commands as root or via sudo.
+$ make acmesystems_aria_g25_128mb_defconfig
 
-Make sure all of the card partitions are unmounted before starting.
+else for 256MB RAM variant type:
 
-First we'll need to create two partitions:
+$ make acmesystems_aria_g25_256mb_defconfig
 
-# sfdisk -uM /dev/sdb <<EOF
-,32,6
-;
-EOF
+To customize the configuration choosed type:
 
-Then we'll need to create the empty filesystems:
+$ make menuconfig
 
-# mkdosfs -n SD_BOOT /dev/sdb1
-# mkfs.ext4 -L SD_ROOT /dev/sdb2
+When you are ready to start building Buildroot type:
 
-We'll populate the first partition (boot) with the relevant files:
+$ make
 
-# mount /dev/sdb1 /mnt
-# cp output/images/at91bootstrap.bin /mnt/BOOT.BIN
-# cp output/images/zImage /mnt
-# cp output/images/at91-ariag25.dtb /mnt
-# umount /mnt
+How to write the microSD card
+=============================
 
-And the root filesystem afterwards:
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
 
-# mount /dev/sdb2 /mnt
-# tar -C /mnt output/images/rootfs.tar
-# umount /mnt
+Write the bootable SD card image "sdcard.img" onto an SD card with "dd" command:
 
-You're done, insert the MicroSD card in the slot and enjoy.
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Assuming your Aria G25 baseboard has a MicroSD socket, for example with
+the Terra baseboard, insert the microSD card into the baseboard slot and power it.
 
+To get the kernel log messages you can use a DPI cable (http://www.acmesystems.it/DPI)
-- 
2.7.4
