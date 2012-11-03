From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 17:20:15 +0100
Subject: [Buildroot] [git commit] barebox: Allow to pass a custom
	configuration file
Message-ID: <20121103165737.6AAB799AA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e9b963255fd20c2532f71c62d5c80eb5643d4c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in  |   21 +++++++++++++++++++++
 boot/barebox/barebox.mk |   26 +++++++++++++++++++++-----
 2 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index bd70e58..d6ce8dd 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -67,12 +67,33 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
 
 endif
 
+
+choice
+	prompt "Barebox configuration"
+	default BR2_TARGET_BAREBOX_USE_DEFCONFIG
+
+config BR2_TARGET_BAREBOX_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
 config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
 	string "board defconfig"
+	depends on BR2_TARGET_BAREBOX_USE_DEFCONFIG
 	help
 	  Name of the board for which Barebox should be built, without
 	  the _defconfig suffix.
 
+
+config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
+	help
+	  Path to the barebox configuration file
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index ee84831..a025d5f 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -37,8 +37,6 @@ ifneq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
 BAREBOX_INSTALL_TARGET = NO
 endif
 
-BAREBOX_BOARD_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
-
 ifeq ($(KERNEL_ARCH),i386)
 BAREBOX_ARCH=x86
 else ifeq ($(KERNEL_ARCH),powerpc)
@@ -49,8 +47,16 @@ endif
 
 BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
 
+
+ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
+BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
+BAREBOX_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+endif
+
 define BAREBOX_CONFIGURE_CMDS
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) $(BAREBOX_BOARD_DEFCONFIG)_defconfig
+	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
@@ -80,8 +86,8 @@ $(eval $(generic-package))
 ifeq ($(BR2_TARGET_BAREBOX),y)
 # we NEED a board defconfig file unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
-ifeq ($(BAREBOX_BOARD_DEFCONFIG),)
-$(error No Barebox defconfig file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting)
+ifeq ($(BAREBOX_SOURCE_CONFIG),)
+$(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
 
@@ -94,4 +100,14 @@ barebox-savedefconfig: barebox-configure
 	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
 		$(subst barebox-,,$@)
 
+ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
+barebox-update-config: barebox-configure $(BAREBOX_DIR)/.config
+	cp -f $(BAREBOX_DIR)/.config $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+
+barebox-update-defconfig: barebox-savedefconfig
+	cp -f $(BAREBOX_DIR)/defconfig $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+else
+barebox-update-config: ;
+barebox-update-defconfig: ;
+endif
 endif
