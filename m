From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 25 Mar 2015 00:30:49 +0200
Subject: [Buildroot] [PATCH] aiccu: musl patches
Message-ID: <20150324223049.GA4134@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8c666ef11310868097601b6de1dd25779729b878/

if_ether.h issue discussion: http://www.openwall.com/lists/musl/2012/10/11/1

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/aiccu/0004-if-ether-header.patch | 23 +++++++++++++++++++++++
 package/aiccu/0005-res-ninit.patch       | 22 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 package/aiccu/0004-if-ether-header.patch
 create mode 100644 package/aiccu/0005-res-ninit.patch

diff --git a/package/aiccu/0004-if-ether-header.patch b/package/aiccu/0004-if-ether-header.patch
new file mode 100644
index 0000000..e0ecd74
--- /dev/null
+++ b/package/aiccu/0004-if-ether-header.patch
@@ -0,0 +1,23 @@
+musl does not allow using <netinet/*> together with <linux/*> headers.
+Since there are both netinet/if_ether.h and linux/if_ether.h providing
+the same definitions, use linux/if_ether.h whenever other linux/*
+headers are included.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- aiccu/common/common.h
++++ aiccu/common/common.h
+@@ -91,11 +91,12 @@
+ 	#include <sys/select.h>
+ 
+ 	#include <net/if.h>
+-	#include <netinet/if_ether.h>
+ #ifdef linux
+ 	#include <netpacket/packet.h>
++	#include <linux/if_ether.h>
+ 	#include <linux/if_tun.h>
+ #else
++	#include <netinet/if_ether.h>
+ #ifdef _DFBSD
+ 	#include <net/tun/if_tun.h>
+ #else
diff --git a/package/aiccu/0005-res-ninit.patch b/package/aiccu/0005-res-ninit.patch
new file mode 100644
index 0000000..f25b53b
--- /dev/null
+++ b/package/aiccu/0005-res-ninit.patch
@@ -0,0 +1,22 @@
+With _LINUX defined, getrrs uses res_ninit instead of res_init.
+
+Musl does not provide res_ninit.
+
+Since getrrs is only called from a single location before any threads
+are spawned, it is actually safe to use res_init here.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- aiccu/common/resolver.c
++++ aiccu/common/resolver.c
+@@ -24,6 +24,10 @@
+ #include <resolv.h>
+ #include <netdb.h>
+ 
++#ifdef _LINUX
++#undef _LINUX
++#endif
++
+ int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
+ {
+ #ifdef _LINUX
-- 
2.0.3
