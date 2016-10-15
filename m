From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:50:56 +0200
Subject: [Buildroot] [PATCH 02/13] configs/freescale_mpc8315erdb: remove
	U-Boot build
In-Reply-To: <20161015145107.18264-1-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
Message-ID: <20161015145107.18264-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Binutils was locked down to 2.24 because U-Boot 2014.01 didn't build
with more recent binutils. However, this doesn't work anymore because
binutils 2.24 is deprecated.

Current U-Boot 2016.09.01 doesn't work out of the box because the
u-boot-nand.img support has been removed.

Since updating U-Boot is generally not needed anyway, we just remove
the U-Boot support.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Gustavo still has this board to test again, so when he has time, he
will try to revive with current U-Boot.
---
 board/freescale/mpc8315erdb/readme.txt  | 30 ++++--------------------------
 configs/freescale_mpc8315erdb_defconfig |  9 ---------
 2 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
index 446bd39..b4c87b4 100644
--- a/board/freescale/mpc8315erdb/readme.txt
+++ b/board/freescale/mpc8315erdb/readme.txt
@@ -1,14 +1,3 @@
-
-******************** WARNING ********************
-The compiled U-Boot binary is intended for NAND flash only!
-It won't work for NOR and will brick that bootloader!
-
-Also don't go playing around with different U-boot versions or flash targets
-unless you've got the necessary hardware and/or know-how to unbrick your kit.
-
-2014.04 is known good for NAND.
-******************** WARNING ********************
-
 You'll need to program the files created by buildroot into the flash.
 The fast way is to tftp transfer the files via one of the network interfaces.
 
@@ -17,36 +6,25 @@ file transfer from your terminal program by using a "loady" command
 from the u-boot prompt instead of the "tftp ..." commands stated below.
 Beware that serial console file transfers are quite slow!
 
-Remember to set the MPC8315ERDB switches to NAND boot if you want to use
-your newly built U-Boot.
-
-1. Program the new U-Boot binary to NAND flash (optional)
-    If you don't feel confident upgrading your bootloader then don't do it,
-    it's unnecessary most of the time.
-
-    => tftp $loadaddr u-boot-nand.bin
-    => nand erase 0 0x80000
-    => nand write $loadaddr 0 0x80000 $filesize
-
-2. Program the kernel to NAND flash
+1. Program the kernel to NAND flash
 
     => tftp $loadaddr uImage
     => nand erase 0x100000 0x1e0000
     => nand write $loadaddr 0x100000 0x1e0000
 
-3. Program the DTB to NAND flash
+2. Program the DTB to NAND flash
 
     => tftp $loadaddr mpc8315erdb.dtb
     => nand erase 0x2e0000 0x20000
     => nand write $loadaddr 0x2e0000 0x20000
 
-4. Program the root filesystem to NAND flash
+3. Program the root filesystem to NAND flash
 
     => tftp $loadaddr rootfs.jffs2
     => nand erase 0x400000 0x1c00000
     => nand write $loadaddr 0x400000 $filesize
 
-5. Booting your new system
+4. Booting your new system
 
     => setenv nandboot 'setenv bootargs root=/dev/mtdblock3 rootfstype=jffs2 console=$consoledev,$baudrate;nand read $fdtaddr 0x2e0000 0x20000;nand read $loadaddr 0x100000 0x1e0000;bootm $loadaddr - $fdtaddr'
 
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
index 628aaad..de7e561 100644
--- a/configs/freescale_mpc8315erdb_defconfig
+++ b/configs/freescale_mpc8315erdb_defconfig
@@ -26,12 +26,3 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-
-# Bootloader
-# Lock down binutils to <2.25 to avoid U-Boot build failure
-BR2_BINUTILS_VERSION_2_24_X=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="MPC8315ERDB_NAND"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.04"
-BR2_TARGET_UBOOT_FORMAT_NAND_BIN=y
-- 
2.9.3
