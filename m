From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Apr 2018 23:31:34 +0200
Subject: [Buildroot] [git commit] keepalived: bump to 1.4.2
Message-ID: <20180405213312.2A0F7863B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e4d2194952c46667cbd40aad01d9667c2c7a3d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can drop 0001-Fix-build-with-Linux-kernel-headers-v4.15.patch as it
has been merged upstream, as of commit
https://github.com/acassen/keepalived/commit/a5457d3a1f579fef5825ffe841f1613b0014ff19.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-build-with-Linux-kernel-headers-v4.15.patch | 59 ----------------------
 package/keepalived/keepalived.hash                 |  2 +-
 package/keepalived/keepalived.mk                   |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch b/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch
deleted file mode 100644
index b5f21cb40a..0000000000
--- a/package/keepalived/0001-Fix-build-with-Linux-kernel-headers-v4.15.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 15f93dd90484532e25c8f3e43fb34a361a79d7f2 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 9 Feb 2018 11:55:19 +0200
-Subject: [PATCH] Fix build with Linux kernel headers v4.15
-
-Linux kernel version 4.15 changed the libc/kernel headers suppression
-logic in a way that introduces collisions:
-
-In file included from ./../include/vrrp_ipaddress.h:32:0,
-                 from ./../include/vrrp_arp.h:31,
-                 from vrrp.c:29:
-/home/peko/autobuild/instance-1/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/in.h:29:3: error: redeclaration of enumerator 'IPPROTO_IP'
-   IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
-   ^
-/home/peko/autobuild/instance-1/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/netinet/in.h:33:5: note: previous definition of 'IPPROTO_IP' was here
-     IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
-     ^~~~~~~~~~
-
-Include the libc netinet/in.h header first to suppress the kernel
-header.
-
-In addition, add _GNU_SOURCE to vrrp.c for the libc provided in6_pktinfo
-definition.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/acassen/keepalived/pull/777
-
- keepalived/include/vrrp_arp.h | 1 +
- keepalived/vrrp/vrrp.c        | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/keepalived/include/vrrp_arp.h b/keepalived/include/vrrp_arp.h
-index 77a26c450b12..a103ab075c1d 100644
---- a/keepalived/include/vrrp_arp.h
-+++ b/keepalived/include/vrrp_arp.h
-@@ -24,6 +24,7 @@
- #define _VRRP_ARP_H
- 
- /* system includes */
-+#include <netinet/in.h>
- #include <net/ethernet.h>
- #include <net/if_arp.h>
- 
-diff --git a/keepalived/vrrp/vrrp.c b/keepalived/vrrp/vrrp.c
-index 3d2bfe41ab4f..435a4b54b2a9 100644
---- a/keepalived/vrrp/vrrp.c
-+++ b/keepalived/vrrp/vrrp.c
-@@ -26,6 +26,7 @@
- #include "config.h"
- 
- /* local include */
-+#define _GNU_SOURCE
- #include "vrrp_arp.h"
- #include "vrrp_ndisc.h"
- #include "vrrp_scheduler.h"
--- 
-2.15.1
-
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 4590c33ef9..ed7d2fb0a0 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	220407517ccad822d1ffa80f7bc37582abaf97da6f7bda2326fa6904b1855bd0  keepalived-1.4.1.tar.gz
+sha256	4e2d7cc01a6ee29a3955f5c622d47704ba7d9dd758189f15e9def016a2d1faa3  keepalived-1.4.2.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 6d3d8e7cc6..0fa1b79e3a 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 1.4.1
+KEEPALIVED_VERSION = 1.4.2
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
 KEEPALIVED_LICENSE = GPL-2.0+
