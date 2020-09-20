From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 16:08:09 +0200
Subject: [Buildroot] [git commit] package/iwd: fix build with uclibc
Message-ID: <20200920140002.0A92A875B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3a99230203597ab89b776c6e371f17b0d68e4ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is needed to fix a build failure with iwd 1.9.0 and uclibc

Fixes:
 - http://autobuild.buildroot.org/results/c7a0096a269bfc52bd8e23d453d36d5bfb61441d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../iwd/0001-src-ap.c-fix-build-with-uclibc.patch  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..97f8c5a8e7
--- /dev/null
+++ b/package/iwd/0001-src-ap.c-fix-build-with-uclibc.patch
@@ -0,0 +1,36 @@
+From 377df79e83e2127a087e1aa5ba6173e195e50933 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 10 Sep 2020 07:47:14 +0200
+Subject: [PATCH] src/ap.c: fix build with uclibc
+
+explicit_bzero is used in src/ap.c since commit
+d55e00b31d7bccdbb2ea1cdeb0a749df77a51e47 but src/missing.h is not
+included, as a result build with uclibc fails on:
+
+/srv/storage/autobuild/run/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/ap.o: in function `ap_probe_req_cb':
+ap.c:(.text+0x23d8): undefined reference to `explicit_bzero'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c7a0096a269bfc52bd8e23d453d36d5bfb61441d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream: https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=0a6de7932a61ec82aca4f78f71dab7247c897860]
+---
+ src/ap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ap.c b/src/ap.c
+index c972cfcb..ac705c31 100644
+--- a/src/ap.c
++++ b/src/ap.c
+@@ -31,6 +31,7 @@
+ 
+ #include "linux/nl80211.h"
+ 
++#include "src/missing.h"
+ #include "src/iwd.h"
+ #include "src/module.h"
+ #include "src/scan.h"
+-- 
+2.28.0
+
