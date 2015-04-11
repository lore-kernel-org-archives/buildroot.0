From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 11:30:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxml2: Fix musl compile
Message-ID: <1428744655-14261-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...s-use-forward-declarations-only-for-glibc.patch |   52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/libxml2/0002-threads-use-forward-declarations-only-for-glibc.patch

diff --git a/package/libxml2/0002-threads-use-forward-declarations-only-for-glibc.patch b/package/libxml2/0002-threads-use-forward-declarations-only-for-glibc.patch
new file mode 100644
index 0000000..4123306
--- /dev/null
+++ b/package/libxml2/0002-threads-use-forward-declarations-only-for-glibc.patch
@@ -0,0 +1,52 @@
+Fix musl compile
+
+Downloaded from upstream commit
+https://git.gnome.org/browse/libxml2/commit/?id=fff8a6b87e05200a0ad0af6f86c2e859c7de9172
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+From fff8a6b87e05200a0ad0af6f86c2e859c7de9172 Mon Sep 17 00:00:00 2001
+From: Michael Heimpold <mhei@heimpold.de>
+Date: Mon, 22 Dec 2014 11:12:12 +0800
+Subject: threads: use forward declarations only for glibc
+
+Fixes bug #704908
+
+The declarations of pthread functions, used to generate weak references
+to them, fail to suppress macros. Thus, if any pthread function has
+been provided as a macro, compiling threads.c will fail.
+This breaks on musl libc, which defines pthread_equal as a macro (in
+addition to providing the function, as required).
+
+Prevent the declarations for e.g. musl libc by refining the condition.
+
+The idea for this solution was borrowed from the alpine linux guys, see
+http://git.alpinelinux.org/cgit/aports/tree/main/libxml2/libxml2-pthread.patch
+
+Signed-off-by: Michael Heimpold <mhei@heimpold.de>
+
+diff --git a/threads.c b/threads.c
+index 8921204..78006a2 100644
+--- a/threads.c
++++ b/threads.c
+@@ -47,7 +47,7 @@
+ #ifdef HAVE_PTHREAD_H
+ 
+ static int libxml_is_threaded = -1;
+-#ifdef __GNUC__
++#if defined(__GNUC__) && defined(__GLIBC__)
+ #ifdef linux
+ #if (__GNUC__ == 3 && __GNUC_MINOR__ >= 3) || (__GNUC__ > 3)
+ extern int pthread_once (pthread_once_t *__once_control,
+@@ -89,7 +89,7 @@ extern int pthread_cond_signal ()
+ 	   __attribute((weak));
+ #endif
+ #endif /* linux */
+-#endif /* __GNUC__ */
++#endif /* defined(__GNUC__) && defined(__GLIBC__) */
+ #endif /* HAVE_PTHREAD_H */
+ 
+ /*
+-- 
+cgit v0.10.2
+
-- 
1.7.10.4
