From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:09:54 +0100
Subject: [Buildroot] [git commit] package: enable jobserver for recursive
	make
Message-ID: <20140228133412.E7BB19BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=069b33a30e6d71454ba8cf3b41d1ee2db14549e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add '+' prefix to the $($(PKG)_BUILD_CMDS) and $($(PKG)_INSTALL*_CMDS)
commands to enable jobserver for the sub-make.

Without the '+' prefix GNU make does not detect the sub-make so it
disable the jobserver for the sub-make.

From GNU make documentation:
Using the MAKE variable has the same effect as using a ???+??? character
at the beginning of the recipe line.  This special feature is only
enabled if the MAKE variable appears directly in the recipe: it does
not apply if the MAKE variable is referenced through expansion of
another variable. In the latter case you must use the ???+??? token to get
these special effects.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fec16b0..acb6f62 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -173,7 +173,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
-	$($(PKG)_BUILD_CMDS)
+	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 	@$(call step_end,build)
@@ -182,7 +182,7 @@ $(BUILD_DIR)/%/.stamp_built::
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
-	$($(PKG)_INSTALL_CMDS)
+	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 	@$(call step_end,install-host)
@@ -191,7 +191,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
-	$($(PKG)_INSTALL_STAGING_CMDS)
+	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
@@ -207,7 +207,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
 	@$(call MESSAGE,"Installing to images directory")
-	$($(PKG)_INSTALL_IMAGES_CMDS)
+	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 	@$(call step_end,install-image)
@@ -220,7 +220,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
-	$($(PKG)_INSTALL_TARGET_CMDS)
+	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
