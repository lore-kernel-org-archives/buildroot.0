From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 18:46:36 +0200
Subject: [Buildroot] [PATCH 4/5 v2] core/pkg-kconfig: run the kconfig fixups
	after exiting configurators
In-Reply-To: <cover.1434213146.git.yann.morin.1998@free.fr>
References: <cover.1434213146.git.yann.morin.1998@free.fr>
Message-ID: <17f1d27d04cf9a6585decb819bec783067f1253f.1434213146.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After we exit the configurators, we need to re-run the kconfig fixups to
ensure the user is not able to override them in the configurators.

Currently, we schedule that "for later", by removing the corresponding
stamp file, so make will run the fixups "later".

This means the user has access to the un-fixed .config file, which he
might decide to copy and use as a reference (not too bad, since we'd run
the fixups anyway; but not clean either).

Note that we still remove the stamp file before running the fixups, in
case any one of those fixups breaks, so we don't want to believe the
fixups have been applied; the fixup macro will touch that file anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - the macro now uses the uppercase package name
---
 package/pkg-kconfig.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index d27b819..126c5a0 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -95,11 +95,24 @@ $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
 # Configuration editors (menuconfig, ...)
+#
+# Apply the kconfig fixups right after exiting the configurators, so
+# that the user always sees a .config file that is clean wrt. our
+# requirements.
+#
+# Because commands in $(1)_FIXUP_KCONFIG are probably using $(@D), we
+# fake it for the configurators (otherwise it is set to just '.', i.e.
+# the current directory where make is run, which happens to be in
+# $(TOPDIR), because the target of the rule is not an actual file, so
+# does not have any path component).
+#
+$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
+	$$(call $(2)_FIXUP_DOT_CONFIG)
 
 $(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-- 
1.9.1
