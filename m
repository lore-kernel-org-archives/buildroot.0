From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 19:42:14 +0100
Subject: [Buildroot] [git commit] infra: remove package clean commands
Message-ID: <20131208184341.582569BF73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47e82829c25657b2e6413802dcd1020c15084d31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                 |    3 +--
 package/pkg-autotools.mk |   11 -----------
 package/pkg-cmake.mk     |   11 -----------
 package/pkg-generic.mk   |   10 ----------
 4 files changed, 1 insertions(+), 34 deletions(-)

diff --git a/Makefile b/Makefile
index 6c28a86..6adacd9 100644
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
index 1f97452..a66ecd4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -86,7 +86,6 @@ $(2)_AUTORECONF_OPT		?= $($(3)_AUTORECONF_OPT)
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
index 8abca08..463cd63 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -45,7 +45,6 @@ $(2)_MAKE_OPT			?=
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
index 3596f85..1fce71b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -225,12 +225,6 @@ $(BUILD_DIR)/%/.stamp_target_installed:
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
@@ -375,7 +369,6 @@ $(2)_TARGET_RSYNC_SOURCE =      $$($(2)_DIR)/.stamp_rsync_sourced
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
@@ -509,7 +500,6 @@ $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
