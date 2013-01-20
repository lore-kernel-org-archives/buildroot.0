From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:12 +0100
Subject: [Buildroot] [RFC v1 03/14] generic infrastructure: out of tree
	build support
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the out of tree support to the core package
infrastructure.

In details:

 * The stamp_downloaded, stamp_extracted and stamp_patched are now
   created in the source directory, since those steps are relative to
   the source itself, and not to the build process.

 * The rsynced and rsync_overrive_sourced steps are removed, as
   overriden packages are now naturally handled by the package
   infrastructure.

 * In the patch step, at the end, we mark all files in the package
   source directory as non-writable. This is done to ensure that the
   out-of-tree build process really doesn't mess up with the source
   code (which is now shared by the target and host builds).

 * In the configure step, if the package doesn't support out of tree
   build, we rsync its source code into the build directory.

 * We now define the $(2)_RAW_BASE_NAME variable in addition to
   $(2)_BASE_NAME. The former is always "<pkg>-<version>" regarding of
   whether we're building a target or a host package, while the latter
   is "<pkg>-<version>" for target packages, and
   "host-<pkg>-<version>" for host packages. The $(2)_RAW_BASE_NAME
   variable will be used to name the source directory of packages,
   since we have only one, shared for both the target and host build.

 * $(2)_BUILDDIR is no longer equal to $(2)_SRCDIR, and is now defined
   to $(BUILD_DIR)/$(2)_BASE_NAME, i.e
   output/build/(host-)?<pkg>-<version>. $(2)_SRCDIR, in turn, is
   equal to output/src/<pkg>-<version> if the package has not been
   overriden, otherwise it is set to the overriden location.

 * By default, $(2)_SUPPORTS_OUT_OF_TREE is set to NO, so that the
   copy of the sources to the build directory is done. It can be
   overriden on a per-package basis (for example, the Linux, Barebox
   or U-Boot generic packages support out of tree build) or in some
   specialized package infrastructure.

 * The location of the stamp files is now defined relatively to either
   the build directory or the source directory. We consider that the
   download, extract and patch steps are related to the sources, and
   therefore the stamp file is created in the source directory of the
   package. The other steps are consider to be build related.

 * The default extract command is changed to extract to the source
   directory.

 * The sequencing of steps is slightly modified for various reasons:

   - As the autoreconf step will be moved as a post patch hook, we
     need to have a special handling of the host-autoconf,
     host-automake and host-libtool dependencies. Instead of depending
     on them in the $(1)-depends step, we depend on them in the
     $(1)-patch step. We can't move all dependencies to the $(1)-patch
     step, otherwise we would break the RTAI packaging. See commit
     a473a616d27e46951a23d90249a31b08006098bf.

   - dirclean is now implemented differently depending on whether the
     package has an overriden source directory or not. When the
     package is normal (not overriden), both the source directory and
     build directory are removed. When the package is overriden, only
     the build directory is removed.

   - the rsync step for overriden packages no longer exists. It is now
     part of the natural handling of packaging that don't support out
     of tree build.

 * The legal info infrastructure is changed to force copy license
   files. Since the files in the source directories are read-only, if
   we run twice the 'make legal-info' command, it fails at copying the
   license files. Forcing the copy makes it work properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |  128 ++++++++++++++++++++++++++----------------------
 package/pkg-utils.mk   |    2 +-
 2 files changed, 71 insertions(+), 59 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index eeaa4fe..d6ac4ef 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -25,7 +25,7 @@
 ################################################################################
 
 # Retrieve the archive
-$(BUILD_DIR)/%/.stamp_downloaded:
+$(SRC_DIR)/%/.stamp_downloaded:
 ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
 	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
@@ -48,7 +48,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 endif
 
 # Unpack the archive
-$(BUILD_DIR)/%/.stamp_extracted:
+$(SRC_DIR)/%/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
@@ -57,32 +57,13 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-# Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
-# used.
-$(BUILD_DIR)/%/.stamp_rsynced:
-	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
-	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
-	rsync -au $(SRCDIR)/ $(@D)
-	$(Q)touch $@
-
-# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
-# packages
-$(BUILD_DIR)/%/.stamp_rsync_sourced:
-ifeq ($(DL_MODE),SOURCE_CHECK)
-	test -d $(SRCDIR)
-else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
-	echo "file://$(SRCDIR)"
-else
-	@true # Nothing to do to source a local package
-endif
-
 # Patch
 #
 # The RAWNAME variable is the lowercased package name, which allows to
 # find the package directory (typically package/<pkgname>) and the
 # prefix of the patches
-$(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
-$(BUILD_DIR)/%/.stamp_patched:
+$(SRC_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
+$(SRC_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
@@ -100,9 +81,15 @@ $(BUILD_DIR)/%/.stamp_patched:
 	)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
+	chmod a-w -R $(@D)
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+	@mkdir -p $(@D)
+	@if test "$($(PKG)_SUPPORTS_OUT_OF_TREE)" != "YES"; then \
+		rsync -au $($(PKG)_SRCDIR)/* $(@D)/ ; \
+		chmod u+w -R $(@D)/ ; \
+	fi
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Configuring")
 	$($(PKG)_CONFIGURE_CMDS)
@@ -167,10 +154,26 @@ $(BUILD_DIR)/%/.stamp_uninstalled:
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_UNINSTALL_INIT_SYSV))
 
-# Remove package sources
+# Remove package build directory
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
 
+# Remove package source directory
+$(SRC_DIR)/%/.stamp_dircleaned:
+	-chmod u+w -R $(@D)
+	rm -Rf $(@D)
+
+# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for overriden
+# packages
+$(BUILD_DIR)/%/.stamp_override_sourced:
+ifeq ($(DL_MODE),SOURCE_CHECK)
+	test -d $($(PKG)_SRCDIR)
+else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
+	echo "file://$($(PKG)_SRCDIR)"
+else
+	@true # Nothing to do to source a local package
+endif
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -215,11 +218,10 @@ else
   $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
 endif
 
-$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
+$(2)_BASE_NAME	   =  $$($(2)_NAME)-$$($(2)_VERSION)
+$(2)_RAW_BASE_NAME = $$($(2)_RAWNAME)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
-$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
-$(2)_SRCDIR		       = $$($(2)_DIR)
-$(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
+$(2)_BUILDDIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
@@ -260,6 +262,12 @@ $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
 endif
 endif
 
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+$(2)_SRCDIR     = $$(SRC_DIR)/$$($(2)_RAW_BASE_NAME)
+else
+$(2)_SRCDIR     = $$($(2)_OVERRIDE_SRCDIR)
+endif
+
 ifndef $(2)_LICENSE
  ifdef $(3)_LICENSE
   $(2)_LICENSE = $($(3)_LICENSE)
@@ -282,6 +290,13 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+ifndef $(2)_SUPPORTS_OUT_OF_TREE
+ ifdef $(3)_SUPPORTS_OUT_OF_TREE
+  $(2)_SUPPORTS_OUT_OF_TREE = $($(3)_SUPPORTS_OUT_OF_TREE)
+ endif
+endif
+
+$(2)_SUPPORTS_OUT_OF_TREE       ?= NO
 
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
@@ -291,25 +306,25 @@ $(2)_INSTALL_TARGET		?= YES
 $(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
 
 # define sub-target stamps
-$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
-$(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
-$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
-$(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
-$(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
-$(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
-$(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
-$(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
-$(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
-$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
-$(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-$(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
-$(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
-$(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
+$(2)_TARGET_INSTALL_TARGET =	$$($(2)_BUILDDIR)/.stamp_target_installed
+$(2)_TARGET_INSTALL_STAGING =	$$($(2)_BUILDDIR)/.stamp_staging_installed
+$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_BUILDDIR)/.stamp_images_installed
+$(2)_TARGET_INSTALL_HOST =      $$($(2)_BUILDDIR)/.stamp_host_installed
+$(2)_TARGET_BUILD =		$$($(2)_BUILDDIR)/.stamp_built
+$(2)_TARGET_CONFIGURE =		$$($(2)_BUILDDIR)/.stamp_configured
+$(2)_TARGET_PATCH =		$$($(2)_SRCDIR)/.stamp_patched
+$(2)_TARGET_EXTRACT =		$$($(2)_SRCDIR)/.stamp_extracted
+$(2)_TARGET_SOURCE =		$$($(2)_SRCDIR)/.stamp_downloaded
+$(2)_TARGET_OVERRIDE_SOURCE =	$$($(2)_BUILDDIR)/.stamp_override_sourced
+$(2)_TARGET_UNINSTALL =		$$($(2)_BUILDDIR)/.stamp_uninstalled
+$(2)_TARGET_CLEAN =		$$($(2)_BUILDDIR)/.stamp_cleaned
+$(2)_TARGET_SRCDIRCLEAN =	$$($(2)_SRCDIR)/.stamp_dircleaned
+$(2)_TARGET_BUILDDIRCLEAN =	$$($(2)_BUILDDIR)/.stamp_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_SRCDIR) $(TAR_OPTIONS) -)
 
 # post-steps hooks
 $(2)_POST_DOWNLOAD_HOOKS        ?=
@@ -370,7 +385,8 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 $(1)-configure:		$(1)-patch $(1)-depends \
 			$$($(2)_TARGET_CONFIGURE)
 
-$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
+$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH) \
+			$(filter host-automake host-autoconf host-libtool,$$($(2)_DEPENDENCIES))
 
 $(1)-extract:		$(1)-source \
 			$$($(2)_TARGET_EXTRACT)
@@ -378,22 +394,24 @@ $(1)-extract:		$(1)-source \
 $(1)-depends:		$$($(2)_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
+
+$(1)-dirclean:		$$($(2)_TARGET_SRCDIRCLEAN) \
+			$$($(2)_TARGET_BUILDDIRCLEAN)
 else
 # In the package override case, the sequence of steps
-#  source, by rsyncing
 #  depends
 #  configure
 $(1)-configure:		$(1)-depends \
 			$$($(2)_TARGET_CONFIGURE)
 
-$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
+$(1)-depends:		$$($(2)_DEPENDENCIES)
 
-$(1)-patch:		$(1)-rsync
-$(1)-extract:		$(1)-rsync
+$(1)-patch:
+$(1)-extract:
 
-$(1)-rsync:		$$($(2)_TARGET_RSYNC)
+$(1)-source:		$$($(2)_TARGET_OVERRIDE_SOURCE)
 
-$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
+$(1)-dirclean:		$$($(2)_TARGET_BUILDDIRCLEAN)
 endif
 
 $(1)-show-depends:
@@ -404,8 +422,6 @@ $(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
 $(1)-clean:		$(1)-uninstall \
 			$$($(2)_TARGET_CLEAN)
 
-$(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
-
 $(1)-clean-for-rebuild:
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 			rm -f $$($(2)_TARGET_RSYNC)
@@ -431,17 +447,13 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
-$$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-$$($(2)_TARGET_RSYNC):                  PKG=$(2)
-$$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-$$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_OVERRIDE_SOURCE):	PKG=$(2)
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
-$$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
 # package being enabled. We handle three cases: the special Linux
@@ -488,7 +500,7 @@ ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
 	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
 	@for F in $$($(2)_LICENSE_FILES); do \
-		$(call legal-license-file,$$($(2)_RAWNAME),$$$${F},$$($(2)_DIR)/$$$${F}); \
+		$(call legal-license-file,$$($(2)_RAWNAME),$$$${F},$$($(2)_SRCDIR)/$$$${F}); \
 		done
 endif
 ifeq ($$($(2)_REDISTRIBUTE),YES)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 835c588..4eb9df3 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -107,5 +107,5 @@ define legal-license-file # pkg, filename, file-fullpath
 	cat $(3) >>$(LEGAL_LICENSES_TXT) && \
 	echo >>$(LEGAL_LICENSES_TXT) && \
 	mkdir -p $(LICENSE_FILES_DIR)/$(1)/ && \
-	cp $(3) $(LICENSE_FILES_DIR)/$(1)/
+	cp -f $(3) $(LICENSE_FILES_DIR)/$(1)/
 endef
-- 
1.7.9.5
