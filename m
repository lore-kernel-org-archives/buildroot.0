From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 21:57:39 +0200
Subject: [Buildroot] [git commit] wiringpi: fix musl compile
Message-ID: <20160609195744.817B981E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d146e00f7d67bd8ddb8baf0771dd63ca997fa164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  wiringPiSPI.c:89:35: error: '_IOC_SIZEBITS' undeclared (first use in this function)

Patch from yocto meta-raspberrypi [2] adding include of asm/ioctl.h.

[1] http://autobuild.buildroot.net/results/e9d/e9d680af7eea6d6c68c8e48248b5cc5b29389baa
[2] https://github.com/agherzan/meta-raspberrypi/blob/master/recipes-devtools/wiringPi/wiringpi/0001-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...de-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch b/package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
new file mode 100644
index 0000000..6480e3c
--- /dev/null
+++ b/package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
@@ -0,0 +1,60 @@
+From 7f65eb37a82a6d9b095d9c8f262ad9dd205acd03 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Jan 2016 16:57:38 -0800
+Subject: [PATCH] include <asm/ioctl.h> directly for _IOC_SIZEBITS
+
+Fixes errors like
+| wiringPiSPI.c: In function 'wiringPiSPIDataRW':
+| wiringPiSPI.c:89:35: error: '_IOC_SIZEBITS' undeclared (first use in
+this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Patch from https://raw.githubusercontent.com/agherzan/meta-raspberrypi/master/recipes-devtools/wiringPi/wiringpi/0001-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch]
+Signed-off-by: Peter Seiderere <ps.report@gmx.net>
+---
+Upstream-Status: Submitted
+
+ wiringPi/wiringPi.c    | 1 +
+ wiringPi/wiringPiI2C.c | 1 +
+ wiringPi/wiringPiSPI.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/wiringPi/wiringPi.c b/wiringPi/wiringPi.c
+index 32e5100..cb5db9d 100644
+--- a/wiringPi/wiringPi.c
++++ b/wiringPi/wiringPi.c
+@@ -64,6 +64,7 @@
+ #include <time.h>
+ #include <fcntl.h>
+ #include <pthread.h>
++#include <asm/ioctl.h>
+ #include <sys/time.h>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
+diff --git a/wiringPi/wiringPiI2C.c b/wiringPi/wiringPiI2C.c
+index c787bce..efdf53c 100644
+--- a/wiringPi/wiringPiI2C.c
++++ b/wiringPi/wiringPiI2C.c
+@@ -52,6 +52,7 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <asm/ioctl.h>
+ 
+ #include "wiringPi.h"
+ #include "wiringPiI2C.h"
+diff --git a/wiringPi/wiringPiSPI.c b/wiringPi/wiringPiSPI.c
+index 453df31..ae3c7d9 100644
+--- a/wiringPi/wiringPiSPI.c
++++ b/wiringPi/wiringPiSPI.c
+@@ -27,6 +27,7 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <string.h>
++#include <asm/ioctl.h>
+ #include <sys/ioctl.h>
+ #include <linux/spi/spidev.h>
+ 
+-- 
+2.7.0
+
