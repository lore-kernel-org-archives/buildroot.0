From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu,  3 Mar 2011 19:22:49 +0100
Subject: [Buildroot] [PATCH v3] Makefile: improve $(TARGET_DIR) (re)creation
Message-ID: <1299176569-13754-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the following use case:

 1. Build, hack, ...
 2. Oh no, $(TARGET_DIR) is no longer in sync with $(TARGET_SKELETON)
    and/or the packages selected in menuconfig. If only there was a way
    to *easily* rebuild $(TARGET_DIR) so it is in sync...

With this patch, just remove $(TARGET_DIR) and Buildroot will recreate
it.

Main changes:
 * Always copy $(TARGET_SKELETON) to $(TARGET_DIR).
 * If $(TARGET_DIR) needs to be created (i.e. if the directory is
   missing), remove stamp files so all currently selected packages will
   be reinstalled.
 * If $(TARGET_DIR)/lib/modules/ is missing, try to install kernel
   modules.

Also:
 * remove code touching .fakeroot.00000 file (not needed)
 * remove code trying to remove CVS and .svn stuff from target skeleton
   (not needed)

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
Changes in v3:
 * Qt uses a differently named stamp file, handle that too.

Changes in v2:
 * remove gcc stamp file so libgcc_s.so.1 will be copied to TARGET_DIR
 * make sure kernel modules get reinstalled


 Makefile       |   27 ++++++++++++---------------
 linux/linux.mk |    6 ++++--
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 7ae3787..c38f98f 100644
--- a/Makefile
+++ b/Makefile
@@ -364,7 +364,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
+$(BASE_TARGETS): dirs $(O)/toolchainfile.cmake copy-target-skeleton
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
 	$(MAKE) $(EXTRAMAKEARGS) silentoldconfig
@@ -390,9 +390,10 @@ $(O)/toolchainfile.cmake:
 	" > $@
 
 .PHONY: all world dirs clean distclean source outputmakefile \
+	copy-target-skeleton \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
-	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
+	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 #############################################################
@@ -416,19 +417,15 @@ ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
 endif
 
-$(BUILD_DIR)/.root:
-	mkdir -p $(TARGET_DIR)
-	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
-		if [ -d "$(TARGET_SKELETON)" ]; then \
-			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
-		fi; \
-		touch $(STAGING_DIR)/.fakeroot.00000; \
-	fi
-	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
-	-find $(TARGET_DIR) -type f \( -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
-	touch $@
+copy-target-skeleton: $(TARGET_DIR)
+	cp -ua $(TARGET_SKELETON)/* $(TARGET_DIR)/ && \
+	find $(TARGET_DIR) -type f \( -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
 
-$(TARGET_DIR): $(BUILD_DIR)/.root
+$(TARGET_DIR):
+	mkdir $(TARGET_DIR)
+	rm -f $(BUILD_DIR)/*/.stamp_target_installed
+	rm -f $(QT_TARGET_DIR)/.compiled
+	rm -f $(STAMP_DIR)/gcc_libs_target_installed
 
 erase-fakeroots:
 	rm -f $(BUILD_DIR)/.fakeroot*
diff --git a/linux/linux.mk b/linux/linux.mk
index 9076fb9..0ad8c0f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -147,6 +147,9 @@ $(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/
 $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	@$(call MESSAGE,"Installing kernel")
 	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
+	$(Q)touch $@
+
+$(TARGET_DIR)/lib/modules:
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
@@ -155,9 +158,8 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build ;	\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source ;	\
 	fi
-	$(Q)touch $@
 
-linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed $(TARGET_DIR)/lib/modules
 
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
-- 
1.7.1
