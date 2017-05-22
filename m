From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:48:26 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 4.11.0
Message-ID: <20170601202853.DDB2A807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab0cf9c0946e27e513f4bdd6a73f89b8946e3ca5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Add a patch fixing struct ethhdr conflict using the Buildroot local if_ether.h
kernel header suppression patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-ip-include-libc-headers-first.patch       | 35 ++++++++++++++++++++
 .../0003-tc-add-missing-limits.h-header.patch      | 38 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 4 files changed, 37 insertions(+), 40 deletions(-)

diff --git a/package/iproute2/0003-ip-include-libc-headers-first.patch b/package/iproute2/0003-ip-include-libc-headers-first.patch
new file mode 100644
index 0000000..b842142
--- /dev/null
+++ b/package/iproute2/0003-ip-include-libc-headers-first.patch
@@ -0,0 +1,35 @@
+From 8afdd8babb9e82bcfde78e851b24b698436a6f9f Mon Sep 17 00:00:00 2001
+Message-Id: <8afdd8babb9e82bcfde78e851b24b698436a6f9f.1495466847.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 22 May 2017 15:42:49 +0300
+Subject: [PATCH] ip: include libc headers first
+
+Including libc headers first helps as a workaround to redefinition of struct
+ethhdr with a suitably patched musl libc that suppresses the kernel
+if_ether.h.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: posted http://marc.info/?l=linux-netdev&m=149545968900803&w=2
+
+ ip/iplink_bridge.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ip/iplink_bridge.c b/ip/iplink_bridge.c
+index 818b43c89b5b..cccdec1c203a 100644
+--- a/ip/iplink_bridge.c
++++ b/ip/iplink_bridge.c
+@@ -13,9 +13,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <netinet/in.h>
++#include <netinet/ether.h>
+ #include <linux/if_link.h>
+ #include <linux/if_bridge.h>
+-#include <netinet/ether.h>
+ #include <net/if.h>
+ 
+ #include "rt_names.h"
+-- 
+2.11.0
+
diff --git a/package/iproute2/0003-tc-add-missing-limits.h-header.patch b/package/iproute2/0003-tc-add-missing-limits.h-header.patch
deleted file mode 100644
index b9b27f3..0000000
--- a/package/iproute2/0003-tc-add-missing-limits.h-header.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1f4547b0a81db617f4b0d02711d9e39278eb8283 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 22 Dec 2016 20:45:11 +0200
-Subject: [PATCH] tc: add missing limits.h header
-
-This fixes under musl build issues like:
-
-f_matchall.c: In function ???matchall_parse_opt???:
-f_matchall.c:48:12: error: ???LONG_MIN??? undeclared (first use in this function)
-   if (h == LONG_MIN || h == LONG_MAX) {
-            ^
-f_matchall.c:48:12: note: each undeclared identifier is reported only once for each function it appears in
-f_matchall.c:48:29: error: ???LONG_MAX??? undeclared (first use in this function)
-   if (h == LONG_MIN || h == LONG_MAX) {
-                             ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: posted http://marc.info/?l=linux-netdev&m=148243283002957&w=2
----
- tc/tc_util.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tc/tc_util.h b/tc/tc_util.h
-index f198a4ad5554..4db26c6d5e25 100644
---- a/tc/tc_util.h
-+++ b/tc/tc_util.h
-@@ -2,6 +2,7 @@
- #define _TC_UTIL_H_ 1
- 
- #define MAX_MSG 16384
-+#include <limits.h>
- #include <linux/pkt_sched.h>
- #include <linux/pkt_cls.h>
- #include <linux/gen_stats.h>
--- 
-2.11.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 5cacc7f..5bc47d8 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	c0f30f043f7767cc1b2cd2197b08d4e9b2392c95823fabe30bbce308c30116c4	iproute2-4.9.0.tar.xz
+sha256	72671028bda696d0cb8f48ec8e702581c3a501caeed33eec3a81d7041cbc8026	iproute2-4.11.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6ecfc09..5502d73 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.9.0
+IPROUTE2_VERSION = 4.11.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
