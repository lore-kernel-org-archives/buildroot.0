From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:39:59 +0200
Subject: [Buildroot] [git commit] package/ser2net: fix build on musl
Message-ID: <20200926133109.363C689169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa828ecafda083627008933a4a0e7b3b0e3ea5c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build on musl fails since version 4.2.2 and
https://github.com/cminyard/ser2net/commit/1703ddf5231caf08c7bb2c14a845bc2dd602159f

Fixes:
 - http://autobuild.buildroot.org/results/4c0b238186cb2fb2d81807ce006945594f92b2cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../ser2net/0001-port.h-include-sys-time.h.patch   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/ser2net/0001-port.h-include-sys-time.h.patch b/package/ser2net/0001-port.h-include-sys-time.h.patch
new file mode 100644
index 0000000000..daf5372437
--- /dev/null
+++ b/package/ser2net/0001-port.h-include-sys-time.h.patch
@@ -0,0 +1,39 @@
+From 021543b02b6fdb78c9217757736eabac90a647eb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 26 Sep 2020 12:37:38 +0200
+Subject: [PATCH] port.h: include <sys/time.h>
+
+Include <sys/time.h> to avoid the following build failure on musl:
+
+port.h:361:29: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+     const char *str, struct timeval *tv,
+                             ^~~~~~~
+portconfig.c: In function 'myconfig':
+portconfig.c:586:9: error: variable 'tv' has initializer but incomplete type
+  struct timeval tv = { 0, 0 };
+         ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4c0b238186cb2fb2d81807ce006945594f92b2cd
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/cminyard/ser2net/pull/34]
+---
+ port.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/port.h b/port.h
+index 048c5bd..86c3b1d 100644
+--- a/port.h
++++ b/port.h
+@@ -9,6 +9,7 @@
+ #define PORT
+ 
+ #include <netdb.h>
++#include <sys/time.h>
+ #include "gbuf.h"
+ #include "absout.h"
+ 
+-- 
+2.28.0
+
