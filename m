From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:11 -0600
Subject: [Buildroot] [PATCH v4 10/27] refpolicy: custom git repo
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-11-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                              |  1 +
 package/refpolicy-contrib/Config.in            | 20 +++++++++++++++++
 package/refpolicy-contrib/refpolicy-contrib.mk | 19 ++++++++++++++++
 package/refpolicy/Config.in                    | 22 +++++++++++++++++++
 package/refpolicy/refpolicy.mk                 | 30 ++++++++++++++++++++++----
 5 files changed, 88 insertions(+), 4 deletions(-)
 create mode 100644 package/refpolicy-contrib/Config.in
 create mode 100644 package/refpolicy-contrib/refpolicy-contrib.mk

diff --git a/package/Config.in b/package/Config.in
index fdd4273..d6d88e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1207,6 +1207,7 @@ menu "policycoreutils"
 endmenu
 menu "refpolicy"
 	source "package/refpolicy/Config.in"
+	source "package/refpolicy-contrib/Config.in"
 endmenu
 	source "package/setools/Config.in"
 endmenu
diff --git a/package/refpolicy-contrib/Config.in b/package/refpolicy-contrib/Config.in
new file mode 100644
index 0000000..1fc0c31
--- /dev/null
+++ b/package/refpolicy-contrib/Config.in
@@ -0,0 +1,20 @@
+if BR2_REFPOLICY_CUSTOM_GIT
+
+comment "A refpolicy contrib repository is required if using a refpolicy repo. (Contrib is a GIT submodule of refpolicy)"
+
+config BR2_PACKAGE_REFPOLICY_CONTRIB
+	bool "refpolicy-contrib"
+	help
+	  A GIT submodule of the refpolicy package.
+
+
+config BR2_REFPOLICY_CONTRIB_CUSTOM_REPO_URL
+	string "URL of custom contrib submodule repository"
+
+config BR2_REFPOLICY_CONTRIB_CUSTOM_REPO_VERSION
+	string "Custom contrib submodule repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  e.g. a SHA id, a tag, branch, ..
+
+endif
diff --git a/package/refpolicy-contrib/refpolicy-contrib.mk b/package/refpolicy-contrib/refpolicy-contrib.mk
new file mode 100644
index 0000000..e13a3ff
--- /dev/null
+++ b/package/refpolicy-contrib/refpolicy-contrib.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# refpolicy-contrib
+#
+################################################################################
+
+ifeq ($(BR2_REFPOLICY_CUSTOM_GIT),y)
+REFPOLICY_CONTRIB_SITE = $(call qstrip,$(BR2_REFPOLICY_CONTRIB_CUSTOM_REPO_URL))
+REFPOLICY_CONTRIB_VERSION = $(call qstrip,$(BR2_REFPOLICY_CONTRIB_CUSTOM_REPO_VERSION))
+REFPOLICY_CONTRIB_SITE_METHOD = git
+
+# Inherits license from refpolicy as normally this is a submodule
+REFPOLICY_CONTRIB_LICENSE = GPLv2
+REFPOLICY_CONTRIB_LICENSE_FILES = COPYING
+endif
+
+# If refpolicy is from release archive, this contrib content is part of it.
+
+$(eval $(generic-package))
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 39bebca..51e2142 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -59,6 +59,8 @@ config BR2_PACKAGE_REFPOLICY_MODULES_FILE
 	  SELinux policy modules to be included in the compiled
 	  policy. See policy/modules.conf in the refpolicy sources for
 	  the complete list of available modules.
+	  NOTE: This file is only used if a Custom GIT repo is
+	  not specified.
 
 config BR2_PACKAGE_REFPOLICY_MODULAR
 	bool "Build a modular SELinux policy"
@@ -68,4 +70,24 @@ config BR2_PACKAGE_REFPOLICY_MODULAR
 	  target. A modular policy can also be built if policies
 	  need to be modified without reloading the target.
 
+config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+	bool "Custom Git repository"
+	select BR2_PACKAGE_REFPOLICY_CONTRIB
+	help
+	 This option allows Buildroot to get the refpolicy source
+	 code from a Git repository.
+
+if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  e.g. a SHA id, a tag, branch, ..
+
+endif
+
 endif
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 81e104c..382f141 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,16 +4,23 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
+REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
+REFPOLICY_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION))
+REFPOLICY_SITE_METHOD = git
+REFPOLICY_DEPENDENCIES += refpolicy-contrib
+else
 REFPOLICY_VERSION = 2.20130424
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy/
+endif
 REFPOLICY_LICENSE = GPLv2
 REFPOLICY_LICENSE_FILES = COPYING
 
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
 
-REFPOLICY_DEPENDENCIES = host-m4 host-checkpolicy host-policycoreutils \
+REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
 	host-setools host-python-pyxml host-gawk policycoreutils
 
 REFPOLICY_INSTALL_STAGING = YES
@@ -37,18 +44,33 @@ else
 	REFPOLICY_MONOLITHIC = y
 endif
 
+ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
+define REFPOLICY_GIT_SUBMODULE_SETUP
+	rsync -ar $(REFPOLICY_CONTRIB_DIR)/* $(@D)/policy/modules/contrib/
+endef
+else
+define REFPOLICY_CUSTOM_MODULES_CONF
+	cp -f $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf
+endef
+endif
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(REFPOLICY_GIT_SUBMODULE_SETUP)
 	# If an external repo is used to build refpolicy, this preserves the
 	# custom modules.conf which defines the enabled components.
-	[ -f $(@D)/policy/modules.conf ] && mv $(@D)/policy/modules.conf $(@D)/modules.conf.bk
+	if [ -f $(@D)/policy/modules.conf ]; then \
+		mv $(@D)/policy/modules.conf $(@D)/modules.conf.bk ; \
+	fi
 	$(REFPOLICY_MAKE) -C $(@D) bare $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
 	$(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = $(REFPOLICY_MONOLITHIC)" $(@D)/build.conf
 	$(SED) "/NAME/c\NAME = $(REFPOLICY_POLICY_NAME)" $(@D)/build.conf
 	$(REFPOLICY_MAKE) -C $(@D) conf $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
-	[ -f $(@D)/modules.conf.bk ] &&  echo "[Preserved modules.conf]" && \
-		mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf
+	if [ -f $(@D)/modules.conf.bk ]; then \
+		echo "[Preserved modules.conf]" ; \
+		mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
+	fi
+	$(REFPOLICY_CUSTOM_MODULES_CONF)
 endef
 
 define REFPOLICY_INSTALL_STAGING_CMDS
-- 
1.9.1
