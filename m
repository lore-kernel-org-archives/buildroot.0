From: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 29 Mar 2016 12:11:41 +0200
Subject: [Buildroot] [PATCH v2 1/2] core/pkg-kconfig: fix .config rule for
	silent mode
In-Reply-To: <1459246302-21837-1-git-send-email-romain.izard.pro@gmail.com>
References: <1459246302-21837-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <1459246302-21837-2-git-send-email-romain.izard.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ensure that each command line in the .config rule is prefixed by $$(Q)

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
Changelog:
v2: New patch

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
-- 
2.5.0
