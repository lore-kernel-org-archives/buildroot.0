From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Nov 2019 20:21:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: fix build with musl
Message-ID: <20191105192120.31351-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/356a6e2d00b1c5be411f48666c949c791810a5ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ce-tcp.c-do-not-undefine-_GNU_SOURCE.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/ndisc6/0001-src-trace-tcp.c-do-not-undefine-_GNU_SOURCE.patch

diff --git a/package/ndisc6/0001-src-trace-tcp.c-do-not-undefine-_GNU_SOURCE.patch b/package/ndisc6/0001-src-trace-tcp.c-do-not-undefine-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..2c0977a21b
--- /dev/null
+++ b/package/ndisc6/0001-src-trace-tcp.c-do-not-undefine-_GNU_SOURCE.patch
@@ -0,0 +1,36 @@
+From b2093549844452e674a44038bddc68e249ebebba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Nov 2019 20:14:21 +0100
+Subject: [PATCH] src/trace-tcp.c: do not undefine _GNU_SOURCE
+
+Don't undefine _GNU_SOURCE otherwise build with musl will fail on:
+
+src/trace-tcp.c: In function 'send_syn_probe':
+src/trace-tcp.c:52:21: error: invalid application of 'sizeof' to incomplete type 'struct tcphdr'
+  if (plen < sizeof (struct tcphdr))
+                     ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/356a6e2d00b1c5be411f48666c949c791810a5ad
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to remi at remlab.net]
+---
+ src/trace-tcp.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/trace-tcp.c b/src/trace-tcp.c
+index 5aba9d4..1b367ae 100644
+--- a/src/trace-tcp.c
++++ b/src/trace-tcp.c
+@@ -21,7 +21,6 @@
+ # include <config.h>
+ #endif
+ 
+-#undef _GNU_SOURCE
+ #define _DEFAULT_SOURCE 1
+ 
+ #include <string.h>
+-- 
+2.23.0
+
-- 
2.23.0
