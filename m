From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:50 +0100
Subject: [Buildroot] [PATCH 10/10] barebox: migrate to the kconfig
	infrastructure
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <ea421877479d951601ffcf49fd5bce2d9d4f96b5.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
---
 boot/barebox/barebox.mk | 33 +++++----------------------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f26c151..56d545a 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -49,7 +49,7 @@ endif
 
 BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
 	$(TARGET_CROSS)"
-
+BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
 BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
@@ -58,12 +58,9 @@ else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
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
-- 
1.9.1
