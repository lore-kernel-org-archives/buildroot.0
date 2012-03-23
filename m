From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 23 Mar 2012 10:26:20 +0100
Subject: [Buildroot] [PATCH 3/5] Rework of the init system
In-Reply-To: <cover.1332494567.git.maxime.ripard@free-electrons.com>
References: <cover.1332494567.git.maxime.ripard@free-electrons.com>
Message-ID: <0d1be76af6b3946ebcd13f7601ed051411ccf774.1332494567.git.maxime.ripard@free-electrons.com>
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
 package/sysvinit/Config.in  |    1 +
 target/generic/Config.in    |   28 ++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index f7b6566..3992247 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -427,6 +427,10 @@ $(BUILD_DIR)/%/.stamp_images_installed:
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
@@ -445,6 +449,10 @@ $(BUILD_DIR)/%/.stamp_uninstalled:
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
 	$($(PKG)_UNINSTALL_STAGING_CMDS)
 	$($(PKG)_UNINSTALL_TARGET_CMDS)
+	$(if $(BR2_INIT_SYSTEMD),\
+		$($(PKG)_UNINSTALL_INIT_SYSTEMD))
+	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
+		$($(PKG)_UNINSTALL_INIT_SYSV))
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
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
index 88f0718..40009bd 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -37,6 +37,34 @@ comment "udev requires a toolchain with LARGEFILE + WCHAR support"
 
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
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_DBUS
+	select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	select BR2_PACKAGE_SYSTEMD
+
+comment 'systemd requires largefile, wchar and IPv6 support'
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_INET_IPV6)
+
+endchoice
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "target/generic/device_table.txt"
-- 
1.7.5.4
