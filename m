From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 23:01:39 +0200
Subject: [Buildroot] [git commit] package/stress-ng: fix install commande
Message-ID: <20160907210229.5E81C81F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5609fe65aa7a3b85f1226f57439abd07a2869fae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't use make install otherwise stress-ng will be rebuild without
required link libraries if any. Furthermore, using INSTALL allow to
set the file permission correcly on the target.

Fixes:
http://autobuild.buildroot.net/results/bba/bba4d0b635ab6849f969b8a0363ebe9f5fafd82e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 6015a1e..e12895a 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -15,8 +15,11 @@ define STRESS_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
+# Don't use make install otherwise stress-ng will be rebuild without
+# required link libraries if any. Furthermore, using INSTALL allow to
+# set the file permission correcly on the target.
 define STRESS_NG_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(INSTALL) -m 0755 -D $(@D)/stress-ng $(TARGET_DIR)/usr/bin/stress-ng
 endef
 
 $(eval $(generic-package))
