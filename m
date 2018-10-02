From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  2 Oct 2018 18:02:20 -0500
Subject: [Buildroot] [PATCH v2] fs/common: allow custom user table to
 override package-defined users
Message-ID: <1538521340-25386-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when a custom user table and a package define the same user,
the settings from the package takes precedence over the ones from the
custom user table.

However, it makes sense to allow the settings from the custom user table
take precedence. For example, it would allow redirecting the user's
home directory to an alternate location (e.g. away from tmp and into a
partition that is persistent).

The support/scripts/mkusers script will only retain settings from the
latest definition it finds.

Thus, by passing the custom user table after the package defined users,
it is possible to override the package provided user definitions.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Change v1 -> v2
[Yann
 - Updated commit message
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
