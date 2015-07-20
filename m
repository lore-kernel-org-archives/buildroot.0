From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:39:28 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: do not always silence
	oldconfig
Message-ID: <20150720203936.E27967FE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58bb6ca3b197624a22b7269329729762dc9e54d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When debugging packages that use the pkg-kconfig infrastructure, it
is sometime interesting to see the exact command line that is being
executed when running oldconfig.

But currently, those command lines are prefixed with '@' which makes
them silent, always.

Instead, use $(Q) so they are silent by default, and verbose with V=1.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index f708875..3e17a70 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -65,14 +65,14 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
-	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
