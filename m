From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 14:27:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090225142749.73B2C7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-25 14:27:49 +0000 (Wed, 25 Feb 2009)
New Revision: 25452

Log:
kernel-headers: update -rt support for 2.6.24 / 2.6.26

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-25 14:26:03 UTC (rev 25451)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-25 14:27:49 UTC (rev 25452)
@@ -50,7 +50,7 @@
 
 config BR2_KERNEL_HEADERS_RT
 	bool "use realtime (-rt) kernel patches"
-	depends on BR2_KERNEL_HEADERS_2_6_21_5 || BR2_KERNEL_HEADERS_2_6_22_1
+	depends on BR2_KERNEL_HEADERS_2_6_24 || BR2_KERNEL_HEADERS_2_6_26
 	help
 	  Apply Ingo's realtime extensions to linux
 

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-02-25 14:26:03 UTC (rev 25451)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-02-25 14:27:49 UTC (rev 25452)
@@ -22,12 +22,12 @@
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.1")
-LINUX_RT_VERSION:=rt9
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.24.7")
+LINUX_RT_VERSION:=rt27
 endif
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.5")
-LINUX_RT_VERSION:=rt20
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.26.8")
+LINUX_RT_VERSION:=rt16
 endif
 
 # Need to redefine KERNEL_HEADERS_PATCH_DIR if you want
@@ -37,7 +37,7 @@
 
 ifeq ($(BR2_KERNEL_HEADERS_RT),y)
 LINUX_RT_SOURCE:=patch-$(LINUX_HEADERS_VERSION)-$(LINUX_RT_VERSION)
-LINUX_RT_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/projects/rt/older/
+LINUX_RT_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/projects/rt
 LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX_RT_SOURCE)
 $(DL_DIR)/$(LINUX_RT_SOURCE):
 	$(call DOWNLOAD,$(LINUX_RT_SITE),$(LINUX_RT_SOURCE))
