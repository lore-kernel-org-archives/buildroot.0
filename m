From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] netperf: use correct step
	override method
Message-ID: <20100916113829.4C6088AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b88c394685f3c77219da743d6e0c434312712cf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netperf/netperf.mk |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index d198eee..6bf9b5c 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -8,18 +8,16 @@ NETPERF_VERSION = 2.4.5
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
 NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
 
-$(eval $(call AUTOTARGETS,package,netperf))
-
-$(NETPERF_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
-	$(INSTALL) -m 0755 $(NETPERF_DIR)/src/netperf \
+define NETPERF_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/src/netperf \
 		$(TARGET_DIR)/usr/bin/netperf
-	$(INSTALL) -m 0755 $(NETPERF_DIR)/src/netserver \
+	$(INSTALL) -m 0755 $(@D)/src/netserver \
 		$(TARGET_DIR)/usr/bin/netserver
-	touch $@
+endef
 
-$(NETPERF_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define NETPERF_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/netperf
 	rm -f $(TARGET_DIR)/usr/bin/netserver
-	rm -f $(NETPERF_TARGET_INSTALL_TARGET) $(NETPERF_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,netperf))
-- 
1.7.1
