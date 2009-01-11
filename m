From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:43:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090111204325.064BB76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:43:24 +0000 (Sun, 11 Jan 2009)
New Revision: 24765

Log:
Move kernel localversion files to TARGET_DIR/boot 
to allow packages which assumes that LINUX26_DIR
and the /lib/modules/LINUX_VERSION use
the consistent version numbering to build.

Create a file ".linux-version" containing
the real linux version in $(PROJECT_B UILD_DIR)
to allow packages to read the correct linux version



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-11 20:37:04 UTC (rev 24764)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-11 20:43:24 UTC (rev 24765)
@@ -223,7 +223,7 @@
 
 
 # -----------------------------------------------------------------------------
-LINUX26_TARGETS+=$(LINUX26_KERNEL)
+LINUX26_TARGETS+=$(LINUX26_KERNEL) linux26-version
 
 ifeq ($(BR2_LINUX_COPYTO_ROOTFS),y)
 LINUX26_TARGETS+=$(TARGET_DIR)/boot/$(LINUX26_KERNEL_NAME)
@@ -386,6 +386,7 @@
 
 # -----------------------------------------------------------------------------
 $(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured $(LINUX26_MKIMAGE_DEP)
+	-mv $(LINUX26_DIR)/localversion* $(TARGET_DIR)/boot
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
 
@@ -457,12 +458,18 @@
 	cp -dpf $(LINUX26_KERNEL) $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
 endif
 
+$(PROJECT_BUILD_DIR)/.linux-version:
+	echo $(LINUX26_VERSION_PROBED) > $(PROJECT_BUILD_DIR)/.linux-version
+	echo LINUX_MODULES=$(LINUX26_VERSION_PROBED)	
+
 linux26-mkimage:	u-boot
 	mkdir -p $(LINUX26_MKIMAGE_DIR)
 	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)
 
 linux26: $(LINUX26_TARGETS)
 
+linux26-version: $(PROJECT_BUILD_DIR)/.linux-version
+
 linux26-modules: cross-depmod26 $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
