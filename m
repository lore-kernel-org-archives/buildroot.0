From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Apr 2013 22:37:18 +0200
Subject: [Buildroot] [git commit] rootfs-overlay: use a make foreach instead
	of a shell for
Message-ID: <20130430203700.7BB3F994DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9b771283765e74792df6a05775383f6d4da2636
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Makes the code uniform with the post-build and post-image implementation
(which is slightly simpler and, presumably, more efficient).

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 840aa1f..97804ff 100644
--- a/Makefile
+++ b/Makefile
@@ -501,13 +501,12 @@ endif
 		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 	) >  $(TARGET_DIR)/etc/os-release
 
-	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
-		$(call MESSAGE,"Copying overlay $${dir}"); \
+	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
+		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a \
 			--exclude .empty --exclude .svn --exclude .git \
 			--exclude .hg --exclude '*~' \
-			$${dir}/ $(TARGET_DIR); \
-	done
+			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
