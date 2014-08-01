From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 01 Aug 2014 21:53:44 +0200
Subject: [Buildroot] [PATCH 2 of 5 v3] infra: introduce a kconfig-package
	infrastructure
In-Reply-To: <patchbomb.1406922822@localhost>
References: <patchbomb.1406922822@localhost>
Message-ID: <e56a7788b2d0501d2503.1406922824@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are several packages that have a configuration file managed by
kconfig: uclibc, busybox, linux and barebox. All these packages need some
make targets to handle the kconfig specificities: creating a configuration
(menuconfig, ...) and saving it back (update-config, ...)

These targets should be the same for each of these packages, but
unfortunately they are not. Especially with respect to saving back the
configuration to the original config file, there are many differences.

A previous set of patches fixed these targets for the uclibc package.
This patch extracts these targets into a common kconfig-package
infrastructure, with the goals of:
- aligning the behavior of all kconfig-based packages
- removing code duplication

In order to use this infrastructure, a package should at a minimum specify
FOO_KCONFIG_FILE and eval the kconfig-package macro. The supported
configuration editors can be set with FOO_KCONFIG_EDITORS and defaults to
menuconfig only.
Additionally, a package can specify FOO_KCONFIG_OPT for extra options to
pass to the invocation of the kconfig editors, and FOO_KCONFIG_FIXUP_CMDS
for a list of shell commands used to fixup the .config file after a
configuration has been created/edited.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3:
- let menuconfig depend on the fixup rule, rather than on .config only
  (Yann)
v2:
- fold comments into this patch
- inherit from generic-package instead of sitting alongside of it (ThomasP)

Notes:

- the issue with MAKE_OPT vs MAKE_OPTS has been worked around currently
by not relying on any MAKE_OPT(S) but instead requiring the package to add
the necessary variable to FOO_KCONFIG_OPT.
However, I still believe we should create a consistent set here, either
MAKE_OPT or MAKE_OPTS, and the same for CONFIGURE_OPT(S), but this is now no
longer related to the introduction of kconfig-package.

- the targets in this patch are sufficient to handle uclibc and busybox.
For linux and barebox, some changes will be needed, but for clarity this
will be added later.


 package/Makefile.in    |   1 +
 package/pkg-kconfig.mk |  80 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 0 deletions(-)

diff -r 8fc7b26a4914 -r e56a7788b2d0 package/Makefile.in
--- a/package/Makefile.in	Fri Aug 01 21:22:29 2014 +0200
+++ b/package/Makefile.in	Mon Jun 30 21:08:13 2014 +0200
@@ -390,3 +390,4 @@
 include package/pkg-python.mk
 include package/pkg-virtual.mk
 include package/pkg-generic.mk
+include package/pkg-kconfig.mk
diff -r 8fc7b26a4914 -r e56a7788b2d0 package/pkg-kconfig.mk
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/package/pkg-kconfig.mk	Mon Jun 30 21:08:13 2014 +0200
@@ -0,0 +1,82 @@
+################################################################################
+# Kconfig package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for packages that use kconfig for configuration files.
+# It is based on the generic-package infrastructure, and inherits all of its
+# features.
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
+################################################################################
+
+define inner-kconfig-package
+
+# Call the generic package infrastructure to generate the necessary
+# make targets.
+# Note: this must be done _before_ attempting to use $$($(2)_DIR) in a
+# dependency expression
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+# Default values
+
+$(2)_KCONFIG_EDITORS ?= menuconfig
+$(2)_KCONFIG_OPT ?=
+$(2)_KCONFIG_FIXUP_CMDS ?=
+
+# FOO_KCONFIG_FILE is required
+
+ifndef $(2)_KCONFIG_FILE
+$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
+endif
+
+# The .config file is obtained by copying it from the specified source
+# configuration file, after the package has been patched.
+
+$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
+	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
+
+# In order to get a usable, consistent configuration, some fixup may be needed.
+# The exact rules are specified by the package .mk file.
+
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+	$$($(2)_KCONFIG_FIXUP_CMDS)
+	$$(Q)touch $$@
+
+# Before running configure, the configuration file should be present and fixed
+
+$$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
+
+# Configuration editors (menuconfig, ...)
+
+$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
+	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
+	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
+
+# Target to copy back the configuration to the source configuration file
+
+$(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+
+endef # inner-kconfig-package
+
+################################################################################
+# kconfig-package -- the target generator macro for kconfig packages
+################################################################################
+
+kconfig-package = $(call inner-kconfig-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)))
