From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 7 Jul 2016 19:49:08 +0200
Subject: [Buildroot] [PATCH] directfb: fix compile for m68k
Message-ID: <20160707174908.GA22788@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/162db0d62075a16c7abae1229676e2cdb29fe953/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
- Idea from
  http://lists.busybox.net/pipermail/buildroot/2015-February/120281.html
- Will only work for uClibc-ng >= 1.0.15 -> rebuild of external
  toolchain required, because of Linuxthreads renaming
---
 ...sable-pthread_getattr_np-for-Linuxthreads.patch | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/directfb/0006-disable-pthread_getattr_np-for-Linuxthreads.patch

diff --git a/package/directfb/0006-disable-pthread_getattr_np-for-Linuxthreads.patch b/package/directfb/0006-disable-pthread_getattr_np-for-Linuxthreads.patch
new file mode 100644
index 0000000..88d56f7
--- /dev/null
+++ b/package/directfb/0006-disable-pthread_getattr_np-for-Linuxthreads.patch
@@ -0,0 +1,23 @@
+Fix compile for uClibc-ng and Linuxthreads
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur DirectFB-1.7.7.orig/lib/direct/os/linux/glibc/thread.c DirectFB-1.7.7/lib/direct/os/linux/glibc/thread.c
+--- DirectFB-1.7.7.orig/lib/direct/os/linux/glibc/thread.c	2014-07-15 08:54:58.000000000 +0200
++++ DirectFB-1.7.7/lib/direct/os/linux/glibc/thread.c	2016-07-07 18:26:18.085793056 +0200
+@@ -152,12 +152,15 @@
+ 
+      pthread_attr_destroy( &attr );
+ 
++/* uClibc-ng does not implement pthread_getattr_np for Linuxthreads */
++#if !defined(__UCLIBC_HAS_LINUXTHREADS__)
+      /* Read (back) value. */
+      pthread_getattr_np( thread->handle.thread, &attr );
+      pthread_attr_getstacksize( &attr, &thread->stack_size );
+      pthread_attr_getschedparam( &attr, &param );
+      thread->priority = param.sched_priority;
+      pthread_attr_destroy( &attr );
++#endif
+ 
+      return DR_OK;
+ }
-- 
2.1.4
