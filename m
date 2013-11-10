From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 00:51:36 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <cover.1384127173.git.yann.morin.1998@free.fr>
References: <cover.1384127173.git.yann.morin.1998@free.fr>
Message-ID: <8fad5e960285a79ff9ff75467cd3e595fa16cd4d.1384127173.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This hooks will let us instrument the build process in many ways:
  - log current step to see what broke
  - time each step to see what is worth optimising
  - sanity-check installed files (rpath, overwritten files...)
  - call user-provided script
  - ...

The steps are coarse-grain, and all have a 'start' and a 'end' hooks.
Here is the list of available steps (8 total):
  - extract
  - patch
  - configure
  - build
  - install-host
  - install-staging
  - install-image
  - install-target

The download, clean and uninstall steps are not instrumented on purpose.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-generic.mk | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 75fda02..02ab8a3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -21,6 +21,29 @@
 ################################################################################
 
 ################################################################################
+# Helper functions to catch start/end of each step
+################################################################################
+
+# Those two functions are called by each step below.
+# They are responsible for calling all hooks defined in $(STEP_HOOKS)
+# and pass each of them two arguments:
+#   $1: either 'start' or 'end'
+#   $2: the name of the step
+#   $3: the name of the package
+
+# Start step
+# $1: step name
+define step_start
+	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),start,$(1),$($(PKG)_NAME))$(sep))
+endef
+
+# End step
+# $1: step name
+define step_end
+	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))
+endef
+
+################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
 
@@ -55,6 +78,7 @@ endif
 
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
+	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
@@ -62,6 +86,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	$(Q)chmod -R +rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
+	@$(call step_end,extract)
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
@@ -91,6 +116,7 @@ endif
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
 $(BUILD_DIR)/%/.stamp_patched:
+	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
@@ -107,31 +133,39 @@ $(BUILD_DIR)/%/.stamp_patched:
 	)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
+	@$(call step_end,patch)
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+	@$(call step_start,configure)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Configuring")
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
+	@$(call step_end,configure)
 
 # Build
 $(BUILD_DIR)/%/.stamp_built::
+	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
 	$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
+	@$(call step_end,build)
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
+	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
 	$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
+	@$(call step_end,install-host)
 
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
+	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
 	$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
@@ -143,16 +177,20 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
 	$(Q)touch $@
+	@$(call step_end,install-staging)
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
+	@$(call step_start,install-image)
 	@$(call MESSAGE,"Installing to images directory")
 	$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
+	@$(call step_end,install-image)
 
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
+	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
@@ -164,6 +202,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
 	$(Q)touch $@
+	@$(call step_end,install-target)
 
 # Clean package
 $(BUILD_DIR)/%/.stamp_cleaned:
-- 
1.8.1.2
