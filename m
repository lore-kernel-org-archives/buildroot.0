From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 Mar 2018 22:15:34 +0100
Subject: [Buildroot] [PATCH 10/15 v3] fs: new intermediate rootfs-common to
 gather common dependencies
In-Reply-To: <cover.1520543724.git.yann.morin.1998@free.fr>
References: <cover.1520543724.git.yann.morin.1998@free.fr>
Message-ID: <0d959e865195504f305699fe9a4e2b27a2f0f850.1520543724.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before we can create an intermediate tarball for all filesystems, we
nedd to move the common dependencies needed to generate that
intermediate tarball, rather than levae those dependencies to each
filesystem.

So, we introduce rootfs-common, which gathers all those common
dependencies.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 fs/common.mk | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 363798bb20..3505a32e5d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -34,6 +34,24 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
 USERS_TABLE = $(FS_DIR)/users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+ROOTFS_COMMON_TAR = $(FS_DIR)/rootfs.common.tar
+
+.PHONY: rootfs-common
+rootfs-common: $(ROOTFS_COMMON_TAR)
+
+ROOTFS_COMMON_DEPENDENCIES = \
+	host-fakeroot host-makedevs \
+	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
+
+.PHONY: $(ROOTFS_COMMON_TAR)
+# When doing the common tarball, we're not really doing a rootfs.
+$(ROOTFS_COMMON_TAR): ROOTFS=
+$(ROOTFS_COMMON_TAR): $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
+	@:
+
+rootfs-common-show-depends:
+	@echo $(ROOTFS_COMMON_DEPENDENCIES)
+
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
 define inner-rootfs
@@ -42,9 +60,7 @@ ROOTFS_$(2)_NAME = $(1)
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
 ROOTFS_$(2)_TARGET_DIR = $$(BASE_TARGET_DIR)
 
-# extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
-	$$(if $$(PACKAGES_USERS)$$(ROOTFS_USERS_TABLES),host-mkpasswd)
+ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
@@ -77,7 +93,6 @@ endif
 
 $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 $$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
-$$(BINARIES_DIR)/rootfs.$(1): target-finalize
 $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	rm -rf $(FS_DIR) $$(ROOTFS_$(2)_DIR)
-- 
2.14.1
