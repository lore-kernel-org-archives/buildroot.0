From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Jun 2020 23:25:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: fix build with headers
 >= 4.15
Message-ID: <20200625212521.1495141-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/db7f149f63e9180b22460caa74850673362aa17c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uild-with-Linux-kernel-headers-v4.15.patch | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch

diff --git a/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch b/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch
new file mode 100644
index 0000000000..4a20520ae0
--- /dev/null
+++ b/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch
@@ -0,0 +1,64 @@
+From 6ad62a612ade0a9cbfe5f9d3ad3473141816fb9a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 25 Jun 2020 23:14:22 +0200
+Subject: [PATCH] Fix build with Linux kernel headers v4.15
+
+Same issue that was fixed by 947248af144bcab6376ccddab8dc40f313b14281
+but raised again when bumping keepalived from version 2.0.15 to 2.1.2 in
+buildroot
+
+Fixes:
+ - http://autobuild.buildroot.org/results/db7f149f63e9180b22460caa74850673362aa17c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/acassen/keepalived/pull/1654]
+---
+ keepalived/vrrp/vrrp_arp.c   | 1 +
+ keepalived/vrrp/vrrp_ndisc.c | 2 +-
+ keepalived/vrrp/vrrp_vmac.c  | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/keepalived/vrrp/vrrp_arp.c b/keepalived/vrrp/vrrp_arp.c
+index c06904a7..888f1d5f 100644
+--- a/keepalived/vrrp/vrrp_arp.c
++++ b/keepalived/vrrp/vrrp_arp.c
+@@ -23,6 +23,7 @@
+ #include "config.h"
+ 
+ /* system includes */
++#include <netinet/in.h>
+ #include <unistd.h>
+ #include <net/ethernet.h>
+ #include <net/if_arp.h>
+diff --git a/keepalived/vrrp/vrrp_ndisc.c b/keepalived/vrrp/vrrp_ndisc.c
+index 0f5569bc..0a4fffc6 100644
+--- a/keepalived/vrrp/vrrp_ndisc.c
++++ b/keepalived/vrrp/vrrp_ndisc.c
+@@ -23,11 +23,11 @@
+ #include "config.h"
+ 
+ /* system includes */
++#include <netinet/in.h>
+ #include <unistd.h>
+ #include <net/ethernet.h>
+ #include <linux/if_packet.h>
+ #include <netinet/icmp6.h>
+-#include <netinet/in.h>
+ #include <stdint.h>
+ #include <errno.h>
+ 
+diff --git a/keepalived/vrrp/vrrp_vmac.c b/keepalived/vrrp/vrrp_vmac.c
+index 2a59aee3..7afbf604 100644
+--- a/keepalived/vrrp/vrrp_vmac.c
++++ b/keepalived/vrrp/vrrp_vmac.c
+@@ -23,6 +23,7 @@
+ #include "config.h"
+ 
+ /* global include */
++#include <netinet/in.h>
+ #ifdef NETLINK_H_NEEDS_SYS_SOCKET_H
+ #include <sys/socket.h>
+ #endif
+-- 
+2.26.2
+
-- 
2.26.2
