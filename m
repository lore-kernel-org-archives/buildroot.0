From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 22:40:06 +0100
Subject: [Buildroot] [git commit] boot/barebox: handle generated defconfigs
Message-ID: <20151222215317.BBC04826C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0370d92d31ea6c05949681a1e46fbd30be3a8121
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 00e1537..f36ca70 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -56,13 +56,11 @@ BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
 BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(BAREBOX_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
-	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+BAREBOX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
+BAREBOX_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
 endif
 
-BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
 BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
 BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
@@ -111,8 +109,11 @@ endif
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
 ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
-ifeq ($(BAREBOX_SOURCE_CONFIG),)
-$(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
+# We must use the user-supplied kconfig value, because
+# BAREBOX_KCONFIG_DEFCONFIG will at least contain the
+# trailing _defconfig
+ifeq ($(or $(BAREBOX_KCONFIG_FILE),$(BAREBOX_KCONFIG_DEFCONFIG)),)
+$(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
 
