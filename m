From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:56:29 +0200
Subject: [Buildroot] [git commit] package/evtest: fix build with musl 1.2.0
Message-ID: <20200330064308.49CE98A3FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3adc71b070f4f71f500b13e10da33174a9747c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing issue with 64-bit time_t introduced in musl
1.2.0 for 32-bit architectures.

Fixes:
http://autobuild.buildroot.net/results/0847ef68b7f7bffa3083229ad9523dbad28db4f2/
http://autobuild.buildroot.net/results/73355877a945d3555350bea3bef70dfa68b80018/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-build-on-32bit-arches-with-64bit-time_t.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/package/evtest/0002-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..e39ccb641f
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
