From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Feb 2013 23:38:00 +0100
Subject: [Buildroot] [RFC 2/5] package: remove support from CLEAN_CMDS
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360363083-28747-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    3 ---
 package/pkg-autotools.mk                |   11 -----------
 package/pkg-cmake.mk                    |   11 -----------
 package/pkg-generic.mk                  |   11 -----------
 4 files changed, 36 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 41a94d7..4ac4caa 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -360,9 +360,6 @@ different steps of the build process.
   should be installed, since they might be needed to compile other
   packages.
 
-* +LIBFOO_CLEAN_CMDS+, lists the actions to perform to clean up
-  the build directory of the package.
-
 * +LIBFOO_UNINSTALL_TARGET_CMDS+ lists the actions to
   uninstall the package from the target directory +$(TARGET_DIR)+
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 890506b..ea4370e 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -78,7 +78,6 @@ $(2)_AUTORECONF			?= NO
 $(2)_AUTORECONF_OPT		?=
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
-$(2)_CLEAN_OPT			?= clean
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
@@ -260,16 +259,6 @@ endef
 endif
 
 #
-# Clean step. Only define it if not already defined by
-# the package .mk file.
-#
-ifndef $(2)_CLEAN_CMDS
-define $(2)_CLEAN_CMDS
-	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
-endef
-endif
-
-#
 # Uninstall from staging step. Only define it if not already defined by
 # the package .mk file.
 #
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 626a0b0..9c560f5 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -45,7 +45,6 @@ $(2)_MAKE_OPT			?=
 $(2)_INSTALL_HOST_OPT		?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
-$(2)_CLEAN_OPT			?= clean
 
 $(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)
@@ -140,16 +139,6 @@ endef
 endif
 
 #
-# Clean step. Only define it if not already defined by
-# the package .mk file.
-#
-ifndef $(2)_CLEAN_CMDS
-define $(2)_CLEAN_CMDS
-	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_BUILDDIR)
-endef
-endif
-
-#
 # Uninstall from staging step. Only define it if not already defined by
 # the package .mk file.
 #
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 19a115e..bcb7604 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -155,12 +155,6 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-# Clean package
-$(BUILD_DIR)/%/.stamp_cleaned:
-	@$(call MESSAGE,"Cleaning up")
-	$($(PKG)_CLEAN_CMDS)
-	rm -f $(@D)/.stamp_built
-
 # Uninstall package from target and staging
 # Uninstall commands tend to fail, so remove the stamp files first
 $(BUILD_DIR)/%/.stamp_uninstalled:
@@ -319,7 +313,6 @@ $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
-$(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
@@ -417,9 +410,6 @@ $(1)-show-depends:
 
 $(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
 
-$(1)-clean:		$(1)-uninstall \
-			$$($(2)_TARGET_CLEAN)
-
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
@@ -456,7 +446,6 @@ $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
-$$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
-- 
1.7.9.5
