From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 14:32:46 -0600
Subject: [Buildroot] [PATCH 6/9] Ask the kernel source where it will install
	modules
In-Reply-To: <20081016203220.15826.26173.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
Message-ID: <20081016203246.15826.56394.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Grant Likely <grant.likely@secretlab.ca>

Originally, $(LINUX26_VERSION) was used to figure out which directory
modules would get installed in under /lib/modules.  This causes problems
when $(LINUX26_VERSION) differs from what version the kernel source
thinks it is using because it will try to use depmod in the wrong directory.

This patch adds a new variable $(LINUX26_VERSION_MOD) which resolves to the
exact version string that the kernel uses.  Module install then uses this
value instead of $(LINUX26_VERSION) when running depmod

This patch also eliminates the modules.dep target and makes
.modules_installed depend on $(LINUX26_DIR)/.configured directly.  This is
necessary because the value of $(LINUX26_VERSION_MOD) is unavailable before
the kernel is unpacked.  Trying to use it in a target or dependency name
confuses make.
---

 target/linux/Makefile.in.advanced |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)


diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 90f8e01..3018ab3 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -42,6 +42,9 @@ LINUX26_VERSION:=$(LINUX_HEADERS_VERSION)
 endif
 endif
 
+# Ask the kernel what version number it will use when installing modules
+LINUX26_VERSION_MOD = `$(LINUX26_MAKE) -s kernelrelease`
+
 ifeq ($(BOARD_PATH),)
 BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))
 #"))
@@ -390,16 +393,16 @@ $(LINUX26_KERNEL): $(LINUX26_DIR)/$(LINUX26_BINLOC)
 
 # -----------------------------------------------------------------------------
 
-$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
-	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
+$(LINUX26_DIR)/.modules_installed: $(LINUX26_DIR)/.configured
+	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_MOD)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
 	$(LINUX26_MAKE) modules
 	$(LINUX26_MAKE) \
 		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
-	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/source
-	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION)	#$(LINUX_HEADERS_VERSION)
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_MOD)/build
+	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_MOD)/source
+	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION_MOD)	#$(LINUX_HEADERS_VERSION)
 	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
@@ -442,9 +445,6 @@ $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 
 linux26: $(LINUX26_TARGETS)
 
-$(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
-	touch $@
-
 linux26-modules: cross-depmod26 $(LINUX26_DIR)/.modules_installed
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
