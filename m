From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Apr 2007 09:36:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/fakeroot
	target/cpio target/cra etc...
Message-ID: <20070406163648.AACE9485FC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-06 09:36:48 -0700 (Fri, 06 Apr 2007)
New Revision: 18353

Log:
- make sure to download fakeroot if needed


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/fakeroot/Config.in
   trunk/buildroot/package/fakeroot/fakeroot.mk
   trunk/buildroot/target/cpio/Config.in
   trunk/buildroot/target/cramfs/Config.in
   trunk/buildroot/target/ext2/Config.in
   trunk/buildroot/target/iso9660/Config.in
   trunk/buildroot/target/jffs2/Config.in
   trunk/buildroot/target/squashfs/Config.in
   trunk/buildroot/target/tar/Config.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/Makefile	2007-04-06 16:36:48 UTC (rev 18353)
@@ -119,7 +119,7 @@
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
 
-source: $(TARGETS_SOURCE)
+source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 #############################################################
 #

Modified: trunk/buildroot/package/fakeroot/Config.in
===================================================================
--- trunk/buildroot/package/fakeroot/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/package/fakeroot/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -5,3 +5,8 @@
 	  Run commands in an environment faking root privileges.
 
 	  http://joostje.op.het.net/fakeroot/
+
+# dummy for fakeroot-source
+config BR2_HOST_FAKEROUTE
+	bool
+	default n

Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-04-06 16:36:48 UTC (rev 18353)
@@ -122,3 +122,7 @@
 ifeq ($(strip $(BR2_PACKAGE_FAKEROOT)),y)
 TARGETS+=fakeroot
 endif
+
+ifeq ($(strip $(BR2_HOST_FAKEROUTE)),y)
+HOST_SOURCE+=fakeroot-source
+endif

Modified: trunk/buildroot/target/cpio/Config.in
===================================================================
--- trunk/buildroot/target/cpio/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/target/cpio/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_CPIO
-       bool "cpio the root filesystem"
-       default n
-       help
-         Build a cpio archive of the root filesystem
+	bool "cpio the root filesystem"
+	default n
+	select BR2_HOST_FAKEROUTE
+	help
+	  Build a cpio archive of the root filesystem
 

Modified: trunk/buildroot/target/cramfs/Config.in
===================================================================
--- trunk/buildroot/target/cramfs/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/target/cramfs/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_CRAMFS
 	bool "cramfs root filesystem"
 	default n
+	select BR2_HOST_FAKEROUTE
 	help
 	  Build a cramfs root filesystem
 

Modified: trunk/buildroot/target/ext2/Config.in
===================================================================
--- trunk/buildroot/target/ext2/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/target/ext2/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2 root filesystem"
 	default y
+	select BR2_HOST_FAKEROUTE
 	help
 	  Build an ext2 root filesystem
 

Modified: trunk/buildroot/target/iso9660/Config.in
===================================================================
--- trunk/buildroot/target/iso9660/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/target/iso9660/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -4,6 +4,7 @@
 	depends on BR2_i386
 	select BR2_TARGET_ROOTFS_EXT2
 	select BR2_TARGET_GRUB
+	select BR2_HOST_FAKEROUTE
 	help
 	  Build a bootable iso9660 image
 

Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/target/jffs2/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_JFFS2
 	bool "jffs2 root filesystem"
 	default n
+	select BR2_HOST_FAKEROUTE
 	select BR2_PACKAGE_MTD
 	help
 	  Build a jffs2 root filesystem

Modified: trunk/buildroot/target/squashfs/Config.in
===================================================================
--- trunk/buildroot/target/squashfs/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/target/squashfs/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_SQUASHFS
 	bool "squashfs root filesystem"
 	default n
+	select BR2_HOST_FAKEROUTE
 	help
 	  Build a squashfs root filesystem
 

Modified: trunk/buildroot/target/tar/Config.in
===================================================================
--- trunk/buildroot/target/tar/Config.in	2007-04-06 16:32:05 UTC (rev 18352)
+++ trunk/buildroot/target/tar/Config.in	2007-04-06 16:36:48 UTC (rev 18353)
@@ -1,6 +1,7 @@
 config BR2_TARGET_ROOTFS_TAR
 	bool "tar the root filesystem"
 	default n
+	select BR2_HOST_FAKEROUTE
 	help
 	  Build a tar archive of the root filesystem
 
