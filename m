From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  2 Mar 2017 09:54:00 +0200
Subject: [Buildroot] [PATCH] iptables: fix build with musl
Message-ID: <045cb32775a51576353bc4aa73dcc5fa8b554864.1488441240.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch that defines _GNU_SOURCE to expose some struct tcphdr fields.

Fixes:
http://autobuild.buildroot.net/results/bee/bee20b689345b593378cfd91e0abc48bf381d3f9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...utils-nfsynproxy-fix-build-with-musl-libc.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch

diff --git a/package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch b/package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch
new file mode 100644
index 000000000000..1f86ad135490
--- /dev/null
+++ b/package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch
@@ -0,0 +1,44 @@
+From 06e0312d0bfd1f0b9e7c23ab654f18524d49e86b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 2 Mar 2017 09:20:48 +0200
+Subject: [PATCH] utils: nfsynproxy: fix build with musl libc
+
+The musl libc exposes some struct tcphdr field only when _GNU_SOURCE is
+defined. Fix the following build failure:
+
+nfsynproxy.c: In function ?parse_packet?:
+nfsynproxy.c:34:9: error: ?const struct tcphdr? has no member named ?syn?
+  if (!th->syn || !th->ack)
+         ^
+nfsynproxy.c:34:21: error: ?const struct tcphdr? has no member named ?ack?
+  if (!th->syn || !th->ack)
+                     ^
+nfsynproxy.c:42:8: error: ?const struct tcphdr? has no member named ?res2?
+  if (th->res2 == 0x1)
+        ^
+nfsynproxy.c:45:13: error: ?const struct tcphdr? has no member named ?doff?
+  length = th->doff * 4 - sizeof(*th);
+             ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: pending (http://patchwork.ozlabs.org/patch/734503/)
+
+ utils/nfsynproxy.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/nfsynproxy.c b/utils/nfsynproxy.c
+index baedc92c5d9f..bf5c416340f1 100644
+--- a/utils/nfsynproxy.c
++++ b/utils/nfsynproxy.c
+@@ -6,6 +6,7 @@
+  * published by the Free Software Foundation.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdlib.h>
+ #include <stdbool.h>
+ #include <unistd.h>
+-- 
+2.11.0
+
-- 
2.11.0
