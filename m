From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:49:42 +0200
Subject: [Buildroot] [git commit] infra/pkg-kconfig: fix saving the config
	file
Message-ID: <20141022205110.1AA4EB0653@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8201c362d788b11f85a7a9c28fa16382d830d6e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
