From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 15:29:56 +0200
Subject: [Buildroot] [git commit] linuxptp: add patch to fix
 no-thread/linuxthreads uClibc builds
Message-ID: <20180805132759.F12828B4CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2cae70b82bbb1c85307c5947e1b441567038fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linuxptp missing.h header implements a replacement clock_nanosleep()
function, which was used when the thread implementation was not NPTL,
because uClibc failed to provide clock_nanosleep() in such
configurations.

However, uClibc-ng has fixed this problem upstream, and has backported
this change in Buildroot in patch
package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch
(the code is upstream and will be part of uClibc-ng 1.0.31). Due to
this, there is now a conflicting definition of clock_nanosleep()
between the C library and the linuxptp missing.h code, which manifests
itself by the following build failure:

missing.h:117:19: error: static declaration of 'clock_nanosleep' follows non-static declaration
 static inline int clock_nanosleep(clockid_t clock_id, int flags,
                   ^~~~~~~~~~~~~~~
In file included from clockadj.h:24:0,
                 from clockadj.c:24:

This commit fixes that by adding a patch that removes the replacement
clock_nanosleep() implementation from the linuxptp code base.

Fixes:

  http://autobuild.buildroot.net/results/bf400095a853f5beb28c77a50fcffefe52c3d769/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...issing.h-drop-clock_nanosleep-replacement.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch b/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
new file mode 100644
index 0000000000..54ef963ae4
--- /dev/null
+++ b/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
@@ -0,0 +1,49 @@
+From 947bf03ec3d9eaa0bfc0269eed86b9364e94bc1a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 5 Aug 2018 15:25:53 +0200
+Subject: [PATCH] missing.h: drop clock_nanosleep() replacement
+
+Since uClibc-ng commits 68628fe7d463541bf3c33da6b214e63c0cc9feed
+("librt: declare clock_nanosleep not only for NPTL") and
+ddbb03e77ac1a48740688814b82f45c97ee81f37 ("librt: clock_nanosleep
+could be even used without threads"), clock_nanosleep() is always
+provided by uClibc, regardless of the thread implementation (none,
+linuxthreads, nptl). These commits will be part of the upcoming 1.0.31
+release of uClibc-ng.
+
+Thanks to this, we can drop the replacement clock_nanosleep()
+implementation added by linuxptp. Without this, linuxptp fails to
+build with:
+
+missing.h:117:19: error: static declaration of 'clock_nanosleep' follows non-static declaration
+ static inline int clock_nanosleep(clockid_t clock_id, int flags,
+                   ^~~~~~~~~~~~~~~
+In file included from clockadj.h:24:0,
+                 from clockadj.c:24:
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ missing.h | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/missing.h b/missing.h
+index 2f7adb9..60f89a3 100644
+--- a/missing.h
++++ b/missing.h
+@@ -129,13 +129,6 @@ enum {
+ 
+ #define TFD_TIMER_ABSTIME (1 << 0)
+ 
+-static inline int clock_nanosleep(clockid_t clock_id, int flags,
+-				  const struct timespec *request,
+-				  struct timespec *remain)
+-{
+-	return syscall(__NR_clock_nanosleep, clock_id, flags, request, remain);
+-}
+-
+ static inline int timerfd_create(int clockid, int flags)
+ {
+ 	return syscall(__NR_timerfd_create, clockid, flags);
+-- 
+2.14.4
+
