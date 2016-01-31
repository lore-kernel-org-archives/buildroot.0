From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 09:02:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/mraa: fix musl build
Message-ID: <1454227344-20681-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These build error have not yet being found by the autobuilders:

/home/bernd/buildroot/br3/output/build/mraa-v0.9.0/src/uart/uart.c: In function ?mraa_uart_set_mode?:
/home/bernd/buildroot/br3/output/build/mraa-v0.9.0/src/uart/uart.c:364:40: error: ?CMSPAR? undeclared (first use in this function)
             termio.c_cflag |= PARENB | CMSPAR | PARODD;
                                        ^
/home/bernd/buildroot/br3/output/build/mraa-v0.9.0/src/uart/uart.c:364:40: note: each undeclared identifier is reported only once for each function it appears in
/home/bernd/buildroot/br3/output/build/mraa-v0.9.0/src/uart/uart.c: In function ?mraa_uart_data_available?:
/home/bernd/buildroot/br3/output/build/mraa-v0.9.0/src/uart/uart.c:491:20: error: storage size of ?timeout? isn?t known
     struct timeval timeout;
                    ^
/home/bernd/buildroot/br3/output/build/mraa-v0.9.0/src/uart/uart.c:502:5: error: unknown type name ?fd_set?
     fd_set readfds;

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0003-uart.c-fix-build-with-musl-libc.patch     | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/mraa/0003-uart.c-fix-build-with-musl-libc.patch

diff --git a/package/mraa/0003-uart.c-fix-build-with-musl-libc.patch b/package/mraa/0003-uart.c-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..75ceb6f
--- /dev/null
+++ b/package/mraa/0003-uart.c-fix-build-with-musl-libc.patch
@@ -0,0 +1,40 @@
+From 30e4abcd5f53bac50da874ba8795388fc05f5252 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 31 Jan 2016 08:57:05 +0100
+Subject: [PATCH 1/1] uart.c: fix build with musl libc
+
+musl does not define CMSPAR on all archs, patch inspired by
+http://git.alpinelinux.org/cgit/aports/plain/main/freerdp/musl-fix.patch
+
+musl needs sys/select.h to provide fd_set.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Patch sent upstream: https://github.com/intel-iot-devkit/mraa/pull/418
+
+ src/uart/uart.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/uart/uart.c b/src/uart/uart.c
+index 6d3973a..0f8a2e3 100644
+--- a/src/uart/uart.c
++++ b/src/uart/uart.c
+@@ -29,10 +29,15 @@
+ #include <unistd.h>
+ #include <string.h>
+ #include <termios.h>
++#include <sys/select.h>
+ 
+ #include "uart.h"
+ #include "mraa_internal.h"
+ 
++#ifndef CMSPAR
++#define CMSPAR   010000000000
++#endif
++
+ // This function takes an unsigned int and converts it to a B* speed_t
+ // that can be used with linux/posix termios
+ static speed_t
+-- 
+2.7.0.rc3
+
-- 
2.7.0.rc3
