From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 22:34:02 +0100
Subject: [Buildroot] [git commit] php: fix build for AArch64
Message-ID: <20161212213427.9C86181941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d871352b3353881de510a06dd7f4895eced56469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from a PHP Github pull request that fixes the build at -O0
on AArch64.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
[Thomas: improved patch commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...asm-constraints-in-aarch64-multiply-macro.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch b/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch
new file mode 100644
index 0000000..f4812da
--- /dev/null
+++ b/package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch
@@ -0,0 +1,28 @@
+From 1622f24fde4220967bd907bf8f0325d444bf9339 Mon Sep 17 00:00:00 2001
+From: Andy Postnikov <apostnikov@gmail.com>
+Date: Sat, 10 Dec 2016 23:51:17 +0300
+Subject: [PATCH] Fix bug #70015 - Compilation failure on aarch64
+
+Fixes build at -O0.
+
+[From pull request https://github.com/php/php-src/pull/2236.]
+Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
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
