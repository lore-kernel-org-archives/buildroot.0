From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 01:53:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070320085318.621BC48015@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 01:53:17 -0700 (Tue, 20 Mar 2007)
New Revision: 18172

Log:
- add busybox-1.4.2


Removed:
   trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch
   trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch

Modified:
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-03-20 03:32:26 UTC (rev 18171)
+++ trunk/buildroot/package/busybox/Config.in	2007-03-20 08:53:17 UTC (rev 18172)
@@ -18,19 +18,26 @@
 
 	config BR2_BUSYBOX_VERSION_1_0_1
 		bool "BusyBox 1.0.1"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_1_3
 		bool "BusyBox 1.1.3"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_2_2_1
 		bool "BusyBox 1.2.2.1"
 
 	config BR2_BUSYBOX_VERSION_1_4_0
 		bool "BusyBox 1.4.0"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_4_1
 		bool "BusyBox 1.4.1"
+		depends on BR2_DEPRECATED
 
+	config BR2_BUSYBOX_VERSION_1_4_2
+		bool "BusyBox 1.4.2"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -60,6 +67,7 @@
 	default "package/busybox/busybox-1.2.2.1.config" if BR2_BUSYBOX_VERSION_1_2_2_1
 	default "package/busybox/busybox-1.4.0.config" if BR2_BUSYBOX_VERSION_1_4_0
 	default "package/busybox/busybox-1.4.1.config" if BR2_BUSYBOX_VERSION_1_4_1
+	default "package/busybox/busybox-1.4.1.config" if BR2_BUSYBOX_VERSION_1_4_2
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.

Deleted: trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch	2007-03-20 03:32:26 UTC (rev 18171)
+++ trunk/buildroot/package/busybox/busybox.fix-ptr_to_globals.patch	2007-03-20 08:53:17 UTC (rev 18172)
@@ -1,11 +0,0 @@
-Index: busybox/libbb/messages.c
-===================================================================
---- busybox/libbb/messages.c	(revision 18097)
-+++ busybox/libbb/messages.c	(working copy)
-@@ -56,4 +56,5 @@ WTMP_FILE;
- 
- char bb_common_bufsiz1[BUFSIZ+1];
- 
--void *ptr_to_globals;
-+struct global1;
-+struct global1 *ptr_to_globals;

Deleted: trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch	2007-03-20 03:32:26 UTC (rev 18171)
+++ trunk/buildroot/package/busybox/busybox.mdev-just-read-9-bytes.patch	2007-03-20 08:53:17 UTC (rev 18172)
@@ -1,13 +0,0 @@
-Index: busybox/util-linux/mdev.c
-===================================================================
---- busybox/util-linux/mdev.c	(revision 17891)
-+++ busybox/util-linux/mdev.c	(working copy)
-@@ -39,7 +39,7 @@
- 
- 	if (!delete) {
- 		strcat(path, "/dev");
--		len = open_read_close(path, temp + 1, 64);
-+		len = open_read_close(path, temp + 1, 9);
- 		*temp++ = 0;
- 		if (len < 1) return;
- 	}

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-03-20 03:32:26 UTC (rev 18171)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-03-20 08:53:17 UTC (rev 18172)
@@ -24,6 +24,11 @@
 BUSYBOX_VER:=1.4.1
 endif
 
+ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_4_2)),y)
+BUSYBOX_VER:=1.4.2
+endif
+
+
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
 # Be aware that this changes daily....
 BUSYBOX_DIR:=$(BUILD_DIR)/busybox
