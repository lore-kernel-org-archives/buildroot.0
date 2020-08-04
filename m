From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue,  4 Aug 2020 14:00:04 -0500
Subject: [Buildroot] [PATCH 1/2] package/pkg-kconfig: Support custom $(MAKE)
Message-ID: <20200804190005.114872-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The U-Boot package requires GNU Make v4.0 or later, and so all U-Boot
"make" commands must use "$(BR2_MAKE)" so they use the host-make
package. Currently pkg-kconfig is hardcoded to uses $(MAKE), so add a
way to support $(BR2_MAKE). The package infra for pkg-automake and
pkg-cmake have a similar problem, and they solved it by defining a
$(PKG)_MAKE variable, and allowing each package to override it.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 package/pkg-kconfig.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 9d65b21ec5..45faf50e71 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -33,7 +33,7 @@ PKG_KCONFIG_COMMON_OPTS = \
 # Macro to save the defconfig file
 # $(1): the name of the package in upper-case letters
 define kconfig-package-savedefconfig
-	$($(1)_MAKE_ENV) $(MAKE) -C $($(1)_DIR) \
+	$($(1)_MAKE_ENV) $($(1)_MAKE) -C $($(1)_DIR) \
 		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) savedefconfig
 endef
 
@@ -89,6 +89,7 @@ $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 # Default values
+$(2)_MAKE ?= $$(MAKE)
 $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
@@ -122,7 +123,7 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 	done
 
 $(2)_KCONFIG_MAKE = \
-	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
 # $(2)_KCONFIG_MAKE may already rely on shell expansion. As the $() syntax
@@ -226,7 +227,7 @@ $(2)_CONFIGURATOR_MAKE_ENV = \
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
 $$($(2)_DIR)/.kconfig_editor_%: PKG=$(2)
 $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
-	$$($(2)_CONFIGURATOR_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+	$$($(2)_CONFIGURATOR_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS) $$(*)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
-- 
2.28.0
