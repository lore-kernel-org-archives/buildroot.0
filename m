From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 22:44:44 +0200
Subject: [Buildroot] [git commit] c-periphery: add patch to fix musl
	compatibility
Message-ID: <20150808204513.80C8B80E46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60974ee92dd8ff9e43cc6b785ea5131a8851e74c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/ebfc9a44a305ab45305f8b393761304576ae9077/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Add-missing-header-for-musl-compatibility.patch |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch b/package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch
new file mode 100644
index 0000000..108297c
--- /dev/null
+++ b/package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch
@@ -0,0 +1,32 @@
+From 1d8cb0ad54099c3d7261aaa19a2c0786f16736d0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 8 Aug 2015 22:42:39 +0200
+Subject: [PATCH] Add missing header for musl compatibility
+
+<linux/ioctl.h> is needed to get the definition of _IOC_SIZEBITS and
+solve the following build failure:
+
+src/spi.c: In function 'spi_transfer':
+src/spi.c:100:24: error: '_IOC_SIZEBITS' undeclared (first use in this function)
+     if (ioctl(spi->fd, SPI_IOC_MESSAGE(1), &spi_xfer) < 1)
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/spi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/spi.c b/src/spi.c
+index 52a8d3d..1a6b17c 100644
+--- a/src/spi.c
++++ b/src/spi.c
+@@ -16,6 +16,7 @@
+ #include <errno.h>
+ 
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ #include <linux/spi/spidev.h>
+ 
+ #include "spi.h"
+-- 
+2.5.0
+
