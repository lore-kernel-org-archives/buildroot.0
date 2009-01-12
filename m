From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 Jan 2009 00:43:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20090112004324.7BD1676736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-12 00:43:22 +0000 (Mon, 12 Jan 2009)
New Revision: 24778

Log:
Support large sector NAND flash for JFFS2

Modified:
   trunk/buildroot/target/jffs2/Config.in


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2009-01-12 00:06:49 UTC (rev 24777)
+++ trunk/buildroot/target/jffs2/Config.in	2009-01-12 00:43:22 UTC (rev 24778)
@@ -20,6 +20,11 @@
 	depends on BR2_TARGET_ROOTFS_JFFS2
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
+config BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
+	bool "NAND flash with 2kB Page and 128 kB erasesize"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
+
 config BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	bool "Parallel flash with 4 kB pagesize and 128 kB erase size"
 	depends on BR2_TARGET_ROOTFS_JFFS2
@@ -53,6 +58,7 @@
 	depends on BR2_TARGET_ROOTFS_JFFS2
 	default 0x420 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default 0x210 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default 0x800 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
@@ -62,6 +68,7 @@
 	depends on BR2_TARGET_ROOTFS_JFFS2
 	default 0x2100 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
 	default 0x1080 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	default 0x10000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
 	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
@@ -69,6 +76,9 @@
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
 	depends on BR2_TARGET_ROOTFS_JFFS2
+	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
+	default y if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default y if BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K
 	help
 	  Do not use cleanmarkers if using NAND flash or Dataflash where
 	  the pagesize is not a power of 2
