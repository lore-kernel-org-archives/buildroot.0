From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libevent: convert old-style
	hook to new-style hook
Message-ID: <20100916113822.8D7168AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3c6985d309a37217196877bc87a84967ad2dd213
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevent/libevent.mk |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index f71bf9a..4df6270 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -12,12 +12,14 @@ LIBEVENT_LIBTOOL_PATCH = NO
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package,libevent))
+define LIBEVENT_REMOVE_PYSCRIPT
+	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
+endef
 
+# libevent installs a python script to target - get rid of it if we
+# don't have python support enabled
 ifneq ($(BR2_PACKAGE_PYTHON),y)
-# libevent installs a python script to target - get rid of it if
-# we don't have python support enabled
-$(LIBEVENT_HOOK_POST_INSTALL):
-	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
-	touch $@
+LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
+
+$(eval $(call AUTOTARGETS,package,libevent))
-- 
1.7.1
