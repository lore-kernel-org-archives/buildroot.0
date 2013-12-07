From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 07 Dec 2013 10:16:48 +0100
Subject: [Buildroot] [PATCH 2 of 3] infra: remove package clean commands
In-Reply-To: <patchbomb.1386407806@argentina>
References: <patchbomb.1386407806@argentina>
Message-ID: <85e93a9e78e4c9f8dbec.1386407808@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile                 |   3 +--
 package/pkg-autotools.mk |  11 -----------
 package/pkg-cmake.mk     |  11 -----------
 package/pkg-generic.mk   |  10 ----------
 4 files changed, 1 insertions(+), 34 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -361,7 +361,6 @@ include fs/common.mk
 
 TARGETS+=target-post-image
 
-TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
@@ -403,7 +402,7 @@ world: $(BASE_TARGETS) $(TARGETS_ALL)
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
-	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
+	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -86,7 +86,6 @@ endif
 $(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
-$(2)_CLEAN_OPT			?= clean
 
 
 #
@@ -266,16 +265,6 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
-#
-# Clean step. Only define it if not already defined by
-# the package .mk file.
-#
-ifndef $(2)_CLEAN_CMDS
-define $(2)_CLEAN_CMDS
-	-$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
-endef
-endif
-
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -45,7 +45,6 @@ define inner-cmake-package
 $(2)_INSTALL_HOST_OPT		?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
-$(2)_CLEAN_OPT			?= clean
 
 $(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)
@@ -139,16 +138,6 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
-#
-# Clean step. Only define it if not already defined by
-# the package .mk file.
-#
-ifndef $(2)_CLEAN_CMDS
-define $(2)_CLEAN_CMDS
-	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_BUILDDIR)
-endef
-endif
-
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -225,12 +225,6 @@ endif
 	$(Q)touch $@
 	@$(call step_end,install-target)
 
-# Clean package
-$(BUILD_DIR)/%/.stamp_cleaned:
-	@$(call MESSAGE,"Cleaning up")
-	$($(PKG)_CLEAN_CMDS)
-	rm -f $(@D)/.stamp_built
-
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
@@ -375,7 +369,6 @@ endif
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
-$(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
@@ -472,8 +465,6 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
-$(1)-clean:		$$($(2)_TARGET_CLEAN)
-
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
 $(1)-clean-for-rebuild:
@@ -509,7 +500,6 @@ endif
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
