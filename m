From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed,  2 Sep 2015 13:54:38 +1000
Subject: [Buildroot] [PATCH v2 4/4] boot/barebox: Handle generated defconfigs
In-Reply-To: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
References: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
Message-ID: <2a7416c2ade0a5b49b0a071a9158c2a6cd61a9ab.1441166076.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 boot/barebox/barebox.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index e45976d..018b79c 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -57,13 +57,11 @@ BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
 BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(BAREBOX_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
-	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+BAREBOX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
 else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
+BAREBOX_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
 endif
 
-BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
 BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
 BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
@@ -112,8 +110,8 @@ endif
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
 ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
-ifeq ($(BAREBOX_SOURCE_CONFIG),)
-$(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
+ifeq ($(or $(BAREBOX_KCONFIG_FILE),$(BAREBOX_KCONFIG_DEFCONFIG)),)
+$(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
 
-- 
2.1.4
