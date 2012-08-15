From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 15 Aug 2012 15:30:19 +0800
Subject: [Buildroot] [PATCH 1/2 v2] package: pkg-generic: Support building
	override source without copying in common package infrastructure.
Message-ID: <1345015820-30911-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

1) Set _SRCDIR a different path from _DIR if _OVERRIDE_SRCDIR is
defined. Generic package's make rules should replace $@ by $(_SRCDIR).
2) Remove unused makefile target .stamp_rsynced and .stamp_rsync_sourced.
3) Add .stamp_patch target to patch the external source tree
if _OVERRIDE_SRCDIR is defined.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/pkg-cmake.mk   |    8 ++++++--
 package/pkg-generic.mk |   47 ++++++++++++-----------------------------------
 2 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 626a0b0..2d7b067 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -47,8 +47,12 @@ $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
 $(2)_CLEAN_OPT			?= clean
 
-$(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
-$(2)_BUILDDIR			= $$($(2)_SRCDIR)
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+ $(2)_SRCDIR			= $$($(2)_OVERRIDE_SRCDIR)/$($(2)_SUBDIR)
+else
+ $(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
+endif
+$(2)_BUILDDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 68d23ba..68336fc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -50,25 +50,6 @@ $(BUILD_DIR)/%/.stamp_extracted:
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
@@ -224,7 +205,14 @@ $(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
 $(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-$(2)_VERSION = custom
+ $(2)_VERSION = custom
+ ifndef $(2)_SRCDIR
+  $(2)_SRCDIR	=  $$($(2)_OVERRIDE_SRCDIR)
+ endif
+else
+ ifndef $(2)_SRCDIR
+  $(2)_SRCDIR	=  $$($(2)_DIR)
+ endif
 endif
 
 ifndef $(2)_SOURCE
@@ -293,8 +281,6 @@ $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
-$(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
-$(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
@@ -375,17 +361,15 @@ $(1)-depends:		$$($(2)_DEPENDENCIES)
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 else
 # In the package override case, the sequence of steps
-#  source, by rsyncing
+#  patch
 #  depends
 #  configure
-$(1)-configure:		$(1)-depends \
+$(1)-configure:		$(1)-patch $(1)-depends \
 			$$($(2)_TARGET_CONFIGURE)
 
-$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
-
-$(1)-rsync:		$$($(2)_TARGET_RSYNC)
+$(1)-patch:		$$($(2)_TARGET_PATCH)
 
-$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
+$(1)-depends:		$$($(2)_DEPENDENCIES)
 endif
 
 $(1)-show-depends:
@@ -399,9 +383,6 @@ $(1)-clean:		$(1)-uninstall \
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
-ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-			rm -f $$($(2)_TARGET_RSYNC)
-endif
 			rm -f $$($(2)_TARGET_BUILD)
 			rm -f $$($(2)_TARGET_INSTALL_STAGING)
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
@@ -423,10 +404,6 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
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
-- 
1.7.0.4
