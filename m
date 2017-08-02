From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Wed,  2 Aug 2017 23:35:39 +0530
Subject: [Buildroot] [PATCH] let-me-create: fix build with musl
Message-ID: <1501697139-9059-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix build with musl C library.

Fixes:
  http://autobuild.buildroot.net/results/af946fa6fe05ee265e4ac97742b15afeb0cea1ab

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 .../0001-fix-build-with-musl-C-library.patch       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/let-me-create/0001-fix-build-with-musl-C-library.patch

diff --git a/package/let-me-create/0001-fix-build-with-musl-C-library.patch b/package/let-me-create/0001-fix-build-with-musl-C-library.patch
new file mode 100644
index 0000000..90a7246
--- /dev/null
+++ b/package/let-me-create/0001-fix-build-with-musl-C-library.patch
@@ -0,0 +1,38 @@
+From 93fbc53a727a49dd5061e44e3156ff2044e6e0b5 Mon Sep 17 00:00:00 2001
+From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
+Date: Tue, 1 Aug 2017 22:44:22 +0530
+Subject: [PATCH] fix build with musl C library
+
+With musl C library, we get following build error:
+
+/home/buildroot/autobuild/run/instance-3/output/build/let-me-create-v1.5.2/src/core/spi.c: In function 'spi_transfer':
+/home/buildroot/autobuild/run/instance-3/output/build/let-me-create-v1.5.2/src/core/spi.c:170:19: error: '_IOC_SIZEBITS' undeclared (first use in this function)
+if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0) {
+^
+/home/buildroot/autobuild/run/instance-3/output/build/let-me-create-v1.5.2/src/core/spi.c:170:19: note: each undeclared identifier is reported only once for each function it appears in
+
+Include <linux/ioctl.h> for musl C library compatibility.
+
+This build issue is detected by Buildroot autobuilder:
+http://autobuild.buildroot.net/results/af9/af946fa6fe05ee265e4ac97742b15afeb0cea1ab/
+
+Signed-off-by: Rahul Bedarkar rahulbedarkar89 at gmail.com
+---
+Upstream status: https://github.com/CreatorDev/LetMeCreate/pull/29
+
+ src/core/spi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/core/spi.c b/src/core/spi.c
+index 4d55cee..9ec7ea9 100644
+--- a/src/core/spi.c
++++ b/src/core/spi.c
+@@ -1,4 +1,5 @@
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ #include <linux/spi/spidev.h>
+ #include <fcntl.h>
+ #include <errno.h>
+-- 
+2.7.4
+
-- 
2.7.4
