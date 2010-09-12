From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:20 +0200
Subject: [Buildroot] [PATCH 34/74] bridge: remove useless strip and use
	correct definition for uninstall
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9785f71c7a7a0eebf496d45e516b83c8019f6468.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bridge-utils/bridge.mk |   17 ++++-------------
 1 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/bridge-utils/bridge.mk b/package/bridge-utils/bridge.mk
index 925de06..1d633dd 100644
--- a/package/bridge-utils/bridge.mk
+++ b/package/bridge-utils/bridge.mk
@@ -13,18 +13,9 @@ BRIDGE_INSTALL_TARGET:=YES
 BRIDGE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
 BRIDGE_CONF_OPT:=--with-linux-headers=$(LINUX_HEADERS_DIR)
 
-$(eval $(call AUTOTARGETS,package,bridge))
-
-ifeq ($(BR2_ENABLE_DEBUG),)
-# bridge has no install-strip target
-$(BRIDGE_HOOK_POST_INSTALL): $(BRIDGE_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/brctl
-	touch $@
-endif
-
-# bridge has no uninstall target
-$(BRIDGE_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define BRIDGE_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
 		include/libbridge.h man/man8/brctl.8 sbin/brctl)
-	rm -f $(BRIDGE_TARGET_INSTALL_TARGET) $(BRIDGE_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,bridge))
-- 
1.7.0.4
