From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Sep 2009 21:31:57 +0200
Subject: [Buildroot] [git commit master] libevent: only install
	event_rpcgen.py if python support is enabled
Message-ID: <20090919193234.BBEF6774CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=515b511d41dad7d59045e4dc08a5b7e5b2fba353
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libevent/libevent.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index c63dbdb..f71bf9a 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -13,3 +13,11 @@ LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS,package,libevent))
+
+ifneq ($(BR2_PACKAGE_PYTHON),y)
+# libevent installs a python script to target - get rid of it if
+# we don't have python support enabled
+$(LIBEVENT_HOOK_POST_INSTALL):
+	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
+	touch $@
+endif
-- 
1.6.3.3
