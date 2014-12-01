From: Nathaniel Roach <nroach44@gmail.com>
Date: Mon,  1 Dec 2014 22:18:16 +0800
Subject: [Buildroot] [PATCH 1/1] package/dhcp: Only install the relevant
	unit file
Message-ID: <1417443496-9198-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previous to this patch, if BR2_PACKAGE_DHCP_CLIENT was selected,
dhcpd.service was installed to the target on systemd systems.

On the resultant system, this would mean that systemctl would
show an error starting dhcpd.service, as the requisite files
do not exist. This does not cause issue on sysvinit systems
as the init scripts silently error when the files aren't found.

Fix this by adding a conditional check to the install define.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/dhcp/dhcp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 1eb6b32..2aa690f 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -75,6 +75,7 @@ define DHCP_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
 endef
 
+ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
 define DHCP_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
 		$(TARGET_DIR)/lib/systemd/system/dhcpd.service
@@ -89,6 +90,7 @@ define DHCP_INSTALL_INIT_SYSTEMD
 	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
 endef
+endif
 
 define DHCP_INSTALL_TARGET_CMDS
 	$(DHCP_INSTALL_RELAY)
-- 
2.1.3
