From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 23:12:17 +0200
Subject: [Buildroot] [git commit] Rework of the init system
Message-ID: <20120730211657.8345D96FBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c92aacd330366da803b1cf37ecb3af816bedd7f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we have now two uncompatible init systems, and we want only one of
them at the same time in use in the rootfs, we need to select a
particular init system. This patch also adds $(PKG)_INSTALL_INIT_SYSTEMD
and $(PKG)_INSTALL_INIT_SYSV hooks that are called when the matching
init systems are selected to install properly the init scripts of the
package.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    7 +++++++
 package/pkg-generic.mk     |    8 ++++++++
 target/generic/Config.in   |   29 +++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 394a1ae..17ee50a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -134,6 +134,12 @@ define BUSYBOX_DISABLE_MMU_APPLETS
 endef
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX),y)
+define BUSYBOX_SET_INIT
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
@@ -168,6 +174,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_NETKITTELNET)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_DISABLE_MMU_APPLETS)
+	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
 		-C $(@D) oldconfig
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d1f4f2a..68d23ba 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -133,6 +133,10 @@ $(BUILD_DIR)/%/.stamp_images_installed:
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
@@ -151,6 +155,10 @@ $(BUILD_DIR)/%/.stamp_uninstalled:
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
 	$($(PKG)_UNINSTALL_STAGING_CMDS)
 	$($(PKG)_UNINSTALL_TARGET_CMDS)
+	$(if $(BR2_INIT_SYSTEMD),\
+		$($(PKG)_UNINSTALL_INIT_SYSTEMD))
+	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
+		$($(PKG)_UNINSTALL_INIT_SYSV))
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 88f0718..a83ba44 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -37,6 +37,35 @@ comment "udev requires a toolchain with LARGEFILE + WCHAR support"
 
 endchoice
 
+choice
+	prompt "Init system"
+	default BR2_INIT_BUSYBOX
+
+config BR2_INIT_BUSYBOX
+	bool "Busybox"
+	select BR2_PACKAGE_BUSYBOX
+
+config BR2_INIT_SYSV
+	bool "systemV"
+	select BR2_PACKAGE_SYSVINIT
+
+config BR2_INIT_SYSTEMD
+	bool "systemd"
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	depends on BR2_INET_IPV6
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_SYSTEMD
+
+comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
+		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
+		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
+
+endchoice
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "target/generic/device_table.txt"
