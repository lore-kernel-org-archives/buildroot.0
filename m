From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 14 May 2017 13:21:57 -0400
Subject: [Buildroot] [PATCH v2 3/3] refpolicy: add ability to set default
	state.
In-Reply-To: <20170514172157.1780-1-Adamduskett@outlook.com>
References: <20170514172157.1780-1-Adamduskett@outlook.com>
Message-ID: <20170514172157.1780-4-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - Added cover letter explaining the new patch set. 

 package/refpolicy/Config.in    | 25 +++++++++++++++++++++++++
 package/refpolicy/config       |  9 +++++++++
 package/refpolicy/refpolicy.mk |  6 ++++++
 3 files changed, 40 insertions(+)
 create mode 100644 package/refpolicy/config

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 9d4e0e6..a51e411 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -41,5 +41,30 @@ if BR2_PACKAGE_REFPOLICY
 config BR2_PACKAGE_REFPOLICY_VERSION
 	string "Policy version"
 	default "30"
+choice
+	prompt "SELinux default state"
+	default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+
+config BR2_PACKAGE_REFPOLICY_STATE_ENFORCING
+	bool "Enforcing"
+	help
+	  SELinux security policy is enforced
+
+config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+	bool "Permissive"
+	help
+	  SELinux prints warnings instead of enforcing
+
+config BR2_PACKAGE_REFPOLICY_STATE_DISABLED
+	bool "Disabled"
+	help
+	  No SELinux policy is loaded
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_STATE
+	string
+	default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+	default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCING
+	default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLED
 
 endif
diff --git a/package/refpolicy/config b/package/refpolicy/config
new file mode 100644
index 0000000..a45a349
--- /dev/null
+++ b/package/refpolicy/config
@@ -0,0 +1,9 @@
+# This file controls the state of SELinux on the system.
+# SELINUX= can take one of these three values:
+#     enforcing - SELinux security policy is enforced.
+#     permissive - SELinux prints warnings instead of enforcing.
+#     disabled - No SELinux policy is loaded.
+SELINUX=disabled
+
+SELINUXTYPE=targeted
+
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index b60c456..4834a46 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,6 +23,7 @@ REFPOLICY_DEPENDENCIES += \
 	policycoreutils
 
 REFPOLICY_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/site-packages
+REFPOLICY_NAME = "targeted"
 
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = PYTHON="$(HOST_DIR)/usr/bin/python2" $(TARGET_MAKE_ENV) $(MAKE1)
@@ -44,6 +45,11 @@ endef
 
 define REFPOLICY_INSTALL_TARGET_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	$(INSTALL) -m 0755 -D package/refpolicy/config \
+		$(TARGET_DIR)/etc/selinux/config
+
+	$(SED) "/^SELINUX=/c\SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE)" \
+		$(TARGET_DIR)/etc/selinux/config
 endef
 
 $(eval $(generic-package))
-- 
2.9.3
