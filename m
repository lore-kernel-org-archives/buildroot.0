From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 28 Apr 2015 16:34:31 +0200
Subject: [Buildroot] [PATCH v2 1/5] kconfig-package: add support for config
	fragments
Message-ID: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds functionality to the kconfig infrastructure to merge additional
configuration fragment files to the main configuration file of
kconfig packages, using support/kconfig/merge_config.sh

Typical use-case is when you want your configuration to be
kept in sync with an upstream (def)config file, but do require
some minor local modifications.

Disables -update-config and -update-defconfig targets when
fragment files are set.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

---
v2:

- use shell commands to print error message when
update-(def)config target is used while fragment files are set.

- document changes to kconfig infrastructure.
---
 docs/manual/adding-packages-kconfig.txt | 11 +++++++++++
 package/pkg-kconfig.mk                  | 14 ++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index e87d393..dc9ea11 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -36,6 +36,12 @@ This snippet creates the following make targets:
 
 * +foo-update-config+, which copies the configuration back to the source
   configuration file.
+  It is not possible to use this target when fragment files are set.
+
+* +foo-update-defconfig+, which copies the configuration back to the source
+  configuration file. The configuration file will only list the
+  options that differ from the default values.
+  It is not possible to use this target when fragment files are set.
 
 and ensures that the source configuration file is copied to the build
 directory at the right moment.
@@ -46,6 +52,11 @@ be set to suit the needs of the package under consideration:
 * +FOO_KCONFIG_EDITORS+: a space-separated list of kconfig editors to
   support, for example 'menuconfig xconfig'. By default, 'menuconfig'.
 
+* +FOO_KCONFIG_FRAGMENT_FILES+: a space-separated list of configuration
+  fragment files that are merged to the main configuration file.
+  Fragment files are typically used when there is a desire to stay in sync
+  with an upstream (def)config file, with some minor modifications.
+
 * +FOO_KCONFIG_OPTS+: extra options to pass when calling the kconfig
   editors. This may need to include '$(FOO_MAKE_OPTS)', for example. By
   default, empty.
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8361064..21fbfdb 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -35,18 +35,20 @@ $(call inner-generic-package,$(1),$(2),$(3),$(4))
 $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
+$(2)_KCONFIG_FRAGMENT_FILES ?=
 
 # The config file could be in-tree, so before depending on it the package should
 # be extracted (and patched) first
 $$($(2)_KCONFIG_FILE): | $(1)-patch
 
-# The .config file is obtained by copying it from the specified source
-# configuration file, after the package has been patched.
+# The specified source configuration file and any additional configuration file
+# fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first. We use 'make oldconfig' because this can be safely
 # done even when the package does not support defconfigs.
-$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE)
-	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
+$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+	support/kconfig/merge_config.sh -m -O $$(@D) \
+		$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
 
@@ -87,6 +89,8 @@ $(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # Even though we could use 'cp --preserve-timestamps' here, the separate
 # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
+		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
@@ -95,6 +99,8 @@ $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # $(1)-update-config, the reference for 'touch' is _not_ the file from which
 # we copy.
 $(1)-update-defconfig: $(1)-savedefconfig
+	$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
+		echo "Unable to perform $(1)-update-defconfig when fragment files are set"; exit 1)
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
-- 
2.1.4
