From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 12:59:21 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: fix configurators
Message-ID: <20150825105952.8555081E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a91c82f8a8e2de1ab95794429dfa90b78d51670
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the configurators are using $($(2)_MAKE_ENV), often derived
from $(TARGE_MAKE_ENV), as the environment to be set when calling the
various configurators.

This means that our host tools are used first, most notably pkg-config
(from host-pkgconf).

However, this is inherently flawed. Our pkg-config, when set for the
host, only searches .pc files in $(HOST_DIR) and never ever uses the
ones from the host. For example, since we do not build a host-qt, our
pkg-config would not find the host's QtCore.pc et al.

Consequently, on some systems (but not on others?) most of the
configurators fail to build, especially the latest kernel versions, as
they have been starting to use pkg-config two years ago.

Fix that by filtering-out sensible values out of the environment, but
only when calling the configurators.

[Thomas: rewrap comment to appropriate length.]

Reported-by: Mauro Condarelli <mc5686@mclink.it>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mauro Condarelli <mc5686@mclink.it>
Tested-by: Mauro Condarelli <mc5686@mclink.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 375607f..44c74a7 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -96,6 +96,16 @@ $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 endif
 
+# For the configurators, we do want to use the system-provided host
+# tools, not the ones we build. This is particularly true for
+# pkg-config; if we use our pkg-config (from host-pkgconf), then it
+# would not look for the .pc from the host, but we do need them,
+# especially to find ncurses, GTK+, Qt (resp. for menuconfig and
+# nconfig, gconfig, xconfig).
+# So we simply remove our PATH and PKG_CONFIG_* variables.
+$(2)_CONFIGURATOR_MAKE_ENV = \
+	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV))
+
 # Configuration editors (menuconfig, ...)
 #
 # We need to apply the configuration fixups right after a configuration
@@ -112,7 +122,7 @@ endif
 #
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
 $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
-	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+	$$($(2)_CONFIGURATOR_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) $$(*)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
