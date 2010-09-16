From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] strace: convert to new style
	hook
Message-ID: <20100916113834.012488AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d2b7b19a5707def8a03f009ab69d511f99cbe339
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strace/strace.mk |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 3d50879..13d1557 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -14,14 +14,20 @@ STRACE_CONF_ENV:= ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes \
 	          $(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 
-$(eval $(call AUTOTARGETS,package,strace))
-
-$(STRACE_HOOK_POST_INSTALL): $(STRACE_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/strace
+define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
-ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
+endef
+
+STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_REMOVE_STRACE_GRAPH
+
+define STRACE_INSTALL_TOOLCHAIN_TARGET_UTILS
 	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(TARGET_DIR)/usr/bin/strace \
 		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/strace
+endef
+
+ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
+STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_INSTALL_TOOLCHAIN_TARGET_UTILS
 endif
-	touch $@
+
+$(eval $(call AUTOTARGETS,package,strace))
-- 
1.7.1
