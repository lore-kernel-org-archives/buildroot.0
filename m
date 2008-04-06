From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  6 Apr 2008 03:02:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080406100253.C2E543C3C8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-06 03:02:53 -0700 (Sun, 06 Apr 2008)
New Revision: 21650

Log:
Update linux source tree with minor version

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-06 10:01:29 UTC (rev 21649)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-06 10:02:53 UTC (rev 21650)
@@ -273,12 +273,12 @@
 ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
 	if [ -d $(KERNEL_HEADERS_PATCH_DIR) ] ; then \
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
-		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2} ; \
+		linux-$(LINUX26_VERSION)\*.patch{,.gz,.bz2} ; \
 	fi
 endif
 ifeq ($(BR2_PACKAGE_OPENSWAN),y)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) package/openswan \
-		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
+		linux-$(LINUX26_VERSION)\*.patch{,.gz,.bz2}
 endif
 	touch $@
 
@@ -286,7 +286,7 @@
 ifneq ($(BR2_KERNEL_ARCH_PATCH_DIR),)
 	if [ -d $(KERNEL_ARCH_PATCH_DIR) ] ; then \
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_ARCH_PATCH_DIR) \
-		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2} ; \
+		linux-\*.patch{,.gz,.bz2} ; \
 	fi
 endif
 	touch $@
@@ -295,7 +295,7 @@
 ifneq ($(LINUX26_PATCH_DIR),)
 	if [ -d $(LINUX26_PATCH_DIR) ] ; then \
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) \
-		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2} ; \
+		linux-$(LINUX26_VERSION)\*.patch{,.gz,.bz2} ; \
 	fi
 endif
 	touch $@
@@ -303,6 +303,10 @@
 # =============================================================================
 linux_patch: $(LINUX26_DIR)/.patched.board
 
+KERNEL_EXTRA_VERSION:=$(strip $(subst ",,$(BR2_EXTRA_VERSION)))
+#"))
+
+
 $(LINUX26_DIR)/.config:	$(LINUX26_DIR)/.patched.board
 ifeq ($(BR2_PACKAGE_LINUX_USE_DEFCONFIG),y)
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig 
@@ -336,10 +340,10 @@
 	fi
 endif
 ifneq ($(strip $(subst ",,$(BR2_EXTRA_VERSION))),)
-	$(SED) 's,^EXTRA_VERSION=.*,EXTRA_VERSION=="$(BR2_EXTRA_VERSION)",g'
+	$(SED) 's,^EXTRAVERSION.*,EXTRAVERSION = $(KERNEL_EXTRA_VERSION),g' $(LINUX26_DIR)/Makefile
 endif
+# $(strip $(subst ",, - ))
 
-
 # -----------------------------------------------------------------------------
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
@@ -472,6 +476,7 @@
 	@echo DOWNLOAD_LINUX26_VERSION=$(DOWNLOAD_LINUX26_VERSION)
 	@echo LINUX26_VERSION=$(LINUX26_VERSION)
 	@echo LINUX26_SOURCE=$(LINUX26_SOURCE)
+	@echo KERNEL_EXTRA_VERSION=$(KERNEL_EXTRA_VERSION)
 	@echo LINUX26_DIR=$(LINUX26_DIR)
 	@echo LINUX26_PATCH_DIR=$(LINUX26_PATCH_DIR)
 	@echo TARGETS=$(TARGETS)
@@ -486,6 +491,7 @@
 	@echo BR2_KERNEL_PATCH_SITE=$(BR2_KERNEL_PATCH_SITE)
 	@echo BR2_KERNEL_PATCH=$(BR2_KERNEL_PATCH)
 	@echo KERNEL_COND_PATCHES=$(KERNEL_COND_PATCHES)
+	@echo KERNEL_ARCH_PATCH_DIR=$(KERNEL_ARCH_PATCH_DIR)
 	@echo BR2_LINUX26_CUSTOM=$(BR2_LINUX26_CUSTOM)
 	@echo BR2_CUSTOM_LINUX26_PATCH_SITE=$(BR2_CUSTOM_LINUX26_PATCH_SITE)
 	@echo BR2_CUSTOM_LINUX26_PATCH=$(BR2_CUSTOM_LINUX26_PATCH)
