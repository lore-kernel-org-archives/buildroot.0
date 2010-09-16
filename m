From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] squid: convert old-style hook
	to new-style hook
Message-ID: <20100916113827.38CC68AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=62df009e47bb0f850989aaba24b08d06d5b03305
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6e94d50..6254b84 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -23,13 +23,15 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	SQUID_DEPENDENCIES += openssl
 endif
 
-$(eval $(call AUTOTARGETS,package,squid))
-
-$(SQUID_HOOK_POST_INSTALL):
+define SQUID_CLEANUP_TARGET
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, \
 		RunCache RunAccel)
 	rm -f $(addprefix $(TARGET_DIR)/etc/, \
 		cachemgr.conf mime.conf.default squid.conf.default)
 	rm -f $(TARGET_DIR)/usr/libexec/cachemgr.cgi
 	rm -f $(TARGET_DIR)/usr/share/mib.txt
-	touch $@
+endef
+
+SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
+
+$(eval $(call AUTOTARGETS,package,squid))
-- 
1.7.1
