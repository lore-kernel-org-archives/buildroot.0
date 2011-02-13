From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 13 Feb 2011 21:09:05 +0100
Subject: [Buildroot] [PATCH] Makefile: improve $(TARGET_DIR) (re)creation
Message-ID: <1297627745-17087-1-git-send-email-bjorn.forsman@gmail.com>
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
 * Always copy $(TARGET_SKELETON). This is the easiest way to ensure
   $(TARGET_DIR) has the latest skeleton.
 * If $(TARGET_DIR) needs to be created (i.e. if the directory is
   missing), remove $(BUILD_DIR)/*/.stamp_target_installed files so
   all currently selected packages will be reinstalled.

Also:
 * remove code touching .fakeroot.00000 file (not needed)
 * remove code trying to remove CVS and .svn stuff from target skeleton
   (not needed)

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
Applies on top of "[PATCH] Makefile: remove dead code (TARGET_SKELETON_PATCH)"
which I sent 12 Feb.

 Makefile |   25 ++++++++++---------------
 1 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 111fbd6..157e29f 100644
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
@@ -416,19 +417,13 @@ ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
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
+	mkdir $(TARGET_DIR) && \
+	rm -f $(BUILD_DIR)/*/.stamp_target_installed
 
 erase-fakeroots:
 	rm -f $(BUILD_DIR)/.fakeroot*
-- 
1.7.1
