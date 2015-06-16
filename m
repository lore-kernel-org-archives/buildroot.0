From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 16 Jun 2015 15:21:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: fix build with
	older kernel headers
Message-ID: <1434460914-14562-1-git-send-email-vorel@jablocom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Petr Vorel <petr.vorel@gmail.com>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...anager-fix-build-with-Linux-3.2.0-headers.patch | 28 ++++++++++++++++++++++
 ...d-dhcp-fix-build-with-linux-3.2.0-headers.patch | 19 +++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
 create mode 100644 package/network-manager/0002-systemd-dhcp-fix-build-with-linux-3.2.0-headers.patch

diff --git a/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
new file mode 100644
index 0000000..fdda4a2
--- /dev/null
+++ b/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
@@ -0,0 +1,28 @@
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
diff --git a/package/network-manager/0002-systemd-dhcp-fix-build-with-linux-3.2.0-headers.patch b/package/network-manager/0002-systemd-dhcp-fix-build-with-linux-3.2.0-headers.patch
new file mode 100644
index 0000000..80c2beb
--- /dev/null
+++ b/package/network-manager/0002-systemd-dhcp-fix-build-with-linux-3.2.0-headers.patch
@@ -0,0 +1,19 @@
+# Fix build error due to missing definition in linux/filter.h in Linux 3.2.0
+# dhcp-manager/systemd-dhcp/src/libsystemd-network/dhcp-network.c: In function '_bind_raw_socket':
+# dhcp-manager/systemd-dhcp/src/libsystemd-network/dhcp-network.c:79:43: error: 'BPF_XOR' undeclared (first use in this function)
+# dhcp-manager/systemd-dhcp/src/libsystemd-network/dhcp-network.c:79:43: note: each undeclared identifier is reported only once for each function it appears in
+# Inspired by http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=2697aaf3c11de1243ba85d43a62706597d849ba6
+--- a/src/dhcp-manager/systemd-dhcp/src/libsystemd-network/dhcp-network.c
++++ b/src/dhcp-manager/systemd-dhcp/src/libsystemd-network/dhcp-network.c
+@@ -37,6 +37,11 @@
+
+ #include "dhcp-internal.h"
+
++/* Missing in linux/filter.h in Linux 3.2.0 */
++#ifndef BPF_XOR
++#define BPF_XOR 0xa0
++#endif
++
+ static int _bind_raw_socket(int ifindex, union sockaddr_union *link,
+                             uint32_t xid, const uint8_t *mac_addr,
+                             size_t mac_addr_len,
-- 
1.8.0
