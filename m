From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri,  7 Nov 2014 00:50:35 -0300
Subject: [Buildroot] [PATCH v2 2/5] Makefile: don't depend on current
	skeleton/overlay permissions
In-Reply-To: <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1415332238-31677-3-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use 'rsync -a' to copy the skeleton and overlays, so the target ends
up with the exact same permissions as on the repo. The problem is we
don't track these permissions, since Git doesn't allow for that (except
for the exec bit). This means users with different umasks at the time of
cloning could end up with different target permissions.

Fix this by using --chmod on rsync calls so we don't depend on the
current permission set for the skeleton and overlays. We do depend on
the exec bit, but that's fine since that one is tracked by Git.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d9f1fb0..0f7db1e 100644
--- a/Makefile
+++ b/Makefile
@@ -477,7 +477,7 @@ RSYNC_VCS_EXCLUSIONS = \
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-		--chmod=Du+w --exclude .empty --exclude '*~' \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
@@ -613,7 +613,7 @@ endif
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-			--chmod=Du+w --exclude .empty --exclude '*~' \
+			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-- 
2.1.1
