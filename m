From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  8 Apr 2013 18:50:16 +0200
Subject: [Buildroot] [PATCH v2 3/3] rootfs-overlay: use a make foreach
	instead of a shell for
In-Reply-To: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1365439816-6935-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makes the code uniform with the post-build and post-image implementation
(which is slightly simpler and, presumably, more efficient).

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f475d1b..a3b98f3 100644
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
 		$(call MESSAGE,"Executing  post-build script $(s)"); \
-- 
1.7.10.4
