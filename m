From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Aug 2017 00:52:15 +0200
Subject: [Buildroot] [PATCH v5 05/14] package/skeleton-custom: simplify
	target/staging install
In-Reply-To: <20170801225224.16899-1-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
Message-ID: <20170801225224.16899-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For target install, we don't need to check the merged-usr symlinks
any more, it was already checked before.

For staging, instead of creating directories, just copy the same
skeleton, which was already checked to be correct.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: split off in a separate patch + wrote commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5: (Arnout)
 - New patch (split off from the previous one)
---
 package/skeleton-custom/skeleton-custom.mk | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index df46b72c4c..6e9d52620b 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -85,24 +85,21 @@ $(error The custom skeleton in $(SKELETON_CUSTOM_PATH) is not \
 endif
 endif
 
+# The target-dir-warning file and the lib{32,64} symlinks are the only
+# things we customise in the custom skeleton.
 define SKELETON_CUSTOM_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(TARGET_DIR))
-	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
 endef
 
-# For the staging dir, we don't really care about /bin and /sbin.
-# But for consistency with the target dir, and to simplify the code,
-# we still handle them for the merged or non-merged /usr cases.
-# Since the toolchain is not yet available, the staging is not yet
-# populated, so we need to create the directories in /usr
+# For the staging dir, we don't really care what we install, but we
+# need the /lib and /usr/lib appropriately setup. Since we ensure,
+# above, that they are correct in the skeleton, we can simply copy the
+# skeleton to staging.
 define SKELETON_CUSTOM_INSTALL_STAGING_CMDS
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
-	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
+	$(call SYSTEM_RSYNC,$(SKELETON_CUSTOM_PATH),$(STAGING_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
 endef
 
-- 
2.13.3
