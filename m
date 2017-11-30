From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:53:11 +0100
Subject: [Buildroot] [git commit branch/next] fs: remove
 TARGET_DIR_WARNING_FILE late
Message-ID: <20171201162321.B012B82225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b282f33cf83a18cc73365b897a912a16021d5475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove it just before generating the filesystem image.

This way, removing-and-recreating the file encloses the actual
image generation as tightly as possible.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 378907e..d4d5c18 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -70,7 +70,6 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
-	rm -f $$(TARGET_DIR_WARNING_FILE)
 	rm -f $$(USERS_TABLE)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
@@ -100,6 +99,7 @@ endif
 	$$(foreach hook,$$(ROOTFS_POST_CMD_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	chmod a+x $$(FAKEROOT_SCRIPT)
+	rm -f $$(TARGET_DIR_WARNING_FILE)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
