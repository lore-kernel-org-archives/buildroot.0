From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed,  2 Sep 2015 13:54:37 +1000
Subject: [Buildroot] [PATCH v2 3/4] boot/at91bootstrap3: Handled generated
	defconfigs
In-Reply-To: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
References: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
Message-ID: <1cdfdc187eb5716219908ce48fa7d0165dcb3d41.1441166076.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 9 ++++-----
 package/pkg-kconfig.mk                | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index fa67ea6..1910d46 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -41,12 +41,11 @@ define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
 endef
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-AT91BOOTSTRAP3_SOURCE_CONFIG = $(AT91BOOTSTRAP3_DIR)/board/*/$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))_defconfig
+AT91BOOTSTRAP3_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))
 else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-AT91BOOTSTRAP3_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
+AT91BOOTSTRAP3_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
 endif
 
-AT91BOOTSTRAP3_KCONFIG_FILE = $(AT91BOOTSTRAP3_SOURCE_CONFIG)
 AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
 AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 
@@ -55,13 +54,13 @@ AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 ifeq ($(BR_BUILDING),y)
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
-ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG)),)
+ifeq ($(AT91BOOTSTRAP3_KCONFIG_DEFCONFIG),)
 $(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
 endif
 endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
-ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)),)
+ifeq ($(AT91BOOTSTRAP3_KCONFIG_FILE),)
 $(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
 endif
 endif
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ed8ec07..cf0c523 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -183,7 +183,7 @@ $(1)-update-defconfig: $(1)-savedefconfig
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
 		$$(error Unable to perform $(1)-update-defconfig when fragment files are set))
 	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
-		$$(error Unable to perform $(1)-update-defconfig when using an in-tree defconfig"))
+		$$(error Unable to perform $(1)-update-defconfig when using an in-tree defconfig))
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
-- 
2.1.4
