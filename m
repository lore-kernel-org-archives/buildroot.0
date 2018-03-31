From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:06 +0200
Subject: [Buildroot] [git commit] fs: new intermediate rootfs-common to
 gather common dependencies
Message-ID: <20180331185352.3BDE384BBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98d1e7f9287405cd8848300932555c176eae6423
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before we can create an intermediate tarball for all filesystems, we
nedd to move the common dependencies needed to generate that
intermediate tarball, rather than leave those dependencies to each
filesystem.

So, we introduce rootfs-common, which gathers all those common
dependencies.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 22e18d1eff..a6ab6c6795 100644
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
@@ -41,9 +59,7 @@ define inner-rootfs
 ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
 ROOTFS_$(2)_TARGET_DIR = $$(BASE_TARGET_DIR)
 
-# extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
-	$$(if $$(PACKAGES_USERS)$$(ROOTFS_USERS_TABLES),host-mkpasswd)
+ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
@@ -76,7 +92,6 @@ endif
 
 $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 $$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
-$$(BINARIES_DIR)/rootfs.$(1): target-finalize
 $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	rm -rf $(FS_DIR) $$(ROOTFS_$(2)_DIR)
