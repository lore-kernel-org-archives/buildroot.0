From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Dec 2018 10:14:36 +0100
Subject: [Buildroot] [PATCHv4] fs: allow filesystems to set the name of
 their output file
Message-ID: <20181201091436.7896-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.com.br>

Some filesystems may want to tweak their output names, rather than using
the fixed "rootfs.foo" scheme. Add a ROOTFS_FOO_IMAGE_NAME variable for
this purpose.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
[yann.morin.1998 at free.fr: fix the patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v3 -> v4 (Yann):
  - fix use of $(strip)
Changes v2->v3 (Carlos):
  - Fix typo and use strip instead of qstrip, as spotted by Yann Morin.
Changes v1->v2 (Carlos):
  - Prevent leading space when the filesystem gets 'imaginative', as
    pointed by Yann Morin.
---
 fs/common.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index e4a6a4897b..20bf0941aa 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -70,6 +70,8 @@ rootfs-common-show-depends:
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
 
+ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
+ROOTFS_$(2)_FINAL_IMAGE_NAME = $$(strip $$(ROOTFS_$(2)_IMAGE_NAME))
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
 ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
 
@@ -104,10 +106,10 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
-$$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
-$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
-$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
-	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+$$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): ROOTFS=$(2)
+$$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
+$$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
+	@$$(call MESSAGE,"Generating filesystem image $$(ROOTFS_$(2)_FINAL_IMAGE_NAME)")
 	rm -rf $$(ROOTFS_$(2)_DIR)
 	mkdir -p $$(ROOTFS_$(2)_DIR)
 	rsync -auH \
@@ -142,7 +144,7 @@ endif
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
-rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
+rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME)
 
 .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
 
-- 
2.14.1
