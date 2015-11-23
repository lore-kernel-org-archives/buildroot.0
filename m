From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:51 +0100
Subject: [Buildroot] [PATCH 21/51] package/gcc: prefix all common variables
	with HOST_GCC_COMMON_
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <a4eca136047b000a26dfcae4e3a1ef89715bb599.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variables defined in gcc.mk are all common to the gcc-initial and
gcc-final packages.

In a followup patch, we're going to rename gcc-final into just gcc, so
to avoid namespace clashing, we rename all common gcc variables to be
prefixed with HOST_GCC_COMMON_ instead of just HOST_GCC_.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 18 +++++-----
 package/gcc/gcc-initial/gcc-initial.mk | 18 +++++-----
 package/gcc/gcc.mk                     | 66 +++++++++++++++++-----------------
 3 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 9a6d437..c5da163 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -4,28 +4,28 @@
 #
 ################################################################################
 
-HOST_GCC_FINAL_VERSION = $(HOST_GCC_VERSION)
-HOST_GCC_FINAL_SITE = $(HOST_GCC_SITE)
-HOST_GCC_FINAL_SOURCE = $(HOST_GCC_SOURCE)
+HOST_GCC_FINAL_VERSION = $(HOST_GCC_COMMON_VERSION)
+HOST_GCC_FINAL_SITE = $(HOST_GCC_COMMON_SITE)
+HOST_GCC_FINAL_SOURCE = $(HOST_GCC_COMMON_SOURCE)
 
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
 
-HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
+HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
+HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
 endif
 
-HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
 HOST_GCC_FINAL_SUBDIR = build
 
-HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
 
 # We want to always build the static variants of all the gcc libraries,
 # of which libstdc++, libgomp, libmudflap...
@@ -126,7 +126,7 @@ HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARG
 HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
 # Note: this must be done after CREATE_CC_SYMLINKS, otherwise the
 # -cc symlink to the wrapper is not created.
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_COMMON_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
 # In gcc 4.7.x, the ARM EABIhf library loader path for (e)glibc was not
 # correct, so we create a symbolic link to make things work
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index ca8a7ce..02537cf 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -4,26 +4,26 @@
 #
 ################################################################################
 
-HOST_GCC_INITIAL_VERSION = $(HOST_GCC_VERSION)
-HOST_GCC_INITIAL_SITE = $(HOST_GCC_SITE)
-HOST_GCC_INITIAL_SOURCE = $(HOST_GCC_SOURCE)
+HOST_GCC_INITIAL_VERSION = $(HOST_GCC_COMMON_VERSION)
+HOST_GCC_INITIAL_SITE = $(HOST_GCC_COMMON_SITE)
+HOST_GCC_INITIAL_SOURCE = $(HOST_GCC_COMMON_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
-HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
-HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
+HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
+HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
 endif
 
-HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
 HOST_GCC_INITIAL_SUBDIR = build
 
-HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
 
 HOST_GCC_INITIAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
@@ -49,6 +49,6 @@ endif
 
 HOST_GCC_INITIAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
 HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
-HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_COMMON_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
 $(eval $(host-autotools-package))
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index f5d1b50..abab6ec 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -8,24 +8,24 @@
 # Version, site and source
 #
 
-HOST_GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
+HOST_GCC_COMMON_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 
 ifeq ($(BR2_arc),y)
-HOST_GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(HOST_GCC_VERSION))
-HOST_GCC_SOURCE = gcc-$(HOST_GCC_VERSION).tar.gz
+HOST_GCC_COMMON_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(HOST_GCC_COMMON_VERSION))
+HOST_GCC_COMMON_SOURCE = gcc-$(HOST_GCC_COMMON_VERSION).tar.gz
 else
-HOST_GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(HOST_GCC_VERSION)
-HOST_GCC_SOURCE = gcc-$(HOST_GCC_VERSION).tar.bz2
+HOST_GCC_COMMON_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(HOST_GCC_COMMON_VERSION)
+HOST_GCC_COMMON_SOURCE = gcc-$(HOST_GCC_COMMON_VERSION).tar.bz2
 endif
 
 #
 # Xtensa special hook
 #
 
-HOST_GCC_XTENSA_OVERLAY_TAR = $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,$(BR2_XTENSA_CORE_NAME)).tar
+HOST_GCC_COMMON_XTENSA_OVERLAY_TAR = $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,$(BR2_XTENSA_CORE_NAME)).tar
 
-define HOST_GCC_XTENSA_OVERLAY_EXTRACT
-	tar xf $(HOST_GCC_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
+define HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
+	tar xf $(HOST_GCC_COMMON_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
 endef
 
 #
@@ -34,24 +34,24 @@ endef
 
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
-define HOST_GCC_APPLY_POWERPC_PATCH
-	$(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
+define HOST_GCC_COMMON_APPLY_POWERPC_PATCH
+	$(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_COMMON_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
 endef
 endif
 endif
 
-define HOST_GCC_APPLY_PATCHES
-	if test -d package/gcc/$(HOST_GCC_VERSION); then \
-	  $(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_VERSION) \*.patch ; \
+define HOST_GCC_COMMON_APPLY_PATCHES
+	if test -d package/gcc/$(HOST_GCC_COMMON_VERSION); then \
+	  $(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_COMMON_VERSION) \*.patch ; \
 	fi;
-	$(HOST_GCC_APPLY_POWERPC_PATCH)
+	$(HOST_GCC_COMMON_APPLY_POWERPC_PATCH)
 endef
 
-HOST_GCC_EXCLUDES = \
+HOST_GCC_COMMON_EXCLUDES = \
 	libjava/* libgo/* \
 	gcc/testsuite/* libstdc++-v3/testsuite/*
 
-define HOST_GCC_FAKE_TESTSUITE
+define HOST_GCC_COMMON_FAKE_TESTSUITE
 	mkdir -p $(@D)/libstdc++-v3/testsuite/
 	echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
 	echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
@@ -61,7 +61,7 @@ endef
 # Create 'build' directory and configure symlink
 #
 
-define HOST_GCC_CONFIGURE_SYMLINK
+define HOST_GCC_COMMON_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/build
 	ln -sf ../configure $(@D)/build/configure
 endef
@@ -99,7 +99,7 @@ HOST_GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
 # Workaround until it's fixed in 4.5.4 or later
 ifeq ($(ARCH),powerpc)
-ifeq ($(findstring x4.5.,x$(HOST_GCC_VERSION)),x4.5.)
+ifeq ($(findstring x4.5.,x$(HOST_GCC_COMMON_VERSION)),x4.5.)
 HOST_GCC_COMMON_TARGET_CFLAGS = $(filter-out -Os,$(HOST_GCC_COMMON_TARGET_CFLAGS))
 HOST_GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(HOST_GCC_COMMON_TARGET_CXXFLAGS))
 endif
@@ -206,19 +206,19 @@ HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 endif
 endif
 
-HOST_GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
-ifneq ($(HOST_GCC_TARGET_FPU),)
-HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(HOST_GCC_TARGET_FPU)
+HOST_GCC_COMMON_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
+ifneq ($(HOST_GCC_COMMON_TARGET_FPU),)
+HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(HOST_GCC_COMMON_TARGET_FPU)
 endif
 
-HOST_GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-ifneq ($(HOST_GCC_TARGET_FLOAT_ABI),)
-HOST_GCC_COMMON_CONF_OPTS += --with-float=$(HOST_GCC_TARGET_FLOAT_ABI)
+HOST_GCC_COMMON_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+ifneq ($(HOST_GCC_COMMON_TARGET_FLOAT_ABI),)
+HOST_GCC_COMMON_CONF_OPTS += --with-float=$(HOST_GCC_COMMON_TARGET_FLOAT_ABI)
 endif
 
-HOST_GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
-ifneq ($(HOST_GCC_TARGET_MODE),)
-HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(HOST_GCC_TARGET_MODE)
+HOST_GCC_COMMON_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
+ifneq ($(HOST_GCC_COMMON_TARGET_MODE),)
+HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(HOST_GCC_COMMON_TARGET_MODE)
 endif
 
 # Enable proper double/long double for SPE ABI
@@ -241,20 +241,20 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(HOST_GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(HOST_GCC_COMMON_SOURCE)
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
 # unversioned patches unconditionally
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
-		package/gcc/$(HOST_GCC_VERSION)/*.patch \
-		$(addsuffix $((PKG)_RAWNAME)/$(HOST_GCC_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
+		package/gcc/$(HOST_GCC_COMMON_VERSION)/*.patch \
+		$(addsuffix $((PKG)_RAWNAME)/$(HOST_GCC_COMMON_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
 		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(BR2_GLOBAL_PATCH_DIR))))
 ifeq ($(BR2_xtensa),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_COMMON_XTENSA_OVERLAY_TAR)
 endif
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(HOST_GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
+HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(HOST_GCC_COMMON_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
 endif
 endif
 
@@ -276,7 +276,7 @@ endif # BR2_CCACHE
 # *-ranlib and *-nm.
 # Avoid that a .br_real is symlinked a second time.
 # Also create <arch>-linux-<tool> symlinks.
-define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+define HOST_GCC_COMMON_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 	$(Q)cd $(HOST_DIR)/usr/bin; \
 	for i in $(GNU_TARGET_NAME)-*; do \
 		case "$$i" in \
-- 
1.9.1
