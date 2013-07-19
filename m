From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 23:39:43 +0200
Subject: [Buildroot] [git commit] dhcp: add config option for delayed-ack
	feature of dhcp server
Message-ID: <20130719214137.235E89A20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4db37c663cc0988cf5993d14ee5fdb7976f45694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch creates a config option for the ISC DHCP server to allow passing
--enable-delayed-ack to its configure script.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dhcp/Config.in |    5 +++++
 package/dhcp/dhcp.mk   |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 38cf007..e341485 100644
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
index ce0cf23..3baeb23 100644
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
