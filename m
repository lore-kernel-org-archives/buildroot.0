From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:35 +0200
Subject: [Buildroot] [PATCH 10/15] package/refpolicy: allow providing user
 defined modules
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-11-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow users to provide custom SELinux modules to be part of the final
policy. A new configuration variable is added, pointing to list of
directories containing the custom modules.

SELinux modules do require a metadata.xml file to be well integrated in
the refpolicy build. If this file isn't provided, it will be
automatically created.

For now, this option requires the extra modules to be directly into the
BR2_REFPOLICY_EXTRA_MODULES directory, and subfolders aren't supported.
They may never be, as having subfolders could introduce issues when two
different modules have the same name (which isn't supported by the
refpolicy).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/refpolicy/Config.in    | 10 ++++++++++
 package/refpolicy/refpolicy.mk | 23 ++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index b50b2f09ff79..030b1e93c9bd 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -54,6 +54,16 @@ config BR2_PACKAGE_REFPOLICY_POLICY_STATE
 	default "enforcing" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_ENFORCING
 	default "disabled" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED
 
+config BR2_REFPOLICY_EXTRA_MODULES_DIRS
+	string "Extra modules directories"
+	help
+	  Specify directories containing SELinux modules that will be build
+	  in the SELinux policy. The modules will be automatically enabled in
+	  the policy.
+
+	  Each of those directories must contain the SELinux policy .fc, .if
+	  and .te files directly at the top-level, with no sub-directories.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index c29912a53b0b..edbb5a228f55 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -46,7 +46,26 @@ REFPOLICY_MODULES = \
 	sysnetwork \
 	unconfined \
 	userdomain \
-	$(PACKAGES_SELINUX_MODULES)
+	$(PACKAGES_SELINUX_MODULES) \
+	$(foreach d,$(call qstrip,$(REFPOLICY_EXTRA_MODULES)),\
+		$(basename $(notdir $(wildcard $(d)/*.te))))
+
+# Allow to provide out-of-tree SELinux modules in addition to the ones in the
+# refpolicy.
+REFPOLICY_EXTRA_MODULES = $(BR2_REFPOLICY_EXTRA_MODULES_DIRS)
+$(foreach dir,$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)),\
+	$(if $(wildcard $(dir)),,\
+		$(error BR2_REFPOLICY_EXTRA_MODULES_DIRS contains nonexistent directory $(dir))))
+
+define REFPOLICY_COPY_MODULES
+	mkdir -p $(@D)/policy/modules/buildroot
+	rsync -au $(addsuffix /*,$(call qstrip,$(REFPOLICY_EXTRA_MODULES))) \
+		$(@D)/policy/modules/buildroot/
+	if [ ! -f $(@D)/policy/modules/buildroot/metadata.xml ]; then \
+		echo "<summary>Buildroot extra modules</summary>" > \
+			$(@D)/policy/modules/buildroot/metadata.xml; \
+	fi
+endef
 
 # In the context of a monolithic policy enabling a piece of the policy as
 # 'base' or 'module' is equivalent, so we enable them as 'base'.
@@ -72,6 +91,8 @@ define REFPOLICY_CONFIGURE_CMDS
 endef
 
 define REFPOLICY_BUILD_CMDS
+	$(if $(call qstrip,$(REFPOLICY_EXTRA_MODULES)),\
+		$(REFPOLICY_COPY_MODULES))
 	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) bare conf
 	$(REFPOLICY_CONFIGURE_MODULES)
 endef
-- 
2.26.2
