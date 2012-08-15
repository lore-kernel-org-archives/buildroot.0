From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 15 Aug 2012 18:26:20 +0800
Subject: [Buildroot] [PATCH 1/2 v4] package: pkg-generic: Support building
	override source without copying in common package infrastructure.
Message-ID: <1345026381-29935-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

1) Set _SRCDIR a different path from _DIR if _OVERRIDE_SRCDIR is
defined. Generic package's make rules should replace $@ with $(_SRCDIR).
2) Remove unused makefile target .stamp_rsynced and .stamp_rsync_sourced.
3) Add .stamp_patch target to patch the external source tree
if _OVERRIDE_SRCDIR is defined.
4) Replace _SRCDIR with _BUILDDIR in makefile rules to enable override
for autotools base packages.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/pkg-autotools.mk |   24 ++++++++++++------------
 package/pkg-generic.mk   |   46 +++++++++-------------------------------------
 2 files changed, 21 insertions(+), 49 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 785daab..b5d303c 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -93,11 +93,11 @@ ifeq ($(5),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
+	(cd $$($$(PKG)_BUILDDIR) && rm -rf config.cache && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$(TARGET_CONFIGURE_ARGS) \
 	$$($$(PKG)_CONF_ENV) \
-	./configure \
+	$$(PKG)_SRCDIR)/configure \
 		--target=$$(GNU_TARGET_NAME) \
 		--host=$$(GNU_TARGET_NAME) \
 		--build=$$(GNU_HOST_NAME) \
@@ -117,12 +117,12 @@ else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
+	(cd $$($$(PKG)_BUILDDIR) && rm -rf config.cache; \
 	        $$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
                 $$($$(PKG)_CONF_ENV) \
-		./configure \
+		$$(PKG)_SRCDIR)/configure \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--enable-shared --disable-static \
@@ -207,11 +207,11 @@ endif
 ifndef $(2)_BUILD_CMDS
 ifeq ($(5),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 endif
@@ -222,7 +222,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_BUILDDIR) install
 endef
 endif
 
@@ -232,7 +232,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
 	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
 		cp -f $$$$i $$$$i~; \
 		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
@@ -246,7 +246,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -256,7 +256,7 @@ endif
 #
 ifndef $(2)_CLEAN_CMDS
 define $(2)_CLEAN_CMDS
-	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
+	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -266,7 +266,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_STAGING_CMDS
 define $(2)_UNINSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -279,7 +279,7 @@ endif
 #
 ifndef $(2)_UNINSTALL_TARGET_CMDS
 define $(2)_UNINSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -k $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -k $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 68d23ba..2189c6b 100644
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
@@ -220,11 +201,13 @@ ifndef $(2)_SUBDIR
  endif
 endif
 
-$(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
-$(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
+$(2)_BUILDDIR		       ?= $$($(2)_DIR)/$$($(2)_SUBDIR)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-$(2)_VERSION = custom
+ $(2)_VERSION = custom
+ $(2)_SRCDIR		       = $$($(2)_OVERRIDE_SRCDIR)/$$($(2)_SUBDIR)
+else
+ $(2)_SRCDIR		       = $$($(2)_DIR)/$$($(2)_SUBDIR)
 endif
 
 ifndef $(2)_SOURCE
@@ -293,8 +276,6 @@ $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
-$(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
-$(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
@@ -375,17 +356,15 @@ $(1)-depends:		$$($(2)_DEPENDENCIES)
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
@@ -399,9 +378,6 @@ $(1)-clean:		$(1)-uninstall \
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
-ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-			rm -f $$($(2)_TARGET_RSYNC)
-endif
 			rm -f $$($(2)_TARGET_BUILD)
 			rm -f $$($(2)_TARGET_INSTALL_STAGING)
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
@@ -423,10 +399,6 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
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
