From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:28 +0200
Subject: [Buildroot] [PATCH 1 of 7] infra: introduce a kconfig-package
	infrastructure
In-Reply-To: <patchbomb.1406224167@localhost>
References: <patchbomb.1406224167@localhost>
Message-ID: <c9dcec875ddbc3fa2ef6.1406224168@localhost>
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

- documentation and comments for this package should be added still, but I
  would like to await your feedback first.

 package/Makefile.in    |   1 +
 package/pkg-kconfig.mk |  33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)

diff -r 5916a58248be -r c9dcec875ddb package/Makefile.in
--- a/package/Makefile.in	Mon Jun 16 20:18:23 2014 +0200
+++ b/package/Makefile.in	Mon Jun 30 21:08:13 2014 +0200
@@ -388,3 +388,4 @@
 include package/pkg-python.mk
 include package/pkg-virtual.mk
 include package/pkg-generic.mk
+include package/pkg-kconfig.mk
diff -r 5916a58248be -r c9dcec875ddb package/pkg-kconfig.mk
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/package/pkg-kconfig.mk	Mon Jun 30 21:08:13 2014 +0200
@@ -0,0 +1,33 @@
+
+define inner-kconfig-package
+
+$(2)_KCONFIG_EDITORS ?= menuconfig
+$(2)_KCONFIG_OPT ?=
+$(2)_KCONFIG_FIXUP_CMDS ?=
+
+ifndef $(2)_KCONFIG_FILE
+$$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
+endif
+
+$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
+	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
+
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+	$$($(2)_KCONFIG_FIXUP_CMDS)
+	$$(Q)touch $$@
+
+$$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
+
+# configuration editors (menuconfig, ...)
+$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.config
+	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
+	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
+	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
+
+$(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+
+endef # inner-kconfig-package
+
+kconfig-package = $(call inner-kconfig-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)))
