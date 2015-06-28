From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:29:15 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: move the kconfig fixups
	to a macro
Message-ID: <20150628122933.1F3E97FCD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e0903645e960b2a2106126368ee796b6b830eb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The same fixups will have to be done after leaving the configurators,
so we want to commonalise that code.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

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
