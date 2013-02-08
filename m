From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Feb 2013 23:38:03 +0100
Subject: [Buildroot] [RFC 5/5] package: remove support for
	UNINSTALL_(TARGET|STAGING)_CMDS
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360363083-28747-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    6 ------
 package/pkg-autotools.mk                |   25 -------------------------
 package/pkg-cmake.mk                    |   20 --------------------
 package/pkg-generic.mk                  |   17 -----------------
 4 files changed, 68 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 4ac4caa..3a86240 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -360,12 +360,6 @@ different steps of the build process.
   should be installed, since they might be needed to compile other
   packages.
 
-* +LIBFOO_UNINSTALL_TARGET_CMDS+ lists the actions to
-  uninstall the package from the target directory +$(TARGET_DIR)+
-
-* +LIBFOO_UNINSTALL_STAGING_CMDS+ lists the actions to
-  uninstall the package from the staging directory +$(STAGING_DIR)+.
-
 * +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
   actions to install init scripts either for the systemV-like init systems
   (busybox, sysvinit, etc.) or for the systemd units. These commands
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index ea4370e..58370d5 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -78,8 +78,6 @@ $(2)_AUTORECONF			?= NO
 $(2)_AUTORECONF_OPT		?=
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
-$(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
-$(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
 
 #
@@ -258,29 +256,6 @@ define $(2)_INSTALL_TARGET_CMDS
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
index 9c560f5..eeead15 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -138,26 +138,6 @@ define $(2)_INSTALL_TARGET_CMDS
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
index bcb7604..fe037ae 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -155,19 +155,6 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
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
@@ -312,7 +299,6 @@ $(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-$(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
@@ -408,8 +394,6 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
-$(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
-
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
@@ -445,7 +429,6 @@ $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
-- 
1.7.9.5
