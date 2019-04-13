From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Apr 2019 21:45:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.8.4
Message-ID: <20190413194547.16098-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nk.c-don-t-include-linux-if_bridge.h.patch | 78 -------------------
 package/babeld/babeld.hash                    |  3 +-
 package/babeld/babeld.mk                      |  2 +-
 3 files changed, 3 insertions(+), 80 deletions(-)
 delete mode 100644 package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch

diff --git a/package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch b/package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch
deleted file mode 100644
index efadd2038a..0000000000
--- a/package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 723bbfd8bdb76012a3da937c7499cf3c0b111dd5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 20 Aug 2016 11:13:56 +0200
-Subject: [PATCH] kernel_netlink.c: don't include <linux/if_bridge.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Including <linux/if_bridge.h> causes the inclusion of <linux/in6.h>,
-which defines 'struct in6_addr', also defined in <netinet/in.h>, causing
-a build failure with the musl C library:
-
-In file included from /home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_bridge.h:18:0,
-                 from kernel_netlink.c:42,
-                 from kernel.c:31:
-/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/in6.h:32:8: error: redefinition of ?struct in6_addr?
- struct in6_addr {
-        ^
-In file included from kernel_netlink.c:33:0,
-                 from kernel.c:31:
-/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: note: originally defined here
- struct in6_addr {
-        ^
-In file included from /home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_bridge.h:18:0,
-                 from kernel_netlink.c:42,
-                 from kernel.c:31:
-/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/in6.h:49:8: error: redefinition of ?struct sockaddr_in6?
- struct sockaddr_in6 {
-        ^
-In file included from kernel_netlink.c:33:0,
-                 from kernel.c:31:
-/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: note: originally defined here
- struct sockaddr_in6 {
-        ^
-In file included from /home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_bridge.h:18:0,
-                 from kernel_netlink.c:42,
-                 from kernel.c:31:
-/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/in6.h:59:8: error: redefinition of ?struct ipv6_mreq?
- struct ipv6_mreq {
-        ^
-In file included from kernel_netlink.c:33:0,
-                 from kernel.c:31:
-/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: note: originally defined here
- struct ipv6_mreq {
-        ^
-
-In order to address this, this patch removes the <linux/if_bridge.h>
-inclusion, and instead defines BRCTL_GET_BRIDGES to the appropriate
-value if it's not provided by the C library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- kernel_netlink.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/kernel_netlink.c b/kernel_netlink.c
-index 4eadc39..1a5b3dd 100644
---- a/kernel_netlink.c
-+++ b/kernel_netlink.c
-@@ -39,10 +39,14 @@ THE SOFTWARE.
- #include <sys/socket.h>
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
--#include <linux/if_bridge.h>
- #include <linux/fib_rules.h>
- #include <net/if_arp.h>
- 
-+/* From <linux/if_bridge.h> */
-+#ifndef BRCTL_GET_BRIDGES
-+#define BRCTL_GET_BRIDGES 1
-+#endif
-+
- #if(__GLIBC__ < 2) || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 5)
- #define RTA_TABLE 15
- #endif
--- 
-2.7.4
-
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 0ee64c4f9c..510fe2bc95 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 2c955e7d4ad971da1e860e5cedbaf1dd79903468ff6488b3f67102b2a8d087b6  babeld-1.7.1.tar.gz
+sha256 98070dc418c190f047b8d69eb47987df30ded8f0fca353c49427d3137ad08b87  babeld-1.8.4.tar.gz
+sha256 b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index d718237d98..5fbfa65485 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.7.1
+BABELD_VERSION = 1.8.4
 BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
-- 
2.20.1
