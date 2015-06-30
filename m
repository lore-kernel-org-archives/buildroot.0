From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 23:09:30 +0200
Subject: [Buildroot] [git commit] package/network-manager: add patches to
	build with kernel headers 3.2
Message-ID: <20150630211000.262B77FFE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52282828f06dc8aa3f721727f68a5096b9ed8b49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

+ lower kernel headers dependency

According to upstream [1], there is no known minimal kernel-version, nor
minimal required feature-set.

Experimentally tested, that 1.0.2 is works with 3.2 kernel headers, even
some features will be missing [2].

[1] https://mail.gnome.org/archives/networkmanager-list/2015-April/msg00039.html
[2] https://mail.gnome.org/archives/networkmanager-list/2015-April/msg00041.html

[Thomas: add comment in Config.in to indicate that it may work with
earlier kernel versions.]

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...anager-fix-build-with-Linux-3.2.0-headers.patch |   30 ++++++++++++++++
 ...d-dhcp-fix-build-with-Linux-3.2.0-headers.patch |   37 ++++++++++++++++++++
 package/network-manager/Config.in                  |    3 +-
 3 files changed, 69 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
new file mode 100644
index 0000000..49c1996
--- /dev/null
+++ b/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
@@ -0,0 +1,30 @@
+From 22b99e3bbb2ca33963e839f12ab95314ab8d9ba9 Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Fri, 15 May 2015 16:37:20 +0200
+Subject: [PATCH] ppp-manager: fix build with Linux 3.2.0 headers
+
+Fixes build with Ubuntu 12.04.
+
+In file included from ppp-manager/nm-ppp-manager.c:42:0:
+/usr/include/linux/if_ppp.h:103:16: error: field 'b' has incomplete type
+/usr/include/linux/if_ppp.h:108:21: error: field 'b' has incomplete type
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ src/ppp-manager/nm-ppp-manager.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-manager.c
+index e27c82b..d410ebf 100644
+--- a/src/ppp-manager/nm-ppp-manager.c
++++ b/src/ppp-manager/nm-ppp-manager.c
+@@ -39,6 +39,7 @@
+ #ifndef aligned_u64
+ #define aligned_u64 unsigned long long __attribute__((aligned(8)))
+ #endif
++#include <linux/if.h>
+ #include <linux/if_ppp.h>
+
+ #include "NetworkManagerUtils.h"
+--
+2.1.4
diff --git a/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
new file mode 100644
index 0000000..01eefec
--- /dev/null
+++ b/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
@@ -0,0 +1,37 @@
+From 7f84150e9f6aa7e900d70178e0fc0acc6cfba651 Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Fri, 15 May 2015 16:38:10 +0200
+Subject: [PATCH] systemd-dhcp: fix build with Linux 3.2.0 headers
+
+Fixes build on Ubuntu 12.04.
+
+systemd/src/libsystemd-network/dhcp-network.c: In function '_bind_raw_socket':
+systemd/src/libsystemd-network/dhcp-network.c:75:17: error: 'BPF_XOR' undeclared (first use in this function)
+systemd/src/libsystemd-network/dhcp-network.c:75:17: note: each undeclared identifier is reported only once for each function it appears in
+make[4]: *** [libsystemd_nm_la-dhcp-network.lo] Error 1
+
+(cherry picked from commit 3811a68389b9277533f2eee8372927ca6238653e)
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h b/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h
+index 6d500f4..f8856a1 100644
+--- a/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h
++++ b/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h
+@@ -38,6 +38,11 @@
+
+ #include "nm-logging.h"
+
++/* Missing in Linux 3.2.0, in Ubuntu 12.04 */
++#ifndef BPF_XOR
++#define BPF_XOR 0xa0
++#endif
++
+ static inline guint32
+ _slog_level_to_nm (int slevel)
+ {
+--
+2.1.4
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index f6d8564..bcf8f90 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	bool "networkmanager"
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	# Tested with 3.2, but may even work with earlier versions
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
 	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
 	select BR2_PACKAGE_DBUS
