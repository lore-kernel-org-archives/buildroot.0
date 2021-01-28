From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 13:52:56 +0100
Subject: [Buildroot] [PATCH v2] package/refpolicy: Add option to disable
 "dontaudit" rules
Message-ID: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some rules in the refpolicy are declared with "dontaudit", effectively
suppressing any AVC violation log, while still denying the actions.

This is useful in some cases, where denied actions are to be expected
but won't prevent the system from operating.

However in some other cases, the suppressed logs are important to
troubleshoot some issues.

Disabling the "dontaudit" rules can be done either from the running
system by rebuilding the policy with "semodules -DB", or when initialy
building the policy by using the "enableaudit" make target.

This commit allows building the refpolicy with the "enableaudit" target
prior to installing it, thanks to a dedicated config option.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v1 -> v2: Use POST_BUILD_HOOKS to summon make enableaudit, as per
Antoine Tenart adnd Thomas petazzoni's reviews

 package/refpolicy/Config.in    | 14 ++++++++++++++
 package/refpolicy/refpolicy.mk |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index c529b85e1d..d6e195e8f8 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -111,6 +111,20 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+config BR2_REFPOLICY_DISABLE_DONTAUDIT
+	bool "Disable dontaudit"
+	help
+	  Builds the refpolicy with the "dontaudit" rules disabled.
+	  This will trigger unseen, and probably unharmful audit logs that are
+	  explicitely silenced otherwise. This option can be helpful for
+	  debugging purposes, should a silenced message cause a real issue
+	  that would otherwise be hard to troubleshoot.
+
+	  This option should be used for debugging purposes only, due to
+	  the amount of avc logs it generates.
+
+	  If unsure, select n.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 0194708b37..4dfa9e914a 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -116,6 +116,14 @@ define REFPOLICY_BUILD_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) policy
 endef
 
+ifeq ($(BR2_REFPOLICY_DISABLE_DONTAUDIT),y)
+define REFPOLICY_DISABLE_DONTAUDIT_CMDS
+	$(REFPOLICY_MAKE) -C $(@D) enableaudit
+endef
+endif
+
+REFPOLICY_POST_BUILD_HOOKS += REFPOLICY_DISABLE_DONTAUDIT_CMDS
+
 define REFPOLICY_INSTALL_STAGING_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
 		install-src install-headers
-- 
2.25.4
