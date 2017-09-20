From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 20 Sep 2017 20:18:54 +0300
Subject: [Buildroot] [PATCH] python-numpy: Fix compilation if HAVE_CEXPx is
	defined
Message-ID: <20170920171854.48122-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With update of Numpy to the latest version we've got one change which
breaks Numpy compilcation in some cases.

This change back-ports upstrema fix from:
https://github.com/numpy/numpy/pull/9721

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-compilation-if-HAVE_CEXPx-is-defined.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/python-numpy/0003-MAINT-Fix-compilation-if-HAVE_CEXPx-is-defined.patch

diff --git a/package/python-numpy/0003-MAINT-Fix-compilation-if-HAVE_CEXPx-is-defined.patch b/package/python-numpy/0003-MAINT-Fix-compilation-if-HAVE_CEXPx-is-defined.patch
new file mode 100644
index 0000000000..6efc6e9192
--- /dev/null
+++ b/package/python-numpy/0003-MAINT-Fix-compilation-if-HAVE_CEXPx-is-defined.patch
@@ -0,0 +1,54 @@
+From 587e3f4239807131c963fe2294988b12ed7fdc6d Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Wed, 20 Sep 2017 18:49:46 +0300
+Subject: [PATCH] MAINT: Fix compilation if HAVE_CEXPx is defined
+
+Commit c15f7747c78e ("MAINT: remove a bunch of compiler warnings")
+broke compilation if HAVE_CEXPx is defined with no good reason.
+
+The problem is with defined HAVE_CEXPx _npy_scaled_cexp() is never
+defined and compiler:
+ 1) Reports implicitly declared function
+ 2) Uses default return type "int" in equations like:
+      z = _npy_scaled_cexp at c@(absx, y, -1);
+    where z is "@ctype@" which might very well differ from int...
+ 3) ... and finally throws an error, see:
+--------------------------->8------------------------
+numpy/core/src/npymath/npy_math_complex.c.src: In function 'npy_ccoshl':
+numpy/core/src/npymath/npy_math_complex.c.src:643:17: warning: implicit declaration of function '_npy_scaled_cexpl' [-Wimplicit-function-declaration]
+             z = _npy_scaled_cexp at c@(absx, y, -1);
+                 ^~~~~~~~~~~~~~~~~
+numpy/core/src/npymath/npy_math_complex.c.src:643:15: error: incompatible types when assigning to type 'npy_clongdouble {aka struct <anonymous>}' from type 'int'
+             z = _npy_scaled_cexp at c@(absx, y, -1);
+--------------------------->8------------------------
+               ^
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ numpy/core/src/npymath/npy_math_complex.c.src | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/numpy/core/src/npymath/npy_math_complex.c.src b/numpy/core/src/npymath/npy_math_complex.c.src
+index a82a6737c..f2b391394 100644
+--- a/numpy/core/src/npymath/npy_math_complex.c.src
++++ b/numpy/core/src/npymath/npy_math_complex.c.src
+@@ -184,8 +184,6 @@ npy_carg at c@(@ctype@ z)
+ #define SCALED_CEXP_LOWERL 11357.216553474703895L
+ #define SCALED_CEXP_UPPERL 22756.021937783004509L
+ 
+-#ifndef HAVE_CEXP at C@
+-
+ static
+ @ctype@
+ _npy_scaled_cexp at c@(@type@ x, @type@ y, npy_int expt)
+@@ -212,6 +210,7 @@ _npy_scaled_cexp at c@(@type@ x, @type@ y, npy_int expt)
+                          npy_ldexp at c@(mant * mantsin, expt + exsin));
+ }
+ 
++#ifndef HAVE_CEXP at C@
+ @ctype@
+ npy_cexp at c@(@ctype@ z)
+ {
+-- 
+2.11.0
+
-- 
2.11.0
