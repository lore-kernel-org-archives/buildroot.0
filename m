From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 14:28:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/kernel-headers
Message-ID: <20090225142836.EA80C7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-25 14:28:35 +0000 (Wed, 25 Feb 2009)
New Revision: 25453

Log:
linux: always apply platform patches if available

Get rid of BR2_KERNEL_HEADERS_PATCH_DIR config, and simply always apply
platform patches if available.

Modified:
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/target/linux/Makefile.in.advanced
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2009-02-25 14:27:49 UTC (rev 25452)
+++ trunk/buildroot/target/linux/Makefile.in	2009-02-25 14:28:35 UTC (rev 25453)
@@ -129,7 +129,7 @@
 ifeq ($(BR2_KERNEL_HEADERS_RT),y)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(DL_DIR) $(LINUX_RT_SOURCE)
 endif
-ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
+ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 endif

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-25 14:27:49 UTC (rev 25452)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-25 14:28:35 UTC (rev 25453)
@@ -263,11 +263,9 @@
 ifeq ($(BR2_KERNEL_HEADERS_RT),y)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(DL_DIR) $(LINUX_RT_SOURCE)
 endif
-ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
-	if [ -d $(KERNEL_HEADERS_PATCH_DIR) ] ; then \
+ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
-		linux-$(LINUX26_VERSION)\*.patch{,.gz,.bz2} ; \
-	fi
+		linux-$(LINUX26_VERSION)\*.patch{,.gz,.bz2}
 endif
 ifeq ($(BR2_PACKAGE_OPENSWAN),y)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) package/openswan \

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-25 14:27:49 UTC (rev 25452)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-02-25 14:28:35 UTC (rev 25453)
@@ -54,13 +54,6 @@
 	help
 	  Apply Ingo's realtime extensions to linux
 
-config BR2_KERNEL_HEADERS_PATCH_DIR
-	bool "Add additional headers from $(KERNEL_HEADERS_PATCH_DIR)"
-	depends on BR2_KERNEL_HEADERS_2_6_20_4 || BR2_KERNEL_HEADERS_2_6_21_5 || BR2_KERNEL_HEADERS_2_6_22_1  || BR2_KERNEL_HEADERS_2_6_22_10 || BR2_KERNEL_HEADERS_2_6_28
-	help
-	  Apply additional kernel patches defined by KERNEL_HEADERS_PATCH_DIR
-	  in your board directory.
-
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-02-25 14:27:49 UTC (rev 25452)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-02-25 14:28:35 UTC (rev 25453)
@@ -30,9 +30,6 @@
 LINUX_RT_VERSION:=rt16
 endif
 
-# Need to redefine KERNEL_HEADERS_PATCH_DIR if you want
-# board specific kernel headers
-KERNEL_HEADERS_PATCH_DIR:=toolchain/kernel-headers/empty
 LINUX_HEADERS_DEPENDS:=
 
 ifeq ($(BR2_KERNEL_HEADERS_RT),y)
@@ -56,9 +53,9 @@
 ifeq ($(BR2_KERNEL_HEADERS_RT),y)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(DL_DIR) $(LINUX_RT_SOURCE)
 endif
-ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
+ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
-		\*.patch{,.gz,.bz2}
+		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 endif
 ifeq ($(BR2_PACKAGE_OPENSWAN),y)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
