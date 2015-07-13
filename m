From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:32:00 +0200
Subject: [Buildroot] [PATCH 3/7 v2] package/linux: check for config file
	before calling kconfig-package
In-Reply-To: <cover.1436783490.git.yann.morin.1998@free.fr>
References: <cover.1436783490.git.yann.morin.1998@free.fr>
Message-ID: <ebc17080f0f4a4054e28619845885dc9e7acd77a.1436783490.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check. Move the check with
the existing checks for the DTS, for consistency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - move the check together with the DTS checks
---
 linux/linux.mk | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 24bca7d..96573ad 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -90,6 +90,18 @@ endif
 
 ifeq ($(BR_BUILDING),y)
 
+ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
+$(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
+$(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
 $(error No kernel device tree source specified, check your \
 BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
@@ -364,19 +376,3 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 # The initramfs building code must make sure this target gets called
 # after it generated the initramfs list of files.
 linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
-
-# Checks to give errors that the user can understand
-ifeq ($(BR_BUILDING),y)
-ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
-$(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
-endif
-endif
-
-ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
-$(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
-endif
-endif
-
-endif
-- 
1.9.1
