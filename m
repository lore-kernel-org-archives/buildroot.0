From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:55:08 +0100
Subject: [Buildroot] [git commit] package/dhcp: Only install the relevant
	unit file
Message-ID: <20141207205512.13F6F7FC13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc1ab9015e16cae8235f330bfad9195a4e2d3eb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previous to this patch, if BR2_PACKAGE_DHCP_CLIENT was selected,
dhcpd.service was installed to the target on systemd systems.

On the resultant system, this would mean that systemctl would
show an error starting dhcpd.service, as the requisite files
do not exist. This does not cause issue on sysvinit systems
as the init scripts silently error when the files aren't found.

Fix this by adding a conditional check to the install define.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
