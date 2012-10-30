From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 30 Oct 2012 21:23:25 +0000
Subject: [Buildroot] [PATCH] Add support for custom package patches
Message-ID: <1351632205-15815-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Add a configuration item to allow a space-separated list of directories
to be specified, from which custom package patches will be applied.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 Config.in              |    7 +++++++
 package/pkg-generic.mk |   28 ++++++++++++++++------------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index dab7787..13a7daf 100644
--- a/Config.in
+++ b/Config.in
@@ -415,6 +415,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  as the source directory for a particular package. See the
 	  Buildroot documentation for more details on this feature.
 
+config BR2_CUSTOM_PACKAGE_PATCH_DIRS
+	string "custom package patch directories"
+	help
+	  You may specify a space-separated list of directories containing
+	  custom package patches. Note that any custom patches for a package
+	  will be applied AFTER the Buildroot patch set for the package.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 270da60..d77662e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -69,6 +69,20 @@ else
 	@true # Nothing to do to source a local package
 endif
 
+# Apply package patches from the specified directory
+define pkg-apply-patch-directory
+	if test -d $(1); then \
+	  if test "$(wildcard $(1)/$(NAMEVER)*.patch*)"; then \
+	    support/scripts/apply-patches.sh $(@D) $(1) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
+	  else \
+	    support/scripts/apply-patches.sh $(@D) $(1) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
+	    if test -d $(1)/$(NAMEVER); then \
+	      support/scripts/apply-patches.sh $(@D) $(1)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
+	    fi; \
+	  fi; \
+	fi;
+endef
+
 # Patch
 #
 # The RAWNAME variable is the lowercased package name, which allows to
@@ -79,18 +93,8 @@ $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
-	$(Q)( \
-	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
-	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
-	  else \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
-	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
-	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
-	    fi; \
-	  fi; \
-	fi; \
-	)
+	$(Q)($(call pkg-apply-patch-directory,$($(PKG)_DIR_PREFIX)/$(RAWNAME)))
+	$(Q)($(foreach	patchdir,$(call qstrip,$(BR2_CUSTOM_PACKAGE_PATCH_DIRS)),$(call pkg-apply-patch-directory,$(patchdir))))
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-- 
1.7.10.4
