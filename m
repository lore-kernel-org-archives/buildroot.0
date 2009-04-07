From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  7 Apr 2009 19:22:43 +0000 (UTC)
Subject: [Buildroot] svn commit: [26014] trunk/buildroot/target/jffs2
Message-ID: <20090407192243.546C8768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-07 19:22:43 +0000 (Tue, 07 Apr 2009)
New Revision: 26014

Log:
target/jffs2: Put all sub options in a BR2_TARGET_ROOTFS_JFFS2 conditional

And get rid of all the individual 'depends on B2_TARGET_ROOTFS_JFFS2'

Modified:
   trunk/buildroot/target/jffs2/Config.in


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2009-04-07 19:22:37 UTC (rev 26013)
+++ trunk/buildroot/target/jffs2/Config.in	2009-04-07 19:22:43 UTC (rev 26014)
@@ -5,37 +5,32 @@
 	help
 	  Build a jffs2 root filesystem
 
+if BR2_TARGET_ROOTFS_JFFS2
+
 choice
 	prompt "Memory Type"
 	default BR2_TARGET_ROOTFS_JFFS2_FLASH_128
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	bool "AT45 dataflash with 1056 byte pagesize"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
 config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
 	bool "AT45 dataflash with 528 byte pagesize"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
 config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	bool "NAND flash with 2kB Page and 128 kB erasesize"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
 config BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	bool "Parallel flash with 4 kB pagesize and 128 kB erase size"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	bool "Parallel flash with 4 kB pagesize and 64 kB erase size"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_CUSTOM
 	bool "Select custom page and erase size"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 endchoice
 
@@ -55,7 +50,6 @@
 
 config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
 	hex
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	default 0x420 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default 0x210 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
 	default 0x800 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
@@ -65,7 +59,6 @@
 
 config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	hex
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	default 0x2100 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default 0x1080 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
@@ -75,7 +68,6 @@
 
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
 	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
@@ -85,11 +77,9 @@
 
 config BR2_JFFS2_TARGET_SREC
 	bool "RootFS in SREC file formet"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_PAD
 	bool "Pad output"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_PADSIZE
 	hex "Pad output size (0x0 = to end of EB)"
@@ -101,34 +91,29 @@
 choice
 	prompt "Endianess"
 	default BR2_TARGET_ROOTFS_JFFS2_LE
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_LE
 	bool "little-endian"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 config BR2_TARGET_ROOTFS_JFFS2_BE
 	bool "big-endian"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 
 endchoice
 
 config BR2_TARGET_ROOTFS_JFFS2_SUMMARY
 	bool "Produce a summarized JFFS2 image"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	help
 	  A summarised image can be mounted faster if support is
 	  enabled in the kernel (CONFIG_JFFS2_SUMMARY)
 
 config BR2_TARGET_ROOTFS_JFFS2_OUTPUT
 	string "Output File"
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	default "$(IMAGE).jffs2"
 
 config BR2_TARGET_ROOTFS_JFFS2_COPYTO
 	string "also copy the image to..."
-	depends on BR2_TARGET_ROOTFS_JFFS2
 	default ""
 	help
 	  Copies the resulting image to a secondary location.
 
+endif
