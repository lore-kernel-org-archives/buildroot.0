From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 17:18:25 +0200
Subject: [Buildroot] [git commit] package/pkg-kconfig.mk: new
 <pkg>-diff-config target
Message-ID: <20190802151545.9060F8370B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59f561714853d4b7ea162edfb91c81f713810a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces the new target to compare the current
configuration with the one derived from the defconfig + fragments (if
any). It helps identifying settings not yet inserted to the defconfig
or any fragment.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-kconfig.mk | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index e9dece99f2..86d7c14fdb 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -52,6 +52,18 @@ define kconfig-package-regen-dot-config
 			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
 endef
 
+# Macro to create a .config file where all given fragments are merged into.
+# $(1): the name of the package in upper-case letters
+# $(2): name of the .config file
+# $(3): fragment files to merge
+define kconfig-package-merge-config
+	$(Q)$(if $($(1)_KCONFIG_DEFCONFIG),\
+		$($(1)_KCONFIG_MAKE) $($(1)_KCONFIG_DEFCONFIG),\
+		$(INSTALL) -m 0644 -D $($(1)_KCONFIG_FILE) $(2))
+	$(Q)support/kconfig/merge_config.sh -m -O $(dir $(2)) $(2) $(3)
+	$(call kconfig-package-regen-dot-config,$(1))
+endef
+
 ################################################################################
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
@@ -131,12 +143,8 @@ $(2)_KCONFIG_RULES = \
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
 $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
-		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
-		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@D)/$$($(2)_KCONFIG_DOTCONFIG))
-	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
-		$$(@D)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(call kconfig-package-regen-dot-config,$(2))
+	$$(call kconfig-package-merge-config,$(2),$$(@D)/$$($(2)_KCONFIG_DOTCONFIG),\
+		$$($(2)_KCONFIG_FRAGMENT_FILES))
 	$$(Q)touch $$(@D)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
@@ -261,11 +269,26 @@ $(1)-update-defconfig: PKG=$(2)
 $(1)-update-defconfig: $(1)-savedefconfig
 	$$(call kconfig-package-update-config,defconfig)
 
+# Target to output differences between the configuration obtained via the
+# defconfig + fragments (if any) and the current configuration.
+# Note: it preserves the timestamp of the current configuration when moving it
+# around.
+$(1)-diff-config: $(1)-check-configuration-done
+	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.dc.bak
+	$$(call kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\
+		$$($(2)_KCONFIG_FRAGMENT_FILES))
+	$$(Q)utils/diffconfig $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) \
+		 $$($(2)_DIR)/.config.dc.bak
+	$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
+	$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
+
+
 endif # package enabled
 
 .PHONY: \
 	$(1)-update-config \
 	$(1)-update-defconfig \
+	$(1)-diff-config \
 	$(1)-savedefconfig \
 	$(1)-check-configuration-done \
 	$$($(2)_DIR)/.kconfig_editor_% \
