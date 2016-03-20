From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 20 Mar 2016 23:35:49 +0100
Subject: [Buildroot] [PATCH v4 5/7] barebox: extract package name argument
In-Reply-To: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
Message-ID: <1458513351-6556-6-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No functional changes: Extracts an argument to the inner-barebox-package
function to automatically determine the uppercase package name. This is needed
to support a 2nd config build. This results in the following renaming:
  'BAREBOX' -> '$(1)'

All barebox packages are meant to be built from the same sources, so related
KConfig variables (origin, version and patch directory) are not extracted.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/barebox.mk | 139 +++++++++++++++++++++++++-----------------------
 1 file changed, 71 insertions(+), 68 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index d84c479..8892ab5 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -7,135 +7,138 @@
 ################################################################################
 # inner-barebox-package -- generates the KConfig logic and make targets needed
 # to support a barebox package. All barebox packages are built from the same
-# source (origin, version and patches).
+# source (origin, version and patches). The remainder of the package
+# configuration is unique to each barebox package.
+#
+#  argument 1 is the uppercase package name (used for variable name-space)
 ################################################################################
 
 define inner-barebox-package
 
-BAREBOX_VERSION = $$(call qstrip,$$(BR2_TARGET_BAREBOX_VERSION))
+$(1)_VERSION = $$(call qstrip,$$(BR2_TARGET_BAREBOX_VERSION))
 
-ifeq ($$(BAREBOX_VERSION),custom)
+ifeq ($$($(1)_VERSION),custom)
 # Handle custom Barebox tarballs as specified by the configuration
-BAREBOX_TARBALL = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
-BAREBOX_SITE = $$(patsubst %/,%,$$(dir $$(BAREBOX_TARBALL)))
-BAREBOX_SOURCE = $$(notdir $$(BAREBOX_TARBALL))
-BR_NO_CHECK_HASH_FOR += $$(BAREBOX_SOURCE)
+$(1)_TARBALL = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
+$(1)_SITE = $$(patsubst %/,%,$$(dir $$($(1)_TARBALL)))
+$(1)_SOURCE = $$(notdir $$($(1)_TARBALL))
+BR_NO_CHECK_HASH_FOR += $$($(1)_SOURCE)
 else ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
-BAREBOX_SITE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
-BAREBOX_SITE_METHOD = git
+$(1)_SITE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
+$(1)_SITE_METHOD = git
 else
 # Handle stable official Barebox versions
-BAREBOX_SOURCE = barebox-$$(BAREBOX_VERSION).tar.bz2
-BAREBOX_SITE = http://www.barebox.org/download
+$(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
+$(1)_SITE = http://www.barebox.org/download
 ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
-BR_NO_CHECK_HASH_FOR += $$(BAREBOX_SOURCE)
+BR_NO_CHECK_HASH_FOR += $$($(1)_SOURCE)
 endif
 endif
 
-BAREBOX_DEPENDENCIES = host-lzop
-BAREBOX_LICENSE = GPLv2 with exceptions
-BAREBOX_LICENSE_FILES = COPYING
+$(1)_DEPENDENCIES = host-lzop
+$(1)_LICENSE = GPLv2 with exceptions
+$(1)_LICENSE_FILES = COPYING
 
 ifneq ($$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
-define BAREBOX_APPLY_CUSTOM_PATCHES
+define $(1)_APPLY_CUSTOM_PATCHES
 	$$(APPLY_PATCHES) $$(@D) \
 		$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \*.patch
 endef
 
-BAREBOX_POST_PATCH_HOOKS += BAREBOX_APPLY_CUSTOM_PATCHES
+$(1)_POST_PATCH_HOOKS += $(1)_APPLY_CUSTOM_PATCHES
 endif
 
-BAREBOX_INSTALL_IMAGES = YES
-ifneq ($$(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-BAREBOX_INSTALL_TARGET = NO
+$(1)_INSTALL_IMAGES = YES
+ifneq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
+$(1)_INSTALL_TARGET = NO
 endif
 
 ifeq ($$(KERNEL_ARCH),i386)
-BAREBOX_ARCH = x86
+$(1)_ARCH = x86
 else ifeq ($$(KERNEL_ARCH),x86_64)
-BAREBOX_ARCH = x86
+$(1)_ARCH = x86
 else ifeq ($$(KERNEL_ARCH),powerpc)
-BAREBOX_ARCH = ppc
+$(1)_ARCH = ppc
 else
-BAREBOX_ARCH = $$(KERNEL_ARCH)
+$(1)_ARCH = $$(KERNEL_ARCH)
 endif
 
-BAREBOX_MAKE_FLAGS = ARCH=$$(BAREBOX_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
-BAREBOX_MAKE_ENV = $$(TARGET_MAKE_ENV)
+$(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
+$(1)_MAKE_ENV = $$(TARGET_MAKE_ENV)
 
-ifeq ($$(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_KCONFIG_DEFCONFIG = $$(call qstrip,$$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
-else ifeq ($$(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-BAREBOX_KCONFIG_FILE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
+ifeq ($$(BR2_TARGET_$(1)_USE_DEFCONFIG),y)
+$(1)_KCONFIG_DEFCONFIG = $$(call qstrip,$$(BR2_TARGET_$(1)_BOARD_DEFCONFIG))_defconfig
+else ifeq ($$(BR2_TARGET_$(1)_USE_CUSTOM_CONFIG),y)
+$(1)_KCONFIG_FILE = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_CONFIG_FILE))
 endif
 
-BAREBOX_KCONFIG_FRAGMENT_FILES = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
-BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
-BAREBOX_KCONFIG_OPTS = $$(BAREBOX_MAKE_FLAGS)
+$(1)_KCONFIG_FRAGMENT_FILES = $$(call qstrip,$$(BR2_TARGET_$(1)_CONFIG_FRAGMENT_FILES))
+$(1)_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
+$(1)_KCONFIG_OPTS = $$($(1)_MAKE_FLAGS)
 
-ifeq ($$(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-define BAREBOX_BUILD_BAREBOXENV_CMDS
+ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
+define $(1)_BUILD_BAREBOXENV_CMDS
 	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
 		$$(@D)/scripts/bareboxenv.c
 endef
 endif
 
-ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
-BAREBOX_ENV_NAME = $$(notdir $$(call qstrip,\
-	$$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
-define BAREBOX_BUILD_CUSTOM_ENV
+ifeq ($$(BR2_TARGET_$(1)_CUSTOM_ENV),y)
+$(1)_ENV_NAME = $$(notdir $$(call qstrip,\
+	$$(BR2_TARGET_$(1)_CUSTOM_ENV_PATH)))
+define $(1)_BUILD_CUSTOM_ENV
 	$$(@D)/scripts/bareboxenv -s \
-		$$(call qstrip, $$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
-		$$(@D)/$$(BAREBOX_ENV_NAME)
+		$$(call qstrip, $$(BR2_TARGET_$(1)_CUSTOM_ENV_PATH)) \
+		$$(@D)/$$($(1)_ENV_NAME)
 endef
-define BAREBOX_INSTALL_CUSTOM_ENV
-	cp $$(@D)/$$(BAREBOX_ENV_NAME) $$(BINARIES_DIR)
+define $(1)_INSTALL_CUSTOM_ENV
+	cp $$(@D)/$$($(1)_ENV_NAME) $$(BINARIES_DIR)
 endef
 endif
 
-define BAREBOX_BUILD_CMDS
-	$$(BAREBOX_BUILD_BAREBOXENV_CMDS)
-	$$(TARGET_MAKE_ENV) $$(MAKE) $$(BAREBOX_MAKE_FLAGS) -C $$(@D)
-	$$(BAREBOX_BUILD_CUSTOM_ENV)
+define $(1)_BUILD_CMDS
+	$$($(1)_BUILD_BAREBOXENV_CMDS)
+	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
+	$$($(1)_BUILD_CUSTOM_ENV)
 endef
 
-define BAREBOX_INSTALL_IMAGES_CMDS
-	if test -e $$(@D)/$$(call qstrip,$$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
-		cp -L $$(@D)/$$(call qstrip,$$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) \
-		      $$(BINARIES_DIR)/$$(call qstrip,$$(BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE)) ; \
-	elif test -e $$(@D)/images/$$(call qstrip,$$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
-		cp $$(@D)/images/$$(call qstrip,$$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) \
-		   $$(BINARIES_DIR)/$$(call qstrip,$$(BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE)) ; \
+define $(1)_INSTALL_IMAGES_CMDS
+	if test -e $$(@D)/$$(call qstrip,$$(BR2_TARGET_$(1)_BUILT_IMAGE_FILE)); then \
+		cp -L $$(@D)/$$(call qstrip,$$(BR2_TARGET_$(1)_BUILT_IMAGE_FILE)) \
+		      $$(BINARIES_DIR)/$$(call qstrip,$$(BR2_TARGET_$(1)_OUTPUT_IMAGE_FILE)) ; \
+	elif test -e $$(@D)/images/$$(call qstrip,$$(BR2_TARGET_$(1)_BUILT_IMAGE_FILE)); then \
+		cp $$(@D)/images/$$(call qstrip,$$(BR2_TARGET_$(1)_BUILT_IMAGE_FILE)) \
+		   $$(BINARIES_DIR)/$$(call qstrip,$$(BR2_TARGET_$(1)_OUTPUT_IMAGE_FILE)) ; \
 	else \
-		echo "error: Specified built image file not found: $$(call qstrip,$$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE))" >&2 ; \
+		echo "error: Specified built image file not found: $$(call qstrip,$$(BR2_TARGET_$(1)_BUILT_IMAGE_FILE))" >&2 ; \
 		echo "       in: $$(@D)/" >&2 ; \
 		echo "       or: $$(@D)/images/" >&2 ; \
-		echo "       Check your BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE setting." >&2 ; \
+		echo "       Check your BR2_TARGET_$(1)_BUILT_IMAGE_FILE setting." >&2 ; \
 		exit 1 ; \
 	fi
-	$$(BAREBOX_INSTALL_CUSTOM_ENV)
+	$$($(1)_INSTALL_CUSTOM_ENV)
 endef
 
-ifeq ($$(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-define BAREBOX_INSTALL_TARGET_CMDS
+ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
+define $(1)_INSTALL_TARGET_CMDS
 	cp $$(@D)/bareboxenv $$(TARGET_DIR)/usr/bin
 endef
 endif
 
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
-ifeq ($$(BR2_TARGET_BAREBOX)$$(BR_BUILDING),yy)
+ifeq ($$(BR2_TARGET_$(1))$$(BR_BUILDING),yy)
 # We must use the user-supplied kconfig value, because
-# BAREBOX_KCONFIG_DEFCONFIG will at least contain the
+# $(1)_KCONFIG_DEFCONFIG will at least contain the
 # trailing _defconfig
-ifeq ($$(or $$(BAREBOX_KCONFIG_FILE),$$(call qstrip,$$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))),)
-$$(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
+ifeq ($$(or $$($(1)_KCONFIG_FILE),$$(call qstrip,$$(BR2_TARGET_$(1)_BOARD_DEFCONFIG))),)
+$$(error No Barebox config. Check your BR2_TARGET_$(1)_BOARD_DEFCONFIG or BR2_TARGET_$(1)_CUSTOM_CONFIG_FILE settings)
 endif
-ifndef BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
-$$(error No barebox built image filename specified. Check your BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE setting)
+ifndef BR2_TARGET_$(1)_BUILT_IMAGE_FILE
+$$(error No barebox built image filename specified. Check your BR2_TARGET_$(1)_BUILT_IMAGE_FILE setting)
 endif
-ifndef BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE
-$$(error No barebox output image filename specified. Check your BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE setting)
+ifndef BR2_TARGET_$(1)_OUTPUT_IMAGE_FILE
+$$(error No barebox output image filename specified. Check your BR2_TARGET_$(1)_OUTPUT_IMAGE_FILE setting)
 endif
 endif
 
@@ -146,7 +149,7 @@ endef
 # barebox-package -- the target generator macro for barebox packages
 ################################################################################
 
-barebox-package=$(call inner-barebox-package)
+barebox-package=$(call inner-barebox-package,$(call UPPERCASE,$(pkgname)))
 
 # instantiate this barebox package
 $(eval $(call barebox-package))
-- 
2.5.0
