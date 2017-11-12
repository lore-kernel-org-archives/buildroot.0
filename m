From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 18:45:46 +0100
Subject: [Buildroot] [PATCH 08/14] fs: remove TARGET_DIR_WARNING_FILE late
In-Reply-To: <cover.1510508733.git.yann.morin.1998@free.fr>
References: <cover.1510508733.git.yann.morin.1998@free.fr>
Message-ID: <37cdd5eac486a60b2657a8a0e53fcf6bedac976e.1510508733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove it just before generating the filesystem image.

This way, removing-and-recreating the file encloses the actual
image generation as tightly as possible.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 378907e9ed..d4d5c183a5 100644
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
-- 
2.11.0
