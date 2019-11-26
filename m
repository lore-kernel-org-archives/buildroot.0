From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 26 Nov 2019 13:24:23 +0100
Subject: [Buildroot] [PATCH v2] package/pkg-kconfig: fix reconfigure for
 kconfig packages
Message-ID: <1574771063-29218-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Commit 4b81badbcc0b25678ac6627548160702731cf393

    Currently, calling foo-reconfigure for a kconfig-based package will not
    re-trigger the configuration (kconfig-wise) step for the package.

already solved this problem, but it was lately regressed by

Commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f

    infra/pkg-kconfig: do not rely on package's .config as a timestamp

that introduced the .stamp_dotconfig file.

For this reason, to trigger a kconfig package reconfigure is now
necessary to remove the .stamp_dotconfig file.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 86d7c14..f1931b8 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -175,7 +175,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 $(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
 
 $(1)-clean-kconfig-for-reconfigure:
-	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	rm -f $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # Only enable the foo-*config targets when the package is actually enabled.
 # Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig
-- 
2.7.4
