From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  8 Sep 2017 14:31:14 +0300
Subject: [Buildroot] [PATCH] lcdproc: fix build with musl libc
Message-ID: <fd90703c9a740c0f5653e4d6e43386a5194516f6.1504870274.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch adding missing linux ioctl header.

Fixes:
http://autobuild.buildroot.net/results/58a/58a9b98d08060c6ed9e8855ba9f59d03aa2f3e2c/
http://autobuild.buildroot.net/results/5b2/5b2c1bc872cebc7aadf93995b71178bba29e0b25/
http://autobuild.buildroot.net/results/125/12594e613f8fc106e477411f76093654a084c01c/

Cc: Sven Haardiek <sven.haardiek@greenbone.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../lcdproc/0001-Add-missing-ioctl-header.patch    | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/lcdproc/0001-Add-missing-ioctl-header.patch

diff --git a/package/lcdproc/0001-Add-missing-ioctl-header.patch b/package/lcdproc/0001-Add-missing-ioctl-header.patch
new file mode 100644
index 000000000000..8c2123594f7e
--- /dev/null
+++ b/package/lcdproc/0001-Add-missing-ioctl-header.patch
@@ -0,0 +1,50 @@
+From 6267665454501512ac054202b38e4e6a72fa284b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 8 Sep 2017 14:19:11 +0300
+Subject: [PATCH] Add missing ioctl header
+
+The spidev.h header uses macros from linux/ioctl.h. Add this header
+explicitly since some libc, like musl, do not include it implicitly.
+This fixes the following build failure:
+
+In file included from .../sysroot/usr/include/sys/ioctl.h:7:0,
+                 from hd44780-spi.c:31:
+hd44780-spi.c: In function ?spi_transfer?:
+hd44780-spi.c:89:24: error: ?_IOC_SIZEBITS? undeclared (first use in this function)
+  status = ioctl(p->fd, SPI_IOC_MESSAGE(1), &xfer);
+                        ^
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/lcdproc/lcdproc/pull/90
+
+ server/drivers/hd44780-pifacecad.c | 1 +
+ server/drivers/hd44780-spi.c       | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/server/drivers/hd44780-pifacecad.c b/server/drivers/hd44780-pifacecad.c
+index a73b9f9b1f82..55139124d852 100644
+--- a/server/drivers/hd44780-pifacecad.c
++++ b/server/drivers/hd44780-pifacecad.c
+@@ -54,6 +54,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ #include <stdint.h>
+ #include <linux/spi/spidev.h>
+ 
+diff --git a/server/drivers/hd44780-spi.c b/server/drivers/hd44780-spi.c
+index 791156f87a26..74c85fb014aa 100644
+--- a/server/drivers/hd44780-spi.c
++++ b/server/drivers/hd44780-spi.c
+@@ -29,6 +29,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ #include <stdint.h>
+ #include <linux/spi/spidev.h>
+ 
+-- 
+2.14.1
+
-- 
2.14.1
