From: naresh.kamboju at linaro.org <naresh.kamboju@linaro.org>
Date: Fri, 29 Apr 2016 09:23:21 +0100
Subject: [Buildroot] [PATCH] linux: linux.mk: _defconfig not generic instead
	use defconfig
Message-ID: <1461918201-21233-1-git-send-email-naresh.kamboju@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Naresh Kamboju <naresh.kamboju@linaro.org>

In generic linux tree contains arch/<architecture>/configs/defconfig
and get rid of <machine>_defconfig

Avoid checking the defconfig entry

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 linux/linux.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 317587f..0c5f1a0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -198,7 +198,7 @@ endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
@@ -416,15 +416,6 @@ LINUX_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 # Checks to give errors that the user can understand
 ifeq ($(BR_BUILDING),y)
 
-ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-# We must use the user-supplied kconfig value, because
-# LINUX_KCONFIG_DEFCONFIG will at least contain the
-# trailing _defconfig
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
-$(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
-endif
-endif
-
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 ifeq ($(LINUX_KCONFIG_FILE),)
 $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
-- 
2.8.1
