From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 9 Aug 2015 20:13:36 +0200
Subject: [Buildroot] [PATCH v2] postgresql: fix sparc compile issue
Message-ID: <20150809181336.GA23188@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuilder compile error:
http://autobuild.buildroot.net/results/f374d3535cf91f139ce80703cd2d0a2be5d3b2b1/

The predefines are wrong:
./output/host/usr/bin/sparc-buildroot-linux-uclibc-gcc -dM -E - </dev/null|grep sparc
#define sparc 1                                                                                                                                                                
#define __sparc__ 1                                                                                                                                                            
#define __sparc 1                                                                                                                                                              
#define __sparc_v8__ 1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Changes v1 -> v2:
  - keep Solaris gcc specific defines as suggested by Thomas Petazzoni

---
 package/postgresql/0002-fix-sparc-compile.patch |   38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/postgresql/0002-fix-sparc-compile.patch

diff --git a/package/postgresql/0002-fix-sparc-compile.patch b/package/postgresql/0002-fix-sparc-compile.patch
new file mode 100644
index 0000000..9eec23a
--- /dev/null
+++ b/package/postgresql/0002-fix-sparc-compile.patch
@@ -0,0 +1,38 @@
+The gcc predefines for Linux are __sparc_v8__/__sparc_v7__
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur postgresql-9.4.4.orig/src/include/storage/s_lock.h postgresql-9.4.4/src/include/storage/s_lock.h
+--- postgresql-9.4.4.orig/src/include/storage/s_lock.h	2015-06-09 21:29:38.000000000 +0200
++++ postgresql-9.4.4/src/include/storage/s_lock.h	2015-08-09 19:57:06.000000000 +0200
+@@ -420,12 +420,12 @@
+ :		"=r"(_res), "+m"(*lock)
+ :		"r"(lock)
+ :		"memory");
+-#if defined(__sparcv7)
++#if defined(__sparcv7) || defined(__sparc_v7__)
+ 	/*
+ 	 * No stbar or membar available, luckily no actually produced hardware
+ 	 * requires a barrier.
+ 	 */
+-#elif defined(__sparcv8)
++#elif defined(__sparcv8) || defined(__sparc_v8__)
+ 	/* stbar is available (and required for both PSO, RMO), membar isn't */
+ 	__asm__ __volatile__ ("stbar	 \n":::"memory");
+ #else
+@@ -438,13 +438,13 @@
+ 	return (int) _res;
+ }
+ 
+-#if defined(__sparcv7)
++#if defined(__sparcv7) || defined(__sparc_v7__)
+ /*
+  * No stbar or membar available, luckily no actually produced hardware
+  * requires a barrier.
+  */
+ #define S_UNLOCK(lock)		(*((volatile slock_t *) (lock)) = 0)
+-#elif defined(__sparcv8)
++#elif defined(__sparcv8) || defined(__sparc_v8__)
+ /* stbar is available (and required for both PSO, RMO), membar isn't */
+ #define S_UNLOCK(lock)	\
+ do \
-- 
1.7.10.4
