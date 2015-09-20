From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:35:27 +0200
Subject: [Buildroot] [git commit] host-gcc-final: don't install a
	potentially dead symlink
Message-ID: <20150920123532.91917817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d475da9a0037bc6efbdeb482e2f678bb8089e70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

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
