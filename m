From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri,  4 Mar 2016 21:52:53 -0300
Subject: [Buildroot] [PATCH] dt: fix binary operation errors
Message-ID: <1457139173-9535-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some GCC toolchains does not define _BSD_SOURCE when passing -D_GNU_SOURCE, and
that is causing the declaration of large_t as double.

In that case, GCC is complaining in some binary operations like the code below:

dtgen.c:1653:59: error: invalid operands to binary % (have ?large_t? and ?u_int32?)
   (dip->di_data_limit != INFINITY) && (dip->di_data_limit % dip->di_dsize) ) {
                                                           ^

This patch adds a statement in the include file to define large_t as
"long long int" when __GNUC__ is defined.

Fixes:
http://autobuild.buildroot.net/results/e7b803bd007c125e23eeae351acfc08628333706
http://autobuild.buildroot.net/results/72ca2970db41463435765b90c069417b8bb8a3fd
http://autobuild.buildroot.net/results/22d18f0ca19898be02118c64e615ffbbb23ee46d
http://autobuild.buildroot.net/results/ab50d1d4af47b026da77a81224500a4627c718ac
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/dt/0002-Fix-binary-operations-errors.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/dt/0002-Fix-binary-operations-errors.patch

diff --git a/package/dt/0002-Fix-binary-operations-errors.patch b/package/dt/0002-Fix-binary-operations-errors.patch
new file mode 100644
index 000000000000..ed938ec98e47
--- /dev/null
+++ b/package/dt/0002-Fix-binary-operations-errors.patch
@@ -0,0 +1,50 @@
+From 80bbf34b032bf11647d87ea07c1a0c5cf7f87957 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Fri, 4 Mar 2016 21:25:02 -0300
+Subject: [PATCH] Fix binary operations errors
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some GCC toolchains does not define _BSD_SOURCE when passing -D_GNU_SOURCE, and that is causing the declaration of large_t as double.
+
+In that case, GCC is complaining in some binary operations like the code below:
+
+dtgen.c:1653:59: error: invalid operands to binary % (have ?large_t? and ?u_int32?)
+   (dip->di_data_limit != INFINITY) && (dip->di_data_limit % dip->di_dsize) ) {
+                                                           ^
+
+So we need to add a statement to force large_t as "long long int" when __GNUC__ is defined.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ common.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/common.h b/common.h
+index 0cf9dc2145ee..a702d2d8dcff 100644
+--- a/common.h
++++ b/common.h
+@@ -170,11 +170,18 @@ typedef volatile slarge_t 	 v_slarge;
+ #define FUF	 LUF 
+ #define FXF	 LXF 
+ 
+-#else /* !defined(MACHINE_64BITS) && !defined(__GNUC__) */
++#else /* !defined(MACHINE_64BITS) */
+ 
++#if (defined(__GNUC__))
++#define QuadIsLongLong
++typedef unsigned long long int  large_t;
++typedef signed long long int    slarge_t;
++#else
+ #define QuadIsDouble
+ typedef double			large_t;
+ typedef double			slarge_t;
++#endif
++
+ typedef volatile large_t	v_large;
+ typedef volatile slarge_t	v_slarge;
+ 
+-- 
+1.9.1
+
-- 
1.9.1
