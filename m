From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 18 Mar 2008 06:26:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080318132614.9B9AD12CF8B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-18 06:26:13 -0700 (Tue, 18 Mar 2008)
New Revision: 21395

Log:
Use correct kernel-patch for x86

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-18 12:34:04 UTC (rev 21394)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-18 13:26:13 UTC (rev 21395)
@@ -74,7 +74,7 @@
 # ------------------------------------
 # kernel patches provided by buildroot
 ifeq ($(strip $(LINUX26_PATCH_DIR)),)
-LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches-$(LINUX26_VERSION)/
+LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches/
 endif
 
 # -----------------------------------------------------------------------------
@@ -163,6 +163,10 @@
 LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
 endif
 
+ifeq ($(BOARD_NAME),)
+BOARD_NAME=$(ARCH)
+endif
+
 ifndef LINUX26_KERNEL
 LINUX26_KERNEL:=$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
 endif
@@ -274,7 +278,10 @@
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 endif
 ifneq ($(LINUX26_PATCH_DIR),)
-		toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) linux-$(LINUX26_VERSION)-\*.patch ; 
+	if [ -d $(LINUX26_PATCH_DIR) ] ; then \
+	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2} ; \
+	fi
 endif
 	touch $@
 
@@ -420,6 +427,7 @@
 	@echo LINUX26_VERSION=$(LINUX26_VERSION)
 	@echo LINUX26_SOURCE=$(LINUX26_SOURCE)
 	@echo LINUX26_DIR=$(LINUX26_DIR)
+	@echo LINUX26_PATCH_DIR=$(LINUX26_PATCH_DIR)
 	@echo TARGETS=$(TARGETS)
 	@echo LINUX26_TARGETS=$(LINUX26_TARGETS)
 	@echo LINUX26_HEADERS_PATCH_DIR=$(LINUX26_HEADERS_PATCH_DIR)
