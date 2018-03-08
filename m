From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 Mar 2018 22:15:39 +0100
Subject: [Buildroot] [PATCH 15/15 v3] fs: remove intermediate artefacts
In-Reply-To: <cover.1520543724.git.yann.morin.1998@free.fr>
References: <cover.1520543724.git.yann.morin.1998@free.fr>
Message-ID: <fa877c5eefa966867f045f6b37a9e568eb019dbd.1520543724.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Each of the intermediate, per-rootfs target directories, as well as the
intermediate tarball, can take quite some place, and is mostly a
duplication of what's already in target/. The only delta, if any, would
be the tweaks made by the filesystem image generations, but those tweaks
are most probably only meaningfull when seen as root.

We normally do not remove intermediate files, but those can be quite
large, and are not directly usable by, nor accessible to the user.
So, get rid of them once the filesystem has been generated.

This does not need to be done in fakeroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 Makefile     | 1 +
 fs/common.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 0c872568d5..cc3f983655 100644
--- a/Makefile
+++ b/Makefile
@@ -769,6 +769,7 @@ endif
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
+	@rm -f $(ROOTFS_COMMON_TAR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
diff --git a/fs/common.mk b/fs/common.mk
index bacc98ec68..2ee130ee08 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -96,6 +96,7 @@ endif
 	$(call PRINTF,$(ROOTFS_COMMON_TAR_CMD)) >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
 	PATH=$(BR_PATH) $(HOST_DIR)/bin/fakeroot -- $(FAKEROOT_SCRIPT)
+	$(Q)rm -rf $(TARGET_DIR)
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
@@ -154,6 +155,7 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	$(Q)rm -rf $$(TARGET_DIR)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
-- 
2.14.1
