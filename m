From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:33:08 +0200
Subject: [Buildroot] [git commit] Makefile: make skeleton rsync options
	consistent
Message-ID: <20130502213333.9D50799A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e97376a0fc018970f7a166f183d3817a6b1bfaf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Initially, a "cp" was used for the one-time target skeleton
installation, and an "rsync" was used for the every-time overlay
skeleton installations.  Then, the target skeleton install was
changed to also use rsync (1cd3f992fb3659aacbb0cdd3ed64347a37569891).
Now there are two rsyncs, but with different filter specs, which
seems odd.

This patch adds --excludes to both invocations of rsync to make them
consistent, and removes the -u option from the initial target skeleton
installation.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 97804ff..5b690f0 100644
--- a/Makefile
+++ b/Makefile
@@ -429,7 +429,9 @@ endif
 
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-	rsync -au --exclude=.empty --exclude=CVS --exclude=.svn --exclude='*~' \
+	rsync -a \
+		--exclude .empty --exclude .svn --exclude .git \
+		--exclude .hg --exclude=CVS --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	touch $@
@@ -505,7 +507,7 @@ endif
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a \
 			--exclude .empty --exclude .svn --exclude .git \
-			--exclude .hg --exclude '*~' \
+			--exclude .hg --exclude=CVS --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
