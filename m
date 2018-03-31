From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:06 +0200
Subject: [Buildroot] [git commit] fs: remove intermediate artefacts
Message-ID: <20180331185352.A5A1283A72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=543107d390d18cd109c1a6ddc05d292cf31750d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Each of the intermediate, per-rootfs target directories, as well as the
intermediate tarball, can take quite some place, and is mostly a
duplication of what's already in target/. The only delta, if any, would
be the tweaks made by the filesystem image generations, but those tweaks
are most probably only meaningful when seen as root.

We normally do not remove intermediate files, but those can be quite
large, and are not directly usable by, nor accessible to the user.
So, get rid of them once the filesystem has been generated.

This does not need to be done in fakeroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile     | 1 +
 fs/common.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index b34dd78c73..6a3d038e66 100644
--- a/Makefile
+++ b/Makefile
@@ -753,6 +753,7 @@ endif
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
+	@rm -f $(ROOTFS_COMMON_TAR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
diff --git a/fs/common.mk b/fs/common.mk
index ba2faa7759..9baf367729 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -96,6 +96,7 @@ endif
 	$(call PRINTF,$(ROOTFS_COMMON_TAR_CMD)) >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
 	PATH=$(BR_PATH) $(HOST_DIR)/bin/fakeroot -- $(FAKEROOT_SCRIPT)
+	$(Q)rm -rf $(TARGET_DIR)
 
 rootfs-common-show-depends:
 	@echo $(ROOTFS_COMMON_DEPENDENCIES)
@@ -153,6 +154,7 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	$(Q)rm -rf $$(TARGET_DIR)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
