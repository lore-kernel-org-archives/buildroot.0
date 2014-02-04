From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 04 Feb 2014 17:21:55 +0100
Subject: [Buildroot] [PATCH 3 of 4 v2] infra: remove unused 4th parameter to
 package infrastructures (pkgparentdir)
In-Reply-To: <patchbomb.1391530912@argentina>
References: <patchbomb.1391530912@argentina>
Message-ID: <2af449ca8a013ad360b2.1391530915@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fourth parameter to inner-generic-package is no longer used. Removing
this parameters requires renaming all usages of $(5) to $(4), and updating
the calls to inner-generic-package (and equivalent for the other package
infrastructures).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-autotools.mk |  13 ++++++-------
 package/pkg-cmake.mk     |  13 ++++++-------
 package/pkg-generic.mk   |  21 ++++++++++-----------
 package/pkg-luarocks.mk  |   7 +++----
 package/pkg-python.mk    |  17 ++++++++---------
 5 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -48,8 +48,7 @@ endef
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 4 is the type (target or host)
 ################################################################################
 
 define inner-autotools-package
@@ -94,7 +93,7 @@ endif
 # packages.
 #
 ifndef $(2)_CONFIGURE_CMDS
-ifeq ($(5),target)
+ifeq ($(4),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
@@ -220,7 +219,7 @@ endif
 # file.
 #
 ifndef $(2)_BUILD_CMDS
-ifeq ($(5),target)
+ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
 endef
@@ -267,7 +266,7 @@ endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 endef
 
@@ -275,5 +274,5 @@ endef
 # autotools-package -- the target generator macro for autotools packages
 ################################################################################
 
-autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),target)
+host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),host)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -31,8 +31,7 @@
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 4 is the type (target or host)
 ################################################################################
 
 define inner-cmake-package
@@ -55,7 +54,7 @@ define inner-cmake-package
 # packages.
 #
 ifndef $(2)_CONFIGURE_CMDS
-ifeq ($(5),target)
+ifeq ($(4),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
@@ -99,7 +98,7 @@ endif
 # file.
 #
 ifndef $(2)_BUILD_CMDS
-ifeq ($(5),target)
+ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
@@ -142,7 +141,7 @@ endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 endef
 
@@ -150,8 +149,8 @@ endef
 # cmake-package -- the target generator macro for CMake packages
 ################################################################################
 
-cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),target)
+host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),host)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -241,8 +241,7 @@ endif
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 4 is the type (target or host)
 ################################################################################
 
 define inner-generic-package
@@ -254,7 +253,7 @@ define inner-generic-package
 # these informations have only to be specified once, for both the
 # target and host packages of a given .mk file.
 
-$(2)_TYPE                       =  $(5)
+$(2)_TYPE                       =  $(4)
 $(2)_NAME			=  $(1)
 $(2)_RAWNAME			=  $(patsubst host-%,%,$(1))
 
@@ -534,7 +533,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
 # Packages that have a tarball need it downloaded and extracted beforehand
-$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(5)))
+$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
 $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
 endif
 endif
@@ -558,23 +557,23 @@ else
 
 # Save license files if defined
 ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
-	@$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(5)))
+	@$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(4)))
 	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
 # Double dollar signs are really needed here, to catch host packages
 # without explicit HOST_FOO_LICENSE_FILES assignment, also in case they
 # have multiple license files.
-	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$(call UPPERCASE,$(5)))$$(sep))
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
-	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(5))) 2>/dev/null || \
-	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(5)))
+	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4))) 2>/dev/null || \
+	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
 endif # redistribute
 
 endif # other packages
-	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(5)))
+	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(4)))
 endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
 
@@ -617,8 +616,8 @@ endef # inner-generic-package
 ################################################################################
 
 # In the case of target packages, keep the package name "pkg"
-generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),target)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),host)
 
 # :mode=makefile:
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -28,8 +28,7 @@
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 4 is the type (target or host)
 ################################################################################
 
 define inner-luarocks-package
@@ -70,7 +69,7 @@ endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 endef
 
@@ -78,5 +77,5 @@ endef
 # luarocks-package -- the target generator macro for LuaRocks packages
 ################################################################################
 
-luarocks-package = $(call inner-luarocks-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+luarocks-package = $(call inner-luarocks-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),target)
 # host-luarocks-package not supported
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -80,8 +80,7 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT =
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 4 is the type (target or host)
 ################################################################################
 
 define inner-python-package
@@ -103,7 +102,7 @@ endif
 
 # Distutils
 ifeq ($$($(2)_SETUP_TYPE),distutils)
-ifeq ($(5),target)
+ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
 $(2)_BASE_BUILD_OPT   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPT)
@@ -116,7 +115,7 @@ else
 endif
 # Setuptools
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
-ifeq ($(5),target)
+ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
 $(2)_BASE_BUILD_TGT   = build -x
 $(2)_BASE_BUILD_OPT   =
@@ -149,7 +148,7 @@ endif
 # runtime) and the python interpreter on the host (for
 # compilation). However, host packages only need the python
 # interpreter on the host.
-ifeq ($(5),target)
+ifeq ($(4),target)
 $(2)_DEPENDENCIES += host-python python
 else
 $(2)_DEPENDENCIES += host-python
@@ -164,7 +163,7 @@ endif
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifneq ($(2),HOST_PYTHON_SETUPTOOLS)
 $(2)_DEPENDENCIES += host-python-setuptools
-ifeq ($(5),target)
+ifeq ($(4),target)
 $(2)_DEPENDENCIES += host-python-distutilscross
 endif
 endif
@@ -212,7 +211,7 @@ endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 endef
 
@@ -220,5 +219,5 @@ endef
 # python-package -- the target generator macro for Python packages
 ################################################################################
 
-python-package = $(call inner-python-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-python-package = $(call inner-python-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+python-package = $(call inner-python-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),target)
+host-python-package = $(call inner-python-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),host)
