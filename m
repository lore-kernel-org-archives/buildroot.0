From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Apr 2015 21:14:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/celt051: Add patch to fix musl build
Message-ID: <1430421295-663-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl does not define __GNUC_PREREQ. Use patch from Alpine Linux
(http://git.alpinelinux.org/cgit/aports/plain/main/celt051/fix-gnuc-prereq.patch).

Fixes http://autobuild.buildroot.net/results/223/223ba6003bdd7e0c896455c21fa8fee943b4e716/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/celt051/0001-fix-gnuc-prereq.patch | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/celt051/0001-fix-gnuc-prereq.patch

diff --git a/package/celt051/0001-fix-gnuc-prereq.patch b/package/celt051/0001-fix-gnuc-prereq.patch
new file mode 100644
index 0000000..a775a32
--- /dev/null
+++ b/package/celt051/0001-fix-gnuc-prereq.patch
@@ -0,0 +1,29 @@
+Fix musl build
+
+musl does not define __GNUC_PREREQ. Use patch from Alpine Linux
+(http://git.alpinelinux.org/cgit/aports/plain/main/celt051/fix-gnuc-prereq.patch).
+
+Fixes http://autobuild.buildroot.net/results/223/223ba6003bdd7e0c896455c21fa8fee943b4e716/
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+--- celt-0.5.1.3.orig/libcelt/ecintrin.h
++++ celt-0.5.1.3/libcelt/ecintrin.h
+@@ -52,8 +52,7 @@
+ /*Count leading zeros.
+   This macro should only be used for implementing ec_ilog(), if it is defined.
+   All other code should use EC_ILOG() instead.*/
+-#ifdef __GNUC_PREREQ
+-#if __GNUC_PREREQ(3,4)
++#if defined(__GNUC__) && ((__GNUC__<<16)+__GNUC_MINOR__) >= 0x304
+ # if INT_MAX>=2147483647
+ #  define EC_CLZ0 sizeof(unsigned)*CHAR_BIT
+ #  define EC_CLZ(_x) (__builtin_clz(_x))
+@@ -61,7 +60,6 @@
+ #  define EC_CLZ0 sizeof(unsigned long)*CHAR_BIT
+ #  define EC_CLZ(_x) (__builtin_clzl(_x))
+ # endif
+-#endif
+ #endif
+
+ #if defined(EC_CLZ)
-- 
2.3.7
