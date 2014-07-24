From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 20:57:53 +0200
Subject: [Buildroot] [PATCH 1 of 2] kconfig-package: add some comments to
	pkg-kconfig.mk
In-Reply-To: <patchbomb.1406228272@localhost>
References: <patchbomb.1406228272@localhost>
Message-ID: <a28bf078ba44af4a72a1.1406228273@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clarify what is happening in the kconfig infrastructure by adding some
comments.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-kconfig.mk |  48 ++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 47 insertions(+), 1 deletions(-)

diff -r 4dc6eccbfc41 -r a28bf078ba44 package/pkg-kconfig.mk
--- a/package/pkg-kconfig.mk	Wed Jul 23 20:19:19 2014 +0200
+++ b/package/pkg-kconfig.mk	Thu Jul 24 20:14:00 2014 +0200
@@ -1,33 +1,79 @@
+################################################################################
+# Kconfig package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for packages that use kconfig for configuration files.
+#
+# As this infrastructure only handles the kconfig configuration part, it
+# should be used in combination with one of the other package infrastructures,
+# like generic-package, autotools-package, ...
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure.
+#
+################################################################################
+
+################################################################################
+# inner-kconfig-package -- generates the make targets needed to support a
+# kconfig package
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+#
+################################################################################
 
 define inner-kconfig-package
 
+# Default values
+
 $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPT ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
+# FOO_KCONFIG_FILE is required
+
 ifndef $(2)_KCONFIG_FILE
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
+# The .config file is obtained by copying it from the specified source
+# configuration file, after the package has been patched.
+
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
 	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
 
+# In order to get a usable, consistent configuration, some fixup may be needed.
+# The exact rules are specified by the package .mk file.
+
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	$$(Q)touch $$@
 
+# Before running configure, the configuration file should be present and fixed
+
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 
-# configuration editors (menuconfig, ...)
+# Configuration editors (menuconfig, ...)
+
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.config
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
 
+# Target to copy back the configuration to the source configuration file
+
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
 endef # inner-kconfig-package
 
+################################################################################
+# kconfig-package -- the target generator macro for kconfig packages
+################################################################################
+
 kconfig-package = $(call inner-kconfig-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)))
