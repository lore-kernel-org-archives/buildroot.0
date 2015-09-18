From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 18 Sep 2015 23:44:26 +0200
Subject: [Buildroot] [PATCH v2] host-gcc-final: don't install a potentially
	dead symlink
Message-ID: <1442612666-19806-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc used to be installed into $(HOST_DIR)/usr/$(GNU_TARGET_NAME) but
since gcc 4.9 this is no longer the case.  Therefore, the cc -> gcc
symlink that is created in that we create in that directory is dead.

There don't seem to have been any problems due to the missing gcc and
cc in $(HOST_DIR)/usr/$(GNU_TARGET_NAME), things seems to build fine
without it. The cc -> gcc symlinks in general should not be needed
anyway, since we always pass the appropriate CC variable to the
package build system.

Therefore, let's remove the cc -> gcc symlink in
$(HOST_DIR)/usr/$(GNU_TARGET_NAME) - also for pre-4.9 gcc versions.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
In addition to the explanation above, this patch is also preparation
for an upcoming patch series that implements the wrapper for the
internal toolchain. All the -gcc, -cc and -g++ instances have to be
symlinked to the wrapper, and the original (even if it was already
a symlink) has to be moved to *.real. So removing this redundant
thing helps keeping the internal toolchain wrapper implementation
a little simpler.

I'll repost this patch as part of that series, but since it can be
committed indepedently I already have it here.

Patch changelog:
v2: Rewrote the commit message, after a comment from Thomas P. that
    $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/gcc actually exists.
---
 package/gcc/gcc-final/gcc-final.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 3336ed3..c31c80e 100644
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
