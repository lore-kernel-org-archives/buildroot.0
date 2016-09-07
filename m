From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  7 Sep 2016 22:21:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/stress-ng: fix install commande
Message-ID: <1473279684-5337-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't use make install otherwise stress-ng will be rebuild without
required link libraries if any. Furthermore, using INSTALL allow to
set the file permission correcly on the target.

Fixes:
http://autobuild.buildroot.net/results/bba/bba4d0b635ab6849f969b8a0363ebe9f5fafd82e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.5.5
