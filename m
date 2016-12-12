From: ishitatsuyuki at gmail.com <ishitatsuyuki@gmail.com>
Date: Mon, 12 Dec 2016 13:51:13 +0900
Subject: [Buildroot] [PATCH] php: fix build for AArch64
Message-ID: <20161212045113.25961-1-ishitatsuyuki@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 ...asm-constraints-in-aarch64-multiply-macro.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch

diff --git a/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch b/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch
new file mode 100644
index 000000000..9544d0edb
--- /dev/null
+++ b/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch
@@ -0,0 +1,24 @@
+From 1622f24fde4220967bd907bf8f0325d444bf9339 Mon Sep 17 00:00:00 2001
+From: Andy Postnikov <apostnikov@gmail.com>
+Date: Sat, 10 Dec 2016 23:51:17 +0300
+Subject: [PATCH] Fix bug #70015 - Compilation failure on aarch64
+
+---
+ Zend/zend_multiply.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Zend/zend_multiply.h b/Zend/zend_multiply.h
+index 75769db..fbd69ab 100644
+--- a/Zend/zend_multiply.h
++++ b/Zend/zend_multiply.h
+@@ -75,8 +75,8 @@
+ 	__asm__("mul %0, %2, %3\n"										\
+ 		"smulh %1, %2, %3\n"										\
+ 		"sub %1, %1, %0, asr #63\n"									\
+-			: "=X"(__tmpvar), "=X"(usedval)							\
+-			: "X"(a), "X"(b));										\
++			: "=&r"(__tmpvar), "=&r"(usedval)						\
++			: "r"(a), "r"(b));										\
+ 	if (usedval) (dval) = (double) (a) * (double) (b);				\
+ 	else (lval) = __tmpvar;											\
+ } while (0)
-- 
2.11.0
