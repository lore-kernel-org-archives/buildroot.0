From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 11:18:44 +0200
Subject: [Buildroot] [PATCH v5 2/5] barebox: introduce barebox-package
	function
In-Reply-To: <cover.1461489060.git.pieter@boesman.nl>
References: <cover.1461489060.git.pieter@boesman.nl>
Message-ID: <9431c910cd145263e04a01f0a332555b9212e22e.1461489060.git.pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No functional changes: Introduces a barebox-package function towards re-use by
a 2nd config build.

Because the function is meant to be called from within a $(eval), all instances
of '$' has to be escaped. I.e. rename '$' -> '$$'.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/barebox.mk | 125 ++++++++++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 53 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index dbda9a1..883d083 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,23 +4,31 @@
 #
 ################################################################################
 
-BAREBOX_VERSION = $(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
+################################################################################
+# inner-barebox-package -- generates the KConfig logic and make targets needed
+# to support a barebox package. All barebox packages are built from the same
+# source (origin, version and patches).
+################################################################################
+
+define inner-barebox-package
 
-ifeq ($(BAREBOX_VERSION),custom)
+BAREBOX_VERSION = $$(call qstrip,$$(BR2_TARGET_BAREBOX_VERSION))
+
+ifeq ($$(BAREBOX_VERSION),custom)
 # Handle custom Barebox tarballs as specified by the configuration
-BAREBOX_TARBALL = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
-BAREBOX_SITE = $(patsubst %/,%,$(dir $(BAREBOX_TARBALL)))
-BAREBOX_SOURCE = $(notdir $(BAREBOX_TARBALL))
-BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
-else ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
-BAREBOX_SITE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
+BAREBOX_TARBALL = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
+BAREBOX_SITE = $$(patsubst %/,%,$$(dir $$(BAREBOX_TARBALL)))
+BAREBOX_SOURCE = $$(notdir $$(BAREBOX_TARBALL))
+BR_NO_CHECK_HASH_FOR += $$(BAREBOX_SOURCE)
+else ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
+BAREBOX_SITE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
 BAREBOX_SITE_METHOD = git
 else
 # Handle stable official Barebox versions
-BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
+BAREBOX_SOURCE = barebox-$$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download
-ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
-BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
+ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $$(BAREBOX_SOURCE)
 endif
 endif
 
@@ -28,97 +36,108 @@ BAREBOX_DEPENDENCIES = host-lzop
 BAREBOX_LICENSE = GPLv2 with exceptions
 BAREBOX_LICENSE_FILES = COPYING
 
-ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
+ifneq ($$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) \
-		$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \*.patch
+	$$(APPLY_PATCHES) $$(@D) \
+		$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \*.patch
 endef
 
 BAREBOX_POST_PATCH_HOOKS += BAREBOX_APPLY_CUSTOM_PATCHES
 endif
 
 BAREBOX_INSTALL_IMAGES = YES
-ifneq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+ifneq ($$(BR2_TARGET_BAREBOX_BAREBOXENV),y)
 BAREBOX_INSTALL_TARGET = NO
 endif
 
-ifeq ($(KERNEL_ARCH),i386)
+ifeq ($$(KERNEL_ARCH),i386)
 BAREBOX_ARCH = x86
-else ifeq ($(KERNEL_ARCH),x86_64)
+else ifeq ($$(KERNEL_ARCH),x86_64)
 BAREBOX_ARCH = x86
-else ifeq ($(KERNEL_ARCH),powerpc)
+else ifeq ($$(KERNEL_ARCH),powerpc)
 BAREBOX_ARCH = ppc
 else
-BAREBOX_ARCH = $(KERNEL_ARCH)
+BAREBOX_ARCH = $$(KERNEL_ARCH)
 endif
 
-BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
-BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
+BAREBOX_MAKE_FLAGS = ARCH=$$(BAREBOX_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
+BAREBOX_MAKE_ENV = $$(TARGET_MAKE_ENV)
 
-ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
-else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-BAREBOX_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
+ifeq ($$(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
+BAREBOX_KCONFIG_DEFCONFIG = $$(call qstrip,$$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+else ifeq ($$(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
+BAREBOX_KCONFIG_FILE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
 endif
 
-BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
+BAREBOX_KCONFIG_FRAGMENT_FILES = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
 BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
-BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
+BAREBOX_KCONFIG_OPTS = $$(BAREBOX_MAKE_FLAGS)
 
-ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+ifeq ($$(BR2_TARGET_BAREBOX_BAREBOXENV),y)
 define BAREBOX_BUILD_BAREBOXENV_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/bareboxenv \
-		$(@D)/scripts/bareboxenv.c
+	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
+		$$(@D)/scripts/bareboxenv.c
 endef
 endif
 
-ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
-BAREBOX_ENV_NAME = $(notdir $(call qstrip,\
-	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
+ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
+BAREBOX_ENV_NAME = $$(notdir $$(call qstrip,\
+	$$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
 define BAREBOX_BUILD_CUSTOM_ENV
-	$(@D)/scripts/bareboxenv -s \
-		$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
-		$(@D)/$(BAREBOX_ENV_NAME)
+	$$(@D)/scripts/bareboxenv -s \
+		$$(call qstrip, $$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
+		$$(@D)/$$(BAREBOX_ENV_NAME)
 endef
 define BAREBOX_INSTALL_CUSTOM_ENV
-	cp $(@D)/$(BAREBOX_ENV_NAME) $(BINARIES_DIR)
+	cp $$(@D)/$$(BAREBOX_ENV_NAME) $$(BINARIES_DIR)
 endef
 endif
 
 define BAREBOX_BUILD_CMDS
-	$(BAREBOX_BUILD_BAREBOXENV_CMDS)
-	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
-	$(BAREBOX_BUILD_CUSTOM_ENV)
+	$$(BAREBOX_BUILD_BAREBOXENV_CMDS)
+	$$(TARGET_MAKE_ENV) $$(MAKE) $$(BAREBOX_MAKE_FLAGS) -C $$(@D)
+	$$(BAREBOX_BUILD_CUSTOM_ENV)
 endef
 
-BAREBOX_IMAGE_FILE = $(call qstrip,$(BR2_TARGET_BAREBOX_IMAGE_FILE))
+BAREBOX_IMAGE_FILE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_IMAGE_FILE))
 
 define BAREBOX_INSTALL_IMAGES_CMDS
-	if test -n "$(BAREBOX_IMAGE_FILE)"; then \
-		cp -L $(@D)/$(BAREBOX_IMAGE_FILE) $(BINARIES_DIR) ; \
-	elif test -h $(@D)/barebox-flash-image ; then \
-		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
+	if test -n "$$(BAREBOX_IMAGE_FILE)"; then \
+		cp -L $$(@D)/$$(BAREBOX_IMAGE_FILE) $$(BINARIES_DIR) ; \
+	elif test -h $$(@D)/barebox-flash-image ; then \
+		cp -L $$(@D)/barebox-flash-image $$(BINARIES_DIR)/barebox.bin ; \
 	else \
-		cp $(@D)/barebox.bin $(BINARIES_DIR);\
+		cp $$(@D)/barebox.bin $$(BINARIES_DIR);\
 	fi
-	$(BAREBOX_INSTALL_CUSTOM_ENV)
+	$$(BAREBOX_INSTALL_CUSTOM_ENV)
 endef
 
-ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+ifeq ($$(BR2_TARGET_BAREBOX_BAREBOXENV),y)
 define BAREBOX_INSTALL_TARGET_CMDS
-	cp $(@D)/bareboxenv $(TARGET_DIR)/usr/bin
+	cp $$(@D)/bareboxenv $$(TARGET_DIR)/usr/bin
 endef
 endif
 
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
-ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
+ifeq ($$(BR2_TARGET_BAREBOX)$$(BR_BUILDING),yy)
 # We must use the user-supplied kconfig value, because
 # BAREBOX_KCONFIG_DEFCONFIG will at least contain the
 # trailing _defconfig
-ifeq ($(or $(BAREBOX_KCONFIG_FILE),$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))),)
-$(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
+ifeq ($$(or $$(BAREBOX_KCONFIG_FILE),$$(call qstrip,$$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))),)
+$$(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
 
-$(eval $(kconfig-package))
+$$(eval $$(kconfig-package))
+
+endef
+
+################################################################################
+# barebox-package -- the target generator macro for barebox packages
+################################################################################
+
+barebox-package=$(call inner-barebox-package)
+
+# instantiate this barebox package
+$(eval $(barebox-package))
-- 
2.5.0
