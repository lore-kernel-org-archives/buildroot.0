From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Dec 2015 22:48:30 +0100
Subject: [Buildroot] [PATCH 1/5 v3] core/pkg-kconfig: handle generated
	defconfigs
In-Reply-To: <cover.1449697131.git.yann.morin.1998@free.fr>
References: <cover.1449697131.git.yann.morin.1998@free.fr>
Message-ID: <6c8ba0798388d90cac4fbf0a923893b33f36d947.1449697131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam bobroff <sam.bobroff@au1.ibm.com>

As of Linux kernel commit ea4d1a8 "powerpc/configs: Replace
pseries_le_defconfig with a Makefile target using merge_config" some
kconfig defconfigs (one so far: "pseries_le_defconfig") can be
generated using "make <defconfig>" and they do not exist on disk as a
single defconfig file.

This causes buildroot's build to fail for those configs with:
'arch/powerpc/configs/pseries_le_defconfig' for 'linux' does not exist

To handle this case and keep the makefile steps as simple as possible,
introduce a new package variable, *_KCONFIG_DEFCONFIG, that can be
used to indicate that a defconfig rule is being used, rather than a
file.

This allows the rule that generates the .config file to use either the
provided file (by copying) or a generated defconfig (by running "make
<defconfig>") as its starting point. merge_config.sh can then be run the
same way in either case, using .config as both input and output.

Note that merge_config.sh is now modifying .config in-place but this
is safe because it uses a temporary copy while making changes.

This patch introduces the new variable but does not make use of it.
Use of the new variable will be introduced in separate patches.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
[yann.morin.1998 at free.fr:
  - include all the other kconfig-package hunks into this one patch
  - do not transform the 'echo "..."; exit 1' into $(error ...) calls
  - use a make $(if)-block instead of a shell if-block to copy the file
    or run make (like is done to check the kconfig snippets)
  - misc typoes and rephrasing in the commit log
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 44c74a7..6addbb7 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -63,8 +63,12 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 # full .config first. We use 'make oldconfig' because this can be safely
 # done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+	$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+		$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+			$$($(2)_KCONFIG_OPTS) $$($(2)_KCONFIG_DEFCONFIG)_defconfig, \
+		cp $$($(2)_KCONFIG_FILE) $$(@))
 	support/kconfig/merge_config.sh -m -O $$(@D) \
-		$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
 
@@ -89,10 +93,14 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # already called above, so we can effectively use this variable.
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
-# FOO_KCONFIG_FILE is required
 ifeq ($$(BR_BUILDING),y)
-ifeq ($$($(2)_KCONFIG_FILE),)
-$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
+# Either FOO_KCONFIG_FILE or FOO_KCONFIG_DEFCONFIG is required...
+ifeq ($$(or $$($(2)_KCONFIG_FILE),$$($(2)_KCONFIG_DEFCONFIG)),)
+$$(error Internal error: no value specified for $(2)_KCONFIG_FILE or $(2)_KCONFIG_DEFCONFIG)
+endif
+# ... but not both:
+ifneq ($$(and $$($(2)_KCONFIG_FILE),$$($(2)_KCONFIG_DEFCONFIG)),)
+$$(error Internal error: $(2)_KCONFIG_FILE and $(2)_KCONFIG_DEFCONFIG are mutually exclusive but both are defined)
 endif
 endif
 
@@ -160,6 +168,8 @@ $(1)-savedefconfig: $(1)-check-configuration-done
 $(1)-update-config: $(1)-check-configuration-done
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
 		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
+	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+		echo "Unable to perform $(1)-update-config when using a defconfig rule"; exit 1)
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
@@ -170,6 +180,8 @@ $(1)-update-config: $(1)-check-configuration-done
 $(1)-update-defconfig: $(1)-savedefconfig
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
 		echo "Unable to perform $(1)-update-defconfig when fragment files are set"; exit 1)
+	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+		echo "Unable to perform $(1)-update-defconfig when using a defconfig rule"; exit 1)
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
-- 
1.9.1
