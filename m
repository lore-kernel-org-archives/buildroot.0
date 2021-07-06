From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:57 +0200
Subject: [Buildroot] [PATCH v2 14/18] package/pkg-generic.mk: fix
 per-package <pkg>-{reconfigure, rebuild, reinstall}
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-15-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many overwrites are detected on <pkg>-{reconfigure,rebuild,reinstall}.
Indeed, files previously installed by a package were detected as
overwritten on next reconfigure, rebuild or reinstall.

To avoid this, we recreate per-package host and target dir from
scratch as it was done during the first configure step.

In order not to duplicate the code, this commit shares common code
in prepare-pre-configure macro.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
 - Avoid code duplication using prepare-pre-configure macro

 package/pkg-generic.mk | 44 ++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6157f6e540..ee2d68f2f7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -210,6 +210,23 @@ define REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
 	$(call remove-conflicting-useless-files,$(TARGET_DIR))
 endef
 
+# Function to prepare package
+
+define prepare-pre-configure
+	@$(call pkg_final_rsync_before,$(TARGET_DIR))
+	@$(call pkg_final_rsync_before,$(HOST_DIR),-host)
+	@$(call pkg_size_before,$(TARGET_DIR))
+	@$(call pkg_size_before,$(STAGING_DIR),-staging)
+	@$(call pkg_size_before,$(HOST_DIR),-host)
+	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
+	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
+	$(call fixup-python-files,$(NAME),$(HOST_DIR))
+	$(call fixup-python-files,$(NAME),$(STAGING_DIR))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
+	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
+	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
+endef
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -307,18 +324,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call MESSAGE,"Configuring")
 	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
-	@$(call pkg_final_rsync_before,$(TARGET_DIR))
-	@$(call pkg_final_rsync_before,$(HOST_DIR),-host)
-	@$(call pkg_size_before,$(TARGET_DIR))
-	@$(call pkg_size_before,$(STAGING_DIR),-staging)
-	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
-	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
-	$(call fixup-python-files,$(NAME),$(HOST_DIR))
-	$(call fixup-python-files,$(NAME),$(STAGING_DIR))
-	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
-	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
-	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
+	$(call prepare-pre-configure)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -483,6 +489,13 @@ define pkg-graph-depends
 		$$(GRAPHS_DIR)/$$(@).dot
 endef
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define empty-per-package-directory
+	rm -rf $(HOST_DIR) $(TARGET_DIR)
+	mkdir -p $(HOST_DIR) $(TARGET_DIR)
+endef
+endif
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -1086,6 +1099,8 @@ $(1)-all-legal-info:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-lega
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
+$(1)-clean-for-reinstall: PKG=$(2)
+$(1)-clean-for-reinstall: NAME=$(1)
 $(1)-clean-for-reinstall:
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 			rm -f $$($(2)_TARGET_RSYNC)
@@ -1095,6 +1110,11 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
+			$$(call empty-per-package-directory)
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_DOWNLOAD_DEPENDENCIES))
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_EXTRACT_DEPENDENCIES))
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_DEPENDENCIES))
+			$$(call prepare-pre-configure)
 
 $(1)-reinstall:		$(1)-clean-for-reinstall $(1)
 
-- 
2.31.1
