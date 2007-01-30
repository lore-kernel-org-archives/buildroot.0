From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 16:58:18 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/x86
Message-ID: <20070130005818.08AD148561@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 16:58:18 -0800 (Mon, 29 Jan 2007)
New Revision: 17665

Log:
- generalize the menuconfig linux kernel support
- simplify toplevel mkdir rules a tiny bit


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/target/device/Config.in
   trunk/buildroot/target/device/x86/Config.in
   trunk/buildroot/target/device/x86/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-01-30 00:44:41 UTC (rev 17664)
+++ trunk/buildroot/Makefile	2007-01-30 00:58:18 UTC (rev 17665)
@@ -88,15 +88,9 @@
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR):
-	@mkdir -p $(DL_DIR)
+$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR):
+	@mkdir -p $@
 
-$(BUILD_DIR):
-	@mkdir -p $(BUILD_DIR)
-
-$(TOOL_BUILD_DIR):
-	@mkdir -p $(TOOL_BUILD_DIR)
-
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/lib
 	@mkdir -p $(STAGING_DIR)/include

Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-01-30 00:44:41 UTC (rev 17664)
+++ trunk/buildroot/target/device/Config.in	2007-01-30 00:58:18 UTC (rev 17665)
@@ -1,5 +1,20 @@
 menu "Board Support Options"
 
+config BR2_TARGET_GENERIC
+	bool "linux kernel"
+	default n
+	select BR2_PACKAGE_LINUX
+	help
+	  Architecture or board dependant linux kernel.
+
+config BR2_PACKAGE_LINUX
+	bool "linux"
+	default n
+	depends BR2_TARGET_GENERIC
+	help
+	  The Linux kernel.
+	  http://www.kernel.org/
+
 source "target/device/AMD/Config.in"
 source "target/device/Atmel/Config.in"
 source "target/device/Hitachi/Config.in"

Modified: trunk/buildroot/target/device/x86/Config.in
===================================================================
--- trunk/buildroot/target/device/x86/Config.in	2007-01-30 00:44:41 UTC (rev 17664)
+++ trunk/buildroot/target/device/x86/Config.in	2007-01-30 00:58:18 UTC (rev 17665)
@@ -1,22 +1,6 @@
 comment "Generic x86 Device Support"
 	depends BR2_i386
 
-config BR2_TARGET_X86_GENERIC
-	bool "Generic x86 support"
-	depends BR2_i386
-	default n
-	select BR2_PACKAGE_LINUX
-	help
-	  Generic x86 support.
-
 comment "Package support"
 	depends BR2_TARGET_AMD_ALCHEMY
 
-config BR2_PACKAGE_LINUX
-	bool "linux"
-	default n
-	depends BR2_TARGET_X86_GENERIC
-	help
-	  The Linux kernel.
-	  http://www.kernel.org/
-

Modified: trunk/buildroot/target/device/x86/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/Makefile.in	2007-01-30 00:44:41 UTC (rev 17664)
+++ trunk/buildroot/target/device/x86/Makefile.in	2007-01-30 00:58:18 UTC (rev 17665)
@@ -1,3 +1,3 @@
-ifeq ($(strip $(BR2_TARGET_X86_GENERIC)),y)
+ifeq ($(strip $(BR2_TARGET_GENERIC)),y)
 include target/device/x86/i386/Makefile.in
 endif
