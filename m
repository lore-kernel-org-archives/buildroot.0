From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 30 Sep 2016 08:07:02 +0200
Subject: [Buildroot] [PATCH] php: fix bfin compile error
Message-ID: <20160930060702.GA30641@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid a gcc segfault with Os.

Fixes:
  http://autobuild.buildroot.net/results/61532c31701c9bf756d85c639a00627667baa4fb

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
 package/php/0008-fix-bfin-gcc-segfault.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/php/0008-fix-bfin-gcc-segfault.patch

diff --git a/package/php/0008-fix-bfin-gcc-segfault.patch b/package/php/0008-fix-bfin-gcc-segfault.patch
new file mode 100644
index 0000000..7ff7ed6
--- /dev/null
+++ b/package/php/0008-fix-bfin-gcc-segfault.patch
@@ -0,0 +1,19 @@
+diff -Nur php-7.0.11.orig/Zend/zend_compile.c php-7.0.11/Zend/zend_compile.c
+--- php-7.0.11.orig/Zend/zend_compile.c	2016-09-13 20:52:26.000000000 +0200
++++ php-7.0.11/Zend/zend_compile.c	2016-09-30 04:24:32.380877446 +0200
+@@ -6689,7 +6689,14 @@
+ }
+ /* }}} */
+ 
+-void zend_compile_resolve_class_name(znode *result, zend_ast *ast) /* {{{ */
++// Blackfin gcc 6.2.0 fails with segmentation fault
++#if defined(__bfin__)
++#define disable_opt __attribute__ ((optimize("O2")))
++#else
++#define disable_opt 
++#endif
++
++void disable_opt zend_compile_resolve_class_name(znode *result, zend_ast *ast) /* {{{ */
+ {
+ 	zend_ast *name_ast = ast->child[0];
+ 	uint32_t fetch_type = zend_get_class_fetch_type(zend_ast_get_str(name_ast));
-- 
2.1.4
