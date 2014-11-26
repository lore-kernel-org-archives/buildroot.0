From: Nathaniel Roach <nroach44@gmail.com>
Date: Wed, 26 Nov 2014 14:37:01 +0800
Subject: [Buildroot] [PATCH 1/1] package/network-manager: NM needs ISC-DHCPC
	or DHCPCD
Message-ID: <1416983821-2729-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As NM communicates with the dhcp client through DBus, it
doesn't support any old client.

Add the dependencies to Config.in, and ensure that they
are built beforehand.
---
Two things I'm a little wary of:
 - The new "you need to enable x,y,z..." line is /huge/,
	is there a nice way around this?
 - This adds unecessary things to static-ip configured
	systems, but then again they are using NM for that
	(instead of ifup/down) so maybe this is a non issue?

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/network-manager/Config.in          | 6 ++++--
 package/network-manager/network-manager.mk | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 0ed6ca5..72a2732 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on BR2_PACKAGE_DHCP_CLIENT || BR2_PACKAGE_DHCPCD
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_GNUTLS
@@ -52,9 +53,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	  This option enables support for PPPD daemon
 endif
 
-comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads, headers >= 3.7"
+comment "NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads, headers >= 3.7 and ISC DHCP client or DHCPCD"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
+		!(BR2_PACKAGE_DHCP_CLIENT || BR2_PACKAGE_DHCPCD)
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 7944254..96bc858 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -57,10 +57,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/usr/sbin/dhclient
+NETWORK_MANAGER_DEPENDENCIES += dhcp
 endif
 
 ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/usr/sbin/dhcpcd
+NETWORK_MANAGER_DEPENDENCIES += dhcpcd
 endif
 
 # uClibc by default doesn't have backtrace support, so don't use it
-- 
2.1.3
