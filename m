From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 22:41:01 +0100
Subject: [Buildroot] [git commit] network-manager: add support for pppd
Message-ID: <20140315214420.73B4D9BF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42389cbcae9a9c0bb979024c7577b36cde1e7286
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in          |    9 +++++++++
 package/network-manager/network-manager.mk |    8 +++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index a4eeeaf..a6fbf0b 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -26,6 +26,15 @@ config BR2_PACKAGE_NETWORK_MANAGER
 
 	  http://projects.gnome.org/NetworkManager/
 
+if BR2_PACKAGE_NETWORK_MANAGER
+
+config BR2_PACKAGE_NETWORK_MANAGER_PPPD
+	bool "pppd support"
+	select BR2_PACKAGE_PPPD
+	help
+	  This option enables support for PPPD daemon
+endif
+
 comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index cd8b528..03057a6 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -29,11 +29,17 @@ NETWORK_MANAGER_CONF_OPT = \
 		--disable-gtk-doc \
 		--localstatedir=/var \
 		--with-crypto=gnutls \
-		--disable-ppp \
 		--with-iptables=/usr/sbin/iptables \
 		--disable-ifupdown \
 		--disable-ifnet
 
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
+	NETWORK_MANAGER_DEPENDENCIES += pppd
+	NETWORK_MANAGER_CONF_OPT += --enable-ppp
+else
+	NETWORK_MANAGER_CONF_OPT += --disable-ppp
+endif
+
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 NETWORK_MANAGER_CONF_OPT += --with-dhclient=/usr/sbin/dhclient
 endif
