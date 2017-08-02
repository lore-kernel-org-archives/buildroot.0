From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:31:41 +0200
Subject: [Buildroot] [git commit] package/skeleton-common: simplify staging
	install
Message-ID: <20170802172734.E9B94800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=175a96c4909104bde706fa0e1f9010af8b252caa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't really care what's going in staging, as long as it is properly
setup for merged/non-merged /usr, especially for the lib/ directory.

So we can just copy the skeleton as-is.

This simplifies maintenance, should we ever need to tweak the layout:
we'd just have to do it once in the skeleton directory to have it
propagated to both target and staging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton-common/skeleton-common.mk | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
index e3a52dc..bf75077 100644
--- a/package/skeleton-common/skeleton-common.mk
+++ b/package/skeleton-common/skeleton-common.mk
@@ -26,17 +26,14 @@ define SKELETON_COMMON_INSTALL_TARGET_CMDS
 		$(TARGET_DIR_WARNING_FILE)
 endef
 
-# For the staging dir, we don't really care about /bin and /sbin.
-# But for consistency with the target dir, and to simplify the code,
-# we still handle them for the merged or non-merged /usr cases.
-# Since the toolchain is not yet available, the staging is not yet
-# populated, so we need to create the directories in /usr
+# We don't care much about what goes in staging, as long as it is
+# correctly setup for merged/non-merged /usr. The simplest is to
+# fill it in with the content of the skeleton.
 define SKELETON_COMMON_INSTALL_STAGING_CMDS
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
+	$(call SYSTEM_RSYNC,$(SKELETON_COMMON_PATH),$(STAGING_DIR))
 	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
 	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
 endef
 
 SKELETON_COMMON_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
