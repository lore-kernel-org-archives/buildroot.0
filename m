From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 11:56:10 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/pkg-kconfig: fix
 reconfigure for kconfig packages
Message-ID: <20191207110236.D4CF1884B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38932bac776abd23f3c7bcbe56b8956c1da11ddb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Commit 4b81badbcc0b25678ac6627548160702731cf393

    Currently, calling foo-reconfigure for a kconfig-based package will not
    re-trigger the configuration (kconfig-wise) step for the package.

was supposed to solve this problem and lately we had

Commit 05fea6e4a60a38a797d9bacbf318a2cd7dbd435f

    infra/pkg-kconfig: do not rely on package's .config as a timestamp

that introduced the .stamp_dotconfig file.

For this reason, to trigger a kconfig package reconfigure is now
necessary to remove the .stamp_dotconfig file.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d1f1947af12fc47933c7ea8fa90fc40d423affd2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 86d7c14fdb..f1931b87c6 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -175,7 +175,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 $(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
 
 $(1)-clean-kconfig-for-reconfigure:
-	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	rm -f $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 
 # Only enable the foo-*config targets when the package is actually enabled.
 # Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig
