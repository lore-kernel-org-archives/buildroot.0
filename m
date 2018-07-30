From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Mon, 30 Jul 2018 17:51:53 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180730155153.24091-1-m.patzlaff@pilz.de>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
Message-ID: <20180730155153.24091-4-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the new target above which implements the update routine as
detailled in the head of this patch series.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 package/pkg-kconfig.mk | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 331ba16614..bc817c457f 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -48,6 +48,18 @@ define kconfig-package-regen-dot-config
 			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
 endef
 
+# Macro to create a .config file where all fragments are merged into
+# $(1): the name of the package in upper-case letters
+# $(2): name of the .config file
+# $(3): fragment files to merge
+define kconfig-package-merge-config
+	$(Q)$(if $($(1)_KCONFIG_DEFCONFIG),\
+		$($(1)_KCONFIG_MAKE) $($(1)_KCONFIG_DEFCONFIG),\
+		$(INSTALL) -m 0644 -D $($(1)_KCONFIG_FILE) $(2))
+	$(Q)support/kconfig/merge_config.sh -m -O $(@D) $(2) $(3)
+	$(call kconfig-package-regen-dot-config,$(1))
+endef
+
 ################################################################################
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
@@ -116,12 +128,7 @@ $(2)_KCONFIG_RULES = \
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
 $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
-		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
-		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
-	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
-		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(call kconfig-package-regen-dot-config,$(2))
+	$$(call kconfig-package-merge-config,$(2),$$(@),$$($(2)_KCONFIG_FRAGMENT_FILES))
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
@@ -239,11 +246,40 @@ $(1)-update-defconfig: PKG=$(2)
 $(1)-update-defconfig: $(1)-savedefconfig
 	$$(call kconfig-package-update-config,defconfig)
 
+
+define $(2)_KCONFIG_LAST_FRAGMENT
+	$$(lastword $$($(2)_KCONFIG_FRAGMENT_FILES))
+endef
+
+define $(2)_KCONFIG_FIRST_FRAGMENTS
+	$$(filter-out $$($(2)_KCONFIG_LAST_FRAGMENT),\
+		$$($(2)_KCONFIG_FRAGMENT_FILES))
+endef
+
+$(1)-update-last-config-fragment: PKG=$(2)
+$(1)-update-last-config-fragment: $(1)-savedefconfig
+	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), true, \
+		echo "Unable to perform $(@) when no fragment files are set"; exit 1)
+	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.ulcf.all
+	$$(Q)cp -a $$($(2)_DIR)/defconfig $$($(2)_DIR)/defconfig.ulcf.all
+	$$(call kconfig-package-merge-config,$(2),$$($(2)_KCONFIG_DOTCONFIG),\
+		$$($(2)_KCONFIG_FIRST_FRAGMENTS))
+	$$(call kconfig-package-savedefconfig)
+	$$(Q)cp -a $$($(2)_DIR)/defconfig $$($(2)_DIR)/defconfig.ulcf.first
+	$$(Q)cp -a $$($(2)_DIR)/.config.ulcf.all $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
+	$$(Q)cp -a $$($(2)_DIR)/defconfig.ulcf.all $$($(2)_DIR)/defconfig
+	$$(Q)utils/diff_defconfig.sh $$($(2)_DIR)/defconfig.ulcf.first \
+		$$($(2)_DIR)/defconfig.ulcf.all $$($(2)_DIR)/.config.ulcf.all > \
+		$$($(2)_KCONFIG_LAST_FRAGMENT)
+	$$(Q)rm -f $$($(2)_DIR)/defconfig.ulcf.* $$($(2)_DIR)/.config.ulcf.*
+
+
 endif # package enabled
 
 .PHONY: \
 	$(1)-update-config \
 	$(1)-update-defconfig \
+	$(1)-update-last-config-fragment \
 	$(1)-savedefconfig \
 	$(1)-check-configuration-done \
 	$$($(2)_DIR)/.kconfig_editor_% \
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
