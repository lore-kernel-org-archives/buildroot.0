From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Dec 2015 22:48:32 +0100
Subject: [Buildroot] [PATCH 3/5 v3] package/linux: Handle generated
	defconfigs
In-Reply-To: <cover.1449697131.git.yann.morin.1998@free.fr>
References: <cover.1449697131.git.yann.morin.1998@free.fr>
Message-ID: <f7e0e40386adf567cd65f739588fd0877ca15682.1449697131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam bobroff <sam.bobroff@au1.ibm.com>

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
[yann.morin.1998 at free.fr: move the kconfig-package hunk to the
 corresponding patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 9507837..a2ee349 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -168,12 +168,10 @@ endef
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
+LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
-
-LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
 LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
@@ -365,13 +363,13 @@ LINUX_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 ifeq ($(BR_BUILDING),y)
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
+ifeq ($(LINUX_KCONFIG_DEFCONFIG),)
 $(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
 endif
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
+ifeq ($(LINUX_KCONFIG_FILE),)
 $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
 endif
 endif
-- 
1.9.1
