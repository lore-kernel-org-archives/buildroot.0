From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 23:44:47 +0100
Subject: [Buildroot] [git commit] package/python-spidev: fix musl build
Message-ID: <20160201224704.411CA7F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56032eedf4d02e02ba7bf2ed687c8950f79b31fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build error was not yet being found by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-build-with-musl-libc.patch            | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/python-spidev/0001-Fix-build-with-musl-libc.patch b/package/python-spidev/0001-Fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..b22a73a
--- /dev/null
+++ b/package/python-spidev/0001-Fix-build-with-musl-libc.patch
@@ -0,0 +1,43 @@
+From 3d6e59bff088783f249a60a5f1c900c7f99f933b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 31 Jan 2016 15:03:50 +0100
+Subject: [PATCH 1/1] Fix build with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Include missing header to prevent build error:
+
+spidev_module.c: In function ???SpiDev_xfer???:
+spidev_module.c:330:27: error: ???_IOC_SIZEBITS??? undeclared (first use in this function)
+  status = ioctl(self->fd, SPI_IOC_MESSAGE(1), &xfer);
+                           ^
+spidev_module.c:330:27: note: each undeclared identifier is reported only once for each function it appears in
+spidev_module.c: In function ???SpiDev_xfer2???:
+spidev_module.c:421:27: error: ???_IOC_SIZEBITS??? undeclared (first use in this function)
+  status = ioctl(self->fd, SPI_IOC_MESSAGE(1), &xfer);
+                           ^
+
+Signed-off-by: Bernd Kuhls bernd.kuhls at t-online.de
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Patch sent upstream: https://github.com/doceme/py-spidev/pull/39
+
+ spidev_module.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/spidev_module.c b/spidev_module.c
+index d58ef07..bccaacf 100644
+--- a/spidev_module.c
++++ b/spidev_module.c
+@@ -25,6 +25,7 @@
+ #include <linux/spi/spidev.h>
+ #include <linux/types.h>
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ 
+ #define SPIDEV_MAXPATH 4096
+ 
+-- 
+2.7.0
+
