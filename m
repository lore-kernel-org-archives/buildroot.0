From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 23 Oct 2018 22:01:49 -0300
Subject: [Buildroot] [PATCH] fs: allow filesystems to set the name of their
 output file
In-Reply-To: <20181021132626.GA23085@scaer>
References: <20181021132626.GA23085@scaer>
Message-ID: <20181024010149.3970-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some filesystems may want to tweak their output names, rather than using
the fixed "rootfs.foo" scheme. Add a ROOTFS_FOO_IMAGE_NAME variable for
this purpose and document it.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
NOTE: https://patchwork.ozlabs.org/patch/927116/ must be upated to
document this.
---
 fs/common.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 453da6010a..22ca56a1ff 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,6 +106,7 @@ rootfs-common-show-depends:
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
 
+ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
 ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
 
@@ -140,10 +141,10 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
-$$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
-$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
-$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
-	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): ROOTFS=$(2)
+$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
+$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
+	@$$(call MESSAGE,"Generating filesystem image $$(ROOTFS_$(2)_IMAGE_NAME)")
 	rm -rf $$(ROOTFS_$(2)_DIR)
 	mkdir -p $$(ROOTFS_$(2)_DIR)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
@@ -164,7 +165,7 @@ endif
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
 
-rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
+rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME)
 
 .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
 
-- 
2.17.1
