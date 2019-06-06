From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:33:28 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] infra/pkg-kconfig: do not
 rely on package's .config as a timestamp
Message-ID: <20190606154048.286B18271C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60817d04030e7ac748b0f1a88067165c57d1bf24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Since linux-4.19, the kernel's build system internally touches its
.config file.

However, we currently used that file as a timestamp to detect whether
our kconfig fixups were to be (re)applied or not, which in turn is used
to decide whether we should (re)build the package or not.

But with latest kernel versions, this timestamp heuristic is now broken,
and we always rebuild the kernel on subsequent builds.

We fix that by introducing a separate timestamp file of our own, which
we know the kernel (or the kconfig-based packages, for that matters)
does not use.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kconfig.mk | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 60aae387ca..d62be0fd03 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -24,7 +24,7 @@ define kconfig-package-update-config
 	fi
 	$(Q)mkdir -p $(dir $($(PKG)_KCONFIG_FILE))
 	cp -f $($(PKG)_DIR)/$(1) $($(PKG)_KCONFIG_FILE)
-	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
+	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_STAMP_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
 endef
 
 PKG_KCONFIG_COMMON_OPTS = \
@@ -61,6 +61,12 @@ $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 $(2)_KCONFIG_DOTCONFIG ?= .config
 
+# Do not use $(2)_KCONFIG_DOTCONFIG as stamp file, because the package
+# buildsystem (e.g. linux >= 4.19) may touch it, thus rendering our
+# timestamps out of date, thus re-trigerring the build of the package.
+# Instead, use a specific file of our own as timestamp.
+$(2)_KCONFIG_STAMP_DOTCONFIG = .stamp_dotconfig
+
 # The config file as well as the fragments could be in-tree, so before
 # depending on them the package should be extracted (and patched) first.
 #
@@ -116,23 +122,24 @@ endef
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
-$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+$$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
-		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
+		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@D)/$$($(2)_KCONFIG_DOTCONFIG))
 	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
-		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
+		$$(@D)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$($(2)_REGEN_DOT_CONFIG)
+	$$(Q)touch $$(@D)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
 # it explicitly. It doesn't hurt to always have it though.
-$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $(1)-patch
+$$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): | $(1)-patch
 
 # Some packages may need additional tools to be present by the time their
 # kconfig structure is parsed (e.g. the linux kernel may need to call to
 # the compiler to test its features).
-$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
+$$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
@@ -142,7 +149,7 @@ define $(2)_FIXUP_DOT_CONFIG
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
-$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 	$$($(2)_FIXUP_DOT_CONFIG)
 
 # Before running configure, the configuration file should be present and fixed
