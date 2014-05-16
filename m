From: Michal Sojka <sojka@merica.cz>
Date: Fri, 16 May 2014 17:22:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] Rebuild packages when their external
	config is updated
In-Reply-To: <1400253776-21759-1-git-send-email-sojka@merica.cz>
References: <1400253776-21759-1-git-send-email-sojka@merica.cz>
Message-ID: <1400253776-21759-2-git-send-email-sojka@merica.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages like busybox, Linux kernel or uclibc can "import" their
configuration files from external location specified either in
buildroot's .config or in an environment variable. Currently, this
import happens only when the package is built for the first time. When
the external config changes later, the package is not rebuilt with the
updated configuration until the corresponding .stamp_configured file
is manually deleted. This patch changes this to automatically rebuild
the package, when its external configuration files is newer than
.stamp_configured.

The change is implemented in pkg-generic.mk so it automatically
applies to all packages that use external config.

This patch also changes $(pkg)-update-config targets, which export the
internally used config files to external locations, to not change the
modification time of the external config. This ensures that the
package is not rebuilt just because its config file was exported.

Finally, linux.mk used variable KERNEL_SOURCE_CONFIG to hold the file
name of the external config. This was renamed to LINUX_SOURCE_CONFIG,
in order to be compatible with the change in pkg-generic.mk.

Signed-off-by: Michal Sojka <sojka@merica.cz>
---
 boot/barebox/barebox.mk    |  4 ++--
 linux/linux.mk             | 10 +++++-----
 package/busybox/busybox.mk |  2 +-
 package/pkg-generic.mk     | 17 +++++++++++++++++
 package/uclibc/uclibc.mk   |  2 +-
 5 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f57d297..a49f8dc 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -127,10 +127,10 @@ barebox-savedefconfig: barebox-configure
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
 barebox-update-config: barebox-configure $(BAREBOX_DIR)/.config
-	cp -f $(BAREBOX_DIR)/.config $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+	cp -fa $(BAREBOX_DIR)/.config $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
 
 barebox-update-defconfig: barebox-savedefconfig
-	cp -f $(BAREBOX_DIR)/defconfig $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+	cp -fa $(BAREBOX_DIR)/defconfig $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
 else
 barebox-update-config: ;
 barebox-update-defconfig: ;
diff --git a/linux/linux.mk b/linux/linux.mk
index bd3f2ac..18254ca 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -161,13 +161,13 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+LINUX_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+LINUX_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
-	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	$(INSTALL) -m 0644 $(LINUX_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(if $(BR2_arm)$(BR2_armeb),
@@ -317,10 +317,10 @@ linux-savedefconfig linux26-savedefconfig: linux-configure
 
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 linux-update-config linux26-update-config: linux-configure $(LINUX_DIR)/.config
-	cp -f $(LINUX_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+	cp -fa $(LINUX_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 
 linux-update-defconfig linux26-update-defconfig: linux-savedefconfig
-	cp -f $(LINUX_DIR)/defconfig $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+	cp -fa $(LINUX_DIR)/defconfig $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 else
 linux-update-config linux26-update-config: ;
 linux-update-defconfig linux26-update-defconfig: ;
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 150100b..a5405db 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -231,4 +231,4 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
 busybox-update-config: busybox-configure
-	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
+	cp -fa $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6eca6d4..7440d2d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -466,6 +466,23 @@ $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
 $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
 $$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
 
+# We want a package to be reconfigured whenever an "external" config
+# (if any) is updated. The name of the variable holding the external
+# config file name is not unified in the recipes so we add
+# dependencies to both commonly used variables.
+#
+# Additionally, we want the commands like
+#     make BUSYBOX_CONFIG_FILE=xxx busybox-update-config
+# to succeed even if file 'xxx' does not exist before. Therefore, we
+# condition the dependency by the existence of the config file.
+
+ifneq ($$(wildcard $$(call qstrip,$$($(2)_CONFIG_FILE))),)
+$$($(2)_TARGET_CONFIGURE):	$$(call qstrip,$$($(2)_CONFIG_FILE))
+endif
+ifneq ($$(wildcard $$(call qstrip,$$($(2)_SOURCE_CONFIG))),)
+$$($(2)_TARGET_CONFIGURE):	$$(call qstrip,$$($(2)_SOURCE_CONFIG))
+endif
+
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
 ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 717cf53..6401f3d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -554,7 +554,7 @@ uclibc-menuconfig: uclibc-patch
 $(eval $(generic-package))
 
 uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
-	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
+	cp -fa $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
-- 
2.0.0.rc2
