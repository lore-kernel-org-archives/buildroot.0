From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Apr 2016 19:46:04 +0200
Subject: [Buildroot] [PATCH] core/pkg-kconfig: use olddefconfig when
	available
Message-ID: <1461433564-21311-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Izard <romain.izard.pro@gmail.com>

Using 'yes "" | make oldconfig' to regenerate a .config file from an
existing defconfig does not work reliably in all cases. Specifically, it
does not work well with tristate choice entries.

The correct way to do it is to use 'make olddefconfig', but this target
is not supported in projects that use an old version of kconfig. As
most projects do not use tristate entries, there is no need for them to
upgrade.

'oldnoconfig' is an alias for 'olddefconfig', but it also is the only
name for this target between Linux versions 2.6.36 and 3.6.

Check which targets are supported by the current project, and use the
appropriate method to regenerate the .config file.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
[yann.morin.1998 at free.fr: use a shell construct instead of makefile code]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: the helper to extract the make rule could very well be made more
generic, by passing the make command to run instead of passing the
package name. However, there is no need for it for now, and that would
make thecalls to that macro a little bit longer (e.g. for a kconfig
package):
    $$(call MAKE_RULE,$$($(2)_KCONFIG_MAKE),oldconfig)
This far from unreadable, but since there is no need for a generic
wrapper for, we keep it as-is. When/if there is such a need, we can
revisit it.

---
Changelog:
v1: New patch
v2: Use oldnoconfig instead of olddefconfig
    Fix silent mode
    Change the pattern in both places where it is used
    Use a macro to avoid redundancy
v3: Do not use $(call ...)
    Use the $(2)_KCONFIG_MAKE variable
v4: No change
v5: Detect available methods and use the most recent one
v6: Remove colon from matched rule names
v7: Use shell construct, not makefile code  (Yann)
---
 package/pkg-kconfig.mk | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 4033915..63140f7 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -11,6 +11,15 @@
 #
 ################################################################################
 
+# Helper to extract the make rule specified in $(2) from all the make rules
+# of the package specified in $(1).
+# Returns a non-empty string (the rule itself) of the rule exist; returns
+# an empty string if the rule does not exist.
+define KCONFIG_RULES
+	$($(1)_KCONFIG_MAKE) -pn config 2>/dev/null | \
+	sed -r -e '/^$(2):/!d'
+endef
+
 ################################################################################
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
@@ -60,18 +69,33 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 $(2)_KCONFIG_MAKE = \
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS)
 
+# The correct way to regenerate a .config file is to use 'make olddefconfig'.
+# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
+# versions 2.6.36 and 3.6, and remains as an alias in later versions.
+# In older versions, and in some other projects that use kconfig, the target is
+# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
+# only, as this can fail in complex cases.
+define $(2)_REGEN_DOT_CONFIG
+	$$(Q)if [ "`$$(call KCONFIG_RULES,$(2),olddefconfig)`" ]; then \
+		$$($(2)_KCONFIG_MAKE) olddefconfig || exit 1; \
+	elif [ "`$$(call KCONFIG_RULES,$(2),oldnoconfig)`" ]; then \
+		$$($(2)_KCONFIG_MAKE) oldnoconfig || exit 1; \
+	else \
+		(yes "" | $$($(2)_KCONFIG_MAKE) oldconfig) || exit 1; \
+	fi
+endef
+
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
-# full .config first. We use 'make oldconfig' because this can be safely
-# done even when the package does not support defconfigs.
+# full .config first.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
 		cp $$($(2)_KCONFIG_FILE) $$(@))
 	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
+	$$($(2)_REGEN_DOT_CONFIG)
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
@@ -82,7 +106,7 @@ $$($(2)_DIR)/.config: | $(1)-patch
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
-	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
+	$$($(2)_REGEN_DOT_CONFIG)
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
-- 
1.9.1
