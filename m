From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:44:10 +0200
Subject: [Buildroot] [git commit] pkg-kconfig: support alternative .config
	location
Message-ID: <20160917131555.4E0068172E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbbc8b5de32965aaf9fa01d4fabc461dd65f6c3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kconfig clones, such as openconf used by xvisor [1], do not look for
.config at the root of the build directory, but in a subdirectory (e.g.
build/openconf).

This patch introduces a new Makefile variable named
$(2)_KCONFIG_DOTCONFIG, which contains the path to .config relative to
the source directory of the package. It defaults to .config and can be
overridden in the package Makefile.

It also creates the full directory hierarchy where the .config file is
stored, in case it does not exist (e.g. in xvisor).

This allows the use of the kconfig-package infrastructure with packages
relying on such clones.

[1] https://github.com/xvisor/xvisor/tree/master/tools/openconf

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: use "install -D" instead of "mkdir + cp", as suggested by
Yann.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ce9bf33..215f01b 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -36,6 +36,7 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
+$(2)_KCONFIG_DOTCONFIG ?= .config
 
 # The config file as well as the fragments could be in-tree, so before
 # depending on them the package should be extracted (and patched) first.
@@ -91,10 +92,10 @@ endef
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
-$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
-		cp $$($(2)_KCONFIG_FILE) $$(@))
+		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
 	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$($(2)_REGEN_DOT_CONFIG)
@@ -102,7 +103,7 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
 # it explicitly. It doesn't hurt to always have it though.
-$$($(2)_DIR)/.config: | $(1)-patch
+$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $(1)-patch
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
@@ -112,7 +113,7 @@ define $(2)_FIXUP_DOT_CONFIG
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
-$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
 	$$($(2)_FIXUP_DOT_CONFIG)
 
 # Before running configure, the configuration file should be present and fixed
@@ -208,8 +209,8 @@ $(1)-update-config: $(1)-check-configuration-done
 		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
 	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		echo "Unable to perform $(1)-update-config when using a defconfig rule"; exit 1)
-	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
-	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+	cp -f $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
+	touch --reference $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
 
 # Note: make sure the timestamp of the stored configuration is not newer than
 # the .config to avoid a useless rebuild. Note that, contrary to
@@ -221,7 +222,7 @@ $(1)-update-defconfig: $(1)-savedefconfig
 	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		echo "Unable to perform $(1)-update-defconfig when using a defconfig rule"; exit 1)
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
-	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+	touch --reference $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
 
 endif # package enabled
 
