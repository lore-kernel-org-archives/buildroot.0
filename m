From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:53 +0200
Subject: [Buildroot] [PATCH 07/74] libevent: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3c6985d309a37217196877bc87a84967ad2dd213.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
