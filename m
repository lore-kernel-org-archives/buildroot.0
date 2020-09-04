From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:16:05 +0200
Subject: [Buildroot] [git commit] package/refpolicy: allow providing user
 defined modules
Message-ID: <20200904123951.D64A18185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e2e3cc9519ab0fd6ed5411fe88cce14b4b7a2a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow users to provide custom SELinux modules to be part of the final
policy. A new configuration variable is added, pointing to list of
directories containing the custom modules.

SELinux modules do require a metadata.xml file to be well integrated
in the refpolicy build. If this file isn't provided, it will be
automatically created.

For now, this option requires the extra modules to be directly into
the BR2_REFPOLICY_EXTRA_MODULES directory, and subfolders aren't
supported.  They may never be, as having subfolders could introduce
issues when two different modules have the same name (which isn't
supported by the refpolicy).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/Config.in    | 13 +++++++++++++
 package/refpolicy/refpolicy.mk | 24 +++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index b50b2f09ff..1912f24a58 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -54,6 +54,19 @@ config BR2_PACKAGE_REFPOLICY_POLICY_STATE
 	default "enforcing" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING
 	default "disabled" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED
 
+config BR2_REFPOLICY_EXTRA_MODULES_DIRS
+	string "Extra modules directories"
+	help
+	  Specify a space-separated list of directories containing
+	  SELinux modules that will be built into the SELinux
+	  policy. The modules will be automatically enabled in the
+	  policy.
+
+	  Each of those directories must contain the SELinux policy
+	  .fc, .if and .te files directly at the top-level, with no
+	  sub-directories. Also, you cannot have several modules with
+	  the same name in different directories.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index c29912a53b..a7a924f0af 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -29,6 +29,13 @@ REFPOLICY_POLICY_VERSION = $(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION)
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
+# Allow to provide out-of-tree SELinux modules in addition to the ones
+# in the refpolicy.
+REFPOLICY_EXTRA_MODULES_DIRS = $(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS))
+$(foreach dir,$(REFPOLICY_EXTRA_MODULES_DIRS),\
+	$(if $(wildcard $(dir)),,\
+		$(error BR2_REFPOLICY_EXTRA_MODULES_DIRS contains nonexistent directory $(dir))))
+
 REFPOLICY_MODULES = \
 	application \
 	authlogin \
@@ -46,7 +53,21 @@ REFPOLICY_MODULES = \
 	sysnetwork \
 	unconfined \
 	userdomain \
-	$(PACKAGES_SELINUX_MODULES)
+	$(PACKAGES_SELINUX_MODULES) \
+	$(foreach d,$(REFPOLICY_EXTRA_MODULES_DIRS),\
+		$(basename $(notdir $(wildcard $(d)/*.te))))
+
+ifneq ($(REFPOLICY_EXTRA_MODULES_DIRS),)
+define REFPOLICY_COPY_EXTRA_MODULES
+	mkdir -p $(@D)/policy/modules/buildroot
+	rsync -au $(addsuffix /*,$(REFPOLICY_EXTRA_MODULES_DIRS)) \
+		$(@D)/policy/modules/buildroot/
+	if [ ! -f $(@D)/policy/modules/buildroot/metadata.xml ]; then \
+		echo "<summary>Buildroot extra modules</summary>" > \
+			$(@D)/policy/modules/buildroot/metadata.xml; \
+	fi
+endef
+endif
 
 # In the context of a monolithic policy enabling a piece of the policy as
 # 'base' or 'module' is equivalent, so we enable them as 'base'.
@@ -72,6 +93,7 @@ define REFPOLICY_CONFIGURE_CMDS
 endef
 
 define REFPOLICY_BUILD_CMDS
+	$(REFPOLICY_COPY_EXTRA_MODULES)
 	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) bare conf
 	$(REFPOLICY_CONFIGURE_MODULES)
 endef
