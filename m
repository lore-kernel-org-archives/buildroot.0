From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Jul 2021 22:43:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build on sparc
Message-ID: <20210720204319.79578-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix the following build failure on sparc which is raised since bump to
version 2021-06-R1 in commit 5e3a1e6c7cc3e42b222ecbe30b9afaaa9d6b1c33

Fixes:
 - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-nrf_51822.h-fix-build-on-sparc.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch

diff --git a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
new file mode 100644
index 0000000000..c675654721
--- /dev/null
+++ b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
@@ -0,0 +1,59 @@
+From b347fea1a5ba0f66bf15e7de56d748e0f0dd624a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 20 Jul 2021 22:27:45 +0200
+Subject: [PATCH] nrf_51822.h: fix build on sparc
+
+apple is not the only target that miss some defines, for example build
+fails on sparc with:
+
+capture_nrf_51822.c: In function 'get_baud':
+capture_nrf_51822.c:80:16: error: 'B2500000' undeclared (first use in this function); did you mean 'B2000000'?
+   80 |         return B2500000;
+      |                ^~~~~~~~
+      |                B2000000
+capture_nrf_51822.c:80:16: note: each undeclared identifier is reported only once for each function it appears in
+capture_nrf_51822.c:82:16: error: 'B3000000' undeclared (first use in this function); did you mean 'B2000000'?
+   82 |         return B3000000;
+      |                ^~~~~~~~
+      |                B2000000
+capture_nrf_51822.c:84:16: error: 'B3500000' undeclared (first use in this function); did you mean 'B500000'?
+   84 |         return B3500000;
+      |                ^~~~~~~~
+      |                B500000
+capture_nrf_51822.c:86:16: error: 'B4000000' undeclared (first use in this function); did you mean 'B2000000'?
+   86 |         return B4000000;
+      |                ^~~~~~~~
+      |                B2000000
+
+Fixes:
+ - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kismetwireless/kismet/pull/388]
+---
+ capture_nrf_51822/nrf_51822.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/capture_nrf_51822/nrf_51822.h b/capture_nrf_51822/nrf_51822.h
+index cf7fee1e..d9203f61 100644
+--- a/capture_nrf_51822/nrf_51822.h
++++ b/capture_nrf_51822/nrf_51822.h
+@@ -3,7 +3,6 @@
+ #ifndef __NRF51822_H__
+ #define __NRF51822_H__
+ 
+-#ifdef __APPLE__
+ #ifndef B9600
+ #define B9600 9600
+ #endif
+@@ -58,7 +57,6 @@
+ #ifndef B4000000
+ #define B4000000 4000000
+ #endif
+-#endif
+ 
+ 
+ 
+-- 
+2.30.2
+
-- 
2.30.2
