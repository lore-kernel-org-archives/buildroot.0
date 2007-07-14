From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 14 Jul 2007 00:26:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20070714072645.676D8A5E15@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-14 00:26:41 -0700 (Sat, 14 Jul 2007)
New Revision: 19085

Log:
Correct JFFS2 Erase Size for AT45 dataflash

Modified:
   trunk/buildroot/target/jffs2/Config.in


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-07-14 00:48:29 UTC (rev 19084)
+++ trunk/buildroot/target/jffs2/Config.in	2007-07-14 07:26:41 UTC (rev 19085)
@@ -6,33 +6,56 @@
 	help
 	  Build a jffs2 root filesystem
 
-config BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
-	bool "Use default 4 kB pagesize"
+
+choice
+	prompt "Memory Type"
+	default BR2_TARGET_ROOTFS_JFFS2_FLASH
 	depends on BR2_TARGET_ROOTFS_JFFS2
-	default y			
 
+config BR2_TARGET_ROOTFS_JFFS2_FLASH
+	bool "Parallel flash with 4 kB pagesize"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+
+config BR2_TARGET_ROOTFS_JFFS2_DATAFLASH
+	bool "AT45 dataflash with 1056 byte pagesize"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+	select BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
+
+endchoice
+
+
 config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
-	hex "Page Size (0x0 = Use default 4 kB)"
-	depends on BR2_TARGET_ROOTFS_JFFS2
-	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
+	hex "Page Size"
+	depends on BR2_TARGET_ROOTFS_JFFS2_FLASH
+	default 0x1000
+	help
+	  Set to pagesize of memory (Dataflash is 0x210 or 0x420)
+
+config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
+	hex "Page Size"
+	depends on BR2_TARGET_ROOTFS_JFFS2_DATAFLASH
 	default 0x420
 	help
 	  Set to pagesize of memory (Dataflash is 0x210 or 0x420)
 
+config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
+	hex "Erase block size"
+	depends on BR2_TARGET_ROOTFS_JFFS2_FLASH
+	default 0x20000
+
+config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
+	hex "Erase block size"
+	depends on BR2_TARGET_ROOTFS_JFFS2_DATAFLASH
+	default 0x2100
+
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool	"Do not use Cleanmarker"
 	depends on BR2_TARGET_ROOTFS_JFFS2
-	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
-	default y
+	default n
 	help
 	  Do not use cleanmarkers if using NAND flash or Dataflash where
 	  the pagesize is not a power of 2
 
-config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
-	hex "Erase block size"
-	depends on BR2_TARGET_ROOTFS_JFFS2
-	default 0x20000
-
 config BR2_JFFS2_TARGET_SREC
 	bool "RootFS in SREC file formet"
 	depends on BR2_TARGET_ROOTFS_JFFS2
