From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jun 2015 13:54:24 +0200
Subject: [Buildroot] [PATCH 2/4] core/pkg-kconfig: move the kconfig fixups
	to a macro
In-Reply-To: <cover.1433591404.git.yann.morin.1998@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
Message-ID: <cdb72fa7204d35b88f2b74e79d4d1117b797712d.1433591404.git.yann.morin.1998@free.fr>
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
 package/pkg-kconfig.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 1d69722..d6986c3 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -64,11 +64,15 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
-$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+define $(1)_FIXUP_KCONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
-	$$(Q)touch $$@
+	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
+endef
+
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
+	$$(call $(1)_FIXUP_KCONFIG)
 
 # Before running configure, the configuration file should be present and fixed
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
-- 
1.9.1
