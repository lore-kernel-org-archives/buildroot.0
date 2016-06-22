From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:42 +0200
Subject: [Buildroot] [PATCH 20/24 v2] package/skeleton-systemd: new package
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <5869f5146ba204a0688058af4779ea4a1f7da13c.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Given the very few things to create in the skeleton, there is no real
need in having a pre-populated skeleton that we rsync. We can very well
just create the directory structure with simple mkdir commands.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                            |  1 +
 package/skeleton-systemd/Config.in           |  7 +++++
 package/skeleton-systemd/skeleton-systemd.mk | 43 ++++++++++++++++++++++++++++
 system/Config.in                             |  3 +-
 4 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 package/skeleton-systemd/Config.in
 create mode 100644 package/skeleton-systemd/skeleton-systemd.mk

diff --git a/package/Config.in b/package/Config.in
index 9db6332..17356fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -4,6 +4,7 @@ menu "Target packages"
 	source "package/skeleton/Config.in"
 	source "package/skeleton-common/Config.in"
 	source "package/skeleton-custom/Config.in"
+	source "package/skeleton-systemd/Config.in"
 	source "package/skeleton-sysv/Config.in"
 
 menu "Audio and video applications"
diff --git a/package/skeleton-systemd/Config.in b/package/skeleton-systemd/Config.in
new file mode 100644
index 0000000..c507264
--- /dev/null
+++ b/package/skeleton-systemd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SKELETON_SYSTEMD
+	bool
+	select BR2_PACKAGE_HAS_SKELETON
+	select BR2_PACKAGE_SKELETON_COMMON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-systemd" if BR2_PACKAGE_SKELETON_SYSTEMD
diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
new file mode 100644
index 0000000..e781ce9
--- /dev/null
+++ b/package/skeleton-systemd/skeleton-systemd.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# skeleton-systemd
+#
+################################################################################
+
+SKELETON_SYSTEMD_SOURCE =
+
+SKELETON_SYSTEMD_PROVIDES = skeleton
+
+SKELETON_SYSTEMD_DEPENDENCIES = skeleton-common
+
+SKELETON_SYSTEMD_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_SYSTEMD_ADD_SKELETON_DEPENDENCY = NO
+
+# In case we're not using systemd-networkd, use the sysv-like network infra;
+# otherwise, the necessary bits are installed by the systemd package.
+ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),)
+
+define SKELETON_SYSTEMD_RSYNC_NETWORK
+	 $(call SKELETON_RSYNC,system/skeleton-net,$(TARGET_DIR))
+endef
+
+define SKELETON_SYSTEMD_SET_NETWORK
+	ln -fs ../tmp/resolv.conf $(TARGET_DIR)/etc/resolv.conf
+	mkdir -p $(TARGET_DIR)/etc/network/
+	$(SKELETON_SET_NETWORK_IFUPDOWN_LOOPBACK)
+	$(SKELETON_SET_NETWORK_IFUPDOWN_DHCP)
+endef
+SKELETON_SYSTEMD_TARGET_FINALIZE_HOOKS += SKELETON_SYSTEMD_SET_NETWORK
+
+endif # BR2_PACKAGE_SYSTEMD_NETWORKD not set
+
+define SKELETON_SYSTEMD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/etc
+	mkdir -p $(TARGET_DIR)/home
+	mkdir -p $(TARGET_DIR)/srv
+	mkdir -p $(TARGET_DIR)/var
+	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
+	$(SKELETON_SYSTEMD_RSYNC_NETWORK)
+endef
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 3792be2..17ce832 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -5,7 +5,8 @@ choice
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
-	select BR2_PACKAGE_SKELETON_SYSV
+	select BR2_PACKAGE_SKELETON_SYSV    if !BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
 	help
 	  Use default target skeleton
 
-- 
2.7.4
