From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:52:09 +0200
Subject: [Buildroot] [PATCH 10/12] Makefile.package.in: Pass non-prefixed
	name as argument to GENTARGETS_INNER.
In-Reply-To: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1a95e4dffd7b68d2e9fbcb9d13516f086decab1c.1311141088.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Quotient Remainder <quotientvremainder@gmail.com>

Instead of effectively running s/^host-// on the package name, just pass the
non-prefixed name to GENTARGETS_INNER.  This removes the need to ban packages
with names starting with "host-".

Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
---
 package/Makefile.autotools.in |  119 ++++++++++----------
 package/Makefile.cmake.in     |   91 ++++++++-------
 package/Makefile.package.in   |  247 +++++++++++++++++++++--------------------
 3 files changed, 233 insertions(+), 224 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index b65caa2..1591f61 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -29,66 +29,69 @@
 # calls the generic package infrastructure to generate the necessary
 # make targets
 #
-#  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 1 is the lowercase package name, including an host- prefix
 #             for host packages
-#  argument 3 is the uppercase package name, without the HOST_ prefix
+#  argument 2 is the lowercase package name, without the host- prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 3 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 4 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 5 is the package directory prefix
+#  argument 6 is the type (target or host)
 ################################################################################
 
 define AUTOTARGETS_INNER
 
 # define package-specific variables to default values
-ifndef $(2)_SUBDIR
- ifdef $(3)_SUBDIR
-  $(2)_SUBDIR = $($(3)_SUBDIR)
+ifndef $(3)_SUBDIR
+ ifdef $(4)_SUBDIR
+  $(3)_SUBDIR = $($(4)_SUBDIR)
  else
-  $(2)_SUBDIR ?=
+  $(3)_SUBDIR ?=
  endif
 endif
 
-ifndef $(2)_LIBTOOL_PATCH
- ifdef $(3)_LIBTOOL_PATCH
-  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
+ifndef $(3)_LIBTOOL_PATCH
+ ifdef $(4)_LIBTOOL_PATCH
+  $(3)_LIBTOOL_PATCH = $($(4)_LIBTOOL_PATCH)
  else
-  $(2)_LIBTOOL_PATCH ?= YES
+  $(3)_LIBTOOL_PATCH ?= YES
  endif
 endif
 
-ifndef $(2)_MAKE
- ifdef $(3)_MAKE
-  $(2)_MAKE = $($(3)_MAKE)
+ifndef $(3)_MAKE
+ ifdef $(4)_MAKE
+  $(3)_MAKE = $($(4)_MAKE)
  else
-  $(2)_MAKE ?= $(MAKE)
+  $(3)_MAKE ?= $(MAKE)
  endif
 endif
 
-$(2)_CONF_ENV			?=
-$(2)_CONF_OPT			?=
-$(2)_MAKE_ENV			?=
-$(2)_MAKE_OPT			?=
-$(2)_AUTORECONF			?= NO
-$(2)_AUTORECONF_OPT		?=
-$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
-$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
-$(2)_CLEAN_OPT			?= clean
-$(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
-$(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
+$(3)_CONF_ENV			?=
+$(3)_CONF_OPT			?=
+$(3)_MAKE_ENV			?=
+$(3)_MAKE_OPT			?=
+$(3)_AUTORECONF			?= NO
+$(3)_AUTORECONF_OPT		?=
+$(3)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+$(3)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
+$(3)_CLEAN_OPT			?= clean
+$(3)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
+$(3)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
-$(2)_SRCDIR                     = $$($(2)_DIR)/$($(2)_SUBDIR)
+$(3)_SRCDIR                     = $$($(3)_DIR)/$($(3)_SUBDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
 # packages.
 #
-ifndef $(2)_CONFIGURE_CMDS
-ifeq ($(5),target)
+ifndef $(3)_CONFIGURE_CMDS
+ifeq ($(6),target)
 
 # Configure package for target
-define $(2)_CONFIGURE_CMDS
+define $(3)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$(TARGET_CONFIGURE_ARGS) \
@@ -111,7 +114,7 @@ endef
 else
 
 # Configure package for host
-define $(2)_CONFIGURE_CMDS
+define $(3)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
 	        $$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$$(HOST_CFLAGS)" \
@@ -138,7 +141,7 @@ define UPDATE_CONFIG_HOOK
 	done
 endef
 
-$(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+$(3)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 #
 # Hook to patch libtool to make it work properly for cross-compilation
@@ -162,8 +165,8 @@ define LIBTOOL_PATCH_HOOK
 endef
 
 # default values are not evaluated yet, so don't rely on this defaulting to YES
-ifneq ($$($(2)_LIBTOOL_PATCH),NO)
-$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
+ifneq ($$($(3)_LIBTOOL_PATCH),NO)
+$(3)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
 #
@@ -186,22 +189,22 @@ define AUTORECONF_HOOK
 	fi
 endef
 
-ifeq ($$($(2)_AUTORECONF),YES)
-$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
-$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+ifeq ($$($(3)_AUTORECONF),YES)
+$(3)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
+$(3)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
 
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
 #
-ifndef $(2)_BUILD_CMDS
-ifeq ($(5),target)
-define $(2)_BUILD_CMDS
+ifndef $(4)_BUILD_CMDS
+ifeq ($(6),target)
+define $(3)_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 else
-define $(2)_BUILD_CMDS
+define $(3)_BUILD_CMDS
 	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
@@ -211,8 +214,8 @@ endif
 # Host installation step. Only define it if not already defined by the
 # package .mk file.
 #
-ifndef $(2)_INSTALL_CMDS
-define $(2)_INSTALL_CMDS
+ifndef $(3)_INSTALL_CMDS
+define $(3)_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
 endef
 endif
@@ -221,8 +224,8 @@ endif
 # Staging installation step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_INSTALL_STAGING_CMDS
-define $(2)_INSTALL_STAGING_CMDS
+ifndef $(3)_INSTALL_STAGING_CMDS
+define $(3)_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
 		cp -f $$$$i $$$$i~; \
@@ -235,8 +238,8 @@ endif
 # Target installation step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_INSTALL_TARGET_CMDS
-define $(2)_INSTALL_TARGET_CMDS
+ifndef $(3)_INSTALL_TARGET_CMDS
+define $(3)_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
@@ -245,8 +248,8 @@ endif
 # Clean step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_CLEAN_CMDS
-define $(2)_CLEAN_CMDS
+ifndef $(3)_CLEAN_CMDS
+define $(3)_CLEAN_CMDS
 	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
@@ -255,8 +258,8 @@ endif
 # Uninstall from staging step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_UNINSTALL_STAGING_CMDS
-define $(2)_UNINSTALL_STAGING_CMDS
+ifndef $(3)_UNINSTALL_STAGING_CMDS
+define $(3)_UNINSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
@@ -265,15 +268,15 @@ endif
 # Uninstall from target step. Only define it if not already defined
 # by the package .mk file.
 #
-ifndef $(2)_UNINSTALL_TARGET_CMDS
-define $(2)_UNINSTALL_TARGET_CMDS
+ifndef $(3)_UNINSTALL_TARGET_CMDS
+define $(3)_UNINSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call GENTARGETS_INNER,$(1),$(2),$(3),$(4),$(5))
+$(call GENTARGETS_INNER,$(1),$(2),$(3),$(4),$(5),$(6))
 
 endef
 
@@ -285,8 +288,8 @@ endef
 
 define AUTOTARGETS
 ifeq ($(1),host)
-$(call AUTOTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
+$(call AUTOTARGETS_INNER,$(1)-$(call pkgname),$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 else
-$(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
+$(call AUTOTARGETS_INNER,$(call pkgname),$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
 endif
 endef
diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
index b48e09a..30b0e76 100644
--- a/package/Makefile.cmake.in
+++ b/package/Makefile.cmake.in
@@ -26,49 +26,52 @@
 # tune the build process and calls the generic package infrastructure to
 # generate the necessary make targets
 #
-#  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 1 is the lowercase package name, including the host- prefix
 #             for host packages
-#  argument 3 is the uppercase package name, without the HOST_ prefix
+#  argument 2 is the lowercase package name, without the host- prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 3 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 4 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 5 is the package directory prefix
+#  argument 6 is the type (target or host)
 ################################################################################
 
 define CMAKETARGETS_INNER
 
 # define package-specific variables to default values
-ifndef $(2)_SUBDIR
- ifdef $(3)_SUBDIR
-  $(2)_SUBDIR = $($(3)_SUBDIR)
+ifndef $(3)_SUBDIR
+ ifdef $(4)_SUBDIR
+  $(3)_SUBDIR = $($(4)_SUBDIR)
  else
-  $(2)_SUBDIR ?=
+  $(3)_SUBDIR ?=
  endif
 endif
 
-$(2)_CONF_ENV			?=
-$(2)_CONF_OPT			?=
-$(2)_MAKE			?= $(MAKE)
-$(2)_MAKE_ENV			?=
-$(2)_MAKE_OPT			?=
-$(2)_INSTALL_HOST_OPT		?= install
-$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
-$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
-$(2)_CLEAN_OPT			?= clean
+$(3)_CONF_ENV			?=
+$(3)_CONF_OPT			?=
+$(3)_MAKE			?= $(MAKE)
+$(3)_MAKE_ENV			?=
+$(3)_MAKE_OPT			?=
+$(3)_INSTALL_HOST_OPT		?= install
+$(3)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+$(3)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
+$(3)_CLEAN_OPT			?= clean
 
-$(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
-$(2)_BUILDDIR			= $$($(2)_SRCDIR)
+$(3)_SRCDIR			= $$($(3)_DIR)/$($(3)_SUBDIR)
+$(3)_BUILDDIR			= $$($(3)_SRCDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
 # packages.
 #
-ifndef $(2)_CONFIGURE_CMDS
-ifeq ($(5),target)
+ifndef $(3)_CONFIGURE_CMDS
+ifeq ($(6),target)
 
 # Configure package for target
-define $(2)_CONFIGURE_CMDS
+define $(3)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
@@ -80,7 +83,7 @@ endef
 else
 
 # Configure package for host
-define $(2)_CONFIGURE_CMDS
+define $(3)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
@@ -96,19 +99,19 @@ endef
 endif
 endif
 
-$(2)_DEPENDENCIES += host-cmake
+$(3)_DEPENDENCIES += host-cmake
 
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
 #
-ifndef $(2)_BUILD_CMDS
-ifeq ($(5),target)
-define $(2)_BUILD_CMDS
+ifndef $(3)_BUILD_CMDS
+ifeq ($(6),target)
+define $(3)_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 else
-define $(2)_BUILD_CMDS
+define $(3)_BUILD_CMDS
 	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
@@ -118,8 +121,8 @@ endif
 # Host installation step. Only define it if not already defined by the
 # package .mk file.
 #
-ifndef $(2)_INSTALL_CMDS
-define $(2)_INSTALL_CMDS
+ifndef $(3)_INSTALL_CMDS
+define $(3)_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
@@ -128,8 +131,8 @@ endif
 # Staging installation step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_INSTALL_STAGING_CMDS
-define $(2)_INSTALL_STAGING_CMDS
+ifndef $(3)_INSTALL_STAGING_CMDS
+define $(3)_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
@@ -138,8 +141,8 @@ endif
 # Target installation step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_INSTALL_TARGET_CMDS
-define $(2)_INSTALL_TARGET_CMDS
+ifndef $(3)_INSTALL_TARGET_CMDS
+define $(3)_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
@@ -148,8 +151,8 @@ endif
 # Clean step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_CLEAN_CMDS
-define $(2)_CLEAN_CMDS
+ifndef $(3)_CLEAN_CMDS
+define $(3)_CLEAN_CMDS
 	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
@@ -158,8 +161,8 @@ endif
 # Uninstall from staging step. Only define it if not already defined by
 # the package .mk file.
 #
-ifndef $(2)_UNINSTALL_STAGING_CMDS
-define $(2)_UNINSTALL_STAGING_CMDS
+ifndef $(3)_UNINSTALL_STAGING_CMDS
+define $(3)_UNINSTALL_STAGING_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && sed "s:\(.*\):$$(STAGING_DIR)\1:" install_manifest.txt | xargs rm -f)
 endef
 endif
@@ -168,15 +171,15 @@ endif
 # Uninstall from target step. Only define it if not already defined
 # by the package .mk file.
 #
-ifndef $(2)_UNINSTALL_TARGET_CMDS
-define $(2)_UNINSTALL_TARGET_CMDS
+ifndef $(3)_UNINSTALL_TARGET_CMDS
+define $(3)_UNINSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && sed "s:\(.*\):$$(TARGET_DIR)\1:" install_manifest.txt | xargs rm -f)
 endef
 endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call GENTARGETS_INNER,$(1),$(2),$(3),$(4),$(5))
+$(call GENTARGETS_INNER,$(1),$(2),$(3),$(4),$(5),$(6))
 
 endef
 
@@ -188,8 +191,8 @@ endef
 
 define CMAKETARGETS
 ifeq ($(1),host)
-$(call CMAKETARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
+$(call CMAKETARGETS_INNER,$(1)-$(call pkgname),$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 else
-$(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
+$(call CMAKETARGETS_INNER,$(call pkgname),$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
 endif
 endef
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index cfe4633..cc26cdc 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -379,13 +379,16 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 # GENTARGETS_INNER -- generates the make targets needed to build a
 # generic package
 #
-#  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 1 is the lowercase package name, including an host- prefix
 #             for host packages
-#  argument 3 is the uppercase package name, without the HOST_ prefix
+#  argument 2 is the lowercase package name, without the host- prefix
 #             for host packages
-#  argument 4 is the package directory prefix
-#  argument 5 is the type (target or host)
+#  argument 3 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 4 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 5 is the package directory prefix
+#  argument 6 is the type (target or host)
 ################################################################################
 
 define GENTARGETS_INNER
@@ -397,146 +400,146 @@ define GENTARGETS_INNER
 # these informations have only to be specified once, for both the
 # target and host packages of a given .mk file.
 
-$(2)_TYPE                       =  $(5)
-$(2)_NAME			=  $(1)
+$(3)_TYPE                       =  $(6)
+$(3)_NAME			=  $(1)
 
 # Keep the package version that may contain forward slashes in the _DL_VERSION
 # variable, then replace all forward slashes ('/') by underscores ('_') to
 # sanitize the package version that is used in paths, directory and file names.
 # Forward slashes may appear in the package's version when pointing to a
 # version control system branch or tag, for example remotes/origin/1_10_stable.
-$(2)_DL_VERSION	= $($(2)_VERSION)
-ifndef $(2)_VERSION
- ifdef $(3)_VERSION
-  $(2)_VERSION = $($(3)_VERSION)
+$(3)_DL_VERSION	= $($(3)_VERSION)
+ifndef $(3)_VERSION
+ ifdef $(4)_VERSION
+  $(3)_VERSION = $($(4)_VERSION)
  else
-  $(2)_VERSION = undefined
+  $(3)_VERSION = undefined
  endif
 else
- $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
+ $(3)_VERSION = $(subst /,_,$($(3)_VERSION))
 endif
 
-$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
-$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
-$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
+$(3)_BASE_NAME	=  $(1)-$$($(3)_VERSION)
+$(3)_DL_DIR	=  $$(DL_DIR)/$$($(3)_BASE_NAME)
+$(3)_DIR	=  $$(BUILD_DIR)/$$($(3)_BASE_NAME)
 
-ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-$(2)_VERSION = custom
+ifneq ($$($(3)_OVERRIDE_SRCDIR),)
+$(3)_VERSION = custom
 endif
 
-ifndef $(2)_SOURCE
- ifdef $(3)_SOURCE
-  $(2)_SOURCE = $($(3)_SOURCE)
+ifndef $(3)_SOURCE
+ ifdef $(4)_SOURCE
+  $(3)_SOURCE = $($(4)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
+  $(3)_SOURCE			?= $$($(3)_BASE_NAME).tar.gz
  endif
 endif
 
-ifndef $(2)_PATCH
- ifdef $(3)_PATCH
-  $(2)_PATCH = $($(3)_PATCH)
+ifndef $(3)_PATCH
+ ifdef $(4)_PATCH
+  $(3)_PATCH = $($(4)_PATCH)
  endif
 endif
 
-ifndef $(2)_SITE
- ifdef $(3)_SITE
-  $(2)_SITE = $($(3)_SITE)
+ifndef $(3)_SITE
+ ifdef $(4)_SITE
+  $(3)_SITE = $($(4)_SITE)
  else
-  $(2)_SITE			?= \
+  $(3)_SITE			?= \
 	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
  endif
 endif
 
-ifndef $(2)_SITE_METHOD
- ifdef $(3)_SITE_METHOD
-  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
+ifndef $(3)_SITE_METHOD
+ ifdef $(4)_SITE_METHOD
+  $(3)_SITE_METHOD = $($(4)_SITE_METHOD)
  else
 	# Try automatic detection using the scheme part of the URI
-	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
+	$(3)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(3)_SITE))))
  endif
 endif
 
-ifeq ($$($(2)_SITE_METHOD),local)
-ifeq ($$($(2)_OVERRIDE_SRCDIR),)
-$(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
+ifeq ($$($(3)_SITE_METHOD),local)
+ifeq ($$($(3)_OVERRIDE_SRCDIR),)
+$(3)_OVERRIDE_SRCDIR = $($(4)_SITE)
 endif
 endif
 
-$(2)_DEPENDENCIES		?=
-$(2)_INSTALL_STAGING		?= NO
-$(2)_INSTALL_IMAGES		?= NO
-$(2)_INSTALL_TARGET		?= YES
-$(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
+$(3)_DEPENDENCIES		?=
+$(3)_INSTALL_STAGING		?= NO
+$(3)_INSTALL_IMAGES		?= NO
+$(3)_INSTALL_TARGET		?= YES
+$(3)_DIR_PREFIX			= $(if $(5),$(5),$(TOP_SRCDIR)/package)
 
 # define sub-target stamps
-$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
-$(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
-$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
-$(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
-$(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
-$(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
-$(2)_TARGET_SYMLINK =		$$($(2)_DIR)/.stamp_symlinked
-$(2)_TARGET_SYMLINK_SOURCE =    $$($(2)_DIR)/.stamp_symlink_sourced
-$(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
-$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-$(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
-$(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
-$(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
+$(3)_TARGET_INSTALL_TARGET =	$$($(3)_DIR)/.stamp_target_installed
+$(3)_TARGET_INSTALL_STAGING =	$$($(3)_DIR)/.stamp_staging_installed
+$(3)_TARGET_INSTALL_IMAGES =	$$($(3)_DIR)/.stamp_images_installed
+$(3)_TARGET_INSTALL_HOST =      $$($(3)_DIR)/.stamp_host_installed
+$(3)_TARGET_BUILD =		$$($(3)_DIR)/.stamp_built
+$(3)_TARGET_CONFIGURE =		$$($(3)_DIR)/.stamp_configured
+$(3)_TARGET_SYMLINK =		$$($(3)_DIR)/.stamp_symlinked
+$(3)_TARGET_SYMLINK_SOURCE =    $$($(3)_DIR)/.stamp_symlink_sourced
+$(3)_TARGET_PATCH =		$$($(3)_DIR)/.stamp_patched
+$(3)_TARGET_EXTRACT =		$$($(3)_DIR)/.stamp_extracted
+$(3)_TARGET_SOURCE =		$$($(3)_DIR)/.stamp_downloaded
+$(3)_TARGET_UNINSTALL =		$$($(3)_DIR)/.stamp_uninstalled
+$(3)_TARGET_CLEAN =		$$($(3)_DIR)/.stamp_cleaned
+$(3)_TARGET_DIRCLEAN =		$$($(3)_DIR)/.stamp_dircleaned
 
 # default extract command
-$(2)_EXTRACT_CMDS ?= \
-	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
+$(3)_EXTRACT_CMDS ?= \
+	$$(if $$($(3)_SOURCE),$$(INFLATE$$(suffix $$($(3)_SOURCE))) $(DL_DIR)/$$($(3)_SOURCE) | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(3)_DIR) $(TAR_OPTIONS) -)
 
 # post-steps hooks
-$(2)_POST_DOWNLOAD_HOOKS        ?=
-$(2)_POST_EXTRACT_HOOKS         ?=
-$(2)_POST_PATCH_HOOKS           ?=
-$(2)_PRE_CONFIGURE_HOOKS        ?=
-$(2)_POST_CONFIGURE_HOOKS       ?=
-$(2)_POST_BUILD_HOOKS           ?=
-$(2)_POST_INSTALL_HOOKS         ?=
-$(2)_POST_INSTALL_STAGING_HOOKS ?=
-$(2)_POST_INSTALL_TARGET_HOOKS  ?=
-$(2)_POST_INSTALL_IMAGES_HOOKS  ?=
+$(3)_POST_DOWNLOAD_HOOKS        ?=
+$(3)_POST_EXTRACT_HOOKS         ?=
+$(3)_POST_PATCH_HOOKS           ?=
+$(3)_PRE_CONFIGURE_HOOKS        ?=
+$(3)_POST_CONFIGURE_HOOKS       ?=
+$(3)_POST_BUILD_HOOKS           ?=
+$(3)_POST_INSTALL_HOOKS         ?=
+$(3)_POST_INSTALL_STAGING_HOOKS ?=
+$(3)_POST_INSTALL_TARGET_HOOKS  ?=
+$(3)_POST_INSTALL_IMAGES_HOOKS  ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 
-ifeq ($$($(2)_TYPE),host)
+ifeq ($$($(3)_TYPE),host)
 $(1)-install:	        $(1)-install-host
 else
 $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
 endif
 
-ifeq ($$($(2)_INSTALL_TARGET),YES)
+ifeq ($$($(3)_INSTALL_TARGET),YES)
 $(1)-install-target:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_TARGET)
+			$$($(3)_TARGET_INSTALL_TARGET)
 else
 $(1)-install-target:
 endif
 
-ifeq ($$($(2)_INSTALL_STAGING),YES)
+ifeq ($$($(3)_INSTALL_STAGING),YES)
 $(1)-install-staging:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_STAGING)
+			$$($(3)_TARGET_INSTALL_STAGING)
 else
 $(1)-install-staging:
 endif
 
-ifeq ($$($(2)_INSTALL_IMAGES),YES)
+ifeq ($$($(3)_INSTALL_IMAGES),YES)
 $(1)-install-images:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_IMAGES)
+			$$($(3)_TARGET_INSTALL_IMAGES)
 else
 $(1)-install-images:
 endif
 
-$(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
+$(1)-install-host:      $(1)-build $$($(3)_TARGET_INSTALL_HOST)
 
 $(1)-build:		$(1)-configure \
-			$$($(2)_TARGET_BUILD)
+			$$($(3)_TARGET_BUILD)
 
-ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+ifeq ($$($(3)_OVERRIDE_SRCDIR),)
 # In the normal case (no package override), the sequence of steps is
 #  source, by downloading
 #  depends
@@ -544,98 +547,98 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 #  patch
 #  configure
 $(1)-configure:		$(1)-patch \
-			$$($(2)_TARGET_CONFIGURE)
+			$$($(3)_TARGET_CONFIGURE)
 
-$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
+$(1)-patch:		$(1)-extract $$($(3)_TARGET_PATCH)
 
 $(1)-extract:		$(1)-depends \
-			$$($(2)_TARGET_EXTRACT)
+			$$($(3)_TARGET_EXTRACT)
 
-$(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
+$(1)-depends:		$(1)-source $$($(3)_DEPENDENCIES)
 
-$(1)-source:		$$($(2)_TARGET_SOURCE)
+$(1)-source:		$$($(3)_TARGET_SOURCE)
 else
 # In the package override case, the sequence of steps
 #  source, by symlinking
 #  depends
 #  configure
 $(1)-configure:		$(1)-depends \
-			$$($(2)_TARGET_CONFIGURE)
+			$$($(3)_TARGET_CONFIGURE)
 
-$(1)-depends:		$(1)-symlink $$($(2)_DEPENDENCIES)
+$(1)-depends:		$(1)-symlink $$($(3)_DEPENDENCIES)
 
-$(1)-symlink:		$$($(2)_TARGET_SYMLINK)
+$(1)-symlink:		$$($(3)_TARGET_SYMLINK)
 
-$(1)-source:		$$($(2)_TARGET_SYMLINK_SOURCE)
+$(1)-source:		$$($(3)_TARGET_SYMLINK_SOURCE)
 endif
 
 $(1)-show-depends:
-			@echo $$($(2)_DEPENDENCIES)
+			@echo $$($(3)_DEPENDENCIES)
 
-$(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
+$(1)-uninstall:		$(1)-configure $$($(3)_TARGET_UNINSTALL)
 
 $(1)-clean:		$(1)-uninstall \
-			$$($(2)_TARGET_CLEAN)
+			$$($(3)_TARGET_CLEAN)
 
-$(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
+$(1)-dirclean:		$$($(3)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
-			rm -f $$($(2)_TARGET_BUILD)
-			rm -f $$($(2)_TARGET_INSTALL_STAGING)
-			rm -f $$($(2)_TARGET_INSTALL_TARGET)
-			rm -f $$($(2)_TARGET_INSTALL_HOST)
+			rm -f $$($(3)_TARGET_BUILD)
+			rm -f $$($(3)_TARGET_INSTALL_STAGING)
+			rm -f $$($(3)_TARGET_INSTALL_TARGET)
+			rm -f $$($(3)_TARGET_INSTALL_HOST)
 
 $(1)-rebuild:		$(1)-clean-for-rebuild all
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
-			rm -f $$($(2)_TARGET_CONFIGURE)
+			rm -f $$($(3)_TARGET_CONFIGURE)
 
 $(1)-reconfigure:	$(1)-clean-for-reconfigure all
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
-$$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
-$$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
-$$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
-$$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
-$$($(2)_TARGET_BUILD):			PKG=$(2)
-$$($(2)_TARGET_CONFIGURE):		PKG=$(2)
-$$($(2)_TARGET_SYMLINK):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-$$($(2)_TARGET_SYMLINK_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-$$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
-$$($(2)_TARGET_EXTRACT):		PKG=$(2)
-$$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_UNINSTALL):		PKG=$(2)
-$$($(2)_TARGET_CLEAN):			PKG=$(2)
-$$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
+$$($(3)_TARGET_INSTALL_TARGET):		PKG=$(3)
+$$($(3)_TARGET_INSTALL_STAGING):	PKG=$(3)
+$$($(3)_TARGET_INSTALL_IMAGES):		PKG=$(3)
+$$($(3)_TARGET_INSTALL_HOST):		PKG=$(3)
+$$($(3)_TARGET_BUILD):			PKG=$(3)
+$$($(3)_TARGET_CONFIGURE):		PKG=$(3)
+$$($(3)_TARGET_SYMLINK):		SRCDIR=$$($(3)_OVERRIDE_SRCDIR)
+$$($(3)_TARGET_SYMLINK_SOURCE):		SRCDIR=$$($(3)_OVERRIDE_SRCDIR)
+$$($(3)_TARGET_PATCH):			PKG=$(3)
+$$($(3)_TARGET_PATCH):			RAWNAME=$(2)
+$$($(3)_TARGET_EXTRACT):		PKG=$(3)
+$$($(3)_TARGET_SOURCE):			PKG=$(3)
+$$($(3)_TARGET_UNINSTALL):		PKG=$(3)
+$$($(3)_TARGET_CLEAN):			PKG=$(3)
+$$($(3)_TARGET_DIRCLEAN):		PKG=$(3)
 
 # Compute the name of the Kconfig option that correspond to the
 # package being enabled. We handle three cases: the special Linux
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
-$(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifeq ($(4),boot)
-$(2)_KCONFIG_VAR = BR2_TARGET_$(2)
+$(3)_KCONFIG_VAR = BR2_LINUX_KERNEL
+else ifeq ($(5),boot)
+$(3)_KCONFIG_VAR = BR2_TARGET_$(3)
 else
-$(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
+$(3)_KCONFIG_VAR = BR2_PACKAGE_$(3)
 endif
 
 # add package to the general list of targets if requested by the buildroot
 # configuration
-ifeq ($$($$($(2)_KCONFIG_VAR)),y)
+ifeq ($$($$($(3)_KCONFIG_VAR)),y)
 
 TARGETS += $(1)
 
-ifeq ($$($(2)_SITE_METHOD),svn)
+ifeq ($$($(3)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
-else ifeq ($$($(2)_SITE_METHOD),git)
+else ifeq ($$($(3)_SITE_METHOD),git)
 DL_TOOLS_DEPENDENCIES += git
-else ifeq ($$($(2)_SITE_METHOD),bzr)
+else ifeq ($$($(3)_SITE_METHOD),bzr)
 DL_TOOLS_DEPENDENCIES += bzr
 endif # SITE_METHOD
 
-endif # $(2)_KCONFIG_VAR
+endif # $(3)_KCONFIG_VAR
 endef # GENTARGETS_INNER
 
 ################################################################################
@@ -647,10 +650,10 @@ endef # GENTARGETS_INNER
 define GENTARGETS
 ifeq ($(1),host)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-$(call GENTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
+$(call GENTARGETS_INNER,$(1)-$(call pkgname),$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 else
 # In the case of target packages, keep the package name "pkg"
-$(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
+$(call GENTARGETS_INNER,$(call pkgname),$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
 endif
 endef
 
-- 
1.7.4.1
