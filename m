From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:52:50 +0100
Subject: [Buildroot] [git commit branch/next] fs/common: get rid of
 post-target rules
Message-ID: <20171201162321.A22DA82225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=207c596ad7669c6f09bebf83450e20bdba191631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The only users of post-target rules were ext2, cpio and initramfs.

Of those, ext2 and cpio were changed to use post-gen hooks, while
initramfs was not even using the generic rootfs infra and was fixed
to no longer reference post-target rules.

Besides, the comment in the infra was really misleading: it referenced
initramfs implying it was the sole user of that feature, even though
initramfs was not using the fs infra.

Furthermore, using post-target rules was inherently broken for top-level
parallel builds, because filesystems had to ensure the ordering by
themselves. Of the two real users of post-target rules (cpio and ext2),
one did enforce rules ordering (apparently correctly), while the other
forgot to do so.

We can get rid of post-target rules altogether, now.

Add a legacy check, to catch out-of-tree (e.g. br2-external) users of
post-target rules, and instruct them to switch to post-gen hooks instead.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 5b612a3..378907e 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -19,10 +19,6 @@
 #  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
 #  generating the filesystem image
 #
-#  ROOTFS_$(FSTYPE)_POST_TARGETS, the list of targets that should be
-#  run after running the main filesystem target. This is useful for
-#  initramfs, to rebuild the kernel once the initramfs is generated.
-#
 # In terms of configuration option, this macro assumes that the
 # BR2_TARGET_ROOTFS_$(FSTYPE) config option allows to enable/disable
 # the generation of a filesystem image of a particular type. If
@@ -115,7 +111,7 @@ endif
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
-rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
+rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
 
 .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
 
@@ -123,6 +119,13 @@ ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
 PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
 endif
+
+# Check for legacy POST_TARGETS rules
+ifneq ($$(ROOTFS_$(2)_POST_TARGETS),)
+$$(error Filesystem $(1) uses post-target rules, which are no longer supported.\
+	Update $(1) to use post-gen hooks instead)
+endif
+
 endef
 
 define ROOTFS_TARGET
