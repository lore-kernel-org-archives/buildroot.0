From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Mar 2020 10:45:25 +0300
Subject: [Buildroot] [PATCH] package/evtest: fix build with musl 1.2.0
Message-ID: <fbc996280a1db8d4984fe4ecec2361cd2148641a.1585295125.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing issue with 64-bit time_t introduced in musl
1.2.0 for 32-bit architectures.

Fixes:
http://autobuild.buildroot.net/results/0847ef68b7f7bffa3083229ad9523dbad28db4f2/
http://autobuild.buildroot.net/results/73355877a945d3555350bea3bef70dfa68b80018/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 000000000000..e39ccb641f8d
--- /dev/null
+++ b/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,46 @@
+From 70c5dd9e858ed577a4bbe7ec8920934c89df08fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 11:58:58 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 648f5c1a9e0
+
+ evtest.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/evtest.c b/evtest.c
+index 548c203564d3..8d592f42bdca 100644
+--- a/evtest.c
++++ b/evtest.c
+@@ -61,6 +61,11 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #define BITS_PER_LONG (sizeof(long) * 8)
+ #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
+ #define OFF(x)  ((x)%BITS_PER_LONG)
+@@ -1140,7 +1145,7 @@ static int print_events(int fd)
+ 			type = ev[i].type;
+ 			code = ev[i].code;
+ 
+-			printf("Event: time %ld.%06ld, ", ev[i].time.tv_sec, ev[i].time.tv_usec);
++			printf("Event: time %ld.%06ld, ", ev[i].input_event_sec, ev[i].input_event_usec);
+ 
+ 			if (type == EV_SYN) {
+ 				if (code == SYN_MT_REPORT)
+-- 
+2.25.1
+
-- 
2.25.1
