From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 09:41:27 +0200
Subject: [Buildroot] [PATCH 2/2] python-psutil: fix build against musl C
	library
In-Reply-To: <20160920074127.22328-1-peter@korsgaard.com>
References: <20160920074127.22328-1-peter@korsgaard.com>
Message-ID: <20160920074127.22328-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/365/365c2f0b32ae3cb1d6d4d8f0145500dfadd05c59/
http://autobuild.buildroot.org/results/140/140d0ec9d94f75453c4c82e18803c8d7bffcf6be/

And many more.

The sysinfo structure definition in linux/sysinfo.h (which gets indirectly
included from linux/kernel.h) conflicts with the definition in sys/sysinfo.h
when building against the musl C library, leading to build failures:

arm-linux-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes \
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DPSUTIL_VERSION=430 \
  -c psutil/_psutil_linux.c -o build/temp.linux-x86_64-3.5/psutil/_psutil_linux.o
In file included from /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/kernel.h:4:0,
                 from /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/ethtool.h:16,
                 from psutil/_psutil_linux.c:35:
/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
 struct sysinfo {
        ^
In file included from psutil/_psutil_linux.c:21:0:
/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here

We NEED both sys/sysinfo.h and the kernel headers (E.G. for ethtool), so
hack around it by ensuring the content of linux/sysinfo.h doesn't get
expanded when building against musl.

We cannot do it unconditionally as glibc/uClibc rely on the linux/sysinfo.h
definition. Musl provides no detection define, so instead detect that we
are NOT on glibc/uClibc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-build-against-musl-C-library.patch    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/python-psutil/0001-fix-build-against-musl-C-library.patch

diff --git a/package/python-psutil/0001-fix-build-against-musl-C-library.patch b/package/python-psutil/0001-fix-build-against-musl-C-library.patch
new file mode 100644
index 0000000..0ef994d
--- /dev/null
+++ b/package/python-psutil/0001-fix-build-against-musl-C-library.patch
@@ -0,0 +1,63 @@
+From d08ba65306c7f9ac9c0590cfe313d3ce0f8873be Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 19 Sep 2016 23:41:54 +0200
+Subject: [PATCH] fix build against musl C library
+
+The sysinfo structure definition in linux/sysinfo.h (which gets indirectly
+included from linux/kernel.h) conflicts with the definition in sys/sysinfo.h
+when building against the musl C library, leading to build failures:
+
+http://autobuild.buildroot.net/results/365/365c2f0b32ae3cb1d6d4d8f0145500dfadd05c59/build-end.log
+
+arm-linux-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes \
+ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DPSUTIL_VERSION=430 \
+  -c psutil/_psutil_linux.c -o build/temp.linux-x86_64-3.5/psutil/_psutil_linux.o
+In file included from /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/kernel.h:4:0,
+                 from /home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/ethtool.h:16,
+                 from psutil/_psutil_linux.c:35:
+/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
+ struct sysinfo {
+        ^
+In file included from psutil/_psutil_linux.c:21:0:
+/home/buildroot/build/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
+
+We NEED both sys/sysinfo.h and the kernel headers (E.G. for ethtool), so
+hack around it by ensuring the content of linux/sysinfo.h doesn't get
+expanded when building against musl.
+
+We cannot do it unconditionally as glibc/uClibc rely on the linux/sysinfo.h
+definition. Musl provides no detection define, so instead detect that we
+are NOT on glibc/uClibc.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ psutil/_psutil_linux.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/psutil/_psutil_linux.c b/psutil/_psutil_linux.c
+index 19fd14b..fa7617a 100644
+--- a/psutil/_psutil_linux.c
++++ b/psutil/_psutil_linux.c
+@@ -16,6 +16,19 @@
+ #include <features.h>
+ #include <utmp.h>
+ #include <sched.h>
++
++#ifndef __GLIBC__
++/*
++ * linux/sysinfo.h (which gets indirectly included by other kernel headers)
++ * conflicts with sys/sysinfo.h on musl, so make sure it doesn't get expanded.
++ * We cannot do this unconditionally as E.G. glibc/uClibc rely on the
++ * linux/sysinfo.h definition.
++ * Musl provides no detection define, so instead detect that we are
++ * NOT on glibc/uClibc.
++ */
++#define _LINUX_SYSINFO_H
++#endif
++
+ #include <linux/version.h>
+ #include <sys/syscall.h>
+ #include <sys/sysinfo.h>
+-- 
+2.9.3
+
-- 
2.9.3
