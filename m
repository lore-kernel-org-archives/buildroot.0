From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 May 2018 17:19:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/berkeleydb: fix gcc8 build error
Message-ID: <20180506151947.13821-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes gcc8 build error:

In file included from ../src/dbinc/mutex_int.h:12,
                 from ../src/dbinc/mutex.h:15,
                 from ./db_int.h:1113,
                 from ../lang/cxx/cxx_channel.cpp:11:
../src/dbinc/atomic.h:179:19: error:
 definition of 'int __atomic_compare_exchange(db_atomic_t*, atomic_value_t, atomic_value_t)'
 ambiguates built-in declaration
 'bool __atomic_compare_exchange(long unsigned int, volatile void*, void*, void*, int, int)'
 static inline int __atomic_compare_exchange(
                   ^~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...me-local-__atomic_compare_exchange-to-avo.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/berkeleydb/0002-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch

diff --git a/package/berkeleydb/0002-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch b/package/berkeleydb/0002-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
new file mode 100644
index 0000000000..b734a0611a
--- /dev/null
+++ b/package/berkeleydb/0002-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
@@ -0,0 +1,52 @@
+From 29621d637e30982489693f2e207ce6a1790e3337 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 15:32:26 +0000
+Subject: [PATCH] atomic: Rename local __atomic_compare_exchange to avoid clash
+ with builtins
+
+Helps building with clang
+
+Fixes
+
+../db-5.3.28/src/dbinc/atomic.h:179:19: error: definition of builtin function '__atomic_compare_exchange'
+static inline int __atomic_compare_exchange(
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Downloaded from
+http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
+
+Fixes gcc-8 build error.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dbinc/atomic.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dbinc/atomic.h b/src/dbinc/atomic.h
+index 6a858f7..1b49de5 100644
+--- a/src/dbinc/atomic.h
++++ b/src/dbinc/atomic.h
+@@ -144,7 +144,7 @@ typedef LONG volatile *interlocked_val;
+ #define	atomic_inc(env, p)	__atomic_inc(p)
+ #define	atomic_dec(env, p)	__atomic_dec(p)
+ #define	atomic_compare_exchange(env, p, o, n)	\
+-	__atomic_compare_exchange((p), (o), (n))
++	__db_atomic_compare_exchange((p), (o), (n))
+ static inline int __atomic_inc(db_atomic_t *p)
+ {
+ 	int	temp;
+@@ -176,7 +176,7 @@ static inline int __atomic_dec(db_atomic_t *p)
+  * http://gcc.gnu.org/onlinedocs/gcc-4.1.0/gcc/Atomic-Builtins.html
+  * which configure could be changed to use.
+  */
+-static inline int __atomic_compare_exchange(
++static inline int __db_atomic_compare_exchange(
+ 	db_atomic_t *p, atomic_value_t oldval, atomic_value_t newval)
+ {
+ 	atomic_value_t was;
+-- 
+1.8.3.1
+
-- 
2.14.2
