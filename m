From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Oct 2017 23:16:31 +0200
Subject: [Buildroot] [git commit] package/weston: fix build on musl
Message-ID: <20171001211816.953078041A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ca2a9ce4b3167cbc223a50665ef7f95ce862130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As usual, musl is more conservative than the alternatives, wrt to
headers that are internally included.

Fixes:
    http://autobuild.buildroot.org/results/a7a/a7a6b17dff09a45a35185a0e02704523b815dd57/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-shared-struct-timespec-is-in-time.h.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/weston/0002-shared-struct-timespec-is-in-time.h.patch b/package/weston/0002-shared-struct-timespec-is-in-time.h.patch
new file mode 100644
index 0000000..28476d3
--- /dev/null
+++ b/package/weston/0002-shared-struct-timespec-is-in-time.h.patch
@@ -0,0 +1,44 @@
+From 47535b50c4178d62b848b3e9d3524e4f6282c815 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 1 Oct 2017 14:17:21 +0200
+Subject: [PATCH] shared: struct timespec is in time.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On the musl C library, tests/timespec-text.c does not build, with the
+following error:
+
+    In file included from tests/timespec-test.c:36:0:
+    ./shared/timespec-util.h:41:21: warning: ???struct timespec??? declared
+    inside parameter list will not be visible outside of this definition
+    or declaration
+     timespec_sub(struct timespec *r,
+                         ^~~~~~~~
+   [...]
+
+Indeed, struct timespec is defined in time.h, so we must include it.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Upstream status: submitted
+    https://lists.freedesktop.org/archives/wayland-devel/2017-October/035306.html
+---
+ shared/timespec-util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/shared/timespec-util.h b/shared/timespec-util.h
+index 576b3e8f..34a120ae 100644
+--- a/shared/timespec-util.h
++++ b/shared/timespec-util.h
+@@ -28,6 +28,7 @@
+ 
+ #include <stdint.h>
+ #include <assert.h>
++#include <time.h>
+ 
+ #define NSEC_PER_SEC 1000000000
+ 
+-- 
+2.11.0
+
