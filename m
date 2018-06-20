From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jun 2018 23:25:21 +0200
Subject: [Buildroot] [git commit] package/berkeleydb: fix build error with
 gcc8
Message-ID: <20180620212558.3A09C89120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cbcf2d916d54fdb0a40f4b99d27afc1bfe854c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes

../src/dbinc/atomic.h:179:19: error: definition of 'int __atomic_compare_exchange(db_atomic_t*,
 atomic_value_t, atomic_value_t)' ambiguates built-in declaration 'bool
 __atomic_compare_exchange(unsigned int, volatile void*, void*, void*, int, int)'
 static inline int __atomic_compare_exchange(
                   ^~~~~~~~~~~~~~~~~~~~~~~~~

To reproduce the build error use this defconfig

BR2_GCC_VERSION_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_BERKELEYDB=y
BR2_PACKAGE_BERKELEYDB_COMPAT185=y
BR2_PACKAGE_BERKELEYDB_TOOLS=y

Please note that to trigger the error BR2_TOOLCHAIN_BUILDROOT_CXX=y
is needed although berkeleydb does not depend on c++.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../berkeleydb/0002-atomic_compare_exchange.patch  | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/berkeleydb/0002-atomic_compare_exchange.patch b/package/berkeleydb/0002-atomic_compare_exchange.patch
new file mode 100644
index 0000000000..81e18ac96f
--- /dev/null
+++ b/package/berkeleydb/0002-atomic_compare_exchange.patch
@@ -0,0 +1,27 @@
+Rename __atomic_compare_exchange to not clash with gcc built-in
+
+Downloaded from
+https://src.fedoraproject.org/cgit/rpms/libdb.git/commit/?id=d6841b3b46a51db98c162347211a5a64d154ea37
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- db-5.3.28/src/dbinc/atomic.h.old	2018-05-23 09:20:04.216914922 +0200
++++ db-5.3.28/src/dbinc/atomic.h	2018-05-23 09:20:49.510057897 +0200
+@@ -144,7 +144,7 @@
+ #define	atomic_inc(env, p)	__atomic_inc(p)
+ #define	atomic_dec(env, p)	__atomic_dec(p)
+ #define	atomic_compare_exchange(env, p, o, n)	\
+-	__atomic_compare_exchange((p), (o), (n))
++	__db_atomic_compare_exchange((p), (o), (n))
+ static inline int __atomic_inc(db_atomic_t *p)
+ {
+ 	int	temp;
+@@ -176,7 +176,7 @@
+  * http://gcc.gnu.org/onlinedocs/gcc-4.1.0/gcc/Atomic-Builtins.html
+  * which configure could be changed to use.
+  */
+-static inline int __atomic_compare_exchange(
++static inline int __db_atomic_compare_exchange(
+ 	db_atomic_t *p, atomic_value_t oldval, atomic_value_t newval)
+ {
+ 	atomic_value_t was;
