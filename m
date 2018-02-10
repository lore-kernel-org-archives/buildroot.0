From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 08:59:40 +0100
Subject: [Buildroot] [git commit] keepalived: fix build with 4.15+ kernel
 headers
Message-ID: <20180210075951.052338863D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=242abb4b212eb98e1c3ec1560d69c4e41f98b898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel version 4.15 change the logic of libc-compat.h in a way that
introduced libc/kernel network headers collision. Add a patch for fixing
that.

Fixes:
http://autobuild.buildroot.net/results/000/000293275076c59e298d235e93ce9a92b66360e7/
http://autobuild.buildroot.net/results/2ba/2ba8722a42aa9b92f5194595f53130c97647b9b8/
http://autobuild.buildroot.net/results/114/114136447c9b18436ff9b2804c440a2e37576452/

Cc: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-build-with-Linux-kernel-headers-v4.15.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch b/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch
new file mode 100644
index 0000000000..b5f21cb40a
--- /dev/null
+++ b/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch
@@ -0,0 +1,59 @@
+From 15f93dd90484532e25c8f3e43fb34a361a79d7f2 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 9 Feb 2018 11:55:19 +0200
+Subject: [PATCH] Fix build with Linux kernel headers v4.15
+
+Linux kernel version 4.15 changed the libc/kernel headers suppression
+logic in a way that introduces collisions:
+
+In file included from ./../include/vrrp_ipaddress.h:32:0,
+                 from ./../include/vrrp_arp.h:31,
+                 from vrrp.c:29:
+/home/peko/autobuild/instance-1/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/in.h:29:3: error: redeclaration of enumerator 'IPPROTO_IP'
+   IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
+   ^
+/home/peko/autobuild/instance-1/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/netinet/in.h:33:5: note: previous definition of 'IPPROTO_IP' was here
+     IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
+     ^~~~~~~~~~
+
+Include the libc netinet/in.h header first to suppress the kernel
+header.
+
+In addition, add _GNU_SOURCE to vrrp.c for the libc provided in6_pktinfo
+definition.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/acassen/keepalived/pull/777
+
+ keepalived/include/vrrp_arp.h | 1 +
+ keepalived/vrrp/vrrp.c        | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/keepalived/include/vrrp_arp.h b/keepalived/include/vrrp_arp.h
+index 77a26c450b12..a103ab075c1d 100644
+--- a/keepalived/include/vrrp_arp.h
++++ b/keepalived/include/vrrp_arp.h
+@@ -24,6 +24,7 @@
+ #define _VRRP_ARP_H
+ 
+ /* system includes */
++#include <netinet/in.h>
+ #include <net/ethernet.h>
+ #include <net/if_arp.h>
+ 
+diff --git a/keepalived/vrrp/vrrp.c b/keepalived/vrrp/vrrp.c
+index 3d2bfe41ab4f..435a4b54b2a9 100644
+--- a/keepalived/vrrp/vrrp.c
++++ b/keepalived/vrrp/vrrp.c
+@@ -26,6 +26,7 @@
+ #include "config.h"
+ 
+ /* local include */
++#define _GNU_SOURCE
+ #include "vrrp_arp.h"
+ #include "vrrp_ndisc.h"
+ #include "vrrp_scheduler.h"
+-- 
+2.15.1
+
