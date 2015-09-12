From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Sep 2015 16:31:55 +0200
Subject: [Buildroot] [PATCH] host-gcc-final: don't install a dead symlink
Message-ID: <1442068315-23186-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nothing is installed into $(HOST_DIR)/usr/$(GNU_TARGET_NAME) by
host-gcc-final (only by binutils), so no 'gcc' executable exists
there. Therefore, the cc -> gcc symlink that is created in that
directory is dead.

Since this was not working, the symlink is clearly not needed, so
remove its installation command.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/gcc-final/gcc-final.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 86b3c78..3426ba4 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -92,9 +92,6 @@ define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
 		ln -snf $(GNU_TARGET_NAME)-gcc \
 			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
-		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
-	fi
 endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
-- 
2.5.1
