From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 20 Oct 2018 14:33:24 +0100
Subject: [Buildroot] [git commit] fs/common: allow custom user table to
 override package-defined users
Message-ID: <20181020133157.DFD4D83CEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3edec0018c22814233838b4e6c11c577993923d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index abf35418cb..453da6010a 100644
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
