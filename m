From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 00:38:16 +0200
Subject: [Buildroot] [PATCH 1/5] instrumentation: explicitly pass the
	package name
In-Reply-To: <cover.1439159331.git.yann.morin.1998@free.fr>
References: <cover.1439159331.git.yann.morin.1998@free.fr>
Message-ID: <5fa739484ae7b3250e2bc76b92e13c5d055da54c.1439159331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the global instrumentation hooks automatically determine the
current package name, and they can do so because they are only called
from package-related rules.

However, we're soon gonna call those hooks from other part of the build
process, that are not related to a package (e.g. the rootfs steps).

So, change the API so that the caller must explicitly pass the name of
the entity being processed (only packages for now, more to come in a
followup patch).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a7d97e..d0d580a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -34,14 +34,16 @@
 
 # Start step
 # $1: step name
+# $2: entity name (package...)
 define step_start
-	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),start,$(1),$($(PKG)_NAME))$(sep))
+	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),start,$(1),$(2))$(sep))
 endef
 
 # End step
 # $1: step name
+# $2: entity name (package...)
 define step_end
-	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))
+	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),end,$(1),$(2))$(sep))
 endef
 
 #######################################
@@ -85,7 +87,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
-	@$(call step_start,extract)
+	@$(call step_start,extract,$($(PKG)_NAME))
 	@$(call MESSAGE,"Extracting")
 	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
@@ -94,7 +96,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	$(Q)chmod -R +rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-	@$(call step_end,extract)
+	@$(call step_end,extract,$($(PKG)_NAME))
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
@@ -117,7 +119,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
-	@$(call step_start,patch)
+	@$(call step_start,patch,$($(PKG)_NAME))
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(notdir $(p))$(sep))
@@ -134,7 +136,7 @@ $(BUILD_DIR)/%/.stamp_patched:
 	)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-	@$(call step_end,patch)
+	@$(call step_end,patch,$($(PKG)_NAME))
 
 # Check that all directories specified in BR2_GLOBAL_PATCH_DIR exist.
 $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
@@ -143,33 +145,33 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
-	@$(call step_start,configure)
+	@$(call step_start,configure,$($(PKG)_NAME))
 	@$(call MESSAGE,"Configuring")
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-	@$(call step_end,configure)
+	@$(call step_end,configure,$($(PKG)_NAME))
 
 # Build
 $(BUILD_DIR)/%/.stamp_built::
-	@$(call step_start,build)
+	@$(call step_start,build,$($(PKG)_NAME))
 	@$(call MESSAGE,"Building")
 	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-	@$(call step_end,build)
+	@$(call step_end,build,$($(PKG)_NAME))
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
-	@$(call step_start,install-host)
+	@$(call step_start,install-host,$($(PKG)_NAME))
 	@$(call MESSAGE,"Installing to host directory")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-	@$(call step_end,install-host)
+	@$(call step_end,install-host,$($(PKG)_NAME))
 
 # Install to staging dir
 #
@@ -192,7 +194,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 # empty when we use an internal toolchain.
 #
 $(BUILD_DIR)/%/.stamp_staging_installed:
-	@$(call step_start,install-staging)
+	@$(call step_start,install-staging,$($(PKG)_NAME))
 	@$(call MESSAGE,"Installing to staging directory")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
@@ -220,21 +222,21 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
 			-e "s:@BASE_DIR@:$(BASE_DIR):g"
 	$(Q)touch $@
-	@$(call step_end,install-staging)
+	@$(call step_end,install-staging,$($(PKG)_NAME))
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
-	@$(call step_start,install-image)
+	@$(call step_start,install-image,$($(PKG)_NAME))
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Installing to images directory")
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
-	@$(call step_end,install-image)
+	@$(call step_end,install-image,$($(PKG)_NAME))
 
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
-	@$(call step_start,install-target)
+	@$(call step_start,install-target,$($(PKG)_NAME))
 	@$(call MESSAGE,"Installing to target")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
@@ -247,7 +249,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
 	$(Q)touch $@
-	@$(call step_end,install-target)
+	@$(call step_end,install-target,$($(PKG)_NAME))
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
-- 
1.9.1
