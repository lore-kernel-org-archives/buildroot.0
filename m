From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:34:55 +0200
Subject: [Buildroot] [git commit] infra/pkg-kconfig: commonalise
 update-(def)config code
Message-ID: <20180331203457.A9F6D81556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f542085a61ee0e1d85e32a1f6f71ccea9101ea31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Except for the nice human-friendly reminder of the command that the user
was just running, and the name of the file to copy from, those two rules
are exactly the same.

Make that a common macro that is shared, so that it's easier to add more
checks, and to simplify maintenance.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-kconfig.mk | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 0402f81ffe..4bd7161b1a 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -11,6 +11,17 @@
 #
 ################################################################################
 
+# Macro to update back the custom (def)config file
+# $(1): file to copy from
+define kconfig-package-update-config
+	@$(if $($(PKG)_KCONFIG_FRAGMENT_FILES), \
+		echo "Unable to perform $(@) when fragment files are set"; exit 1)
+	@$(if $($(PKG)_KCONFIG_DEFCONFIG), \
+		echo "Unable to perform $(@) when using a defconfig rule"; exit 1)
+	cp -f $($(PKG)_DIR)/$(1) $($(PKG)_KCONFIG_FILE)
+	touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
+endef
+
 ################################################################################
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
@@ -204,25 +215,17 @@ $(1)-savedefconfig: $(1)-check-configuration-done
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
 # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
+$(1)-update-config: PKG=$(2)
 $(1)-update-config: $(1)-check-configuration-done
-	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
-		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
-	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
-		echo "Unable to perform $(1)-update-config when using a defconfig rule"; exit 1)
-	cp -f $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
-	touch --reference $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
+	$$(call kconfig-package-update-config,$$($(2)_KCONFIG_DOTCONFIG))
 
 # Note: make sure the timestamp of the stored configuration is not newer than
 # the .config to avoid a useless rebuild. Note that, contrary to
 # $(1)-update-config, the reference for 'touch' is _not_ the file from which
 # we copy.
+$(1)-update-defconfig: PKG=$(2)
 $(1)-update-defconfig: $(1)-savedefconfig
-	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
-		echo "Unable to perform $(1)-update-defconfig when fragment files are set"; exit 1)
-	@$$(if $$($(2)_KCONFIG_DEFCONFIG), \
-		echo "Unable to perform $(1)-update-defconfig when using a defconfig rule"; exit 1)
-	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
-	touch --reference $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FILE)
+	$$(call kconfig-package-update-config,defconfig)
 
 endif # package enabled
 
