From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed,  2 Sep 2015 13:54:35 +1000
Subject: [Buildroot] [PATCH v2 1/4] Handle kconfig generated defconfigs
In-Reply-To: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
References: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
Message-ID: <7e0cdb0562f5255b6abbb74d592a0222ff4424ae.1441166076.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of Linux kernel commit ea4d1a8 "powerpc/configs: Replace
pseries_le_defconfig with a Makefile target using merge_config" some
kconfig defconfigs (one so far: "pseries_le_defconfig") can be
generated using "make <defconfig>" and they do not exist on disk as a
single kconfig file.

This causes buildroot's build to fail for those configs with:
'arch/powerpc/configs/pseries_le_defconfig' for 'linux' does not exist

To handle this case and keep the makefile steps as simple as possible,
introduce a new package variable, *_KCONFIG_DEFCONFIG, that can be
used to indicate that a defconfig is being used, rather than a file.

This allows the rule that generates the .config file to use either the
provided file (by copying) or a generated defconfig (by running "make
<defconfig>") as it's starting point.  merge_config.sh can then
be run the same way in either case, using .config as both input and
output.

Note that merge_config.sh is now modifying .config in-place but this
is safe because it uses a temporary copy while making changes.

This patch introduces the new variable but does not make use of it.
Use of the new variable will be introduced in separate patches.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 package/pkg-kconfig.mk | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 44c74a7..47bb550 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -63,8 +63,14 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 # full .config first. We use 'make oldconfig' because this can be safely
 # done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+	if [ ! -z "$$($(2)_KCONFIG_DEFCONFIG)" ] ; then \
+		$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+			$$($(2)_KCONFIG_OPTS) $$($(2)_KCONFIG_DEFCONFIG)_defconfig ; \
+	else \
+		cp $$($(2)_KCONFIG_FILE) $$(@) ; \
+	fi
 	support/kconfig/merge_config.sh -m -O $$(@D) \
-		$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
 
@@ -89,10 +95,10 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # already called above, so we can effectively use this variable.
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
-# FOO_KCONFIG_FILE is required
 ifeq ($$(BR_BUILDING),y)
-ifeq ($$($(2)_KCONFIG_FILE),)
-$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
+# Either FOO_KCONFIG_FILE or FOO_KCONFIG_DEFCONFIG is required
+ifeq ($$($(2)_KCONFIG_FILE)$$($(2)_KCONFIG_DEFCONFIG),)
+$$(error Internal error: no value specified for $(2)_KCONFIG_FILE or $(2)_KCONFIG_DEFCONFIG)
 endif
 endif
 
@@ -159,7 +165,9 @@ $(1)-savedefconfig: $(1)-check-configuration-done
 # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
 $(1)-update-config: $(1)-check-configuration-done
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
-		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
+		$$(error Unable to perform $(1)-update-config when fragment files are set))
+	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+		$$(error Unable to perform $(1)-update-config when using an in-tree defconfig))
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
@@ -169,7 +177,9 @@ $(1)-update-config: $(1)-check-configuration-done
 # we copy.
 $(1)-update-defconfig: $(1)-savedefconfig
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
-		echo "Unable to perform $(1)-update-defconfig when fragment files are set"; exit 1)
+		$$(error Unable to perform $(1)-update-defconfig when fragment files are set))
+	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+		$$(error Unable to perform $(1)-update-defconfig when using an in-tree defconfig"))
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
-- 
2.1.4
