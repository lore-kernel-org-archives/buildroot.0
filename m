From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 23 Jul 2019 11:55:16 +0300
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix redefinition of
 'struct termios'
Message-ID: <20190723085516.17377-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both libc and linux defines 'struct termios', in termbits.h and
termios.h which leads to the compilation error:

In file included from custom_baud.c:23:0:

	    /home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/termbits.h:12:8:
	error: redefinition of 'struct termios'
	 struct termios {
		^~~~~~~
	In file included from
	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/termios.h:39:0,
			 from
	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/bits/ioctl-types.h:5,
			 from
	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/sys/ioctl.h:29,
			 from custom_baud.c:21:
	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/bits/termios.h:33:8:
	note: originally defined here
	 struct termios {
		^~~~~~~

So fix it by renaming 'termios' to 'asmtermios' before termbits.h only,
because 'struct termios2' is used only.

Fixes:
    http://autobuild.buildroot.net/results/797dde5cbf0e94162c7cc7b557841605c78ac2f3/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...d-fix-redefinition-of-struct-termios.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/flashrom/0002-custom_baud-fix-redefinition-of-struct-termios.patch

diff --git a/package/flashrom/0002-custom_baud-fix-redefinition-of-struct-termios.patch b/package/flashrom/0002-custom_baud-fix-redefinition-of-struct-termios.patch
new file mode 100644
index 0000000000..5c4a681303
--- /dev/null
+++ b/package/flashrom/0002-custom_baud-fix-redefinition-of-struct-termios.patch
@@ -0,0 +1,36 @@
+From e94fd14bba4fe21dcb791a44d700ad7f036b8c7e Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Tue, 23 Jul 2019 11:37:17 +0300
+Subject: [PATCH] custom_baud: fix redefinition of 'struct termios'
+
+both libc and linux kernel defines 'struct termios', once it is defined
+via termbits.h and second time it is re-defined via sys/ioctl.h. But
+because only termios2 is used so hide 'struct termios' by renaming it as
+'struct asmtermios'.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ custom_baud.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/custom_baud.c b/custom_baud.c
+index caf2b78..22fb74f 100644
+--- a/custom_baud.c
++++ b/custom_baud.c
+@@ -18,10 +18,12 @@
+ #include "custom_baud.h"
+ 
+ #if IS_LINUX
+-#include <sys/ioctl.h>
+ #include <fcntl.h>
++#define termios asmtermios
+ #include <asm-generic/termbits.h>
+ #include <asm-generic/ioctls.h>
++#undef termios
++#include <sys/ioctl.h>
+ 
+ /*
+  * This include hell above is why this is in a separate source file. See eg.
+-- 
+2.17.1
+
-- 
2.17.1
