From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 11:43:38 +0100
Subject: [Buildroot] [PATCH] liquid-dsp: wrapping isnan in T_ABS to help
	compilation w/ certain gcc
Message-ID: <1464000218-48218-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backporting an upstreamed patch in order to fix a build failure like
this one:

In file included from src/math/src/polyc.c:43:0:
src/math/src/poly.findroots.c: In function
'polyc_findroots_bairstow_recursion':
src/math/src/poly.findroots.c:305:9: error: non-floating-point argument
in call to function '__builtin_isnan'
         if (isnan(du) || isnan(dv)) {

Upstream commit URL:

  https://github.com/jgaeddert/liquid-dsp/commit/3055eb3da9d0a202c1a975f7db0c8370a09a30bc

Fixes:

  http://autobuild.buildroot.net/results/01d/01d7d4f34b256bcdf30b16180c015f146bd50e63/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...rapping-isnan-in-T_ABS-to-help-compilatio.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch

diff --git a/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch b/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
new file mode 100644
index 0000000..e65af33
--- /dev/null
+++ b/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
@@ -0,0 +1,42 @@
+wrapping isnan in T_ABS to help compilation w/ certain gcc versions
+
+This is an upstreamed patch backported from here:
+
+https://github.com/jgaeddert/liquid-dsp/commit/3055eb3da9d0a202c1a975f7db0c8370a09a30bc
+
+It will fix the following error:
+
+src/math/src/poly.findroots.c: In function
+'polyc_findroots_bairstow_recursion':
+src/math/src/poly.findroots.c:305:9: error: non-floating-point argument
+in call to function '__builtin_isnan'
+         if (isnan(du) || isnan(dv)) {
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 3055eb3da9d0a202c1a975f7db0c8370a09a30bc Mon Sep 17 00:00:00 2001
+From: "Joseph D. Gaeddert" <joseph@liquidsdr.org>
+Date: Thu, 25 Feb 2016 17:47:07 -0500
+Subject: [PATCH] math/poly: wrapping isnan in T_ABS to help compilation w/
+ certain gcc versions
+
+---
+ src/math/src/poly.findroots.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/math/src/poly.findroots.c b/src/math/src/poly.findroots.c
+index 21b5756..e000ee8 100644
+--- a/src/math/src/poly.findroots.c
++++ b/src/math/src/poly.findroots.c
+@@ -302,7 +302,7 @@ void POLY(_findroots_bairstow_recursion)(T *          _p,
+ #endif
+ 
+         // adjust u, v
+-        if (isnan(du) || isnan(dv)) {
++        if (isnan(T_ABS(du)) || isnan(T_ABS(dv))) {
+             u *= 0.5f;
+             v *= 0.5f;
+         } else {
+-- 
+2.7.3
+
-- 
2.7.3
