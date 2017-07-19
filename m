From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:10:02 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 4.12.0
Message-ID: <20170719190605.4DBD37FEB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c12e01cc2c3133bfb9f53ab0486c6d7bf909d089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Add uClibc-ng compatibility fix. This is needed due to missing definition in
netinet/in.h.

Add license file hash.

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../iproute2/0002-Fix-build-with-uClibc-ng.patch   | 38 ++++++++++++++++++++++
 .../0002-ip-include-libc-headers-first.patch       | 35 --------------------
 package/iproute2/iproute2.hash                     |  3 +-
 package/iproute2/iproute2.mk                       |  2 +-
 4 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/package/iproute2/0002-Fix-build-with-uClibc-ng.patch b/package/iproute2/0002-Fix-build-with-uClibc-ng.patch
new file mode 100644
index 0000000..48cae70
--- /dev/null
+++ b/package/iproute2/0002-Fix-build-with-uClibc-ng.patch
@@ -0,0 +1,38 @@
+From 2ac2f416072d9968a9ea2dd9f48168223a1147b0 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 18 Jul 2017 14:09:06 +0300
+Subject: [PATCH] Fix build with uClibc-ng
+
+Add a local definition for IPPROTO_MH to fix build with uClibc-ng. As of
+version 1.0.25, the uClibc-ng netinet/in.h header does not provide this
+definition. The kernel provided definition is masked by libc-compat.h. Add
+this local fix until uClibc-ng syncs netinet/in.h with glibc.
+
+This partially reverts upstream commit a9ae195a2169 (xfrm: get #define's from
+linux includes)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: non upstreamable; local uClibc-ng compatibility fix
+---
+ ip/xfrm.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ip/xfrm.h b/ip/xfrm.h
+index 54d80ce5e949..50b85550fb45 100644
+--- a/ip/xfrm.h
++++ b/ip/xfrm.h
+@@ -30,6 +30,10 @@
+ #include <linux/xfrm.h>
+ #include <linux/ipsec.h>
+ 
++#ifndef IPPROTO_MH
++# define IPPROTO_MH     135
++#endif
++
+ #define XFRMS_RTA(x)  ((struct rtattr*)(((char*)(x)) + NLMSG_ALIGN(sizeof(struct xfrm_usersa_info))))
+ #define XFRMS_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct xfrm_usersa_info))
+ 
+-- 
+2.13.2
+
diff --git a/package/iproute2/0002-ip-include-libc-headers-first.patch b/package/iproute2/0002-ip-include-libc-headers-first.patch
deleted file mode 100644
index b842142..0000000
--- a/package/iproute2/0002-ip-include-libc-headers-first.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8afdd8babb9e82bcfde78e851b24b698436a6f9f Mon Sep 17 00:00:00 2001
-Message-Id: <8afdd8babb9e82bcfde78e851b24b698436a6f9f.1495466847.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 22 May 2017 15:42:49 +0300
-Subject: [PATCH] ip: include libc headers first
-
-Including libc headers first helps as a workaround to redefinition of struct
-ethhdr with a suitably patched musl libc that suppresses the kernel
-if_ether.h.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: posted http://marc.info/?l=linux-netdev&m=149545968900803&w=2
-
- ip/iplink_bridge.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ip/iplink_bridge.c b/ip/iplink_bridge.c
-index 818b43c89b5b..cccdec1c203a 100644
---- a/ip/iplink_bridge.c
-+++ b/ip/iplink_bridge.c
-@@ -13,9 +13,9 @@
- #include <stdlib.h>
- #include <string.h>
- #include <netinet/in.h>
-+#include <netinet/ether.h>
- #include <linux/if_link.h>
- #include <linux/if_bridge.h>
--#include <netinet/ether.h>
- #include <net/if.h>
- 
- #include "rt_names.h"
--- 
-2.11.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 5bc47d8..ace94b1 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	72671028bda696d0cb8f48ec8e702581c3a501caeed33eec3a81d7041cbc8026	iproute2-4.11.0.tar.xz
+sha256	2e0a4c4262d9f6c169885a6e16c4c5c5f1ef6fd57b6a0e7b41f42be5bb6ebd7d	iproute2-4.12.0.tar.xz
+sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a9ca376..1dc7abe 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.11.0
+IPROUTE2_VERSION = 4.12.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
