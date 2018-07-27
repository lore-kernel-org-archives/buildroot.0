From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Fri, 27 Jul 2018 15:12:51 +0200
Subject: [Buildroot] [PATCH 1/1] Buildroot: Target to update config
 fragments in kconfig base packages
Message-ID: <20180727131251.21649-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a new make target for kconfig based packages:
    <pkg>-update-last-config-fragment

It updates the last configuration fragment that is specified in
<PKG>_KCONFIG_FRAGMENT_FILES in a defined way. Let's assume that
we have three fragment files X, Y and Z configured. So the update
process will only affect Z and be as follows:

1) Create the defconfig D_now of the current .config file .C_now:

    D_now = savedefconfig .C_now

2) Create the .config file .C out of either <PKG>_KCONFIG_DEFCONFIG
   or <PKG>_KCONFIG_FILE.

3) Merge .C with the two first fragments X and Y into .Cy and create the
   corresponding defconfig Dy:

    .Cy = merge_config.sh .C X Y
     Dy = savedefconfig .Cy

2) Collect all items that differ between the two defconfigs Dy and Dnow and
   take their values from .Cnow:

      Z = diff_defconfig.sh Dy Dnow .Cnow

Now the following holds:

     .Cnow = merge_config.sh .C X Y Z

The intention of this patch is to allow developers to change the
configuration via menuconfig or whatever editor and to apply those changes
automatically to the last fragment. This should further ease layering of
buildroot configurations.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 package/pkg-kconfig.mk            | 89 +++++++++++++++++++++++--------
 support/kconfig/diff_defconfig.sh | 89 +++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 23 deletions(-)
 create mode 100755 support/kconfig/diff_defconfig.sh

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 81bba5220c..1e69572c3b 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -27,6 +27,39 @@ define kconfig-package-update-config
 	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
 endef
 
+# Macro to save the defconfig file
+define kconfig-package-savedefconfig
+	$($(PKG)_MAKE_ENV) $(MAKE) -C $($(PKG)_DIR) \
+		$($(PKG)_KCONFIG_OPTS) savedefconfig
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
@@ -90,31 +123,12 @@ $(2)_KCONFIG_RULES = \
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
 # full .config first.
 $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
-		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
-		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
-	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
-		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$($(2)_REGEN_DOT_CONFIG)
+	$$(call kconfig-package-merge-config,$(2),$$(@),$$($(2)_KCONFIG_FRAGMENT_FILES))
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
@@ -125,7 +139,7 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $(1)-patch
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
-	$$($(2)_REGEN_DOT_CONFIG)
+	$$(call kconfig-package-regen-dot-config,$(2))
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
@@ -213,9 +227,9 @@ $(1)-check-configuration-done:
 		exit 1; \
 	fi
 
+$(1)-savedefconfig: PKG=$(2)
 $(1)-savedefconfig: $(1)-check-configuration-done
-	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPTS) savedefconfig
+	$$(call kconfig-package-savedefconfig)
 
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
@@ -232,11 +246,40 @@ $(1)-update-defconfig: PKG=$(2)
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
+	$$(Q)support/kconfig/diff_defconfig.sh $$($(2)_DIR)/defconfig.ulcf.first \
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
diff --git a/support/kconfig/diff_defconfig.sh b/support/kconfig/diff_defconfig.sh
new file mode 100755
index 0000000000..ee7b0c0fc6
--- /dev/null
+++ b/support/kconfig/diff_defconfig.sh
@@ -0,0 +1,89 @@
+#!/bin/sh
+
+#  diff_defconfig.sh - Takes two defconfig files A and B as well as the config
+#  file derived from B and outputs the differences that lead from A to B.
+#  The output can be used as configuration fragment.
+#
+#  Copyright 2018 Pilz GmbH & Co. KG
+#
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License version 2 as
+#  published by the Free Software Foundation.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+#  See the GNU General Public License for more details.
+
+set -e
+
+THIS_FILE=$(basename ${0})
+
+USAGE="${THIS_FILE} [OPTIONS] <a.defconfig> <b.defconfig> <b.config>"
+
+fail_msg() {
+    printf "%s\n" "${1}" 1>&2
+    exit 1
+}
+
+help() {
+    cat <<-_EOF_
+	Usage:
+	    ${USAGE}
+
+	${THIS_FILE} takes two defconfig files A and B as well as the .config
+	file derived from B and outputs the differences that lead from A to B on
+	stdout. The output can be used as configuration fragment.
+
+	Options:
+	    -h   display this help text
+	    -p   do not restrict config prefix to CONFIG_
+
+	Returns:
+	    0    If no error
+	    !0   If any error
+	_EOF_
+}
+
+
+ALLPREFIXES=false
+# parse options
+while true; do
+    case "${1}" in
+        "-h")
+            help
+            exit 0
+        ;;
+        "-p")
+            ALLPREFIXES=true
+            shift
+        ;;
+        *)
+            break
+        ;;
+    esac
+done
+
+# check if all files are given
+[ "${#}" -eq "3" ] || fail_msg "Usage: ${USAGE}"
+
+# test if files exist
+[ -f "${1}" ] || fail_msg "First defconfig file '${1}' does not exist!"
+[ -f "${2}" ] || fail_msg "Second defconfig file '${2}' does not exist!"
+[ -f "${3}" ] || fail_msg "Config file '${3}' does not exist!"
+
+ITEM_EXP="s/^[<>]\s\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+if [ "${ALLPREFIXES}" = "true" ]; then
+    ITEM_EXP="s/^[<>]\s\(# \)\{0,1\}\([a-zA-Z][a-zA-Z0-9_]*\)[= ].*/\2/p"
+fi
+
+# use normal diff and collect all differing items
+ITEMS=$(diff "${1}" "${2}" | sed -n "${ITEM_EXP}" | sort | uniq)
+
+# output their values
+for item in ${ITEMS}; do
+    # some items disable/hide others so grep may fail here
+    grep -w "${item}" "${3}" || true
+done
+
+exit 0
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
