From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 15 Sep 2014 23:04:43 +0200
Subject: [Buildroot] [PATCH] dhcp: add systemd service file
Message-ID: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a systemd service file to start dhcpd.

The network interfaces to listen on can be set via the variable
INTERFACES in /etc/default/dhcpd.conf. Example:

  INTERFACES="eth0 eth1"

Also install a tmpfiles.d file to create /var/lib/dhcp/dhcpd.leases
(needed at dhcpd start-up).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/dhcp/dhcp.mk       | 15 +++++++++++++++
 package/dhcp/dhcpd.service | 13 +++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 package/dhcp/dhcpd.service

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 9251185..1b914a8 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -74,6 +74,21 @@ define DHCP_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S80dhcp-relay
 endef
 
+define DHCP_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dhcp/dhcpd.service \
+		$(TARGET_DIR)/lib/systemd/system/dhcpd.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf ../../../../lib/systemd/system/dhcpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dhcpd.service
+
+	echo "d /var/lib/dhcp 0755 - - - -" > \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
+	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
+endef
+
 define DHCP_INSTALL_TARGET_CMDS
 	$(DHCP_INSTALL_RELAY)
 	$(DHCP_INSTALL_SERVER)
diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
new file mode 100644
index 0000000..7b265cb
--- /dev/null
+++ b/package/dhcp/dhcpd.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=DHCP server
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/dhcpd.pid
+ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
+KillSignal=SIGINT
+EnvironmentFile=/etc/default/dhcpd.conf
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.3
