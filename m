From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 20:58:27 +0200
Subject: [Buildroot] [git commit] fs: add pre- and post-command hooks
Message-ID: <20170802185638.E9F85821F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4628b6f3b4512ec7cfb3c08ad4fe0ec40e1c5cc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some cases, the directory structure we want in the filesystem is not
exactly what we have in target/

For example, when systemd is used on a read-only rootfs, /var must be a
tmpfs. However, we may have packages that install stuff in there, and
set important rights (via the permission-table). So, at build time, we
need /var to be a symlink to the remanent location (/usr/share/factory)
while at runtime we need /var to be a directory.

One option would have been to have /var as a real directory even during
build time, and in a target-finalize hook, move everything out of there
and into the "factory" location. However, that's not possible because
it's too early: some packages may want to set ownership and/or acces
rights on directories or files in /var, and this is only done in the
fakeroot script, which is called only later during the assembling of the
filesystem images.

Also, there would have been no way to undo the tweak (i.e. we need to
restore the /var symlink so that subsequent builds continue to work) if
it were done as a target-finalize hook.

The only solution is to allow packages to register pre- and post-hooks
that are called right before and right after the rootfs commands are
executed, and inside in the fakeroot script.

We can however not re-use the BR2_ROOTFS_POST_FAKEROOT_SCRIPT feature
either because it is done before the filesystem command, but there is
nothing that is done after. Also, we don't want to add to, and modify a
user-supplied variable.

So, we introduce two new variables that packages can set to add the
commands they need to run to tweak the filesystem right at the last
moment.

Those hooks are not documented on-purpose; they are probably going to
only ever be used by systemd.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk           | 4 ++++
 package/pkg-generic.mk | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 14e0a6b..9a7758f 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -95,10 +95,14 @@ endif
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
+	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
+		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT))
 ifeq ($$(BR2_REPRODUCIBLE),y)
 	echo "find $$(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$$(SOURCE_DATE_EPOCH)" >> $$(FAKEROOT_SCRIPT)
 endif
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
+	$$(foreach hook,$$(ROOTFS_POST_CMD_HOOKS),\
+		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT))
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f17f110..ae03051 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -612,6 +612,8 @@ $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
 $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
+$(2)_ROOTFS_PRE_CMD_HOOKS       ?=
+$(2)_ROOTFS_POST_CMD_HOOKS      ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -931,6 +933,8 @@ ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
 TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
+ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
+ROOTFS_POST_CMD_HOOKS += $$($(2)_ROOTFS_POST_CMD_HOOKS)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
