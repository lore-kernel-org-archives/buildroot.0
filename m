From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Dec 2015 22:48:34 +0100
Subject: [Buildroot] [PATCH 5/5 v3] boot/barebox: Handle generated defconfigs
In-Reply-To: <cover.1449697131.git.yann.morin.1998@free.fr>
References: <cover.1449697131.git.yann.morin.1998@free.fr>
Message-ID: <1245b91af13288bec9e07cdacc65131342b48788.1449697131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam bobroff <sam.bobroff@au1.ibm.com>

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/barebox/barebox.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 00e1537..1e4b05f 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -56,13 +56,11 @@ BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
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
@@ -111,8 +109,8 @@ endif
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
1.9.1
