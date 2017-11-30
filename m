From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:49:07 +0100
Subject: [Buildroot] [git commit branch/next] linux: meddle not in the
 internals of filesystems
Message-ID: <20171201162321.680268151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cef77a6cf5c1982d22e899f046d5e345c0271e7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, the rule to rebuild the Linux kernel with an initramfs
directly depends on the path of the file of the intermediate cpio image.

This is inherently "bad" from a purity point of view; linux.mk should
not have to delve into the fs internals.

Rather, make it directly depend on the "frontal" rule that generates the
cpio image.

Drop the comment for linux-rebuild-with-initramfs, it was misleading
(talking about generating "the initramfs list of files", which is not
what was done, since we use a cpio as source of initramfs, not a list of
files).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1c5631f..5300b9c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -484,21 +484,17 @@ endif # BR_BUILDING
 $(eval $(kconfig-package))
 
 # Support for rebuilding the kernel after the cpio archive has
-# been generated in $(BINARIES_DIR)/rootfs.cpio.
-$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed
-$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_images_installed
-$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(BINARIES_DIR)/rootfs.cpio
-$(LINUX_DIR)/.stamp_initramfs_rebuilt:
+# been generated.
+.PHONY: linux-rebuild-with-initramfs
+linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_target_installed
+linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_images_installed
+linux-rebuild-with-initramfs: rootfs-cpio
+linux-rebuild-with-initramfs:
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image(s) to its(their) final destination
 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
 	# If there is a .ub file copy it to the final destination
 	test ! -f $(LINUX_IMAGE_PATH).ub || cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
-	$(Q)touch $@
-
-# The initramfs building code must make sure this target gets called
-# after it generated the initramfs list of files.
-linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
