From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:27:46 +1300
Subject: [Buildroot] [git commit] package/weston: fix build with musl
Message-ID: <20170124052751.E22C3806B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43ab1e949fa8c194a05e4d4c2ae17ed2f3298632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With musl, stdint.h is not automatically pulled-in by any other header,
so it must be explicitly included.

Fixes:
    http://autobuild.buildroot.net/results/a2f5811f6029f8f3c87dcbea905b9747d55c9c24

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../weston/0006-tests-add-missing-include.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/weston/0006-tests-add-missing-include.patch b/package/weston/0006-tests-add-missing-include.patch
new file mode 100644
index 0000000..67dc3df
--- /dev/null
+++ b/package/weston/0006-tests-add-missing-include.patch
@@ -0,0 +1,36 @@
+From 4c9e149d641a9945c3a8e15707b8712834f08c4f Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 22 Jan 2017 14:46:28 +0100
+Subject: [PATCH] tests: add missing include
+
+The int32_t type is defined in stdint.h.
+
+The musl C library is very conservative in the headers that it
+internally includes, and stdint.h is not included by any other header,
+unlike with glibc or uClibc, which breaks the build.
+
+Add the missing header.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Status: sent upstream
+    https://lists.freedesktop.org/archives/wayland-devel/2017-January/032771.html
+---
+ tests/string-test.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/string-test.c b/tests/string-test.c
+index a72ec30..5571b52 100644
+--- a/tests/string-test.c
++++ b/tests/string-test.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <stdbool.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <assert.h>
+ 
+ #include "shared/string-helpers.h"
+-- 
+2.7.4
+
