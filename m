From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:02:35 +0200
Subject: [Buildroot] [git commit] Makefile: don't depend on current
	skeleton/overlay permissions
Message-ID: <20150713150331.1235581955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=361d3573f5373618b2c566e250430269dd7200e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use 'rsync -a' to copy the skeleton and overlays, so the target ends
up with the exact same permissions as on the repo. The problem is we
don't track these permissions, since Git doesn't allow for that (except
for the exec bit). This means users with different umasks at the time of
cloning could end up with different target permissions.

Fix this by using --chmod on rsync calls so we don't depend on the
current permission set for the skeleton and overlays. We do depend on
the exec bit, but that's fine since that one is tracked by Git.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 55b1d45..546bcd3 100644
--- a/Makefile
+++ b/Makefile
@@ -473,7 +473,7 @@ RSYNC_VCS_EXCLUSIONS = \
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-		--chmod=Du+w --exclude .empty --exclude '*~' \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
@@ -617,7 +617,7 @@ endif
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-			--chmod=Du+w --exclude .empty --exclude '*~' \
+			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
