From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 01:11:25 +0200
Subject: [Buildroot] [PATCH 1/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <cover.1381705600.git.yann.morin.1998@free.fr>
References: <cover.1381705600.git.yann.morin.1998@free.fr>
Message-ID: <f6240fcb39c5dcbfe7a74cc74da3089e3c982ae5.1381705600.git.yann.morin.1998@free.fr>
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

The steps are fine-grain, and all have a 'start' and a 'end' hooks.
Here is the list of available steps (19 total):
  - extract, post-extract
  - pre-patch, patch, post-patch
  - pre-configure, configure, post-configure
  - build, post-build
  - install-host, post-install-host
  - install-staging, post-install-staging, pkg-config-staging
  - install-image, post-install-image
  - install-target, post-install-target

The download, clean, uninstall steps are not instrumented on purpose.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a46457c..c4c7f8a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -21,6 +21,22 @@
 ################################################################################
 
 ################################################################################
+# Helper functions to catch start/end of each steps
+################################################################################
+
+# Start step
+# $1: step name
+define step_start
+	$(foreach hook,$(STEP_HOOKS),$(call $(hook),start,$(1));)
+endef
+
+# End step
+# $1: step name
+define step_end
+	$(foreach hook,$(STEP_HOOKS),$(call $(hook),end,$(1));)
+endef
+
+################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
 
@@ -56,11 +72,15 @@ endif
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
+	@$(call step_start,extract)
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
 	$(Q)chmod -R +rw $(@D)
+	@$(call step_end,extract)
+	@$(call step_start,post-extract)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,post-extract)
 	$(Q)touch $@
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
@@ -91,7 +111,10 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
+	@$(call step_start,pre-patch)
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,pre-patch)
+	@$(call step_start,patch)
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
 	for D in $(PATCH_BASE_DIRS); do \
@@ -104,36 +127,58 @@ $(BUILD_DIR)/%/.stamp_patched:
 	  fi; \
 	done; \
 	)
+	@$(call step_end,patch)
+	@$(call step_start,post-patch)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,patch)
 	$(Q)touch $@
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+	@$(call step_start,pre-configure)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,pre-configure)
 	@$(call MESSAGE,"Configuring")
+	@$(call step_start,configure)
 	$($(PKG)_CONFIGURE_CMDS)
+	@$(call step_end,configure)
+	@$(call step_start,post-configure)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,post-configure)
 	$(Q)touch $@
 
 # Build
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call MESSAGE,"Building")
+	@$(call step_start,build)
 	$($(PKG)_BUILD_CMDS)
+	@$(call step_end,build)
+	@$(call step_start,post-build)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,post-build)
 	$(Q)touch $@
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call MESSAGE,"Installing to host directory")
+	@$(call step_start,install-host)
 	$($(PKG)_INSTALL_CMDS)
+	@$(call step_end,install-host)
+	@$(call step_start,post-install-host)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,post-install-host)
 	$(Q)touch $@
 
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call MESSAGE,"Installing to staging directory")
+	@$(call step_start,install-staging)
 	$($(PKG)_INSTALL_STAGING_CMDS)
+	@$(call step_end,install-staging)
+	@$(call step_start,post-install-staging)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,post-install-staging)
+	@$(call step_start,pkg-config-staging)
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
@@ -141,27 +186,36 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
+	@$(call step_end,pkg-config-staging)
 	$(Q)touch $@
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call MESSAGE,"Installing to images directory")
+	@$(call step_start,install-image)
 	$($(PKG)_INSTALL_IMAGES_CMDS)
+	@$(call step_end,install-image)
+	@$(call step_start,post-install-image)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
+	@$(call step_end,post-install-image)
 	$(Q)touch $@
 
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
+	@$(call step_start,install-target)
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$($(PKG)_INSTALL_TARGET_CMDS)
+	@$(call step_end,install-target)
+	@$(call step_start,post-install-target)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
+	@$(call step_end,post-install-target)
 	$(Q)touch $@
 
 # Clean package
-- 
1.8.1.2
