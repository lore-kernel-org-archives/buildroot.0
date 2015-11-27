From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 27 Nov 2015 16:31:21 +0100
Subject: [Buildroot] [PATCH] libsoc: fix MUSL build issue
Message-ID: <1448638281-1170-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Without <linux/ioctl.h> include compiler cannot find _IOC_SIZEBITS
macro, when using MUSL C library.

Fixes:
  http://autobuild.buildroot.net/results/c86/c86fc75212df75906222772854c283396bb880d2/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...0001-spi-fix-build-against-MUSL-C-library.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch

diff --git a/package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch b/package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch
new file mode 100644
index 0000000..7e8061b
--- /dev/null
+++ b/package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch
@@ -0,0 +1,28 @@
+From 647a3af126943b2251c82340ab7c81706b2eb805 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 27 Nov 2015 10:24:12 +0100
+Subject: [PATCH] spi: fix build against MUSL C library
+
+Without <linux/ioctl.h> include compiler cannot find _IOC_SIZEBITS
+macro, when using MUSL C library.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lib/spi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/spi.c b/lib/spi.c
+index 8465f75..6d1f78a 100644
+--- a/lib/spi.c
++++ b/lib/spi.c
+@@ -6,6 +6,7 @@
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <linux/types.h>
++#include <linux/ioctl.h>
+ #include <linux/spi/spidev.h>
+ 
+ #include "libsoc_spi.h"
+-- 
+2.1.4
+
-- 
2.1.4
