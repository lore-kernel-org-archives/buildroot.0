From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 27 Sep 2018 09:36:47 -0500
Subject: [Buildroot] [PATCH] fs/common: ROOTFS_USERS_TABLES has priority
Message-ID: <1538059007-36692-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the PACKAGES_USERS to be appended to the USERS_TABLES
before ROOTFS_USERS_TABLES.  This allows the ROOTFS_USERS_TABLES to
update the existing users created by packages with different settings
like home directory, pid, gid, etc.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index abf3541..453da60 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -75,10 +75,11 @@ $(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
 	echo '#!/bin/sh' > $(FAKEROOT_SCRIPT)
 	echo "set -e" >> $(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+
+	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
 ifneq ($(ROOTFS_USERS_TABLES),)
 	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
 endif
-	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
 	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
-- 
1.9.1
