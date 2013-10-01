From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  1 Oct 2013 14:55:03 +0200
Subject: [Buildroot] [PATCH v6 4/5] pkg-generic: enable jobserver for
	recursive make
In-Reply-To: <1380632104-10421-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380632104-10421-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380632104-10421-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add '+' prefix to the $($(PKG)_BUILD_CMDS) and $($(PKG)_INSTALL*_CMDS)
commands to enable jobserver for the sub-make.

Without the '+' prefix GNU make does not detect the sub-make so it
disable the jobserver for the sub-make.

From GNU make documentation:
Using the MAKE variable has the same effect as using a ?+? character
at the beginning of the recipe line.  This special feature is only
enabled if the MAKE variable appears directly in the recipe: it does
not apply if the MAKE variable is referenced through expansion of
another variable. In the latter case you must use the ?+? token to get
these special effects.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0de1f35..6118beb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -117,21 +117,21 @@ $(BUILD_DIR)/%/.stamp_configured:
 # Build
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call MESSAGE,"Building")
-	$($(PKG)_BUILD_CMDS)
+	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call MESSAGE,"Installing to host directory")
-	$($(PKG)_INSTALL_CMDS)
+	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call MESSAGE,"Installing to staging directory")
-	$($(PKG)_INSTALL_STAGING_CMDS)
+	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
@@ -145,7 +145,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call MESSAGE,"Installing to images directory")
-	$($(PKG)_INSTALL_IMAGES_CMDS)
+	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
@@ -156,7 +156,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
-	$($(PKG)_INSTALL_TARGET_CMDS)
+	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
-- 
1.8.4
