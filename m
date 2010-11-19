From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 15:05:20 +0100
Subject: [Buildroot] [git commit master 1/1] fs: rename make targets to
	match package/ convention
Message-ID: <20101119141256.2FB268D2FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a0cb991b715ecc490b77533d49d24424b9d11a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use rootfs-* rather than *-root, to match the convention used under
package/ and which fits with the ROOTFS_*_ variables.

This will also help with the host dependencies.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/common.mk          |    6 +++---
 fs/iso9660/iso9660.mk |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 74e9ce0..f9dabab 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -61,13 +61,13 @@ ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 	$(LZMA) -9 -c $$@ > $$@.lzma
 endif
 
-$(1)-root-show-depends:
+rootfs-$(1)-show-depends:
 	@echo $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
 
-$(1)-root: $(BINARIES_DIR)/rootfs.$(1) $(ROOTFS_$(2)_POST_TARGETS)
+rootfs-$(1): $(BINARIES_DIR)/rootfs.$(1) $(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
-TARGETS += $(1)-root
+TARGETS += rootfs-$(1)
 endif
 endef
 
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 6f60893..2a5288c 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
 ISO9660_OPTS+=-U
 endif
 
-$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 ext2-root grub
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 rootfs-ext2 grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
@@ -37,7 +37,7 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26 ext2-root grub
 	- at rm -f $(FAKEROOT_SCRIPT)
 	- at rm -rf $(ISO9660_TARGET_DIR)
 
-iso9660-root: $(BINARIES_DIR)/rootfs.iso9660
+rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 
 #############################################################
 #
@@ -45,5 +45,5 @@ iso9660-root: $(BINARIES_DIR)/rootfs.iso9660
 #
 #############################################################
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
-TARGETS+=iso9660-root
+TARGETS+=rootfs-iso9660
 endif
-- 
1.7.2.2
