From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 12:53:12 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir in
	favor of pkgdir
In-Reply-To: <patchbomb.1384170790@argentina>
References: <patchbomb.1384170790@argentina>
Message-ID: <8953db252a5816d2e988.1384170792@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As Arnout suggested, pkgparentdir is no longer really needed. Its usage can
be replaced with pkgdir. This patch makes that change, and removes the
definition of pkgparentdir.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: as a consequence of this change, the definition of FOO_DIR_PREFIX
slightly changed. I could have renamed the variable, but FOO_DIR was already
taken, and it's still more or less a prefix.

 package/pkg-autotools.mk |   6 +++---
 package/pkg-cmake.mk     |   6 +++---
 package/pkg-generic.mk   |  10 +++++-----
 package/pkg-utils.mk     |   1 -
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -48,7 +48,7 @@ endef
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
+#  argument 4 is the package directory
 #  argument 5 is the type (target or host)
 ################################################################################
 
@@ -311,5 +311,5 @@ endef
 # autotools-package -- the target generator macro for autotools packages
 ################################################################################
 
-autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
+host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -31,7 +31,7 @@
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
+#  argument 4 is the package directory
 #  argument 5 is the type (target or host)
 ################################################################################
 
@@ -179,8 +179,8 @@ endef
 # cmake-package -- the target generator macro for CMake packages
 ################################################################################
 
-cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
+host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -89,7 +89,7 @@ endif
 # find the package directory (typically package/<pkgname>) and the
 # prefix of the patches
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
+$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
@@ -197,7 +197,7 @@ endif
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
+#  argument 4 is the package directory
 #  argument 5 is the type (target or host)
 ################################################################################
 
@@ -475,7 +475,7 @@ endif
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifeq ($(4),boot/)
+else ifneq ($(filter boot/%,$(4)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
@@ -565,8 +565,8 @@ endef # inner-generic-package
 ################################################################################
 
 # In the case of target packages, keep the package name "pkg"
-generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 
 # :mode=makefile:
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -60,7 +60,6 @@ endef
 # package, for which the package directory is an empty string.
 pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
 pkgname      = $(lastword $(subst /, ,$(call pkgdir)))
-pkgparentdir = $(patsubst %$(call pkgname)/,%,$(call pkgdir))
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
