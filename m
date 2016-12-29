From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 Dec 2016 21:16:56 +0200
Subject: [Buildroot] [PATCH] wireshark: fix build with musl
Message-ID: <05c8bbf9134c0689d002e446c144eaadc99ccfec.1483039016.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch adding missing sys/time.h header.

Fixes:
http://autobuild.buildroot.net/results/cd8/cd883b40503a6f4d3035e09a383db2d5a21162ad/
http://autobuild.buildroot.net/results/1ae/1ae34debe7e95eab33a895ecdf04c0ddf96cf4ab/
http://autobuild.buildroot.net/results/4af/4afe968e698f62c6bdbec35e53d35c361c5e852b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...androiddump-add-missing-sys-time.h-header.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/wireshark/0002-androiddump-add-missing-sys-time.h-header.patch

diff --git a/package/wireshark/0002-androiddump-add-missing-sys-time.h-header.patch b/package/wireshark/0002-androiddump-add-missing-sys-time.h-header.patch
new file mode 100644
index 000000000000..ae1198018a72
--- /dev/null
+++ b/package/wireshark/0002-androiddump-add-missing-sys-time.h-header.patch
@@ -0,0 +1,35 @@
+From 1ab938e762ee6ebd3211c22ef25a7575e37791c4 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 29 Dec 2016 20:16:53 +0200
+Subject: [PATCH] androiddump: add missing sys/time.h header
+
+struct timeval requires sys/time.h. Fixes the following musl libc build error:
+
+androiddump.c: In function 'useSndTimeout':
+androiddump.c:262:18: error: variable 'socket_timeout' has initializer but incomplete type
+     const struct timeval socket_timeout = {
+                  ^
+
+Change-Id: I52e204f32a012aabea2e54877e564576c072fe08
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://code.wireshark.org/review/19460
+---
+ extcap/androiddump.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/extcap/androiddump.c b/extcap/androiddump.c
+index 8287c4bb1a76..fab7c10e05cc 100644
+--- a/extcap/androiddump.c
++++ b/extcap/androiddump.c
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <time.h>
++#include <sys/time.h>
+ 
+ #ifdef HAVE_NETINET_IN_H
+ #    include <netinet/in.h>
+-- 
+2.11.0
+
-- 
2.11.0
