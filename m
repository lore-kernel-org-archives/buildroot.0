From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Aug 2017 12:31:55 +0200
Subject: [Buildroot] [git commit] package/skeleton-common: fix recursive
	variable
Message-ID: <20170803102856.C43B9821FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9682fcaf465cfeb56cbdf06c85b32d378032799e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a recursive variable definition introduced by the refactoring
in commit 120307520f69f801bf05df1d2fd3433c6d498551. Simply rename the
hook to remove the recursion.

Fixes https://bugs.busybox.net/show_bug.cgi?id=10146

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 package/skeleton-common/skeleton-common.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
index e9b87c3..e94dd6e 100644
--- a/package/skeleton-common/skeleton-common.mk
+++ b/package/skeleton-common/skeleton-common.mk
@@ -75,16 +75,16 @@ endef
 SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_ROOT_PASSWD
 
 ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
-define SKELETON_COMMON_BIN_SH
+define SKELETON_COMMON_SET_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
 endef
 else
 ifneq ($(SKELETON_COMMON_BIN_SH),)
-define SKELETON_COMMON_BIN_SH
+define SKELETON_COMMON_SET_BIN_SH
 	ln -sf $(SKELETON_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
 endef
 endif
 endif
-SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_BIN_SH
+SKELETON_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_COMMON_SET_BIN_SH
 
 $(eval $(generic-package))
