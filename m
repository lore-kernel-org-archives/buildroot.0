From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Jul 2014 15:45:47 +0200
Subject: [Buildroot] [PATCH] pkg-infra: do the package install before
	installing init files
Message-ID: <1404654347-1261-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The init hooks may reference files installed by the package. For
example, when a package installs systemd unit files, and wants them
enabled/disabled by default, the init hokk may move/symlink/rename the
unit files.

Currently, the init hooks are called before the package is installed,
thus breaking the use-case above.

Just inverse the install orderr, so that a package is installed before
its init hooks are called.

Fixes: http://autobuild.buildroot.net/results/5b03174318d8a6dc3112053ff141b70a90869c20/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b7f50a5..bc8a12e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -228,11 +228,11 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
-	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
-- 
1.9.1
