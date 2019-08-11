From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 11 Aug 2019 16:39:14 -0300
Subject: [Buildroot] [PATCH] package/systemd: create /etc/resolv.conf only
 if resolvd is selected
Message-ID: <20190811193914.25715-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Or else it becomes a dangling link to /run/systemd/resolve/resolv.conf,
which is never created. Even worst, it also prevents NewtorkManager from
updating resolv.conf.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=9881

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Michael Nosthoff <posted@heine.so>
---
 package/systemd/systemd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e8fd7967bd..09751c215e 100644
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
@@ -327,6 +323,10 @@ SYSTEMD_CONF_OPTS += -Dnetworkd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
+define SYSTEMD_INSTALL_RESOLVCONF_HOOK
+	ln -sf ../run/systemd/resolve/resolv.conf \
+		$(TARGET_DIR)/etc/resolv.conf
+endef
 SYSTEMD_CONF_OPTS += -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
 else
-- 
2.18.1
