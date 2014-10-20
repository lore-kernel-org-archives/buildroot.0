From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 22:23:36 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: fix saving the config file
Message-ID: <1413836616-4209-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When saving (aka updating) the configuration file of a kconfig package,
a subsequent call to "make" would rebuild the package, even though the
configuration did not actually change.

It took quite a while to understand why. But the reason is so simple and
obvious, when you think about it:

  - $(@D)/.config depends on the config file $(BUSYBOX_CONFIG_FILE)
  - busybox-update-config then copies $(@D)/.config back to the config
    file $(BUSYBOX_CONFIG_FILE)
  - so the config file is newer than $(@D)/.config

So, in the next run, pkg-kconfig believes that it has to rebuild
busybox. Bummer... :-/

So, the fix is very trivial, and just requires asking "cp" to preserve
timestamps, so the dependency does not kick in at the next run.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 071153a..ec58d69 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -66,7 +66,7 @@ $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_
 
 # Target to copy back the configuration to the source configuration file
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
-	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+	cp --preserve=timestamps -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
 endef # inner-kconfig-package
 
-- 
1.9.1
