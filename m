From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Tue, 15 Jul 2014 10:28:34 +0530
Subject: [Buildroot] [PATCH] make: fix glob building failure for uClibc
Message-ID: <1405400315-11707-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before declaring externel references to glob64 and globfree64, 
check if uClibC has GNU glob support

fixes:
http://autobuild.buildroot.net/results/22927ef1d6c2eeba02361f4b041fe3ee8d5c4704/

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/make/make-uClib-glob.patch |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/make/make-uClib-glob.patch

diff --git a/package/make/make-uClib-glob.patch b/package/make/make-uClib-glob.patch
new file mode 100644
index 0000000..1d9a8bd
--- /dev/null
+++ b/package/make/make-uClib-glob.patch
@@ -0,0 +1,18 @@
+diff -Nurp make-3.82_orig/glob/glob.h make-3.82/glob/glob.h
+--- make-3.82_orig/glob/glob.h	2014-07-02 17:47:46.145132289 +0530
++++ make-3.82/glob/glob.h	2014-07-02 17:50:10.545132374 +0530
+@@ -186,12 +186,14 @@ extern int glob __P ((__const char *__pa
+ /* Free storage allocated in PGLOB by a previous `glob' call.  */
+ extern void globfree __P ((glob_t *__pglob));
+ #else
++#if defined __USE_GNU && defined __UCLIBC_HAS_GNU_GLOB__
+ extern int glob __P ((__const char *__pattern, int __flags,
+ 		      int (*__errfunc) (__const char *, int),
+ 		      glob_t *__pglob)) __asm__ ("glob64");
+ 
+ extern void globfree __P ((glob_t *__pglob)) __asm__ ("globfree64");
+ #endif
++#endif
+ 
+ 
+ #ifdef _GNU_SOURCE
-- 
1.7.9.5
