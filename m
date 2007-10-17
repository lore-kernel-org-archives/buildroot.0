From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 17 Oct 2007 15:01:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20071017220158.E3DB1A45CD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-17 15:01:58 -0700 (Wed, 17 Oct 2007)
New Revision: 20277

Log:
Update JFFS2 page/erase size correctly

Modified:
   trunk/buildroot/target/jffs2/Config.in


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-10-17 21:56:21 UTC (rev 20276)
+++ trunk/buildroot/target/jffs2/Config.in	2007-10-17 22:01:58 UTC (rev 20277)
@@ -6,48 +6,71 @@
 	help
 	  Build a jffs2 root filesystem
 
-
 choice
 	prompt "Memory Type"
-	default BR2_TARGET_ROOTFS_JFFS2_FLASH
+	default BR2_TARGET_ROOTFS_JFFS2_FLASH_128
 	depends on BR2_TARGET_ROOTFS_JFFS2
 
-config BR2_TARGET_ROOTFS_JFFS2_FLASH
-	bool "Parallel flash with 4 kB pagesize"
+config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
+	bool "AT45 dataflash with 1056 byte pagesize"
 	depends on BR2_TARGET_ROOTFS_JFFS2
+	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
-config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH
-	bool "AT45 dataflash with 1056 byte pagesize"
+config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	bool "AT45 dataflash with 528 byte pagesize"
 	depends on BR2_TARGET_ROOTFS_JFFS2
 	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 
+config BR2_TARGET_ROOTFS_JFFS2_FLASH_128
+	bool "Parallel flash with 4 kB pagesize and 128 kB erase size"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+
+config BR2_TARGET_ROOTFS_JFFS2_FLASH_64
+	bool "Parallel flash with 4 kB pagesize and 64 kB erase size"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+
+config BR2_TARGET_ROOTFS_JFFS2_CUSTOM
+	bool "Select custom page and erase size"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+
 endchoice
 
-
-config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
+config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE
 	hex "Page Size"
-	depends on BR2_TARGET_ROOTFS_JFFS2_FLASH
+	depends on BR2_TARGET_ROOTFS_JFFS2_CUSTOM
 	default 0x1000
 	help
-	  Set to pagesize of memory (Dataflash is 0x210 or 0x420)
+	  Set to pagesize of memory
 
+config BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE
+	hex "Erase block size"
+	depends on BR2_TARGET_ROOTFS_JFFS2_CUSTOM
+	default 0x20000
+	help
+	  Set to erase size of memory
+
 config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
-	hex "Page Size"
-	depends on BR2_TARGET_ROOTFS_JFFS2_DATAFLASH
-	default 0x420
+	hex
+	depends on BR2_TARGET_ROOTFS_JFFS2
+	default 0x420 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
+	default 0x210 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
+	default 0x1000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
+	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
 	help
-	  Set to pagesize of memory (Dataflash is 0x210 or 0x420)
+	  Set to pagesize of memory
 
 config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
-	hex "Erase block size"
-	depends on BR2_TARGET_ROOTFS_JFFS2_FLASH
-	default 0x20000
+	hex
+	depends on BR2_TARGET_ROOTFS_JFFS2
+	default 0x2100 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056
+	default 0x1080 if BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528
+	default 0x20000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_128
+	default 0x10000 if BR2_TARGET_ROOTFS_JFFS2_FLASH_64
+	default $(BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE) if BR2_TARGET_ROOTFS_JFFS2_CUSTOM
+	help
+	  Set to Erase Size of memory
 
-config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
-	hex "Erase block size"
-	depends on BR2_TARGET_ROOTFS_JFFS2_DATAFLASH
-	default 0x2100
-
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool "Do not use Cleanmarker"
 	depends on BR2_TARGET_ROOTFS_JFFS2
