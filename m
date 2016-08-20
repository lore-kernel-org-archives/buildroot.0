From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:16:06 +0200
Subject: [Buildroot] [git commit] babeld: fix build with the musl C library
Message-ID: <20160820091646.9C4B2820EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=254da768654b90b448a795c996102e7b4ab0d062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch that removes a header inclusion causing
redefinition issues with the musl C library.

Fixes:

  http://autobuild.buildroot.net/results/7d80c66ab5d4975de7256e73592845b9f8b3a731/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...netlink.c-don-t-include-linux-if_bridge.h.patch | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch b/package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch
new file mode 100644
index 0000000..efadd20
--- /dev/null
+++ b/package/babeld/0001-kernel_netlink.c-don-t-include-linux-if_bridge.h.patch
@@ -0,0 +1,78 @@
+From 723bbfd8bdb76012a3da937c7499cf3c0b111dd5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 20 Aug 2016 11:13:56 +0200
+Subject: [PATCH] kernel_netlink.c: don't include <linux/if_bridge.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Including <linux/if_bridge.h> causes the inclusion of <linux/in6.h>,
+which defines 'struct in6_addr', also defined in <netinet/in.h>, causing
+a build failure with the musl C library:
+
+In file included from /home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_bridge.h:18:0,
+                 from kernel_netlink.c:42,
+                 from kernel.c:31:
+/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/in6.h:32:8: error: redefinition of ???struct in6_addr???
+ struct in6_addr {
+        ^
+In file included from kernel_netlink.c:33:0,
+                 from kernel.c:31:
+/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: note: originally defined here
+ struct in6_addr {
+        ^
+In file included from /home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_bridge.h:18:0,
+                 from kernel_netlink.c:42,
+                 from kernel.c:31:
+/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/in6.h:49:8: error: redefinition of ???struct sockaddr_in6???
+ struct sockaddr_in6 {
+        ^
+In file included from kernel_netlink.c:33:0,
+                 from kernel.c:31:
+/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: note: originally defined here
+ struct sockaddr_in6 {
+        ^
+In file included from /home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/if_bridge.h:18:0,
+                 from kernel_netlink.c:42,
+                 from kernel.c:31:
+/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/in6.h:59:8: error: redefinition of ???struct ipv6_mreq???
+ struct ipv6_mreq {
+        ^
+In file included from kernel_netlink.c:33:0,
+                 from kernel.c:31:
+/home/thomas/projets/buildroot/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: note: originally defined here
+ struct ipv6_mreq {
+        ^
+
+In order to address this, this patch removes the <linux/if_bridge.h>
+inclusion, and instead defines BRCTL_GET_BRIDGES to the appropriate
+value if it's not provided by the C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ kernel_netlink.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/kernel_netlink.c b/kernel_netlink.c
+index 4eadc39..1a5b3dd 100644
+--- a/kernel_netlink.c
++++ b/kernel_netlink.c
+@@ -39,10 +39,14 @@ THE SOFTWARE.
+ #include <sys/socket.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+-#include <linux/if_bridge.h>
+ #include <linux/fib_rules.h>
+ #include <net/if_arp.h>
+ 
++/* From <linux/if_bridge.h> */
++#ifndef BRCTL_GET_BRIDGES
++#define BRCTL_GET_BRIDGES 1
++#endif
++
+ #if(__GLIBC__ < 2) || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 5)
+ #define RTA_TABLE 15
+ #endif
+-- 
+2.7.4
+
