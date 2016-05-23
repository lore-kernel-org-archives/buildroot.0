From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 12:57:27 +0200
Subject: [Buildroot] [git commit] liquid-dsp: wrapping isnan in T_ABS to
	help compilation w/ certain gcc
Message-ID: <20160523105748.4AA8181839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=917fa2ca2301a757a906959f0b3bc9f8a9225022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Thomas: tweak patch format.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rapping-isnan-in-T_ABS-to-help-compilatio.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch b/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
new file mode 100644
index 0000000..f8dd602
--- /dev/null
+++ b/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
@@ -0,0 +1,39 @@
+From 3055eb3da9d0a202c1a975f7db0c8370a09a30bc Mon Sep 17 00:00:00 2001
+From: "Joseph D. Gaeddert" <joseph@liquidsdr.org>
+Date: Thu, 25 Feb 2016 17:47:07 -0500
+Subject: [PATCH] math/poly: wrapping isnan in T_ABS to help compilation w/
+ certain gcc versions
+
+This is an upstreamed patch backported from here:
+
+https://github.com/jgaeddert/liquid-dsp/commit/3055eb3da9d0a202c1a975f7db0c8370a09a30bc
+
+It fixes the following error:
+
+src/math/src/poly.findroots.c: In function
+'polyc_findroots_bairstow_recursion':
+src/math/src/poly.findroots.c:305:9: error: non-floating-point argument
+in call to function '__builtin_isnan'
+         if (isnan(du) || isnan(dv)) {
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
