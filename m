From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 12 Sep 2016 20:40:26 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-kconfig: support alternative .config
	location
In-Reply-To: <1473705627-32589-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1473705627-32589-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1473705627-32589-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kconfig clones, such as openconf used by xvisor [1], do not look for
.config at the root of the build directory, but in a subdirectory (e.g.
build/openconf).

This patch introduces a new Makefile variable named
$(2)_KCONFIG_DOTCONFIG, which defaults to $$($(2)_DIR)/.config and can
be overridden in the package Makefile.

This allows the use of the kconfig-package infrastructure with packages
relying on such clones.

[1] https://github.com/xvisor/xvisor/tree/master/tools/openconf

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/pkg-kconfig.mk | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index b0f5178..46e1bef 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -36,6 +36,7 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
+$(2)_KCONFIG_DOTCONFIG ?= $$($(2)_DIR)/.config
 
 # The config file as well as the fragments could be in-tree, so before
 # depending on them the package should be extracted (and patched) first.
@@ -91,9 +92,10 @@ endef
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
-$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
+		mkdir -p $$(dir $$(@)); \
 		cp $$($(2)_KCONFIG_FILE) $$(@))
 	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
@@ -102,7 +104,7 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
 # it explicitly. It doesn't hurt to always have it though.
-$$($(2)_DIR)/.config: | $(1)-patch
+$$($(2)_KCONFIG_DOTCONFIG): | $(1)-patch
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
@@ -112,7 +114,7 @@ define $(2)_FIXUP_DOT_CONFIG
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
-$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_KCONFIG_DOTCONFIG)
 	$$($(2)_FIXUP_DOT_CONFIG)
 
 # Before running configure, the configuration file should be present and fixed
@@ -202,8 +204,8 @@ $(1)-update-config: $(1)-check-configuration-done
 		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
 	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		echo "Unable to perform $(1)-update-config when using a defconfig rule"; exit 1)
-	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
-	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+	cp -f $$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
+	touch --reference $$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
 
 # Note: make sure the timestamp of the stored configuration is not newer than
 # the .config to avoid a useless rebuild. Note that, contrary to
@@ -215,7 +217,7 @@ $(1)-update-defconfig: $(1)-savedefconfig
 	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		echo "Unable to perform $(1)-update-defconfig when using a defconfig rule"; exit 1)
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
-	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+	touch --reference $$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
 
 endif # package enabled
 
-- 
2.4.11
