From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 15:05:20 +0100
Subject: [Buildroot] [git commit master 1/1] fs: add extra deps to
	ROOTFS_*_DEPENDENCIES variables
Message-ID: <20101119141256.5C3BA8D2FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=094b2938039d9e12323e2f29a59ce6293411dd28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of explicitly adding it both places it is used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/common.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index f9dabab..92be00c 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -36,7 +36,10 @@ ROOTFS_DEVICE_TABLE = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
-$(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
+# extra deps
+$(eval ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma))
+
+$(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
 	rm -f $(FAKEROOT_SCRIPT)
@@ -62,7 +65,7 @@ ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 endif
 
 rootfs-$(1)-show-depends:
-	@echo $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
+	@echo $(ROOTFS_$(2)_DEPENDENCIES)
 
 rootfs-$(1): $(BINARIES_DIR)/rootfs.$(1) $(ROOTFS_$(2)_POST_TARGETS)
 
-- 
1.7.2.2
