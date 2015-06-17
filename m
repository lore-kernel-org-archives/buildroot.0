From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 17 Jun 2015 19:12:10 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/network-manager: fix build with
	older kernel headers
Message-ID: <1434561130-31199-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2: rewrited patch 0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
---
 ...anager-fix-build-with-Linux-3.2.0-headers.patch | 28 ++++++++++++++++
 ...d-dhcp-fix-build-with-Linux-3.2.0-headers.patch | 37 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
 create mode 100644 package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch

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
diff --git a/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
new file mode 100644
index 0000000..a9bdb0e
--- /dev/null
+++ b/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
@@ -0,0 +1,37 @@
+From ae4fc67ae6f14c57a4162731089d69d80a7c7d6d Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 17 Jun 2015 18:56:13 +0200
+Subject: [PATCH] systemd-dhcp: fix build with Linux 3.2.0 headers
+
+Fixes build on Ubuntu 12.04.
+
+systemd/src/libsystemd-network/dhcp-network.c: In function '_bind_raw_socket':
+systemd/src/libsystemd-network/dhcp-network.c:75:17: error: 'BPF_XOR' undeclared (first use in this function)
+systemd/src/libsystemd-network/dhcp-network.c:75:17: note: each undeclared identifier is reported only once for each function it appears in
+make[4]: *** [libsystemd_nm_la-dhcp-network.lo] Error 1
+
+Inspired by http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=3811a683
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
-- 
1.8.0
