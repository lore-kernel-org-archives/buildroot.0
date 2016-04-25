From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 15:29:38 +0200
Subject: [Buildroot] [git commit] Revert "core/pkg-kconfig: use olddefconfig
	when available"
Message-ID: <20160425133159.A435C818D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60c7d873814424d833a5d4a694d0386e070d67ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 638ea2d715950f1409475e01a37f25c3528df35e, since it
breaks the build of busybox in many configurations, with the following
issues:

/bin/bash: : command not found
make[1]: Entering directory `/home/test/autobuild/instance-0/output/build/busybox-1.24.2'
[...]
  GEN     miscutils/Config.in
make[2]: *** No rule to make target `olddefconfig'.  Stop.
make[1]: *** [olddefconfig] Error 2
make[1]: Leaving directory `/home/test/autobuild/instance-0/output/build/busybox-1.24.2'
make: *** [/home/test/autobuild/instance-0/output/build/busybox-1.24.2/.config] Error 1
make: Leaving directory `/home/test/autobuild/instance-0/buildroot'

See:

  http://autobuild.buildroot.org/results/48481bb3531927be35cda3df57d02f02cec709aa/

for example.

A minimal configuration with just Busybox doesn't exhibit the problem,
but adding libtirpc in the configuration is enough to trigger the
problem, so the following defconfig allows to reproduce the issue:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_LIBTIRPC=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 500f730..4033915 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -11,15 +11,6 @@
 #
 ################################################################################
 
-# Helper to extract the make rule specified in $(2) from all the make rules
-# of the package specified in $(1).
-# Returns a non-empty string (the rule itself) if the rule exists; returns
-# an empty string if the rule does not exist.
-define KCONFIG_RULES
-	$($(1)_KCONFIG_MAKE) -pn config 2>/dev/null | \
-	sed -r -e '/^$(2):/!d'
-endef
-
 ################################################################################
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
@@ -69,33 +60,18 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 $(2)_KCONFIG_MAKE = \
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS)
 
-# The correct way to regenerate a .config file is to use 'make olddefconfig'.
-# For historical reasons, the target name was 'oldnoconfig' between Linux kernel
-# versions 2.6.36 and 3.6, and remains as an alias in later versions.
-# In older versions, and in some other projects that use kconfig, the target is
-# not supported at all, and we use 'yes "" | make oldconfig' as a fallback
-# only, as this can fail in complex cases.
-define $(2)_REGEN_DOT_CONFIG
-	$$(Q)if [ "`$$(call KCONFIG_RULES,$(2),olddefconfig)`" ]; then \
-		$$($(2)_KCONFIG_MAKE) olddefconfig || exit 1; \
-	elif [ "`$$(call KCONFIG_RULES,$(2),oldnoconfig)`" ]; then \
-		$$($(2)_KCONFIG_MAKE) oldnoconfig || exit 1; \
-	else \
-		(yes "" | $$($(2)_KCONFIG_MAKE) oldconfig) || exit 1; \
-	fi
-endef
-
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
-# full .config first.
+# full .config first. We use 'make oldconfig' because this can be safely
+# done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
 		cp $$($(2)_KCONFIG_FILE) $$(@))
 	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$($(2)_REGEN_DOT_CONFIG)
+	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
@@ -106,7 +82,7 @@ $$($(2)_DIR)/.config: | $(1)-patch
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
-	$$($(2)_REGEN_DOT_CONFIG)
+	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
