From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] tn5250: remove old-style hook
	usage and step override
Message-ID: <20100916113821.DE6BF8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d1b11c16f0620d426a36bf4e10f5bc8ce4d33040
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tn5250/tn5250.mk |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index ac9c1f1..63c6c6c 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -16,16 +16,17 @@ else
 	TN5250_CONF_OPT += --without-ssl
 endif
 
-$(eval $(call AUTOTARGETS,package,tn5250))
-
-$(TN5250_HOOK_POST_INSTALL):
+define TN5250_INSTALL_FIXES
 	rm -f $(TARGET_DIR)/usr/bin/5250keys
 	rm -f $(TARGET_DIR)/usr/bin/xt5250
-	touch $@
+endef
+
+TN5250_POST_INSTALL_TARGET_HOOKS += TN5250_INSTALL_FIXES
 
-$(TN5250_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define TN5250_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(TN5250_DIR)
 	rm -f $(TARGET_DIR)/usr/lib/lib5250.*
 	rm -rf $(TARGET_DIR)/usr/share/tn5250
-	rm -f $(TN5250_TARGET_INSTALL_TARGET) $(TN5250_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,tn5250))
-- 
1.7.1
