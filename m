From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 15:18:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20070124231809.3A38D485DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 15:18:08 -0800 (Wed, 24 Jan 2007)
New Revision: 17512

Log:
- Additional JFFS2 options to support Dataflash (Ulf Samuelsson)
- cleanup a bit while at it


Modified:
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/jffs2/jffs2root.mk


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-01-24 22:22:11 UTC (rev 17511)
+++ trunk/buildroot/target/jffs2/Config.in	2007-01-24 23:18:08 UTC (rev 17512)
@@ -5,6 +5,26 @@
 	help
 	  Build a jffs2 root filesystem
 
+config BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
+	bool "Use default 4 kB pagesize"
+	depends on BR2_TARGET_ROOTFS_JFFS2
+	default y			
+
+config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
+	hex "Page Size (0x0 = Use default 4 kB)"
+	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
+	default 0x420
+	help
+	  Set to pagesize of memory (Dataflash is 0x210 or 0x420)
+
+config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
+	bool	"Do not use Cleanmarker"
+	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
+	default y
+	help
+	  Do not use cleanmarkers if using NAND flash or Dataflash where
+	  the pagesize is not a power of 2
+
 config BR2_TARGET_ROOTFS_JFFS2_EBSIZE
 	hex "Erase block size"
 	depends on BR2_TARGET_ROOTFS_JFFS2
@@ -19,7 +39,7 @@
 	depends on BR2_TARGET_ROOTFS_JFFS2_PAD
 	default 0x0
 	help
-		Set to 0x0 to pad to end of erase block.
+	  Set to 0x0 to pad to end of erase block.
 
 choice
 	prompt "Endianess"
@@ -50,6 +70,5 @@
 	depends on 	BR2_TARGET_ROOTFS_JFFS2
 	default ""
 	help
-		Copies the resulting image to a secondary location.
+	  Copies the resulting image to a secondary location.
 
-

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-01-24 22:22:11 UTC (rev 17511)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-01-24 23:18:08 UTC (rev 17512)
@@ -14,20 +14,29 @@
 endif
 endif
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_SQUASH)),y)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_SQUASH),y)
 JFFS2_OPTS += -q
 endif
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_LE)),y)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_LE),y)
 JFFS2_OPTS += -l
 endif
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_JFFS2_BE)),y)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_BE),y)
 JFFS2_OPTS += -b
 endif
 
-JFFS2_TARGET := $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT))
+ifneq ($(BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE),y)
+JFFS2_OPTS += -s $(BR2_TARGET_ROOTFS_JFFS2_PAGESIZE)
+ifeq ($(BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER),y)
+JFFS2_OPTS += -n
+endif
+endif
+
+JFFS2_TARGET := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_OUTPUT)))
+#"))
 JFFS2_DEVFILE = $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_DEVFILE)))
+#"))
 ifneq ($(JFFS2_DEVFILE),)
 JFFS2_OPTS += -D $(TARGET_DEVICE_TABLE)
 endif
@@ -62,7 +71,7 @@
 	@ls -l $(JFFS2_TARGET)
 
 JFFS2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_JFFS2_COPYTO)))
-# " stupid syntax highlighting does not like unmatched quote from above line
+#"))
 
 jffs2root: $(JFFS2_TARGET)
 ifneq ($(JFFS2_COPYTO),)
