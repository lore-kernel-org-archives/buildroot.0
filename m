From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Apr 2009 09:21:37 +0000 (UTC)
Subject: [Buildroot] svn commit: [25978] trunk/buildroot/target/squashfs
Message-ID: <20090406092137.6D4A377182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-06 09:21:36 +0000 (Mon, 06 Apr 2009)
New Revision: 25978

Log:
squashfs: add v4.0 support and version selection

Squashfs 4.0 is needed to create file systems for the mainline squashfs
version (mainline from 2.6.29). This is unfortunately not compatible with
the old 3.x version and the external kernel patches, so add a choice
between the 2 versions.

Modified:
   trunk/buildroot/target/squashfs/Config.in
   trunk/buildroot/target/squashfs/squashfsroot.mk


Changeset:
Modified: trunk/buildroot/target/squashfs/Config.in
===================================================================
--- trunk/buildroot/target/squashfs/Config.in	2009-04-06 09:21:33 UTC (rev 25977)
+++ trunk/buildroot/target/squashfs/Config.in	2009-04-06 09:21:36 UTC (rev 25978)
@@ -4,3 +4,29 @@
 	help
 	  Build a squashfs root filesystem
 
+choice
+	prompt "Squashfs version"
+	default BR2_TARGET_ROOTFS_SQUASHFS_4
+	depends on BR2_TARGET_ROOTFS_SQUASHFS
+	help
+	  Select squashfs version - This must match what your kernel
+	  supports. Select 3.x if you use the legacy 3.x kernel
+	  patches (pre 2.6.29), and 4.x otherwise.
+
+config BR2_TARGET_ROOTFS_SQUASHFS_3
+       depends on BR2_DEPRECATED || BR2_RECENT
+       bool "3.x"
+       help
+         Select this if you use the legacy 3.x kernel patches (pre 2.6.29)
+
+config BR2_TARGET_ROOTFS_SQUASHFS_4
+       bool "4.x"
+       help
+         Select this if you use the squashfs version in mainline (from 2.6.29)
+
+endchoice
+
+config BR2_TARGET_ROOTFS_SQUASHFS_VERSION
+	string
+	default "3.4"	if BR2_TARGET_ROOTFS_SQUASHFS_3
+	default "4.0"	if BR2_TARGET_ROOTFS_SQUASHFS_4

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-06 09:21:33 UTC (rev 25977)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-06 09:21:36 UTC (rev 25978)
@@ -3,7 +3,8 @@
 # mksquashfs to build to target squashfs filesystems
 #
 #############################################################
-SQUASHFS_VERSION:=3.4
+SQUASHFS_VERSION:=$(strip $(subst ",,$(BR2_TARGET_ROOTFS_SQUASHFS_VERSION)))
+#"))
 SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
@@ -35,11 +36,14 @@
 # Build the squashfs root filesystem image
 #
 #############################################################
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_3),y)
+# 4.x is always little endian
 ifeq ($(BR2_ENDIAN),"BIG")
 SQUASHFS_ENDIANNESS=-be
 else
 SQUASHFS_ENDIANNESS=-le
 endif
+endif
 
 SQUASHFS_TARGET:=$(IMAGE).squashfs
 
