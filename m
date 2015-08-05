From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  5 Aug 2015 12:43:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: add patch to fix musl gcc5
	build issue
Message-ID: <1438771429-15145-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch from the Alpine Linux project [1] to fix a musl build issue with
gcc 5:

```
error: temporary of non-literal type ?pthread_mutex_t? in a constant expression
  constexpr PosixMutex():mutex(PTHREAD_MUTEX_INITIALIZER) {}
```

Problem has been reported by the Alpine team upstream and was closed by the MPD
maintainer with WONTFIX:
http://bugs.musicpd.org/view.php?id=4387
http://bugs.musicpd.org/view.php?id=4110

However...

POSIX does not permit using PTHREAD_COND_INITIALIZER except for static
initialization, and certainly does not permit using it as a value.

Also POSIX does not specify the type of the object (it's opaque) so if
there are any types for which their code would be invalid C++, then their
code is invalid.

Also, volatile in the type is necessary. without that, LTO can break the code.

[1]
http://git.alpinelinux.org/cgit/aports/log/main/mpd/musl-gcc5-fixes.patch

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/0002-musl-gcc5-fixes.patch | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/mpd/0002-musl-gcc5-fixes.patch

diff --git a/package/mpd/0002-musl-gcc5-fixes.patch b/package/mpd/0002-musl-gcc5-fixes.patch
new file mode 100644
index 0000000..a4c65cc
--- /dev/null
+++ b/package/mpd/0002-musl-gcc5-fixes.patch
@@ -0,0 +1,56 @@
+musl gcc5 fixes
+
+Fetch from:
+http://git.alpinelinux.org/cgit/aports/plain/main/mpd/musl-gcc5-fixes.patch
+
+Problem has been reported upstream and closed with WONTFIX:
+http://bugs.musicpd.org/view.php?id=4387
+http://bugs.musicpd.org/view.php?id=4110
+
+however...
+
+POSIX does not permit using PTHREAD_COND_INITIALIZER except for static
+initialization, and certainly does not permit using it as a value
+
+also POSIX does not specify the type of the object (it's opaque) so if
+there are any types for which their code would be invalid C++, then their
+code is invalid
+
+also, volatile in the type is necessary. without that, LTO can break the code.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+--- ./src/notify.hxx.orig
++++ ./src/notify.hxx
+@@ -28,7 +28,7 @@
+ 	Cond cond;
+ 	bool pending;
+ 
+-#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__)
++#if defined(__GLIBC__)
+ 	constexpr
+ #endif
+ 	notify():pending(false) {}
+--- ./src/thread/PosixCond.hxx.orig
++++ ./src/thread/PosixCond.hxx
+@@ -41,7 +41,7 @@
+ 	pthread_cond_t cond;
+ 
+ public:
+-#if defined(__NetBSD__) || defined(__BIONIC__)
++#if !defined(__GLIBC__)
+ 	/* NetBSD's PTHREAD_COND_INITIALIZER is not compatible with
+ 	   "constexpr" */
+ 	PosixCond() {
+--- ./src/thread/PosixMutex.hxx.orig
++++ ./src/thread/PosixMutex.hxx
+@@ -41,7 +41,7 @@
+ 	pthread_mutex_t mutex;
+ 
+ public:
+-#if defined(__NetBSD__) || defined(__BIONIC__)
++#if !defined(__GLIBC__)
+ 	/* NetBSD's PTHREAD_MUTEX_INITIALIZER is not compatible with
+ 	   "constexpr" */
+ 	PosixMutex() {
+
-- 
2.5.0
