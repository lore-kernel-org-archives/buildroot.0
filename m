From: Romain Izard <romain.izard.pro@gmail.com>
Date: Thu, 31 Mar 2016 10:57:51 +0200
Subject: [Buildroot] [PATCH v3 1/3] core/pkg-kconfig: Factorize make commands
In-Reply-To: <1459414674-30753-1-git-send-email-romain.izard.pro@gmail.com>
References: <1459414674-30753-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <1459414674-30753-2-git-send-email-romain.izard.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a variable to factorize the calls to make, as we use the same set
of options each many times.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
Changelog:
v3: new

 package/pkg-kconfig.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 94ec3cc..cb177bb 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -57,6 +57,9 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 		fi; \
 	done
 
+$(2)_KCONFIG_MAKE = \
+	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS)
+
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
@@ -64,13 +67,11 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 # done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
-		$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-			$$($(2)_KCONFIG_OPTS) $$($(2)_KCONFIG_DEFCONFIG), \
+		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
 		cp $$($(2)_KCONFIG_FILE) $$(@))
 	$$(Q)support/kconfig/merge_config.sh -m -O $$(@D) \
 		$$(@) $$($(2)_KCONFIG_FRAGMENT_FILES)
-	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPTS) oldconfig
+	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
 
 # If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
 # already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
@@ -81,8 +82,7 @@ $$($(2)_DIR)/.config: | $(1)-patch
 # The exact rules are specified by the package .mk file.
 define $(2)_FIXUP_DOT_CONFIG
 	$$($(2)_KCONFIG_FIXUP_CMDS)
-	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPTS) oldconfig
+	$$(Q)yes "" | $$($(2)_KCONFIG_MAKE) oldconfig
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
-- 
2.5.0
