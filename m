From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  5 Feb 2018 09:42:32 +0100
Subject: [Buildroot] [PATCH 14/15 v2] fs: get rid of package-provided
 post-fs hooks
In-Reply-To: <cover.1517820133.git.yann.morin.1998@free.fr>
References: <cover.1517820133.git.yann.morin.1998@free.fr>
Message-ID: <c1f98b84002cbf0b9b65ab92bb75c32681657376.1517820133.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the pre-fs ones are run on a transient copy of target/, the
post-fs hooks are no longer needed because we no longer need to restore
the target/ directory as it is only a internal copy.

Remove support for the post-fs hooks, and update the sole package using
them.

Unlike for the pre-/post-gen hooks, we do not add a legacy check because
this was mostly a purely-internal detail that was never really exposed
nor documented.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk                                           | 2 --
 package/pkg-generic.mk                                 | 2 --
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 6 ------
 3 files changed, 10 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 8bb26f1146..bacc98ec68 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -94,8 +94,6 @@ endif
 	$(foreach hook,$(ROOTFS_PRE_CMD_HOOKS),\
 		$(call PRINTF,$($(hook))) >> $(FAKEROOT_SCRIPT)$(sep))
 	$(call PRINTF,$(ROOTFS_COMMON_TAR_CMD)) >> $(FAKEROOT_SCRIPT)
-	$(foreach hook,$(ROOTFS_POST_CMD_HOOKS),\
-		$(call PRINTF,$($(hook))) >> $(FAKEROOT_SCRIPT)$(sep))
 	chmod a+x $(FAKEROOT_SCRIPT)
 	PATH=$(BR_PATH) $(HOST_DIR)/bin/fakeroot -- $(FAKEROOT_SCRIPT)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cb30d29f89..c7e6f72461 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -637,7 +637,6 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
-$(2)_ROOTFS_POST_CMD_HOOKS      ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -948,7 +947,6 @@ PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
 TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
-ROOTFS_POST_CMD_HOOKS += $$($(2)_ROOTFS_POST_CMD_HOOKS)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index a2d4e8c4b3..7da801ac4e 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -54,12 +54,6 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 endef
 SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 
-define SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
-	rm -rf $(TARGET_DIR)/var
-	ln -s usr/share/factory/var $(TARGET_DIR)/var
-endef
-SKELETON_INIT_SYSTEMD_ROOTFS_POST_CMD_HOOKS += SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
-
 endif
 
 define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
-- 
2.14.1
