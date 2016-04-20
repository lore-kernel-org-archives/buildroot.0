From: Romain Izard <romain.izard.pro@gmail.com>
Date: Wed, 20 Apr 2016 11:54:12 +0200
Subject: [Buildroot] [PATCH v6] core/pkg-kconfig: Use olddefconfig when
	available
Message-ID: <1461146052-13261-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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

 package/pkg-kconfig.mk | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 4033915..478f5bb 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -60,18 +60,35 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 $(2)_KCONFIG_MAKE = \
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS)
 
+$(2)_KCONFIG_RULES = \
+	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
+		sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d')
+
+# The correct way to regenerate a .config file is to use 'make olddefconfig'.
+# For historical reasons, the target name is 'oldnoconfig' between Linux kernel
+# versions 2.6.36 and 3.6, and remains as an alias in later versions.
+# In older versions, and in some other projects that use kconfig, the target is
+# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
+# only, as this can fail in complex cases.
+define $(2)_REGEN_DOT_CONFIG
+	$$(if $$(filter olddefconfig,$$($(2)_KCONFIG_RULES)),
+		$$(Q)$$($(2)_KCONFIG_MAKE) olddefconfig,
+		$$(if $$(filter oldnoconfig,$$($(2)_KCONFIG_RULES)),
+			$$(Q)$$($(2)_KCONFIG_MAKE) oldnoconfig,
+			$$(Q)(yes "" | $$($(2)_KCONFIG_MAKE) oldconfig)))
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
@@ -82,7 +99,7 @@ $$($(2)_DIR)/.config: | $(1)-patch
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
-	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
+	$$($(2)_REGEN_DOT_CONFIG)
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
-- 
2.5.0
