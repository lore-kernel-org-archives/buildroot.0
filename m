From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 23:19:14 +0200
Subject: [Buildroot] [git commit] uclibc: fix clock_nanosleep declaration
Message-ID: <20180506211926.3092B8B87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba33728bc3118a6f1d2b4233e7bddb17b2f67f1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild errors:
 http://autobuild.buildroot.net/results/a58007263355e2734a8074d52b1b26b88973c39e
 http://autobuild.buildroot.net/results/7d6fd0872efd23c7de552ab637956902b43c3f58

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...re-clock_nanosleep-independent-of-thread-.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch b/package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch
new file mode 100644
index 0000000000..bb9ef18b4f
--- /dev/null
+++ b/package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch
@@ -0,0 +1,34 @@
+From 368a1df04a32c3b95859b0ca588da8548a5f39ca Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Tue, 1 May 2018 19:35:20 +0200
+Subject: [PATCH] librt: declare clock_nanosleep independent of thread support
+
+Reported-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ include/time.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/include/time.h b/include/time.h
+index 785c8f6..1a14089 100644
+--- a/include/time.h
++++ b/include/time.h
+@@ -356,7 +356,6 @@ extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
+ #  endif /* __UCLIBC_HAS_REALTIME__ */
+ 
+ #  if defined __USE_XOPEN2K && defined __UCLIBC_HAS_ADVANCED_REALTIME__
+-#   ifdef __UCLIBC_HAS_THREADS_NATIVE__
+ /* High-resolution sleep with the specified clock.
+ 
+    This function is a cancellation point and therefore not marked with
+@@ -367,7 +366,6 @@ extern int clock_nanosleep (clockid_t __clock_id, int __flags,
+ 
+ /* Return clock ID for CPU-time clock.  */
+ extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __THROW;
+-#   endif /* __UCLIBC_HAS_THREADS_NATIVE__ */
+ #  endif
+ 
+ #  if defined __UCLIBC_HAS_REALTIME__
+-- 
+2.1.4
+
