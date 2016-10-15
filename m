From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:44 +0200
Subject: [Buildroot] [git commit] configs/freescale_p1010rdb_pa: remove
	U-Boot build
Message-ID: <20161015211549.D4AD581D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59f2f1a9c756f062207ba8c3ca0ec7c7e036c56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils was locked down to 2.24 because U-Boot 2014.01 didn't build
with more recent binutils. However, this doesn't work anymore because
binutils 2.24 is deprecated.

Current U-Boot 2016.09.01 does build successfully, but we don't have a
board anymore to test it.

Since updating U-Boot is generally not needed anyway, we just remove
the U-Boot support.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/p1010rdb/readme.txt     | 45 +++------------------------------
 configs/freescale_p1010rdb_pa_defconfig |  8 ------
 2 files changed, 4 insertions(+), 49 deletions(-)

diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
index b119f9a..025c97e 100644
--- a/board/freescale/p1010rdb/readme.txt
+++ b/board/freescale/p1010rdb/readme.txt
@@ -1,28 +1,3 @@
-
-******************** WARNING ********************
-The compiled U-Boot binary is intended for NOR flash only!
-It won't work for NAND or SPI and will brick those bootloaders!
-
-Also don't go playing around with different U-boot versions or flash targets
-unless you've got the necessary hardware and/or know-how to unbrick your kit.
-
-2014.01 is known good for NOR on the P1010RDB-PA kit.
-
-Freescale released a revised version of the kit with a faster processor and
-some other hardware changes named P1010RDB-PB. U-Boot needs to be configured
-differently for this kit hence this default config WILL NOT WORK.
-This is ONLY related to U-Boot, otherwise the configuration is the same,
-you can perfectly use the generated kernel and rootfs.
-
-IF you want to build an U-Boot for the new kit just change
-BR2_TARGET_UBOOT_BOARDNAME from P1010RDB-PA_NOR to P1010RDB-PB_NOR.
-!!!!! THIS IS COMPLETELY UNTESTED BY BR DEVS SO YOU ARE ON YOUR OWN !!!!!
-If it works we'd like to know so drop an email to the mailing list. Thanks.
-
-If your kit doesn't mention PA nor PB in their shipping inventory then it's
-the old version (PA).
-******************** WARNING ********************
-
 You'll need to program the files created by buildroot into the flash.
 The fast way is to tftp transfer the files via one of the network interfaces.
 
@@ -31,37 +6,25 @@ file transfer from your terminal program by using a "loady" command
 from the u-boot prompt instead of the "tftp ..." commands stated below.
 Beware that serial console file transfers are quite slow!
 
-Remember to set the P1010RDB switches to NOR boot if you want to use
-your newly built U-Boot.
-
-1. Program the new U-Boot binary to NOR flash (optional)
-    If you don't feel confident upgrading your bootloader then don't do it,
-    it's unnecessary most of the time.
-
-    => tftp $loadaddr u-boot.bin
-    => protect off 0xeff80000 +$filesize
-    => erase 0xeff80000 +$filesize
-    => cp.b $loadaddr 0xeff80000 $filesize
-
-2. Program the DTB to NOR flash
+1. Program the DTB to NOR flash
 
     => tftp $loadaddr p1010rdb-pa.dtb
     => erase 0xee000000 +$filesize
     => cp.b $loadaddr 0xee000000 $filesize
 
-3. Program the kernel to NOR flash
+2. Program the kernel to NOR flash
 
     => tftp $loadaddr uImage
     => erase 0xee080000 +$filesize
     => cp.b $loadaddr 0xee080000 $filesize
 
-4. Program the root filesystem to NOR flash
+3. Program the root filesystem to NOR flash
 
     => tftp $loadaddr rootfs.jffs2
     => erase 0xee800000 0xeff5ffff
     => cp.b $loadaddr 0xee800000 $filesize
 
-5. Booting your new system
+4. Booting your new system
 
     => setenv norboot 'setenv bootargs root=/dev/mtdblock2 rootfstype=jffs2 console=$consoledev,$baudrate;bootm 0xee080000 - 0xee000000'
 
diff --git a/configs/freescale_p1010rdb_pa_defconfig b/configs/freescale_p1010rdb_pa_defconfig
index 7f48248..3497275 100644
--- a/configs/freescale_p1010rdb_pa_defconfig
+++ b/configs/freescale_p1010rdb_pa_defconfig
@@ -25,11 +25,3 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb-pa"
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-
-# Bootloader
-# Lock down binutils to <2.25 to avoid U-Boot build failure
-BR2_BINUTILS_VERSION_2_24_X=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="P1010RDB-PA_NOR"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.01"
