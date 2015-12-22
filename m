From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 22:39:36 +0100
Subject: [Buildroot] [git commit] package/linux: handle generated defconfigs
Message-ID: <20151222215317.AAA95826C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cb15b28816846646ac6fb3473640b4d16175afd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
[yann.morin.1998 at free.fr: move the kconfig-package hunk to the
 corresponding patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 451e681..06a27eb 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -188,12 +188,10 @@ endef
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
+LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
-
-LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
 LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
@@ -404,13 +402,16 @@ LINUX_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 ifeq ($(BR_BUILDING),y)
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
+# We must use the user-supplied kconfig value, because
+# LINUX_KCONFIG_DEFCONFIG will at least contain the
+# trailing _defconfig
+ifeq ($(qstrip $(BR2_LINUX_KERNEL_DEFCONFIG)),)
 $(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
 endif
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
+ifeq ($(LINUX_KCONFIG_FILE),)
 $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
 endif
 endif
