From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:42:48 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: fix .config rule for
	silent mode
Message-ID: <20160329144648.6B24B81871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15a4210c622074efb2298e2a2f39f557ddcabe57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure that each command line in the .config rule is prefixed by $$(Q)

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 90f3f9f..94ec3cc 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -63,11 +63,11 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 # full .config first. We use 'make oldconfig' because this can be safely
 # done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(if $$($(2)_KCONFIG_DEFCONFIG), \
+	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 			$$($(2)_KCONFIG_OPTS) $$($(2)_KCONFIG_DEFCONFIG), \
 		cp $$($(2)_KCONFIG_FILE) $$(@))
-	support/kconfig/merge_config.sh -m -O $$(@D) \
+	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) oldconfig
