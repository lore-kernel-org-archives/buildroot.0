From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Aug 2019 10:23:10 +0300
Subject: [Buildroot] [PATCH] package/evtest: fix build with musl libc
Message-ID: <e2ce15f16bd923a646e479cae502778116258d1a.1566112990.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch adding missing limits.h header include.

Fixes:
http://autobuild.buildroot.net/results/c5f1b95741b37f6d949b3407fff901a960c6b781/
http://autobuild.buildroot.net/results/b09a6b340f0a96081a55764b5dad0c2c31240cef/
http://autobuild.buildroot.net/results/90c7a092a5492699406d3f46e0039d253146b6b7/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-Add-missing-limits.h-include.patch   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/evtest/0001-Add-missing-limits.h-include.patch

diff --git a/package/evtest/0001-Add-missing-limits.h-include.patch b/package/evtest/0001-Add-missing-limits.h-include.patch
new file mode 100644
index 000000000000..6c7fc90482bb
--- /dev/null
+++ b/package/evtest/0001-Add-missing-limits.h-include.patch
@@ -0,0 +1,38 @@
+From 7d7c5a81b0e2f3321d269b7acc450d1eec7a910b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 18 Aug 2019 09:57:23 +0300
+Subject: [PATCH] Add missing limits.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build with musl libc that does not include limits.h indirectly via
+other headers.
+
+evtest.c: In function ?scan_devices?:
+evtest.c:886:14: error: ?PATH_MAX? undeclared (first use in this function); did you mean  INT8_MAX??
+   char fname[PATH_MAX];
+              ^~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to input-tools at lists.freedesktop.org (moderated)
+
+ evtest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/evtest.c b/evtest.c
+index 37d4f8540333..548c203564d3 100644
+--- a/evtest.c
++++ b/evtest.c
+@@ -56,6 +56,7 @@
+ #include <getopt.h>
+ #include <ctype.h>
+ #include <signal.h>
++#include <limits.h>
+ #include <sys/time.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+-- 
+2.23.0.rc1
+
-- 
2.23.0.rc1
