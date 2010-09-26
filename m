From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 14:34:43 +0200
Subject: [Buildroot] [git commit master 1/1] ezxml: misc fixes
Message-ID: <20100926123548.412A27FF5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1114b4777495fdc2cd7dbe9397a4b8c07b399d41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install into target as well, and use install -D instead of cp, to handle
missing usr/include / usr/lib.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ezxml/ezxml.mk |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index e29a7b5..58d2624 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -14,8 +14,23 @@ define EZXML_BUILD_CMDS
 endef
 
 define EZXML_INSTALL_STAGING_CMDS
-	cp $(@D)/ezxml.h $(STAGING_DIR)/usr/include
-	cp $(@D)/libezxml.a $(STAGING_DIR)/usr/lib
+	install -D -m 0644 $(@D)/ezxml.h $(STAGING_DIR)/usr/include/ezxml.h
+	install -D -m 0644 $(@D)/libezxml.a $(STAGING_DIR)/usr/lib/libezxml.a
+endef
+
+define EZXML_INSTALL_TARGET_CMDS
+	install -D -m 0644 $(@D)/ezxml.h $(TARGET_DIR)/usr/include/ezxml.h
+	install -D -m 0644 $(@D)/libezxml.a $(TARGET_DIR)/usr/lib/libezxml.a
+endef
+
+define EZXML_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/include/ezxml.h
+	rm -f $(STAGING_DIR)/usr/lib/libezxml.a
+endef
+
+define EZXML_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/include/ezxml.h
+	rm -f $(TARGET_DIR)/usr/lib/libezxml.a
 endef
 
 define EZXML_CLEAN_CMDS
-- 
1.7.1
