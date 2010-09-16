From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] less: use correct step override
	method
Message-ID: <20100916113830.8F6088AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0d5cf75df62825209e134841f0e82f205a0a8c87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/less/less.mk |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index bae1cf6..6f985ed 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -8,15 +8,12 @@ LESS_VERSION = 436
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_DEPENDENCIES = ncurses
 
-$(eval $(call AUTOTARGETS,package,less))
-
-$(LESS_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
-	$(INSTALL) -m 0755 $(LESS_DIR)/less \
-		$(TARGET_DIR)/usr/bin/less
-	touch $@
+define LESS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
+endef
 
-$(LESS_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define LESS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/less
-	rm -f $(LESS_TARGET_INSTALL_TARGET) $(LESS_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,less))
-- 
1.7.1
