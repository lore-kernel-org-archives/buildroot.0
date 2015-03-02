From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:22 -0000
Subject: [Buildroot] [git commit] barebox: migrate to the kconfig
	infrastructure
Message-ID: <20150302222717.F3564807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=357a2c2715d66ed1f6cfb9e869802c9fe3d0c711
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use $(BAREBOX_DIR) instead of $(@D) when defining
   BAREBOX_SOURCE_CONFIG, because $(@D) has no value at this point
   since we're outside of a make rule. This was causing Barebox to be
   constantly rebuilt, since the defconfig path was not a full path,
   it was looking like: '/arch/arm/configs/tegra_v7_defconfig'. The
   solution of using $(BAREBOX_DIR) has been used to mimic was is done
   in the linux package, which uses $(LINUX_DIR).]

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |   35 ++++++-----------------------------
 1 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f26c151..b829ae7 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -49,21 +49,18 @@ endif
 
 BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
 	$(TARGET_CROSS)"
-
+BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
+BAREBOX_SOURCE_CONFIG = $(BAREBOX_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
 	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
 BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
 endif
 
-define BAREBOX_CONFIGURE_CMDS
-	cp $(BAREBOX_SOURCE_CONFIG) \
-		$(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
-	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) \
-		buildroot_defconfig
-endef
+BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
+BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
+BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
 define BAREBOX_BUILD_BAREBOXENV_CMDS
@@ -106,7 +103,7 @@ define BAREBOX_INSTALL_TARGET_CMDS
 endef
 endif
 
-$(eval $(generic-package))
+$(eval $(kconfig-package))
 
 ifeq ($(BR2_TARGET_BAREBOX),y)
 # we NEED a board defconfig file unless we're at make source
@@ -115,24 +112,4 @@ ifeq ($(BAREBOX_SOURCE_CONFIG),)
 $(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
-
-barebox-menuconfig barebox-xconfig barebox-gconfig barebox-nconfig: barebox-configure
-	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
-		$(subst barebox-,,$@)
-	rm -f $(BAREBOX_DIR)/.stamp_{built,target_installed,images_installed}
-
-barebox-savedefconfig: barebox-configure
-	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
-		$(subst barebox-,,$@)
-
-ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-barebox-update-config: barebox-configure $(BAREBOX_DIR)/.config
-	cp -f $(BAREBOX_DIR)/.config $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
-
-barebox-update-defconfig: barebox-savedefconfig
-	cp -f $(BAREBOX_DIR)/defconfig $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
-else
-barebox-update-config: ;
-barebox-update-defconfig: ;
-endif
 endif
