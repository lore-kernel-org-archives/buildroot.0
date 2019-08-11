From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 11 Aug 2019 13:36:48 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: install resolv.conf with
 systemd resolve instead of networkd
Message-ID: <20190811193648.41690-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: https://bugs.busybox.net/show_bug.cgi?id=9881

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e8fd7967bd..bd0c9d43c8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -310,10 +310,6 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - Network Manager
-define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-	ln -sf ../run/systemd/resolve/resolv.conf \
-		$(TARGET_DIR)/etc/resolv.conf
-endef
 SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
 define SYSTEMD_INSTALL_NETWORK_CONFS
@@ -329,6 +325,10 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
 SYSTEMD_CONF_OPTS += -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
+define SYSTEMD_INSTALL_RESOLVCONF_HOOK
+	ln -sf ../run/systemd/resolve/resolv.conf \
+		$(TARGET_DIR)/etc/resolv.conf
+endef
 else
 SYSTEMD_CONF_OPTS += -Dresolve=false
 endif
-- 
2.20.1
