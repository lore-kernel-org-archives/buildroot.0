From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu,  8 Aug 2013 10:47:14 +0200
Subject: [Buildroot] [PATCH v2] Standardisation of $(BUILD)/.root name
Message-ID: <1375951634-15323-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be coherent with stamps used by toolchains, file $(BUILD)/.root is now named
$(STAMPS)/target-skeleton-installed.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Finally, I placed $(STAMP_DIR) before $(TARGET_DIR) in dirs rule. It 
 is weak, and I dislike this solution. Although, there was already the 
 same issue between BUILD_DIR and TARGET_DIR. So this code is not wore 
 than previous one.

 Makefile |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index fcfc0be..1281f27 100644
--- a/Makefile
+++ b/Makefile
@@ -392,8 +392,8 @@ TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
-dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+dirs: $(BUILD_DIR) $(STAGING_DIR) $(STAMP_DIR) \
+	$(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR)
 
 $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
 
@@ -434,7 +434,7 @@ ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
 endif
 
-$(BUILD_DIR)/.root:
+$(STAMP_DIR)/skeleton-target-installed:
 	mkdir -p $(TARGET_DIR)
 	rsync -a \
 		--exclude .empty --exclude .svn --exclude .git \
@@ -443,7 +443,7 @@ $(BUILD_DIR)/.root:
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	touch $@
 
-$(TARGET_DIR): $(BUILD_DIR)/.root
+$(TARGET_DIR): $(STAMP_DIR)/skeleton-target-installed
 
 STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
-- 
1.7.9.5
