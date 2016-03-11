From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:41:32 +0100
Subject: [Buildroot] [PATCH 3/9 v2] linux: meddle not in the affairs of
	filesystems, for you are tasty with bacon
In-Reply-To: <cover.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <9cef8c3fc419c6ef806d18184cf9e53c4c7323e6.1457721607.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the rule to rebuild the Linux kernel with an initramfs
directly depends on the filesystem image filename.

This is inherently "bad" from a purity point of view. linux.mk should
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

---
Changes v1 -> v2:
  - drop intermediate, unneeded stamp-file
  - drop misleading comment

---
This, too, will be useful for the initramfs patch coming next.
---
 linux/linux.mk | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ea90918..c0d760a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -438,11 +438,12 @@ endif # BR_BUILDING
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
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
@@ -451,8 +452,3 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt:
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 	# If there is a .ub file copy it to the final destination
 	test ! -f $(LINUX_IMAGE_PATH).ub || cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
-	$(Q)touch $@
-
-# The initramfs building code must make sure this target gets called
-# after it generated the initramfs list of files.
-linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
-- 
1.9.1
