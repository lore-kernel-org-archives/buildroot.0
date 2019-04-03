From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  3 Apr 2019 16:42:20 +0200
Subject: [Buildroot] [PATCH] package/bayer2rgb-neon: fix build failure with
 musl libc
Message-ID: <20190403144220.9090-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Musl libc doesn't provide ssize_t type through <stdlib.h>, need to
directly include <unistd.h>.

Add patch to include <unistd.h> in main header included in every .c/.cc
file.

Fixes:
http://autobuild.buildroot.net/results/2e9/2e99d0066fadb0802dd0d898215b2f6867603d69/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../0001-bayer2rgb.h-add-missing-header.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch

diff --git a/package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch b/package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch
new file mode 100644
index 0000000000..65302f3baf
--- /dev/null
+++ b/package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch
@@ -0,0 +1,36 @@
+From 98e22511b0b134626b4ae38089ec1725100349de Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 3 Apr 2019 16:24:16 +0200
+Subject: [PATCH] bayer2rgb.h: add missing header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The ssize_t type requires the unistd.h header. This fixes build with
+musl libc:
+
+src/convert-dumb.cc:229:2: error: ?ssize_t? was not declared in this
+scope
+  ssize_t   stride;
+  ^
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/bayer2rgb.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/bayer2rgb.h b/src/bayer2rgb.h
+index 3c96209..5337dbd 100644
+--- a/src/bayer2rgb.h
++++ b/src/bayer2rgb.h
+@@ -19,6 +19,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdint.h>
++#include <unistd.h>
+ 
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.17.1
+
-- 
2.17.1
