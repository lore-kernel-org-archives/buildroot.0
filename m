From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:42 +0100
Subject: [Buildroot] [PATCH 02/10] kconfig infra: add support for defconfig
	files
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <7ccc6d89131659797c40c30d84a58b49009388d4.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This commit adds support for using a defconfig file instead of a full
.config. This is a precondition to migrate packages like linux and
barebox to the kconfig infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ef724e5..db56b7a 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -47,8 +47,13 @@ $$($(2)_KCONFIG_FILE): | $(1)-patch
 
 # The .config file is obtained by copying it from the specified source
 # configuration file, after the package has been patched.
+# Since the file could be a defconfig file it needs to be expanded to a
+# full .config first. We use 'make oldconfig' because this can be safely
+# done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE)
 	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
+	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$($(2)_KCONFIG_OPTS) oldconfig
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
@@ -68,10 +73,22 @@ $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
 
+$(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$($(2)_KCONFIG_OPTS) savedefconfig
+
 # Target to copy back the configuration to the source configuration file
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	cp --preserve=timestamps -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
+# Note: make sure the timestamp of the stored configuration is not newer than
+# the .config to avoid a useless rebuild. Note that, contrary to
+# $(1)-update-config, the reference for 'touch' is _not_ the file from which
+# we copy.
+$(1)-update-defconfig: $(1)-savedefconfig
+	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
+	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+
 endef # inner-kconfig-package
 
 ################################################################################
-- 
1.9.1
