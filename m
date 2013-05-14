From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 14 May 2013 16:30:50 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <50FACA8F.1040503@mind.be>
References: <50FACA8F.1040503@mind.be>
Message-ID: <1368541851-31089-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be coherent with stamps used by toolchains, file $(BUILD)/.root is now named
$(STAMPS)/target-skeleton-installed.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a57975e..73a7c01 100644
--- a/Makefile
+++ b/Makefile
@@ -429,16 +429,17 @@ ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
 endif
 
-$(BUILD_DIR)/.root:
+$(STAMP_DIR)/skeleton-target-installed:
 	mkdir -p $(TARGET_DIR)
 	rsync -a \
 		--exclude .empty --exclude .svn --exclude .git \
 		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
+	mkdir -p $(STAMP_DIR)
 	touch $@
 
-$(TARGET_DIR): $(BUILD_DIR)/.root
+$(TARGET_DIR): $(STAMP_DIR)/skeleton-target-installed
 
 STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
-- 
1.7.9.5
