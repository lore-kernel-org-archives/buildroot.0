From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed,  2 Sep 2015 13:54:36 +1000
Subject: [Buildroot] [PATCH v2 2/4] package/linux: Handle generated
	defconfigs
In-Reply-To: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
References: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
Message-ID: <a6d21dd8d6e762bb5298cfcb8eae4012821e4eb3.1441166076.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 linux/linux.mk         | 10 ++++------
 package/pkg-kconfig.mk |  8 ++++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 48f9c74..2f6e884 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -164,12 +164,10 @@ endef
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
@@ -359,13 +357,13 @@ LINUX_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
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
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 47bb550..ed8ec07 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -96,10 +96,14 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 ifeq ($$(BR_BUILDING),y)
-# Either FOO_KCONFIG_FILE or FOO_KCONFIG_DEFCONFIG is required
-ifeq ($$($(2)_KCONFIG_FILE)$$($(2)_KCONFIG_DEFCONFIG),)
+# Either FOO_KCONFIG_FILE or FOO_KCONFIG_DEFCONFIG is required...
+ifeq ($$(or $$($(2)_KCONFIG_FILE),$$($(2)_KCONFIG_DEFCONFIG)),)
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE or $(2)_KCONFIG_DEFCONFIG)
 endif
+# ... but not both:
+ifneq ($$(and $$($(2)_KCONFIG_FILE),$$($(2)_KCONFIG_DEFCONFIG)),)
+$$(error Internal error: $(2)_KCONFIG_FILE and $(2)_KCONFIG_DEFCONFIG are mutually exclusive but but both are defined)
+endif
 endif
 
 # For the configurators, we do want to use the system-provided host
-- 
2.1.4
