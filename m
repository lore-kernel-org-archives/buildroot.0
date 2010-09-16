From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] openvpn: use correct step
	override method
Message-ID: <20100916113831.275E98AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=138212a1046fb4a63d28a88bf6f53b71e35a281b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/openvpn.mk |   16 +++++++---------
 1 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 714938b..8d99cab 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -26,20 +26,18 @@ else
 	OPENVPN_CONF_OPT += --disable-crypto --disable-ssl
 endif
 
-$(eval $(call AUTOTARGETS,package,openvpn))
-
-$(OPENVPN_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing")
-	$(INSTALL) -m 755 $(OPENVPN_DIR)/openvpn \
+define OPENVPN_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 $(@D)/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
 	if [ ! -f $(TARGET_DIR)/etc/init.d/openvpn ]; then \
 		$(INSTALL) -m 755 -D package/openvpn/openvpn.init \
 			$(TARGET_DIR)/etc/init.d/openvpn; \
 	fi
-	touch $@
+endef
 
-$(OPENVPN_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define OPENVPN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/openvpn
 	rm -f $(TARGET_DIR)/etc/init.d/openvpn
-	rm -f $(OPENVPN_TARGET_INSTALL_TARGET) $(OPENVPN_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,openvpn))
-- 
1.7.1
