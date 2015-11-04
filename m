From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 14:10:45 +0100
Subject: [Buildroot] [git commit] core/pkg-generic: allow step hooks to fail
	a step
Message-ID: <20151104132016.55D5D7F9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e76467031e226aa348570c00c7e4a5ad60ae6c75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we touch our stamp files before we call the step hooks.
This means a step hook can not properly fail a step, since the stamp
file exists even if the hook exits in error, thus a subsequent 'make'
would not try to redo that step.

Fix that by calling the hooks before we touch the stamp files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1ae0315..a5d0e57 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -125,8 +125,8 @@ $(BUILD_DIR)/%/.stamp_extracted:
 # some packages have messed up permissions inside
 	$(Q)chmod -R +rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
-	$(Q)touch $@
 	@$(call step_end,extract)
+	$(Q)touch $@
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
@@ -165,8 +165,8 @@ $(BUILD_DIR)/%/.stamp_patched:
 	done; \
 	)
 	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(Q)touch $@
 	@$(call step_end,patch)
+	$(Q)touch $@
 
 # Check that all directories specified in BR2_GLOBAL_PATCH_DIR exist.
 $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
@@ -180,8 +180,8 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
-	$(Q)touch $@
 	@$(call step_end,configure)
+	$(Q)touch $@
 
 # Build
 $(BUILD_DIR)/%/.stamp_built::
@@ -190,8 +190,8 @@ $(BUILD_DIR)/%/.stamp_built::
 	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
-	$(Q)touch $@
 	@$(call step_end,build)
+	$(Q)touch $@
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
@@ -200,8 +200,8 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
-	$(Q)touch $@
 	@$(call step_end,install-host)
+	$(Q)touch $@
 
 # Install to staging dir
 #
@@ -251,8 +251,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
 			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
 			-e "s:@BASE_DIR@:$(BASE_DIR):g"
-	$(Q)touch $@
 	@$(call step_end,install-staging)
+	$(Q)touch $@
 
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
@@ -261,8 +261,8 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call MESSAGE,"Installing to images directory")
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
-	$(Q)touch $@
 	@$(call step_end,install-image)
+	$(Q)touch $@
 
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
@@ -278,8 +278,8 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
-	$(Q)touch $@
 	@$(call step_end,install-target)
+	$(Q)touch $@
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
