From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 09:40:24 +0100
Subject: [Buildroot] [git commit] infra: remove uninstall commands
Message-ID: <20131206084201.AA4E49BF4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b64273db75307a8ad3c30202b45582b8a2b894e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |   25 -------------------------
 package/pkg-cmake.mk     |   20 --------------------
 package/pkg-generic.mk   |   20 +-------------------
 3 files changed, 1 insertions(+), 64 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 9523529..1f97452 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -87,8 +87,6 @@ $(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 $(2)_CLEAN_OPT			?= clean
-$(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
-$(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
 
 #
@@ -278,29 +276,6 @@ define $(2)_CLEAN_CMDS
 endef
 endif
 
-#
-# Uninstall from staging step. Only define it if not already defined by
-# the package .mk file.
-#
-ifndef $(2)_UNINSTALL_STAGING_CMDS
-define $(2)_UNINSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-endef
-endif
-
-#
-# Uninstall from target step. Only define it if not already defined
-# by the package .mk file.
-# Autotools Makefiles do uninstall with ( cd ...; rm -f ... )
-# Since we remove a lot of directories in target-finalize, this is likely
-# to fail.  Therefore add -k flag.
-#
-ifndef $(2)_UNINSTALL_TARGET_CMDS
-define $(2)_UNINSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -k $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
-endef
-endif
-
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 0e08722..8abca08 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -149,26 +149,6 @@ define $(2)_CLEAN_CMDS
 endef
 endif
 
-#
-# Uninstall from staging step. Only define it if not already defined by
-# the package .mk file.
-#
-ifndef $(2)_UNINSTALL_STAGING_CMDS
-define $(2)_UNINSTALL_STAGING_CMDS
-	(cd $$($$(PKG)_BUILDDIR) && sed "s:\(.*\):$$(STAGING_DIR)\1:" install_manifest.txt | xargs rm -f)
-endef
-endif
-
-#
-# Uninstall from target step. Only define it if not already defined
-# by the package .mk file.
-#
-ifndef $(2)_UNINSTALL_TARGET_CMDS
-define $(2)_UNINSTALL_TARGET_CMDS
-	(cd $$($$(PKG)_BUILDDIR) && sed "s:\(.*\):$$(TARGET_DIR)\1:" install_manifest.txt | xargs rm -f)
-endef
-endif
-
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 03eb537..3596f85 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -231,19 +231,6 @@ $(BUILD_DIR)/%/.stamp_cleaned:
 	$($(PKG)_CLEAN_CMDS)
 	rm -f $(@D)/.stamp_built
 
-# Uninstall package from target and staging
-# Uninstall commands tend to fail, so remove the stamp files first
-$(BUILD_DIR)/%/.stamp_uninstalled:
-	@$(call MESSAGE,"Uninstalling")
-	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
-	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
-	$($(PKG)_UNINSTALL_STAGING_CMDS)
-	$($(PKG)_UNINSTALL_TARGET_CMDS)
-	$(if $(BR2_INIT_SYSTEMD),\
-		$($(PKG)_UNINSTALL_INIT_SYSTEMD))
-	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
-		$($(PKG)_UNINSTALL_INIT_SYSV))
-
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
@@ -388,7 +375,6 @@ $(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-$(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
@@ -486,10 +472,7 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
-$(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
-
-$(1)-clean:		$(1)-uninstall \
-			$$($(2)_TARGET_CLEAN)
+$(1)-clean:		$$($(2)_TARGET_CLEAN)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
@@ -526,7 +509,6 @@ $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
