From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:37:04 +0100
Subject: [Buildroot] [git commit] package/flashrom: fix build failures with
	musl
Message-ID: <20151028224140.CDAED80503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc2c039c90336160bb58ddd2011ef89c4deb1121
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flashroms makes a few assumptions on the headers to be included.
It forgets that not everything is using glibc, so it is missing
crucial includes.

Fixes:
    http://autobuild.buildroot.org/results/2a3/2a3744007c630c267575a638ebcd83a4b97644f5/
    http://autobuild.buildroot.org/results/3de/3de936d9be79e151e66af15193084d82a0f2c04a/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/0001-spi.patch      |   25 +++++++++++++++++++++++++
 package/flashrom/0002-sys-io.h.patch |   27 +++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/flashrom/0001-spi.patch b/package/flashrom/0001-spi.patch
new file mode 100644
index 0000000..d28cb46
--- /dev/null
+++ b/package/flashrom/0001-spi.patch
@@ -0,0 +1,25 @@
+linux_spi: add missing include
+
+Some defines (e.g. _IOC_SIZEBITS) are defined in linux/ioctl.h,
+so it must be included before it is used, by SPI_IOC_MESSAGE
+from linux/spi/spidev.h
+
+Fixes build errors with the musl C library, as seen in these
+Buidlroot autobuilder failures:
+
+    http://autobuild.buildroot.org/results/2a3/2a3744007c630c267575a638ebcd83a4b97644f5/build-end.log
+    http://autobuild.buildroot.org/results/3de/3de936d9be79e151e66af15193084d82a0f2c04a/build-end.log
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN flashrom-0.9.8.orig/linux_spi.c flashrom-0.9.8/linux_spi.c
+--- flashrom-0.9.8.orig/linux_spi.c	2015-10-28 19:42:38.480285847 +0100
++++ flashrom-0.9.8/linux_spi.c	2015-10-28 19:43:15.492994613 +0100
+@@ -27,6 +27,7 @@
+ #include <ctype.h>
+ #include <unistd.h>
+ #include <linux/types.h>
++#include <linux/ioctl.h>
+ #include <linux/spi/spidev.h>
+ #include <sys/ioctl.h>
+ #include "flash.h"
diff --git a/package/flashrom/0002-sys-io.h.patch b/package/flashrom/0002-sys-io.h.patch
new file mode 100644
index 0000000..ddb2b4c
--- /dev/null
+++ b/package/flashrom/0002-sys-io.h.patch
@@ -0,0 +1,27 @@
+hwaccess: sys/io.h is not specific to glibc
+
+Under Linux, sys/io.h provides inb and outb, so we really need it.
+However, its inclusion is conditional to the _GLIBC_ define. This is
+usually OK under Linux, since both glibc and uClibc define it (uclibc
+fakes being glibc).
+
+But the mus lC library does not impersonate glibc, so we're missing
+including sys/io.h in this case.
+
+Change the include from checking _GLIBC_ to checking whether this is
+Linux, looking for the __linux__ define.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN flashrom-0.9.8.orig/hwaccess.h flashrom-0.9.8/hwaccess.h
+--- flashrom-0.9.8.orig/hwaccess.h	2015-02-10 09:03:10.000000000 +0100
++++ flashrom-0.9.8/hwaccess.h	2015-10-28 20:01:54.259202484 +0100
+@@ -27,7 +27,7 @@
+ #include "platform.h"
+ 
+ #if IS_X86
+-#if defined(__GLIBC__)
++#if defined(__linux__)
+ #include <sys/io.h>
+ #endif
+ #endif
