From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 18:46:35 +0200
Subject: [Buildroot] [PATCH 3/5 v2] core/pkg-kconfig: move the kconfig
	fixups to a macro
In-Reply-To: <cover.1434213146.git.yann.morin.1998@free.fr>
References: <cover.1434213146.git.yann.morin.1998@free.fr>
Message-ID: <c86b27feb418b05e7d2d4970016adbf6dddd7ea6.1434213146.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The same fixups will have to be done after leaving the configurators,
so we want to commonalise that code.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - rename the macro
  - use the uppercase package name when defining the macro
---
 package/pkg-kconfig.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index e441548..d27b819 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -70,11 +70,15 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
-$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
-	$$(Q)touch $$@
+	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
+endef
+
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+	$$(call $(2)_FIXUP_DOT_CONFIG)
 
 # Before running configure, the configuration file should be present and fixed
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
-- 
1.9.1
