From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 17 Feb 2009 16:02:18 +1100
Subject: [Buildroot] RFC: option to Makefile.autotools.in to build
	in	$(PROJECT_BUILD_DIR)
Message-ID: <20090217050218.GA20875@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've got a package which will use Makefile.autotools.in that needs to
build in $(PROJECT_BUILD_DIR), because it builds kernel modules.

Here is my proposed patch to Makefile.autotools.in to support this (via
a FOO_BUILD_PROJECT_DIR = YES/NO option). Feedback welcome; unless
there's issues I will commit in a day or two.

Hamish


Index: package/Makefile.autotools.in
===================================================================
--- package/Makefile.autotools.in	(revision 8043)
+++ package/Makefile.autotools.in	(working copy)
@@ -64,6 +64,8 @@
 #	make
 # FOO_DIR_PREFIX [default empty]
 #	toplevel relative path to package *.mk file and corresponding patches
+# FOO_BUILD_PROJECT_DIR [YES/NO, default NO]
+#	Do you want to build in $(PROJECT_BUILD_DIR) rather than $(BUILD_DIR)?
 #
 ## The following variables contain hook target names
 ## by default they do nothing, they can be overriden in package makefiles
@@ -134,7 +136,7 @@
 ################################################################################
 
 # Retrieve and unpack the archive
-$(BUILD_DIR)/%/.stamp_downloaded:
+$(BUILD_DIR)/%/.stamp_downloaded $(PROJECT_BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
 ifneq ($(SPIDER),)
 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
@@ -152,7 +154,7 @@
 endif
 
 # Retrieve and unpack the archive
-$(BUILD_DIR)/%/.stamp_extracted:
+$(BUILD_DIR)/%/.stamp_extracted $(PROJECT_BUILD_DIR)/%/.stamp_extracted:
 	$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
 	$(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
@@ -162,7 +164,7 @@
 	$(Q)touch $@
 
 # Fix libtool support if required by the package
-$(BUILD_DIR)/%/.stamp_libtool_patch:
+$(BUILD_DIR)/%/.stamp_libtool_patch $(PROJECT_BUILD_DIR)/%/.stamp_libtool_patch:
 	$(call MESSAGE,"Patching libtool")
 # if the package uses libtool, patch it for cross-compiling in buildroot
 	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
@@ -176,8 +178,8 @@
 # XXX: FIXME: This has to be done differently and path-independent, i.e. use
 # XXX: FIXME: the dir-part of the stem as base-dir (instead of hardcoding
 # XXX: FIXME: "package/".
-$(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(PKG)_NAME)-$($(PKG)_VERSION)
-$(BUILD_DIR)/%/.stamp_patched:
+$(BUILD_DIR)/%/.stamp_patched $(PROJECT_BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(PKG)_NAME)-$($(PKG)_VERSION)
+$(BUILD_DIR)/%/.stamp_patched $(PROJECT_BUILD_DIR)/%/.stamp_patched:
 	$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
@@ -202,7 +204,7 @@
 	$(Q)touch $@
 
 # Running autoreconf
-$(BUILD_DIR)/%/.stamp_autoconfigured:
+$(BUILD_DIR)/%/.stamp_autoconfigured $(PROJECT_BUILD_DIR)/%/.stamp_autoconfigured:
 	$(call MESSAGE,"Running autoreconf")
 	$(Q)cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF)
 # if the package uses libtool, patch it for cross-compiling in buildroot
@@ -214,7 +216,7 @@
 	$(Q)touch $@
 
 # Configuring
-$(BUILD_DIR)/%/.stamp_configured:
+$(BUILD_DIR)/%/.stamp_configured $(PROJECT_BUILD_DIR)/%/.stamp_configured:
 	$(call MESSAGE,"Configuring")
 	cd $(@D)/$($(PKG)_SUBDIR) && rm -f config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
@@ -233,13 +235,13 @@
 	$(Q)touch $@
 
 # Build
-$(BUILD_DIR)/%/.stamp_built:
+$(BUILD_DIR)/%/.stamp_built $(PROJECT_BUILD_DIR)/%/.stamp_built:
 	$(call MESSAGE,"Building")
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	$(Q)touch $@
 
 # Install to staging dir
-$(BUILD_DIR)/%/.stamp_staging_installed:
+$(BUILD_DIR)/%/.stamp_staging_installed $(PROJECT_BUILD_DIR)/%/.stamp_staging_installed:
 	$(call MESSAGE,'Installing to host (staging directory)')
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 #	toolchain/replace.sh $(STAGING_DIR)/usr/lib ".*\.la" "\(['= ]\)/usr" "\\1$(STAGING_DIR)/usr"
@@ -264,19 +266,19 @@
 	done)
 	touch $@
 
-$(BUILD_DIR)/%/.stamp_cleaned:
+$(BUILD_DIR)/%/.stamp_cleaned $(PROJECT_BUILD_DIR)/%/.stamp_cleaned:
 	$(call MESSAGE,"Cleaning up")
 	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_CLEAN_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $(@D)/.stamp_built
 
-$(BUILD_DIR)/%/.stamp_uninstalled:
+$(BUILD_DIR)/%/.stamp_uninstalled $(PROJECT_BUILD_DIR)/%/.stamp_uninstalled:
 	$(call MESSAGE,"Uninstalling")
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $(@D)/.stamp_staging_installed
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET) $($(PKG)_HOOK_POST_INSTALL)
 
-$(BUILD_DIR)/%/.stamp_dircleaned:
+$(BUILD_DIR)/%/.stamp_dircleaned $(PROJECT_BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
 
 
@@ -299,7 +301,14 @@
 # define package-specific variables to default values
 $(2)_NAME			=  $(1)
 $(2)_VERSION			?= undefined
-$(2)_DIR			=  $$(BUILD_DIR)/$(1)-$$($(2)_VERSION)
+$(2)_BUILD_PROJECT_DIR		?= NO
+
+ifeq ($$($(2)_BUILD_PROJECT_DIR),YES)
+$(2)_DIR			= $$(PROJECT_BUILD_DIR)/$(1)-$$($(2)_VERSION)
+else
+$(2)_DIR			= $$(BUILD_DIR)/$(1)-$$($(2)_VERSION)
+endif
+
 $(2)_SOURCE			?= $(1)-$$($(2)_VERSION).tar.gz
 $(2)_SITE			?= \
 	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
