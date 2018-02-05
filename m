From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Feb 2018 09:42:19 +0100
Subject: [Buildroot] [PATCH 01/15 v2] fs: run filesystem hooks under fakeroot
In-Reply-To: <cover.1517820133.git.yann.morin.1998@free.fr>
References: <cover.1517820133.git.yann.morin.1998@free.fr>
Message-ID: <f80a988cc55526ac9dd56842ddc6de6f77901064.1517820133.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.14.1
