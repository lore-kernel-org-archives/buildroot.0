From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 13:42:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [26112] trunk/buildroot/package/busybox
Message-ID: <20090415134204.5273C7767F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-15 13:42:03 +0000 (Wed, 15 Apr 2009)
New Revision: 26112

Log:
busybox: add 1.14.x

Modified:
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2009-04-15 13:41:59 UTC (rev 26111)
+++ trunk/buildroot/package/busybox/Config.in	2009-04-15 13:42:03 UTC (rev 26112)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends on BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_13_X
+	default BR2_BUSYBOX_VERSION_1_14_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -46,11 +46,15 @@
 
 	config BR2_BUSYBOX_VERSION_1_12_X
 		bool "BusyBox 1.12.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_13_X
 		bool "BusyBox 1.13.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
 
+	config BR2_BUSYBOX_VERSION_1_14_X
+		bool "BusyBox 1.14.x"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -67,6 +71,7 @@
 	default "1.11.3"	if BR2_BUSYBOX_VERSION_1_11_X
 	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
+	default "1.14.0"	if BR2_BUSYBOX_VERSION_1_14_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
@@ -94,6 +99,7 @@
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_11_X
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_12_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_13_X
+	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_14_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2009-04-15 13:41:59 UTC (rev 26111)
+++ trunk/buildroot/package/busybox/busybox.mk	2009-04-15 13:42:03 UTC (rev 26112)
@@ -52,8 +52,8 @@
 	$(SED) s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config
 endif
-# id applet breaks on 1.13.0 with old uclibc unless the bb pwd routines are used
-ifeq ($(BR2_BUSYBOX_VERSION_1_13_X)$(BR2_UCLIBC_VERSION_0_9_28_3)$(BR2_UCLIBC_VERSION_0_9_29),yy)
+# id applet breaks on >=1.13.0 with old uclibc unless the bb pwd routines are used
+ifeq ($(BR2_BUSYBOX_VERSION_1_13_X)$(BR2_BUSYBOX_VERSION_1_14_X)$(BR2_UCLIBC_VERSION_0_9_28_3)$(BR2_UCLIBC_VERSION_0_9_29),yy)
 	if grep -q 'CONFIG_ID=y' $(BUSYBOX_DIR)/.config; \
 	then \
 		echo 'warning: CONFIG_ID needs BB_PWD_GRP with old uclibc, enabling' >&2;\
