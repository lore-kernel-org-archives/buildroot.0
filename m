From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 22:43:34 +0200
Subject: [Buildroot] [git commit] python-numpy: Ensure `_npy_scaled_cexp{, f,
	l}` is defined when needed
Message-ID: <20170926204958.76269800D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f137667f3e9c1a84e0ea1dc72acbd4fbd0acef04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With update of Numpy to the latest version we've got one change which
breaks Numpy compilcation in some cases.

This change back-ports upstream fix from:
https://github.com/numpy/numpy/pull/9740

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ..._npy_scaled_cexp-f-l-is-defined-when-need.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch b/package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch
new file mode 100644
index 0000000..a243df5
--- /dev/null
+++ b/package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch
@@ -0,0 +1,43 @@
+From 9aa5d577c58f04f9606674dd6f326aee1bf1e6e8 Mon Sep 17 00:00:00 2001
+From: Charles Harris <charlesr.harris@gmail.com>
+Date: Thu, 21 Sep 2017 10:10:05 -0600
+Subject: [PATCH] BUG: Ensure `_npy_scaled_cexp{,f,l}` is defined when needed.
+
+The `_npy_scaled_cexp{,f,l}` functions were previously only defined when
+the npy_cexp fallback functions were needed, but they are also called by
+the npy_csinh and npy_ccosh functions.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ numpy/core/src/npymath/npy_math_complex.c.src | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/numpy/core/src/npymath/npy_math_complex.c.src b/numpy/core/src/npymath/npy_math_complex.c.src
+index a82a6737c..fb31e8e6a 100644
+--- a/numpy/core/src/npymath/npy_math_complex.c.src
++++ b/numpy/core/src/npymath/npy_math_complex.c.src
+@@ -184,7 +184,9 @@ npy_carg at c@(@ctype@ z)
+ #define SCALED_CEXP_LOWERL 11357.216553474703895L
+ #define SCALED_CEXP_UPPERL 22756.021937783004509L
+ 
+-#ifndef HAVE_CEXP at C@
++#if !defined(HAVE_CSINH at C@) || \
++    !defined(HAVE_CCOSH at C@) || \
++    !defined(HAVE_CEXP at C@)
+ 
+ static
+ @ctype@
+@@ -212,6 +214,10 @@ _npy_scaled_cexp at c@(@type@ x, @type@ y, npy_int expt)
+                          npy_ldexp at c@(mant * mantsin, expt + exsin));
+ }
+ 
++#endif
++
++#ifndef HAVE_CEXP at C@
++
+ @ctype@
+ npy_cexp at c@(@ctype@ z)
+ {
+-- 
+2.11.0
+
