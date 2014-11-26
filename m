From: Nathaniel Roach <nroach44@gmail.com>
Date: Wed, 26 Nov 2014 18:50:55 +0800
Subject: [Buildroot] [PATCH v3] package/network-manager: NM needs isc-dhcpc
	or dhcpcd
Message-ID: <1416999055-11095-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NM only currently supports isc-dhcpc, dhcpcd and dhclient
as clients because NM communicates with the client
through DBus, and support for clients needs to be
written in. (as per files in src/dhcp-manager)

Buildroot's default, udhcpc is not supported, and
dhclient is not in buildroot.

Add the dependencies to Config.in, favoring dhcpcd as
default due to size.

----
Changes v2 -> v3:
Both as noted by Baruch
  - The clients aren't a build time dependency, so we don't
	need to build them first.
  - Reworded the commit message to clarify NM's requirements.

Changes v1 -> v2:
  - Switched to "select" from "depends on" (As recommended by
	Baruch). Uses DHCPCD as default as it's the lighter
	option.
  - Because of the above, the edit to "NM needs ..." is no
	longer needed.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/network-manager/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 0ed6ca5..a3e6e33 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_GNUTLS
-- 
2.1.3
