From: Cam Hutchison <camh@xdna.net>
Date: Mon, 14 Aug 2017 07:21:10 +1000
Subject: [Buildroot] [PATCH v2 2/4] skeleton: Rename skeleton-systemd to
	skeleton-init-systemd
In-Reply-To: <20170813212112.7873-1-camh@xdna.net>
References: <20170813212112.7873-1-camh@xdna.net>
Message-ID: <20170813212112.7873-3-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The skeletons are based on the selection of BR2_INIT_*, so add init- to
the package name to make this clearer. While skeleton-systemd is
relatively clear, skeleton-common and skeleton-none are less clear on
their relationship to BR2_INIT_*. So rename skeleton-systemd to conform
to clearer pattern.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 package/Config.in                                  |  2 +-
 .../Config.in                                      |  4 ++--
 .../skeleton-init-systemd.mk}                      | 26 +++++++++++-----------
 system/Config.in                                   |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)
 rename package/{skeleton-systemd => skeleton-init-systemd}/Config.in (50%)
 rename package/{skeleton-systemd/skeleton-systemd.mk => skeleton-init-systemd/skeleton-init-systemd.mk} (72%)

diff --git a/package/Config.in b/package/Config.in
index b48eac65ca..4bdfeeaedd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -5,7 +5,7 @@ menu "Target packages"
 	source "package/skeleton-common/Config.in"
 	source "package/skeleton-custom/Config.in"
 	source "package/skeleton-init-none/Config.in"
-	source "package/skeleton-systemd/Config.in"
+	source "package/skeleton-init-systemd/Config.in"
 	source "package/skeleton-sysv/Config.in"
 
 menu "Audio and video applications"
diff --git a/package/skeleton-systemd/Config.in b/package/skeleton-init-systemd/Config.in
similarity index 50%
rename from package/skeleton-systemd/Config.in
rename to package/skeleton-init-systemd/Config.in
index c507264598..2d8845c281 100644
--- a/package/skeleton-systemd/Config.in
+++ b/package/skeleton-init-systemd/Config.in
@@ -1,7 +1,7 @@
-config BR2_PACKAGE_SKELETON_SYSTEMD
+config BR2_PACKAGE_SKELETON_INIT_SYSTEMD
 	bool
 	select BR2_PACKAGE_HAS_SKELETON
 	select BR2_PACKAGE_SKELETON_COMMON
 
 config BR2_PACKAGE_PROVIDES_SKELETON
-	default "skeleton-systemd" if BR2_PACKAGE_SKELETON_SYSTEMD
+	default "skeleton-init-systemd" if BR2_PACKAGE_SKELETON_INIT_SYSTEMD
diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
similarity index 72%
rename from package/skeleton-systemd/skeleton-systemd.mk
rename to package/skeleton-init-systemd/skeleton-init-systemd.mk
index 860ebea2cd..b2a6e266b4 100644
--- a/package/skeleton-systemd/skeleton-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# skeleton-systemd
+# skeleton-init-systemd
 #
 ################################################################################
 
@@ -8,16 +8,16 @@
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
 # on skeleton.
-SKELETON_SYSTEMD_ADD_TOOLCHAIN_DEPENDENCY = NO
-SKELETON_SYSTEMD_ADD_SKELETON_DEPENDENCY = NO
+SKELETON_INIT_SYSTEMD_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_INIT_SYSTEMD_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_SYSTEMD_DEPENDENCIES = skeleton-common
+SKELETON_INIT_SYSTEMD_DEPENDENCIES = skeleton-common
 
-SKELETON_SYSTEMD_PROVIDES = skeleton
+SKELETON_INIT_SYSTEMD_PROVIDES = skeleton
 
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 
-define SKELETON_SYSTEMD_ROOT_RO_OR_RW
+define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
 	mkdir -p $(TARGET_DIR)/var
 endef
@@ -29,7 +29,7 @@ else
 # filesystem gets created, the /var symlink will be replaced with
 # a real (but empty) directory, and the "factory files" will be copied
 # back there by the tmpfiles.d mechanism.
-define SKELETON_SYSTEMD_ROOT_RO_OR_RW
+define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
 	mkdir -p $(TARGET_DIR)/usr/share/factory/var
 	ln -s usr/share/factory/var $(TARGET_DIR)/var
@@ -37,7 +37,7 @@ define SKELETON_SYSTEMD_ROOT_RO_OR_RW
 	echo "tmpfs /var tmpfs mode=1777 0 0" >>$(TARGET_DIR)/etc/fstab
 endef
 
-define SKELETON_SYSTEMD_PRE_ROOTFS_VAR
+define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 	rm -f $(TARGET_DIR)/var
 	mkdir $(TARGET_DIR)/var
 	for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
@@ -52,20 +52,20 @@ define SKELETON_SYSTEMD_PRE_ROOTFS_VAR
 		fi; \
 	done >$(TARGET_DIR)/etc/tmpfiles.d/var-factory.conf
 endef
-SKELETON_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_SYSTEMD_PRE_ROOTFS_VAR
+SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 
-define SKELETON_SYSTEMD_POST_ROOTFS_VAR
+define SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
 	rm -rf $(TARGET_DIR)/var
 	ln -s usr/share/factory/var $(TARGET_DIR)/var
 endef
-SKELETON_SYSTEMD_ROOTFS_POST_CMD_HOOKS += SKELETON_SYSTEMD_POST_ROOTFS_VAR
+SKELETON_INIT_SYSTEMD_ROOTFS_POST_CMD_HOOKS += SKELETON_INIT_SYSTEMD_POST_ROOTFS_VAR
 
 endif
 
-define SKELETON_SYSTEMD_INSTALL_TARGET_CMDS
+define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
-	$(SKELETON_SYSTEMD_ROOT_RO_OR_RW)
+	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 45326f0985..cbde411895 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -11,7 +11,7 @@ config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
 	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
 	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
-	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_INIT_NONE
 	help
 	  Use default target skeleton
-- 
2.11.0
