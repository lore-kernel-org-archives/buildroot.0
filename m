From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 27 Jun 2016 22:58:33 -0500
Subject: [Buildroot] [PATCH v12 3/9] refpolicy-contrib: new package
In-Reply-To: <1467086319-42783-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1467086319-42783-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1467086319-42783-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

The patch is for updating selinux reference policy latest
contribution changes.

---
Changes v11 -> v12:
  - No changes

Changes v10 -> v11:
  - Seperated refpolicy-contrib package from refpolicy patch and created
    this patch (suggested by Thomas).

Changed v1 -> v10:
  - Did not exist
---
 package/Config.in                              |  1 +
 package/refpolicy-contrib/Config.in            | 19 +++++++++++++++++++
 package/refpolicy-contrib/refpolicy-contrib.mk | 15 +++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/refpolicy-contrib/Config.in
 create mode 100644 package/refpolicy-contrib/refpolicy-contrib.mk

diff --git a/package/Config.in b/package/Config.in
index 71fa9f2..82474df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1609,6 +1609,7 @@ endmenu
 menu "Security"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
+	source "package/refpolicy-contrib/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/refpolicy-contrib/Config.in b/package/refpolicy-contrib/Config.in
new file mode 100644
index 0000000..b518248
--- /dev/null
+++ b/package/refpolicy-contrib/Config.in
@@ -0,0 +1,19 @@
+if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+
+comment "A refpolicy contrib repository is required if using a refpolicy repo. (Contrib is a Git submodule of refpolicy)"
+
+config BR2_PACKAGE_REFPOLICY_CONTRIB
+	bool "refpolicy-contrib"
+	help
+	  A Git submodule of the refpolicy package.
+
+config BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_URL
+	string "URL of custom contrib submodule repository"
+
+config BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_VERSION
+	string "Custom contrib submodule repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  e.g. a SHA id, a tag, branch, ..
+
+endif
diff --git a/package/refpolicy-contrib/refpolicy-contrib.mk b/package/refpolicy-contrib/refpolicy-contrib.mk
new file mode 100644
index 0000000..7bfcfa1
--- /dev/null
+++ b/package/refpolicy-contrib/refpolicy-contrib.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# refpolicy-contrib
+#
+################################################################################
+
+REFPOLICY_CONTRIB_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_URL))
+REFPOLICY_CONTRIB_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_VERSION))
+REFPOLICY_CONTRIB_SITE_METHOD = git
+
+# Inherits license from refpolicy as normally this is a submodule
+REFPOLICY_CONTRIB_LICENSE = GPLv2
+
+# If refpolicy is from release archive, this contrib content is part of it.
+$(eval $(generic-package))
-- 
1.9.1
