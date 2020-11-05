From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu,  5 Nov 2020 11:04:01 -0300
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: fix generation of
 package list in reinstall
Message-ID: <20201105140401.1356161-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Running "make <pkg>-reinstall" always shows a message like these:

comm: /.../build/pkg-x.y.z/.files-list.before: No such file or directory
comm: /.../build/pkg-x.y.z/.files-list-staging.before: No such file or directory
comm: /.../build/pkg-x.y.z/.files-list-host.before: No such file or directory

This happens because pkg_size_after is called in the .stamp_installed
target and removes .files-list$(2).before, so in a second installation
the file is not there anymore. This results in an empty .files-list.txt
file.

Move the pkg_size_{before,after} calls from the .stamp_configured and
.stamp_installed targets to the .stamp_{host,staging,target}_installed
targets, respectively. This ensures that every pkg_size_after call has
an immediately corresponding pkg_size_before call.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/pkg-generic.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54de03da03..b13ecc5d8e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -232,9 +232,6 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call MESSAGE,"Configuring")
 	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
-	@$(call pkg_size_before,$(TARGET_DIR))
-	@$(call pkg_size_before,$(STAGING_DIR),-staging)
-	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
@@ -256,9 +253,11 @@ $(BUILD_DIR)/%/.stamp_built::
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
+	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
+	@$(call pkg_size_after,$(HOST_DIR),-host)
 	@$(call step_end,install-host)
 	$(Q)touch $@
 
@@ -285,6 +284,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
+	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
@@ -320,6 +320,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 			mv "$${la}.fixed" "$${la}"; \
 		fi || exit 1; \
 	done
+	@$(call pkg_size_after,$(STAGING_DIR),-staging)
 	@$(call step_end,install-staging)
 	$(Q)touch $@
 
@@ -337,6 +338,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
+	@$(call pkg_size_before,$(TARGET_DIR))
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(if $(BR2_INIT_SYSTEMD),\
@@ -350,15 +352,13 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
+	@$(call pkg_size_after,$(TARGET_DIR))
 	@$(call step_end,install-target)
 	$(Q)touch $@
 
 # Final installation step, completed when all installation steps
 # (host, images, staging, target) have completed
 $(BUILD_DIR)/%/.stamp_installed:
-	@$(call pkg_size_after,$(TARGET_DIR))
-	@$(call pkg_size_after,$(STAGING_DIR),-staging)
-	@$(call pkg_size_after,$(HOST_DIR),-host)
 	@$(call check_bin_arch)
 	$(Q)touch $@
 
-- 
2.27.0
