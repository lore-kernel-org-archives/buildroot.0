From: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 21 Jun 2021 16:11:18 +0200
Subject: [Buildroot] [PATCH 03/15] package/pkg-generic.mk: Remove Info
 documents dir entry
In-Reply-To: <20210621141130.48654-1-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
Message-ID: <20210621141130.48654-4-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (autotools for instance) install documentation
files using install-info. This program adds an entry in
the Info directory file (share/info/dir) and this causes
TARGET_DIR and/or HOST_DIR overwrite.

In order to avoid this overwrite this patch removes the Info
directory file right after any installation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bb9ff4150a..2499c94746 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -280,6 +280,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
+	$(Q) rm -f $(HOST_DIR)/share/info/dir
 	@$(call step_end,install-host)
 	$(Q)touch $@
 
@@ -309,6 +310,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	$(Q) rm -f $(STAGING_DIR)/share/info/dir
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(HOST_DIR), at HOST_DIR@,g" \
@@ -368,6 +370,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$(or $($(PKG)_INSTALL_INIT_OPENRC), \
 			$($(PKG)_INSTALL_INIT_SYSV)))
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	$(Q) rm -f $(TARGET_DIR)/share/info/dir
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
-- 
2.31.1
