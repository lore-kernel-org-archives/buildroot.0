From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 30 Jan 2007 05:36:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070130133611.9DA53485AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-30 05:36:10 -0800 (Tue, 30 Jan 2007)
New Revision: 17668

Log:
Busybox 1.4.0 support

Modified:
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-01-30 08:35:32 UTC (rev 17667)
+++ trunk/buildroot/package/busybox/Config.in	2007-01-30 13:36:10 UTC (rev 17668)
@@ -24,6 +24,9 @@
 	config BR2_BUSYBOX_VERSION_1_2_2_1
 		bool "BusyBox 1.2.2.1"
 
+	config BR2_BUSYBOX_VERSION_1_4_0
+		bool "BusyBox 1.4.0"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -51,6 +54,7 @@
 	default "package/busybox/busybox-1.0.1.config" if BR2_BUSYBOX_VERSION_1_0_1
 	default "package/busybox/busybox-1.1.3.config" if BR2_BUSYBOX_VERSION_1_1_3
 	default "package/busybox/busybox-1.2.2.1.config" if BR2_BUSYBOX_VERSION_1_2_2_1
+	default "package/busybox/busybox-1.4.0.config" if BR2_BUSYBOX_VERSION_1_4_0
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-01-30 08:35:32 UTC (rev 17667)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-01-30 13:36:10 UTC (rev 17668)
@@ -25,6 +25,13 @@
 BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
+ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_4_0)),y)
+BUSYBOX_VER:=1.4.0
+BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
+BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
+BUSYBOX_SITE:=http://www.busybox.net/downloads
+endif
+
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
 # Be aware that this changes daily....
 BUSYBOX_DIR:=$(BUILD_DIR)/busybox
@@ -51,7 +58,7 @@
 	$(SED) "/#include.*busybox\.h/a#define CONFIG_SYSLOGD" $(BUSYBOX_DIR)/init/init.c
 endif
 	# Allow busybox patches.
-	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox\*.patch
+	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BUSYBOX_VER)\*.patch
 	touch $(BUSYBOX_DIR)/.unpacked
 
 $(BUSYBOX_DIR)/.configured: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
