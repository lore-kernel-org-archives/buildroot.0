From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:47:25 +0200
Subject: [Buildroot] [git commit] fs: run filesystem hooks under fakeroot
Message-ID: <20180331185351.6D11C84B9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=405f91200488dc8f4648acbdff5114d0af20b6b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the pre-gen hooks of the various filesystems are run before
we enter the fakeroot.

However, this precludes those hooks from doing actions that require
root, like creating a pseudo-device or the likes.

So, move those pre-gen hooks under fakeroot.

This has currently no side-effect, as they are still called before
everything else in the fakeroot script, even the system-wide chown call.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 6d579db810..274a3e9c7b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -76,9 +76,10 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	rm -rf $(FS_DIR)
 	mkdir -p $(FS_DIR)
-	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
+	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
+		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_USERS_TABLES),)
 	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
