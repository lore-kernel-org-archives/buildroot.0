From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Nov 2011 12:30:10 +0100
Subject: [Buildroot] [PATCH 2/3] Rework of the init system
In-Reply-To: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1322047811-12933-3-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we have now two uncompatible init systems, and we want only one of
them at the same time in the rootfs, we need to select a particular init
system. This patch also adds $(PKG)_INIT_SYSV and $(PKG)_INIT_SYSTEMD
variables, that basically moves the init script installation in the
package infrastructure, and installs them only when needed.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/Makefile.package.in  |    8 ++++++++
 package/busybox/busybox.mk   |   11 +++++++++++
 package/systemd/Config.in    |    1 +
 package/sysvinit/Config.in   |    1 +
 package/sysvinit/sysvinit.mk |    5 -----
 target/generic/Config.in     |   19 +++++++++++++++++++
 6 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bd9ceb5..c0684d0 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -367,6 +367,10 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
+	$(if $(and $(BR2_INIT_SYSTEMD),$($(PKG)_INIT_SYSTEMD)),\
+		$(foreach init,$($(PKG)_INIT_SYSTEMD),$(INSTALL) -m 0755 -D $(init) $(TARGET_DIR)/etc/init.d/$(notdir $(init))))
+	$(if $(and $(or $(BR2_INIT_SYSV),$(BR2_INIT_BUSYBOX)),$($(PKG)_INIT_SYSV)),\
+		$(foreach init,$($(PKG)_INIT_SYSV),$(INSTALL) -m 0755 -D $(init) $(TARGET_DIR)/etc/init.d/$(notdir $(init))))
 	$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
@@ -384,6 +388,8 @@ $(BUILD_DIR)/%/.stamp_uninstalled:
 	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
 	$($(PKG)_UNINSTALL_TARGET_CMDS)
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
+	$(foreach init, $($(PKG)_INIT_SYSV), rm -f $(TARGET_DIR)/etc/init.d/$(notdir $(init)))
+	$(foreach init, $($(PKG)_INIT_SYSTEMD), rm -f $(TARGET_DIR)/etc/init.d/$(notdir $(init)))
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
@@ -479,6 +485,8 @@ endif
 endif
 
 $(2)_DEPENDENCIES		?=
+$(2)_INIT_SYSTEMD		?=
+$(2)_INIT_SYSV			?=
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9e91136..73c4969 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -129,6 +129,16 @@ define BUSYBOX_DISABLE_MMU_APPLETS
 endef
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX),y)
+define BUSYBOX_SET_INIT
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
+endef
+else
+define BUSYBOX_SET_INIT
+	$(call KCONFIG_DISABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
@@ -145,6 +155,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_BB_PWD)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
+	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_RPC)
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 09cedb9..33d5ccf 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
+	depends on BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_UDEV
 	depends on BR2_PACKAGE_DBUS
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
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 0d65c43..163ba9b 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -8,11 +8,6 @@ SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
 SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
 SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 
-# Override Busybox implementations if Busybox is enabled.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSVINIT_DEPENDENCIES = busybox
-endif
-
 define SYSVINIT_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
diff --git a/target/generic/Config.in b/target/generic/Config.in
index a91de32..d9b93af 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -32,6 +32,25 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 
 endchoice
 
+choice
+	prompt "Init system"
+	default BR2_INIT_BUSYBOX
+
+config BR2_INIT_BUSYBOX
+	bool "Busybox init"
+	select BR2_PACKAGE_BUSYBOX
+
+config BR2_INIT_SYSTEMD
+	bool "Use systemd"
+	depends on BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_SYSTEMD
+
+config BR2_INIT_SYSV
+	bool "Use systemV init"
+	select BR2_PACKAGE_SYSVINIT
+
+endchoice
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "target/generic/device_table.txt"
-- 
1.7.4.1
