From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Wed, 27 Jan 2021 10:56:27 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: Add option to disable
 "dontaudit" rules
Message-ID: <20210127095627.789080-1-maxime.chevallier@bootlin.com>
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
 package/refpolicy/Config.in    | 14 ++++++++++++++
 package/refpolicy/refpolicy.mk |  6 +++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

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
index 0194708b37..7e78413a71 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -34,6 +34,9 @@ REFPOLICY_MAKE = \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)
 
+REFPOLICY_EXTRA_MAKE_INSTALL_TARGETS = \
+	$(if $(BR2_REFPOLICY_DISABLE_DONTAUDIT),enableaudit)
+
 REFPOLICY_POLICY_VERSION = $(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION)
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
@@ -122,7 +125,8 @@ define REFPOLICY_INSTALL_STAGING_CMDS
 endef
 
 define REFPOLICY_INSTALL_TARGET_CMDS
-	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		$(REFPOLICY_EXTRA_MAKE_INSTALL_TARGETS) install
 	$(INSTALL) -m 0755 -D package/refpolicy/config \
 		$(TARGET_DIR)/etc/selinux/config
 	$(SED) "/^SELINUX=/c\SELINUX=$(REFPOLICY_POLICY_STATE)" \
-- 
2.25.4
