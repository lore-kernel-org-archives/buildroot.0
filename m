From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 22:07:00 +0100
Subject: [Buildroot] [PATCH] iproute2: fix build with musl
Message-ID: <1447967220-30052-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds two patches to the iproute2 package that are
necessary to build it against the musl C library. Both patches have
been submitted upstream.

Fixes:

  http://autobuild.buildroot.org/results/5d3/5d3f8c2242e9a89bb545166fc7d70429d2cddd42/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Avoid-in6_addr-redefinition.patch         | 95 ++++++++++++++++++++++
 .../0002-Add-missing-sys-types.h-include.patch     | 38 +++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 package/iproute2/0001-Avoid-in6_addr-redefinition.patch
 create mode 100644 package/iproute2/0002-Add-missing-sys-types.h-include.patch

diff --git a/package/iproute2/0001-Avoid-in6_addr-redefinition.patch b/package/iproute2/0001-Avoid-in6_addr-redefinition.patch
new file mode 100644
index 0000000..52e2940
--- /dev/null
+++ b/package/iproute2/0001-Avoid-in6_addr-redefinition.patch
@@ -0,0 +1,95 @@
+From 48596709d8ab59727b79a5c6db33ebb251c36543 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 19 Nov 2015 17:44:25 +0100
+Subject: [PATCH] Avoid in6_addr redefinition
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Due to both <netinet/in.h> and <linux/in6.h> being included, the
+in6_addr is being redefined: once from the C library headers and once
+from the kernel headers. This causes some build failures with for
+example the musl C library:
+
+In file included from ../include/linux/xfrm.h:4:0,
+                 from xfrm.h:29,
+                 from ipxfrm.c:39:
+../include/linux/in6.h:32:8: error: redefinition of ?struct in6_addr?
+ struct in6_addr {
+        ^
+In file included from .../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netdb.h:9:0,
+                 from ipxfrm.c:34:
+.../output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:24:8: note: originally defined here
+ struct in6_addr
+        ^
+
+In order to fix this, use just the C library header <netinet/in.h>.
+
+Original patch taken from
+http://git.alpinelinux.org/cgit/aports/tree/main/iproute2/musl-fixes.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/libiptc/ipt_kernel_headers.h | 2 --
+ include/linux/if_bridge.h            | 1 -
+ include/linux/netfilter.h            | 2 --
+ include/linux/xfrm.h                 | 1 -
+ 4 files changed, 6 deletions(-)
+
+diff --git a/include/libiptc/ipt_kernel_headers.h b/include/libiptc/ipt_kernel_headers.h
+index 7e87828..9566be5 100644
+--- a/include/libiptc/ipt_kernel_headers.h
++++ b/include/libiptc/ipt_kernel_headers.h
+@@ -15,12 +15,10 @@
+ #else /* libc5 */
+ #include <sys/socket.h>
+ #include <linux/ip.h>
+-#include <linux/in.h>
+ #include <linux/if.h>
+ #include <linux/icmp.h>
+ #include <linux/tcp.h>
+ #include <linux/udp.h>
+ #include <linux/types.h>
+-#include <linux/in6.h>
+ #endif
+ #endif
+diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
+index ee197a3..f823aa4 100644
+--- a/include/linux/if_bridge.h
++++ b/include/linux/if_bridge.h
+@@ -15,7 +15,6 @@
+ 
+ #include <linux/types.h>
+ #include <linux/if_ether.h>
+-#include <linux/in6.h>
+ 
+ #define SYSFS_BRIDGE_ATTR	"bridge"
+ #define SYSFS_BRIDGE_FDB	"brforward"
+diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
+index b71b4c9..3e4e6ae 100644
+--- a/include/linux/netfilter.h
++++ b/include/linux/netfilter.h
+@@ -4,8 +4,6 @@
+ #include <linux/types.h>
+ 
+ #include <linux/sysctl.h>
+-#include <linux/in.h>
+-#include <linux/in6.h>
+ 
+ /* Responses from hook functions. */
+ #define NF_DROP 0
+diff --git a/include/linux/xfrm.h b/include/linux/xfrm.h
+index b8f5451..a9761a5 100644
+--- a/include/linux/xfrm.h
++++ b/include/linux/xfrm.h
+@@ -1,7 +1,6 @@
+ #ifndef _LINUX_XFRM_H
+ #define _LINUX_XFRM_H
+ 
+-#include <linux/in6.h>
+ #include <linux/types.h>
+ 
+ /* All of the structures in this file may not change size as they are
+-- 
+2.6.3
+
diff --git a/package/iproute2/0002-Add-missing-sys-types.h-include.patch b/package/iproute2/0002-Add-missing-sys-types.h-include.patch
new file mode 100644
index 0000000..ef91814
--- /dev/null
+++ b/package/iproute2/0002-Add-missing-sys-types.h-include.patch
@@ -0,0 +1,38 @@
+From 560dee4b4be54699c0c9679771c9e0d61e4db80a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 19 Nov 2015 17:48:55 +0100
+Subject: [PATCH] Add missing <sys/types.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The u_intXX_t types are defined in <sys/types.h>, so it should be
+included before using those types. Otherwise, with certain C
+libraries, the build fails with:
+
+In file included from ../include/iptables.h:4:0,
+                 from m_ipt.c:18:
+../include/iptables_common.h:47:16: error: unknown type name ?u_int32_t?
+ #define __le32 u_int32_t
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/iptables_common.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/iptables_common.h b/include/iptables_common.h
+index 9099667..2c27a4b 100644
+--- a/include/iptables_common.h
++++ b/include/iptables_common.h
+@@ -43,6 +43,8 @@ extern char *lib_dir;
+   extern void init_extensions(void);
+ #endif
+ 
++#include <sys/types.h>
++
+ #define __be32	u_int32_t
+ #define __le32	u_int32_t
+ #define __be16	u_int16_t
+-- 
+2.6.3
+
-- 
2.6.3
