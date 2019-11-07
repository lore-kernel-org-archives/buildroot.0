From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Nov 2019 21:47:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: Fix musl build
Message-ID: <20191107204726.2834-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/eec/eecbb0ee0901735db9d5595d2d6b91bb22cca3ca/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ndisc6/0001-Fix-musl-build.patch | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/ndisc6/0001-Fix-musl-build.patch

diff --git a/package/ndisc6/0001-Fix-musl-build.patch b/package/ndisc6/0001-Fix-musl-build.patch
new file mode 100644
index 0000000000..6a13a435c5
--- /dev/null
+++ b/package/ndisc6/0001-Fix-musl-build.patch
@@ -0,0 +1,34 @@
+From 12787f5936c79b56b24ffe0a92f4370804070223 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 7 Nov 2019 21:41:34 +0100
+Subject: [PATCH] Fix musl build
+
+Fixes
+src/trace-tcp.c:67:24: error: 'TH_SYN' undeclared (first use in this function); did you mean 'TH_CWR'?
+  packet->th.th_flags = TH_SYN | (ecn ? (TH_ECE | TH_CWR) : 0);
+
+Musl guards TH_SYN with if defined(_GNU_SOURCE):
+https://git.musl-libc.org/cgit/musl/tree/include/netinet/tcp.h#n82
+
+Patch sent via email to upstream.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
+2.20.1
+
-- 
2.20.1
