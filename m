From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:50 +0100
Subject: [Buildroot] [PATCH 20/51] pacakge/gcc: rename all variables as it
	is a host-only package
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <8cf6fec39c0f443211d66042febb6c020da844dd.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The naming convention in Buildroot is that package-specific variables be
prefixed with the package name.

gcc-initial and gcc-final are host-only packages, so they really are
named host-gcc-initial and host-gcc-final, so all their variables should
be prefixed with HOST_GCC_INITIAL_ or HOST_GCC_FINAL_.

gcc is not a package, it only defines variables for either or both of
host-gcc-initial and host-gcc-final, so is only defining variables for
the host variants. Even though it is not a package, prefix all variables
in gcc.mk with HOST_GCC_.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 16 ++++-----
 package/gcc/gcc-initial/gcc-initial.mk |  6 ++--
 package/gcc/gcc.mk                     | 60 +++++++++++++++++-----------------
 3 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 53199c3..9a6d437 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GCC_FINAL_VERSION = $(GCC_VERSION)
-GCC_FINAL_SITE = $(GCC_SITE)
-GCC_FINAL_SOURCE = $(GCC_SOURCE)
+HOST_GCC_FINAL_VERSION = $(HOST_GCC_VERSION)
+HOST_GCC_FINAL_SITE = $(HOST_GCC_SITE)
+HOST_GCC_FINAL_SOURCE = $(HOST_GCC_SOURCE)
 
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
@@ -67,14 +67,14 @@ endef
 
 
 # Languages supported by the cross-compiler
-GCC_FINAL_CROSS_LANGUAGES-y = c
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
-GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
+HOST_GCC_FINAL_CROSS_LANGUAGES-y = c
+HOST_GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+HOST_GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
+HOST_GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(HOST_GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
-	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
+	--enable-languages=$(HOST_GCC_FINAL_CROSS_LANGUAGES) \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index f3cd34c..ca8a7ce 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GCC_INITIAL_VERSION = $(GCC_VERSION)
-GCC_INITIAL_SITE = $(GCC_SITE)
-GCC_INITIAL_SOURCE = $(GCC_SOURCE)
+HOST_GCC_INITIAL_VERSION = $(HOST_GCC_VERSION)
+HOST_GCC_INITIAL_SITE = $(HOST_GCC_SITE)
+HOST_GCC_INITIAL_SOURCE = $(HOST_GCC_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 091bba7..f5d1b50 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -8,14 +8,14 @@
 # Version, site and source
 #
 
-GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
+HOST_GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 
 ifeq ($(BR2_arc),y)
-GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
+HOST_GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(HOST_GCC_VERSION))
+HOST_GCC_SOURCE = gcc-$(HOST_GCC_VERSION).tar.gz
 else
-GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+HOST_GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(HOST_GCC_VERSION)
+HOST_GCC_SOURCE = gcc-$(HOST_GCC_VERSION).tar.bz2
 endif
 
 #
@@ -35,14 +35,14 @@ endef
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
-	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
+	$(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
 endef
 endif
 endif
 
 define HOST_GCC_APPLY_PATCHES
-	if test -d package/gcc/$(GCC_VERSION); then \
-	  $(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
+	if test -d package/gcc/$(HOST_GCC_VERSION); then \
+	  $(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_VERSION) \*.patch ; \
 	fi;
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
@@ -93,28 +93,28 @@ HOST_GCC_COMMON_CONF_OPTS = \
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
 
-GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
-GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+HOST_GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
+HOST_GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
 # Workaround until it's fixed in 4.5.4 or later
 ifeq ($(ARCH),powerpc)
-ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-GCC_COMMON_TARGET_CFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CFLAGS))
-GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
+ifeq ($(findstring x4.5.,x$(HOST_GCC_VERSION)),x4.5.)
+HOST_GCC_COMMON_TARGET_CFLAGS = $(filter-out -Os,$(HOST_GCC_COMMON_TARGET_CFLAGS))
+HOST_GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(HOST_GCC_COMMON_TARGET_CXXFLAGS))
 endif
 endif
 
 # Xtensa libgcc can't be built with -mauto-litpools
 # because of the trick used to generate .init/.fini sections.
 ifeq ($(BR2_xtensa),y)
-GCC_COMMON_TARGET_CFLAGS = $(filter-out -mauto-litpools,$(TARGET_CFLAGS))
-GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mauto-litpools,$(TARGET_CXXFLAGS))
+HOST_GCC_COMMON_TARGET_CFLAGS = $(filter-out -mauto-litpools,$(TARGET_CFLAGS))
+HOST_GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mauto-litpools,$(TARGET_CXXFLAGS))
 endif
 
 # Propagate options used for target software building to GCC target libs
-HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
-HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(HOST_GCC_COMMON_TARGET_CFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(HOST_GCC_COMMON_TARGET_CXXFLAGS)"
 
 # libitm needs sparc V9+
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
@@ -206,19 +206,19 @@ HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 endif
 endif
 
-GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
-ifneq ($(GCC_TARGET_FPU),)
-HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
+HOST_GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
+ifneq ($(HOST_GCC_TARGET_FPU),)
+HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(HOST_GCC_TARGET_FPU)
 endif
 
-GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-ifneq ($(GCC_TARGET_FLOAT_ABI),)
-HOST_GCC_COMMON_CONF_OPTS += --with-float=$(GCC_TARGET_FLOAT_ABI)
+HOST_GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+ifneq ($(HOST_GCC_TARGET_FLOAT_ABI),)
+HOST_GCC_COMMON_CONF_OPTS += --with-float=$(HOST_GCC_TARGET_FLOAT_ABI)
 endif
 
-GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
-ifneq ($(GCC_TARGET_MODE),)
-HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
+HOST_GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
+ifneq ($(HOST_GCC_TARGET_MODE),)
+HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(HOST_GCC_TARGET_MODE)
 endif
 
 # Enable proper double/long double for SPE ABI
@@ -241,20 +241,20 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(HOST_GCC_SOURCE)
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
 # unversioned patches unconditionally
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
-		package/gcc/$(GCC_VERSION)/*.patch \
-		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
+		package/gcc/$(HOST_GCC_VERSION)/*.patch \
+		$(addsuffix $((PKG)_RAWNAME)/$(HOST_GCC_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
 		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(BR2_GLOBAL_PATCH_DIR))))
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
 endif
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
+HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(HOST_GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
 endif
 endif
 
-- 
1.9.1
