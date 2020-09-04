From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:49:32 +0200
Subject: [Buildroot] [git commit] package/refpolicy: allow to provide a
 custom refpolicy
Message-ID: <20200904123951.EE5078185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8619307c965030c61dfde8ff5cff787cc928d8ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the user to provide a fully custom refpolicy. When
this is used, modules aren't disabled anymore and packages do not
select refpolicy available modules either. The custom refpolicy must
define the full policy explicitly, and must be a fork of the original
refpolicy, to have the same build system.

This is added to allow users to fully control an SELinux policy, by
providing a complete custom policy.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/Config.in    | 39 +++++++++++++++++++++++++++++++++++++++
 package/refpolicy/refpolicy.mk | 18 +++++++++++++++---
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 24c811ca24..c529b85e1d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -28,6 +28,41 @@ config BR2_PACKAGE_REFPOLICY
 
 if BR2_PACKAGE_REFPOLICY
 
+choice
+	prompt "Refpolicy version"
+	default BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
+
+config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
+	bool "Upstream version"
+	help
+	  Use the refpolicy as provided by Buildroot.
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+	bool "Custom git repository"
+	help
+	  Allows to get the refpolicy from a custom git repository.
+
+	  The custom refpolicy must define the full policy explicitly,
+	  and must be a fork of the original refpolicy, to have the
+	  same build system.  When this is selected, only the custom
+	  policy definition are taken into account and all the modules
+	  of the policy are built into the binary policy.
+
+endchoice
+
+if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git.
+	  E.g. a sha id, tag, branch...
+
+endif
+
 choice
 	prompt "SELinux default state"
 	default BR2_PACKAGE_REFPOLICY_POLICY_STATE_PERMISSIVE
@@ -54,6 +89,8 @@ config BR2_PACKAGE_REFPOLICY_POLICY_STATE
 	default "enforcing" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING
 	default "disabled" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED
 
+if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
+
 config BR2_REFPOLICY_EXTRA_MODULES_DIRS
 	string "Extra modules directories"
 	help
@@ -74,5 +111,7 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+endif
+
 comment "refpolicy needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 50d86699b2..7e469e8cdc 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-REFPOLICY_VERSION = 2.20200229
-REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20200229
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
 REFPOLICY_INSTALL_STAGING = YES
@@ -18,6 +15,17 @@ REFPOLICY_DEPENDENCIES = \
 	host-setools \
 	host-gawk
 
+ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
+REFPOLICY_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION))
+REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
+REFPOLICY_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
+else
+REFPOLICY_VERSION = 2.20200229
+REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20200229
+endif
+
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
@@ -29,6 +37,8 @@ REFPOLICY_POLICY_VERSION = $(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION)
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
+ifeq ($(BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION),y)
+
 # Allow to provide out-of-tree SELinux modules in addition to the ones
 # in the refpolicy.
 REFPOLICY_EXTRA_MODULES_DIRS = $(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS))
@@ -79,6 +89,8 @@ define REFPOLICY_CONFIGURE_MODULES
 	)
 endef
 
+endif # BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION = y
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 define REFPOLICY_CONFIGURE_SYSTEMD
 	$(SED) "/SYSTEMD/c\SYSTEMD = y" $(@D)/build.conf
