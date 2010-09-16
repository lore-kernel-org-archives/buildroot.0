From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] iptables: convert old-style
	hook to new-style hook
Message-ID: <20100916113831.009838AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=56993a53805dafa1dbd3a11d450c3a5c8ae39e6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iptables/iptables.mk |   28 +++++++++++++++++++---------
 1 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 0b7dae1..21146bc 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -16,24 +16,34 @@ endif
 IPTABLES_AUTORECONF = YES
 IPTABLES_LIBTOOL_PATCH = NO
 
-$(eval $(call AUTOTARGETS,package,iptables))
-
-$(IPTABLES_HOOK_POST_INSTALL): $(IPTABLES_TARGET_INSTALL_TARGET)
+define IPTABLES_TARGET_SYMLINK_CREATE
 	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables
 	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables-save
 	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables-restore
-ifeq ($(BR2_INET_IPV6),y)
+endef
+
+define IPTABLES_TARGET_IPV6_SYMLINK_CREATE
 	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables
 	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
 	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
-else
+endef
+
+define IPTABLES_TARGET_IPV6_REMOVE
 	rm -f $(TARGET_DIR)/usr/lib/libip6tc.*
+endef
+
+IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_SYMLINK_CREATE
+
+ifeq ($(BR2_INET_IPV6),y)
+IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_SYMLINK_CREATE
+else
+IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_REMOVE
 endif
-	touch $@
 
-$(IPTABLES_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define IPTABLES_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/iptables-xml
 	rm -f $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/sbin/ip6tables*
 	rm -rf $(TARGET_DIR)/usr/lib/xtables
-	rm -f $(IPTABLES_TARGET_INSTALL_TARGET) $(IPTABLES_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,iptables))
-- 
1.7.1
