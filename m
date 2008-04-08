From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon,  7 Apr 2008 21:28:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ubifs
Message-ID: <20080408042819.210953C362@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-07 21:28:18 -0700 (Mon, 07 Apr 2008)
New Revision: 21668

Log:
Fix UBI compression options


Modified:
   trunk/buildroot/target/ubifs/Config.in
   trunk/buildroot/target/ubifs/ubifsroot.mk


Changeset:
Modified: trunk/buildroot/target/ubifs/Config.in
===================================================================
--- trunk/buildroot/target/ubifs/Config.in	2008-04-08 04:18:11 UTC (rev 21667)
+++ trunk/buildroot/target/ubifs/Config.in	2008-04-08 04:28:18 UTC (rev 21668)
@@ -36,25 +36,25 @@
 
 choice
 	prompt "ubifs runtime compression"
-	default BR2_TARGET_ROOTFS_UBIFS_LZO
+	default BR2_TARGET_ROOTFS_UBIFS_RT_LZO
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
-	  Select compressor for ubifs filesystem of the root filesystem
+	  Select which compression format to use at run-time within the ubifs file system.
 
-config BR2_TARGET_ROOTFS_UBIFS_NONE
+config BR2_TARGET_ROOTFS_UBIFS_RT_NONE
 	bool "no compression"
 	help
-	  Do not compress the ubifs filesystem.
+	  Don't use run-time compression.
 
-config BR2_TARGET_ROOTFS_UBIFS_ZLIB
+config BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB
 	bool "gzip"
 	help
-	  Compress the ubifs filesystem with zlib.
+	  Use zlib compression at run-time.
 
-config BR2_TARGET_ROOTFS_UBIFS_LZO
+config BR2_TARGET_ROOTFS_UBIFS_RT_LZO
 	bool "lzo"
 	help
-	  Compress the ext2 filesystem with lzo.
+	  Use lzo compression at run-time.
 
 endchoice
 
@@ -63,7 +63,7 @@
 	default BR2_TARGET_ROOTFS_UBIFS_NONE
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
-	  Select compressor for ubifs filesystem of the root filesystem
+	  Select which compression format to compress the final image into.
 
 config BR2_TARGET_ROOTFS_UBIFS_NONE
 	bool "no compression"

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2008-04-08 04:18:11 UTC (rev 21667)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2008-04-08 04:28:18 UTC (rev 21668)
@@ -41,13 +41,13 @@
 UBIFS_BASE := $(subst ",,$(BR2_TARGET_ROOTFS_UBIFS_OUTPUT))
 #")
 
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS_ZLIB),y)
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
 UBIFS_OPTS += -x zlib
 endif
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS_LZI),y)
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_LZI),y)
 UBIFS_OPTS += -x lzo
 endif
-ifeq ($(BR2_TARGET_ROOTFS_UBIFS_NONE),y)
+ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_NONE),y)
 UBIFS_OPTS += -x none
 endif
 
