From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:55:44 +0200
Subject: [Buildroot] [git commit] postgresql: fix sparc compile issue
Message-ID: <20150810135551.01ED08185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1c6801f1c5dfdf8610d16d8a4cd68d062b44e16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuilder compile error:
http://autobuild.buildroot.net/results/f374d3535cf91f139ce80703cd2d0a2be5d3b2b1/

The predefines are wrong:
./output/host/usr/bin/sparc-buildroot-linux-uclibc-gcc -dM -E - </dev/null|grep sparc
#define sparc 1
#define __sparc__ 1
#define __sparc 1
#define __sparc_v8__ 1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/0002-fix-sparc-compile.patch |   38 +++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

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
