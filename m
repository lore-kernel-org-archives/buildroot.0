From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:53:30 +0200
Subject: [Buildroot] [git commit] infra: introduce a kconfig-package
	infrastructure
Message-ID: <20140804075840.114A19D11C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abb8a8dae49cdf1f35861985e4a51128889dcdb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998 at free.fr: add missing 4th argument when calling to
 inner-kconfig-package (namely, 'target']
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in    |    1 +
 package/pkg-kconfig.mk |   82 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 106a04c..60816b4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -394,3 +394,4 @@ include package/pkg-perl.mk
 include package/pkg-python.mk
 include package/pkg-virtual.mk
 include package/pkg-generic.mk
+include package/pkg-kconfig.mk
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
new file mode 100644
index 0000000..5220fdf
--- /dev/null
+++ b/package/pkg-kconfig.mk
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
+kconfig-package = $(call inner-kconfig-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
