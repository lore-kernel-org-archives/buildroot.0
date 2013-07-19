From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 14:46:37 +0200
Subject: [Buildroot] [PATCH] dhcp: add config option for delayed-ack feature
	of dhcp server
Message-ID: <2ac4c1f0c7025c5012b9.1374237997@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch creates a config option for the ISC DHCP server to allow passing
--enable-delayed-ack to its configure script.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/dhcp/Config.in |  5 +++++
 package/dhcp/dhcp.mk   |  4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -13,6 +13,11 @@ config BR2_PACKAGE_DHCP_SERVER
 	help
 	  DHCP server from the ISC DHCP distribution.
 
+config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
+	bool "Enable delayed ACK feature"
+	depends on BR2_PACKAGE_DHCP_SERVER
+	help
+	  Enable delayed ACK feature in the ISC DHCP server.
 
 config BR2_PACKAGE_DHCP_RELAY
 	bool "dhcp relay"
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -17,6 +17,10 @@ DHCP_CONF_OPT = \
 	--with-cli-pid-file=/var/run/dhclient.pid \
 	--with-relay-pid-file=/var/run/dhcrelay.pid
 
+ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
+        DHCP_CONF_OPT += --enable-delayed-ack
+endif
+
 ifneq ($(BR2_INET_IPV6),y)
         DHCP_CONF_OPT += --disable-dhcpv6
 endif
