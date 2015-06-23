From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 23 Jun 2015 20:21:20 +0300
Subject: [Buildroot] [PATCH] gpsd: fix build with musl
Message-ID: <07e6ebc91a63c508bf4caeb2594def8164556281.1435080080.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch adding missing include.

Fixes:
http://autobuild.buildroot.net/results/493/493ddaf63f41918d718b5c26e2db258c67dba0a6/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../gpsd/0001-Fix-build-against-musl-libc.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/gpsd/0001-Fix-build-against-musl-libc.patch

diff --git a/package/gpsd/0001-Fix-build-against-musl-libc.patch b/package/gpsd/0001-Fix-build-against-musl-libc.patch
new file mode 100644
index 000000000000..c7c5b2333c8f
--- /dev/null
+++ b/package/gpsd/0001-Fix-build-against-musl-libc.patch
@@ -0,0 +1,36 @@
+From 2f1b033094df266008d9c4070cd7be33e93a4e12 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 19 Jun 2015 08:08:32 +0300
+Subject: [PATCH] Fix build against musl libc
+
+musl does not include sys/ttydefaults.h from sys/termios.h. Include it
+explicitly.
+
+Fixes build failures like:
+
+gpsmon.o: In function `main':
+gpsmon.c:(.text.startup+0x8f4): undefined reference to `CTRL'
+
+Upstream status: sent
+(http://lists.nongnu.org/archive/html/gpsd-dev/2015-06/msg00031.html)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ gpsmon.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gpsmon.c b/gpsmon.c
+index c3001c865821..0ccf74110b5a 100644
+--- a/gpsmon.c
++++ b/gpsmon.c
+@@ -20,6 +20,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/select.h>
++#include <sys/ttydefaults.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+ 
+-- 
+2.1.4
+
-- 
2.1.4
