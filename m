From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 23:00:02 +0100
Subject: [Buildroot] [git commit] dhcp: add systemd service file
Message-ID: <20141029220729.1FE92B1BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=938056f948cc00041be64c9f0394f79d820df3bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a systemd service file to start dhcpd.

The network interfaces to listen on can be set via the variable
INTERFACES in /etc/default/dhcpd.conf. Example:

  INTERFACES="eth0 eth1"

Also install a tmpfiles.d file to create /var/lib/dhcp/dhcpd.leases
(needed at dhcpd start-up).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk       |   15 +++++++++++++++
 package/dhcp/dhcpd.service |   13 +++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 736635a..8b38fd0 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -73,6 +73,21 @@ define DHCP_INSTALL_INIT_SYSV
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
