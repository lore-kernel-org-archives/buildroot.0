From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:47 +0200
Subject: [Buildroot] [PATCH 01/74] bind: remove old-style hook usage and
	step override
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50f8b80f2abf4e7fd0572500af064cb5ce25fba6.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk |   23 ++++++++++++++---------
 1 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e57f267..8e4867a 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -27,21 +27,26 @@ BIND_CONF_OPT =	\
 		--disable-epoll \
 		--disable-threads
 
-$(eval $(call AUTOTARGETS,package,bind))
-
-$(BIND_HOOK_POST_INSTALL):
+define BIND_TARGET_INSTALL_FIXES
 	rm -f $(TARGET_DIR)/usr/bin/isc-config.sh
-ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
+	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
+endef
+
+BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_INSTALL_FIXES
+
+define BIND_TARGET_REMOVE_TOOLS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
+endef
+
+ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
+BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
 endif
-	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
-	touch $@
 
-$(BIND_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define BIND_UNINSTALL_TARGET_CMDS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SBINS))
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
 	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
 	rm -f $(TARGET_DIR)/etc/init.d/S81named
-	rm -f $(BIND_TARGET_INSTALL_TARGET) $(BIND_HOOK_POST_INSTALL)
+endef
 
+$(eval $(call AUTOTARGETS,package,bind))
-- 
1.7.0.4
