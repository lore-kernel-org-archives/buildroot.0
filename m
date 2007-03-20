From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 02:51:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070320095138.4DB874801A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 02:51:37 -0700 (Tue, 20 Mar 2007)
New Revision: 18173

Log:
- simplify busybox version fiddling


Modified:
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-03-20 08:53:17 UTC (rev 18172)
+++ trunk/buildroot/package/busybox/Config.in	2007-03-20 09:51:37 UTC (rev 18173)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_2_2_1
+	default BR2_BUSYBOX_VERSION_1_4_2
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -26,6 +26,7 @@
 
 	config BR2_BUSYBOX_VERSION_1_2_2_1
 		bool "BusyBox 1.2.2.1"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_4_0
 		bool "BusyBox 1.4.0"
@@ -43,6 +44,14 @@
 
 endchoice
 
+config BR2_BUSYBOX_VERSION
+	string
+	default "1.0.1"		if BR2_BUSYBOX_VERSION_1_0_1
+	default "1.1.3"		if BR2_BUSYBOX_VERSION_1_1_3
+	default "1.2.2.1"	if BR2_BUSYBOX_VERSION_1_2_2_1
+	default "1.4.0"		if BR2_BUSYBOX_VERSION_1_4_0
+	default "1.4.1"		if BR2_BUSYBOX_VERSION_1_4_1
+	default "1.4.2"		if BR2_BUSYBOX_VERSION_1_4_2
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-03-20 08:53:17 UTC (rev 18172)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-03-20 09:51:37 UTC (rev 18173)
@@ -4,39 +4,15 @@
 #
 #############################################################
 
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_0_1)),y)
-BUSYBOX_VER:=1.01
-endif
 
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_1_3)),y)
-BUSYBOX_VER:=1.1.3
-endif
-
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_2_2_1)),y)
-BUSYBOX_VER:=1.2.2.1
-endif
-
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_4_0)),y)
-BUSYBOX_VER:=1.4.0
-endif
-
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_4_1)),y)
-BUSYBOX_VER:=1.4.1
-endif
-
-ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_4_2)),y)
-BUSYBOX_VER:=1.4.2
-endif
-
-
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
 # Be aware that this changes daily....
 BUSYBOX_DIR:=$(BUILD_DIR)/busybox
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
-BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
+BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BR2_BUSYBOX_VERSION)
+BUSYBOX_SOURCE:=busybox-$(BR2_BUSYBOX_VERSION).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
@@ -62,7 +38,7 @@
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
 	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox.\*.patch
 else
-	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BUSYBOX_VER)-\*.patch
+	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BR2_BUSYBOX_VERSION)-\*.patch
 endif
 	touch $@
 
