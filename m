From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:38:04 +0200
Subject: [Buildroot] [git commit] refpolicy: add ability to set default
	state.
Message-ID: <20170606213820.91B5F7F91E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83875effcfe1d5d16f4e6e3dcacb1b402631bfa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux requires a config file in /etc/selinux which controls the state
of SELinux on the system.

This config file has two options set in it:
SELINUX which set's the state of selinux on boot.
SELINUXTYPE which should equal the name of the policy.  In this case, the
default name is targeted.

This patch adds:
- A choice menu on Config.in that allows the user to select a default
  SELinux state.

- A basic config file that will be installed to
  target/etc/selinux and will set SELINUX= to the selected state.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Acked-by: Matt Weber  <matthew.weber@rockwellcollins.com>
[Thomas:
 - rename option to BR2_PACKAGE_REFPOLICY_POLICY_STATE
 - qstrip the variable
 - drop unused REFPOLICY_NAME variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/refpolicy/Config.in    | 26 ++++++++++++++++++++++++++
 package/refpolicy/config       |  8 ++++++++
 package/refpolicy/refpolicy.mk |  6 ++++++
 3 files changed, 40 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 6978562..954dc3a 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -40,4 +40,30 @@ config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
 	string "Policy version"
 	default "30"
 
+choice
+	prompt "SELinux default state"
+	default BR2_PACKAGE_REFPOLICY_POLICY_STATE_PERMISSIVE
+
+config BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING
+	bool "Enforcing"
+	help
+	  SELinux security policy is enforced
+
+config BR2_PACKAGE_REFPOLICY_POLICY_STATE_PERMISSIVE
+	bool "Permissive"
+	help
+	  SELinux prints warnings instead of enforcing
+
+config BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED
+	bool "Disabled"
+	help
+	  No SELinux policy is loaded
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_POLICY_STATE
+	string
+	default "permissive" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_PERMISSIVE
+	default "enforcing" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING
+	default "disabled" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED
+
 endif
diff --git a/package/refpolicy/config b/package/refpolicy/config
new file mode 100644
index 0000000..087297c
--- /dev/null
+++ b/package/refpolicy/config
@@ -0,0 +1,8 @@
+# This file controls the state of SELinux on the system.
+# SELINUX= can take one of these three values:
+#     enforcing - SELinux security policy is enforced.
+#     permissive - SELinux prints warnings instead of enforcing.
+#     disabled - No SELinux policy is loaded.
+SELINUX=disabled
+
+SELINUXTYPE=targeted
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 4d85ee5..aab1877 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -31,6 +31,8 @@ REFPOLICY_MAKE = \
 
 REFPOLICY_POLICY_VERSION = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_VERSION))
+REFPOLICY_POLICY_STATE = \
+	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
 define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
@@ -50,6 +52,10 @@ endef
 
 define REFPOLICY_INSTALL_TARGET_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(INSTALL) -m 0755 -D package/refpolicy/config \
+		$(TARGET_DIR)/etc/selinux/config
+	$(SED) "/^SELINUX=/c\SELINUX=$(REFPOLICY_POLICY_STATE)" \
+		$(TARGET_DIR)/etc/selinux/config
 endef
 
 $(eval $(generic-package))
