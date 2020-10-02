From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:37:34 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] fs/common.mk: move
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT after pre cmd hooks
Message-ID: <20201002085305.818838444A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39403f58ed50f64129cac73675c3892f390babba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

The fakeroot script does not appear to be used in any of the checked
in defconfig targets, but it seems that most often the post
fakeroot script should be done after all the packages rules have
been applied instead of before.

Given that a change in systemd moved the SYSTEMD_PRESET_ALL hook to
a ROOTFS_PRE_CMD_HOOKS, there was no way to use a FAKEROOT script
to disable a service or fixup a systemd configuration. The systemd
move makes sense, and this just tries to preserve the same ability
to fixup a rootfs after all the cmd hooks are processed.

Refer to commit 65b63785a642bbc565924edf365b5d7c080f961c for
the change that instigated this reordering.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4bc4dbd630b50ce077f60d4ebbcb33e6b55fe15a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 842ea924a5..5e790365d6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -163,11 +163,11 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FULL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_FULL_DEVICES_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
+	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
+		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
-	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
-		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
