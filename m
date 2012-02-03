From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  3 Feb 2012 15:27:24 +0100
Subject: [Buildroot] [PATCH 2/5] Rework of the init system
In-Reply-To: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1328279247-7277-3-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we have now two uncompatible init systems, and we want only one of
them at the same time in use in the rootfs, we need to select a
particular init system. This patch also adds $(PKG)_INSTALL_INIT_SYSTEMD
and $(PKG)_INSTALL_INIT_SYSV hooks that are called when the matching
init systems are selected to install properly the init scripts of the
package.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/Makefile.package.in |    8 ++++++++
 package/systemd/Config.in   |    1 +
 package/sysvinit/Config.in  |    1 +
 target/generic/Config.in    |   22 ++++++++++++++++++++++
 4 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 1ace683..e267b65 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -431,6 +431,10 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
+	$(if $(BR2_INIT_SYSTEMD),\
+		$($(PKG)_INSTALL_INIT_SYSTEMD))
+	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
+		$($(PKG)_INSTALL_INIT_SYSV))
 	$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
@@ -449,6 +453,10 @@ $(BUILD_DIR)/%/.stamp_uninstalled:
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
 	$($(PKG)_UNINSTALL_STAGING_CMDS)
 	$($(PKG)_UNINSTALL_TARGET_CMDS)
+	$(if $(BR2_INIT_SYSTEMD),\
+		$($(PKG)_UNINSTALL_INIT_SYSTEMD))
+	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
+		$($(PKG)_UNINSTALL_INIT_SYSV))
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 753b433..7a0b37d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
+	depends on BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 34ec391..d91c643 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
+	depends on BR2_INIT_SYSV
 	help
 	  /sbin/init - parent of all processes
 
diff --git a/target/generic/Config.in b/target/generic/Config.in
index a91de32..f54e7d8 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -32,6 +32,28 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 
 endchoice
 
+choice
+	prompt "Init system"
+	default BR2_INIT_BUSYBOX
+	help
+	  To select systemd, you first need to have dbus and udev enabled
+
+config BR2_INIT_BUSYBOX
+	bool "Busybox init"
+	select BR2_PACKAGE_BUSYBOX
+
+config BR2_INIT_SYSV
+	bool "Use systemV init"
+	select BR2_PACKAGE_SYSVINIT
+
+config BR2_INIT_SYSTEMD
+	bool "Use systemd"
+	select BR2_PACKAGE_DBUS
+	depends on BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_SYSTEMD
+	
+endchoice
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "target/generic/device_table.txt"
-- 
1.7.5.4
