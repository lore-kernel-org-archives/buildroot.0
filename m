From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 17:18:25 +0200
Subject: [Buildroot] [git commit] package/pkg-kconfig.mk: reusability
 improvements
Message-ID: <20190802151545.87A508C9E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38a1954ad99db751b64284a20ae2d4de3eb0e00e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch refactors savedefconfig and the configuration re-generation
to separate macros so that the functionality can be re-used in further
rules.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-kconfig.mk | 43 +++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index d62be0fd03..e9dece99f2 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -30,6 +30,28 @@ endef
 PKG_KCONFIG_COMMON_OPTS = \
 	HOSTCC=$(HOSTCC_NOCCACHE)
 
+# Macro to save the defconfig file
+# $(1): the name of the package in upper-case letters
+define kconfig-package-savedefconfig
+	$($(1)_MAKE_ENV) $(MAKE) -C $($(1)_DIR) \
+		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) savedefconfig
+endef
+
+# The correct way to regenerate a .config file is to use 'make olddefconfig'.
+# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
+# versions 2.6.36 and 3.6, and remains as an alias in later versions.
+# In older versions, and in some other projects that use kconfig, the target is
+# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
+# only, as this can fail in complex cases.
+# $(1): the name of the package in upper-case letters
+define kconfig-package-regen-dot-config
+	$(if $(filter olddefconfig,$($(1)_KCONFIG_RULES)),
+		$(Q)$($(1)_KCONFIG_MAKE) olddefconfig,
+		$(if $(filter oldnoconfig,$($(1)_KCONFIG_RULES)),
+			$(Q)$($(1)_KCONFIG_MAKE) oldnoconfig,
+			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
+endef
+
 ################################################################################
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
@@ -104,20 +126,6 @@ $(2)_KCONFIG_RULES = \
 	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
 		sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d')
 
-# The correct way to regenerate a .config file is to use 'make olddefconfig'.
-# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
-# versions 2.6.36 and 3.6, and remains as an alias in later versions.
-# In older versions, and in some other projects that use kconfig, the target is
-# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
-# only, as this can fail in complex cases.
-define $(2)_REGEN_DOT_CONFIG
-	$$(if $$(filter olddefconfig,$$($(2)_KCONFIG_RULES)),
-		$$(Q)$$($(2)_KCONFIG_MAKE) olddefconfig,
-		$$(if $$(filter oldnoconfig,$$($(2)_KCONFIG_RULES)),
-			$$(Q)$$($(2)_KCONFIG_MAKE) oldnoconfig,
-			$$(Q)(yes "" | $$($(2)_KCONFIG_MAKE) oldconfig)))
-endef
-
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
@@ -128,7 +136,7 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCO
 		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@D)/$$($(2)_KCONFIG_DOTCONFIG))
 	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$(@D)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$($(2)_REGEN_DOT_CONFIG)
+	$$(call kconfig-package-regen-dot-config,$(2))
 	$$(Q)touch $$(@D)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
@@ -145,7 +153,7 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
-	$$($(2)_REGEN_DOT_CONFIG)
+	$$(call kconfig-package-regen-dot-config,$(2))
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
@@ -236,8 +244,7 @@ $(1)-check-configuration-done:
 	fi
 
 $(1)-savedefconfig: $(1)-check-configuration-done
-	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS) savedefconfig
+	$$(call kconfig-package-savedefconfig,$(2))
 
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
