From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:05 +0100
Subject: [Buildroot] [PATCH 10/21 RFC] package/gcc: make host-gcc a pure
	host package
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <ee7fc6847f08818a2b73c21060321b7b088a99f8.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we define a mix of GCC_ and HOST_GCC_ variables, even though
we only have a host variant of the gcc package.

Prefix all variables with HOST_ since gcc is a pure host package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk     |  6 ++--
 package/gcc/gcc-initial/gcc-initial.mk |  6 ++--
 package/gcc/gcc.mk                     | 64 +++++++++++++++++-----------------
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index dcbf7bf..5479a4b 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GCC_FINAL_VERSION = $(GCC_VERSION)
-GCC_FINAL_SITE = $(GCC_SITE)
-GCC_FINAL_SOURCE = $(GCC_SOURCE)
+GCC_FINAL_VERSION = $(HOST_GCC_VERSION)
+GCC_FINAL_SITE = $(HOST_GCC_SITE)
+GCC_FINAL_SOURCE = $(HOST_GCC_SOURCE)
 
 # We only need to redistribute the gcc sources once, and that is handled by
 # the host-gcc package, not host-gcc-final. So, we fake a non-redistribuale
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index e476c501..1c478a5 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GCC_INITIAL_VERSION = $(GCC_VERSION)
-GCC_INITIAL_SITE = $(GCC_SITE)
-GCC_INITIAL_SOURCE = $(GCC_SOURCE)
+GCC_INITIAL_VERSION = $(HOST_GCC_VERSION)
+GCC_INITIAL_SITE = $(HOST_GCC_SITE)
+GCC_INITIAL_SOURCE = $(HOST_GCC_SOURCE)
 
 # We only need to redistribute the gcc sources once, and that is handled by
 # the host-gcc package, not host-gcc-initial. So, we fake a non-redistribuale
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index fa5baa6..28346b2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -8,11 +8,11 @@
 # Version, site and source
 #
 
-GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
-GCC_LICENSE = \
+HOST_GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
+HOST_GCC_LICENSE = \
 	GPLv2+, GPLv3+, LGPLv2.1+ (w/ exception), LGPv3+ (w/ exception), \
 	BSD-3c, MIT, BSL-1.0
-GCC_LICENSE_FILES = \
+HOST_GCC_LICENSE_FILES = \
 	COPYING COPYING3 COPYING.LIB COPYING3.LIB COPYING.RUNTIME \
 	libiberty/COPYING.LIB gcc/go/gofrontend/LICENSE \
 	gcc/COPYING gcc/COPYING.LIB gcc/COPYING3 gcc/COPYING3.LIB \
@@ -20,11 +20,11 @@ GCC_LICENSE_FILES = \
 	include/COPYING include/COPYING3 zlib/contrib/dotzlib/LICENSE_1_0.txt
 
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
 
 HOST_GCC_EXCLUDES = \
@@ -52,15 +52,15 @@ endif # Xtensa
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
-	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
+	$(APPLY_PATCHES) $(@D) package/gcc/$(HOST_GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
 endef
 HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_APPLY_POWERPC_PATCH
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
@@ -102,28 +102,28 @@ HOST_GCC_COMMON_CONF_OPTS = \
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
@@ -215,19 +215,19 @@ HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
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
@@ -250,20 +250,20 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(HOST_GCC_SOURCE)
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
 # unversioned patches unconditionally
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
-		package/gcc/$(GCC_VERSION)/*.patch \
-		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		package/gcc/$(HOST_GCC_VERSION)/*.patch \
+		$(addsuffix $((PKG)_RAWNAME)/$(HOST_GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
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
