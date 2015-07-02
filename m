From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu,  2 Jul 2015 14:19:15 +1000
Subject: [Buildroot] [PATCH 1/1] Handle generated kernel defconfigs
Message-ID: <0d303452453182553eeb0cdb2c9f580a8ef32f6c.1435810722.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of commit ea4d1a8 "powerpc/configs: Replace pseries_le_defconfig
with a Makefile target using merge_config" some kernel defconfigs (one
so far: "pseries_le_defconfig") can be generated using "make <defconfig>"
and they do not exist on disk as a single kconfig file.

This causes buildroot's build to fail for those configs with:
'/home/samb/projects/buildroot/scratch/output-guest-le/build/linux-custom/arch/powerpc/configs/pseries_le_defconfig' for 'linux' does not exist

To handle this case and keep the makefile steps as simple as possible,
have the linux.mk fragment set the defconfig name into a new variable
(LINUX_KCONFIG_DEFCONFIG) and leave the kconfig file
name (LINUX_KCONFIG_FILE) empty. Leaving the file name empty prevents
the file existance rule (in pkg-kconfig.mk) from failing on the
missing file, without having to add special cases.

Then have the rule that generates the .config file use this new value
so that it's first step is to either copy the input kconfig file to
.config or run "make <defconfig>" (which writes to .config). Then
merge_config.sh can be run the same way in either case, using .config
as both input and output.

Note that merge_config.sh is now modifying .config in-place but this
is safe because it uses a temporary copy while making changes.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
This patch is somewhat of an RFC, as there are several different
approaches that could be taken to resolve the issue. I ended up with
this one as the least invasive, but I'm happy to persue other options.

 linux/linux.mk         |  3 ++-
 package/pkg-kconfig.mk | 20 ++++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index eca1450..f988d5a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -176,12 +176,13 @@ endef
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+KERNEL_SOURCE_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
 LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG)
+LINUX_KCONFIG_DEFCONFIG = $(KERNEL_SOURCE_DEFCONFIG)
 LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
 LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index c86c340..7685509 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -35,6 +35,8 @@ $(call inner-generic-package,$(1),$(2),$(3),$(4))
 $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
+$(2)_KCONFIG_KCONFIG_FILE ?=
+$(2)_KCONFIG_KCONFIG_DEFCONFIG ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 
 # The config file as well as the fragments could be in-tree, so before
@@ -63,8 +65,14 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 # full .config first. We use 'make oldconfig' because this can be safely
 # done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+	if [ ! -z "$$($(2)_KCONFIG_DEFCONFIG)" ] ; then \
+		$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+			$$($(2)_KCONFIG_OPTS) $$($(2)_KCONFIG_DEFCONFIG) ; \
+	else \
+		cp $$($(2)_KCONFIG_FILE) $$(@) ; \
+	fi
 	support/kconfig/merge_config.sh -m -O $$(@D) \
-		$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
 
@@ -89,9 +97,9 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # already called above, so we can effectively use this variable.
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
-# FOO_KCONFIG_FILE is required
-ifeq ($$($(2)_KCONFIG_FILE),)
-$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
+# Either FOO_KCONFIG_FILE or FOO_KCONFIG_DEFCONFIG is required
+ifeq ($$($(2)_KCONFIG_FILE)$$($(2)_KCONFIG_DEFCONFIG),)
+$$(error Internal error: no value specified for $(2)_KCONFIG_FILE or $(2)_KCONFIG_DEFCONFIG)
 endif
 
 # Configuration editors (menuconfig, ...)
@@ -147,6 +155,8 @@ $(1)-savedefconfig: $(1)-check-configuration-done
 $(1)-update-config: $(1)-check-configuration-done
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
 		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
+	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+		echo "Unable to perform $(1)-update-config when using an in-tree defconfig"; exit 1)
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
@@ -157,6 +167,8 @@ $(1)-update-config: $(1)-check-configuration-done
 $(1)-update-defconfig: $(1)-savedefconfig
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
 		echo "Unable to perform $(1)-update-defconfig when fragment files are set"; exit 1)
+	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+		echo "Unable to perform $(1)-update-defconfig when using an in-tree defconfig"; exit 1)
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
-- 
2.1.4
