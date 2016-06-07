From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:26:34 +0200
Subject: [Buildroot] [git commit] package/liquid-dsp: bump version
Message-ID: <20160607112639.D2BE2807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=054b75dfa577b239d374235131bacb69f727dff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:
https://github.com/jgaeddert/liquid-dsp/commit/c9d239490d47d5dd3d7d7b8b7d9007171c5f60ce
https://github.com/jgaeddert/liquid-dsp/commit/3055eb3da9d0a202c1a975f7db0c8370a09a30bc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch | 45 ----------------------
 ...rapping-isnan-in-T_ABS-to-help-compilatio.patch | 39 -------------------
 package/liquid-dsp/liquid-dsp.hash                 |  2 +-
 package/liquid-dsp/liquid-dsp.mk                   |  2 +-
 4 files changed, 2 insertions(+), 86 deletions(-)

diff --git a/package/liquid-dsp/0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch b/package/liquid-dsp/0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch
deleted file mode 100644
index c51f587..0000000
--- a/package/liquid-dsp/0001-configure.ac-use-AC_CONFIG_MACRO_DIR.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c9d239490d47d5dd3d7d7b8b7d9007171c5f60ce Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 11 Oct 2015 15:27:09 +0200
-Subject: [PATCH] configure.ac: use AC_CONFIG_MACRO_DIR
-
-Instead of having to explicitly pass -I./scripts when running aclocal,
-use the AC_CONFIG_MACRO_DIR() macro in configure.ac. This allows to
-use "autoreconf" normally, without any hacks.
-
-Submitted upstream at https://github.com/jgaeddert/liquid-dsp/pull/15.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- bootstrap.sh | 2 +-
- configure.ac | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bootstrap.sh b/bootstrap.sh
-index 640e01d..eb4894e 100755
---- a/bootstrap.sh
-+++ b/bootstrap.sh
-@@ -27,7 +27,7 @@
- #
- 
- rm -f config.cache aclocal.m4
--aclocal -I./scripts
-+aclocal
- autoconf
- autoheader
- #automake --foreign --add-missing
-diff --git a/configure.ac b/configure.ac
-index a9ad1d7..3b1ba68 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,6 +25,7 @@
- 
- AC_INIT([liquid-dsp],[1.2.0],[support at liquidsdr.org])
- AC_CONFIG_SRCDIR([src/libliquid.c])
-+AC_CONFIG_MACRO_DIR([scripts])
- 
- # permit auxiliary scripts directory (e.g. config.sub, config.guess, install-sh)
- AC_CONFIG_AUX_DIR(scripts/)
--- 
-2.6.1
-
diff --git a/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch b/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
deleted file mode 100644
index f8dd602..0000000
--- a/package/liquid-dsp/0002-math-poly-wrapping-isnan-in-T_ABS-to-help-compilatio.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3055eb3da9d0a202c1a975f7db0c8370a09a30bc Mon Sep 17 00:00:00 2001
-From: "Joseph D. Gaeddert" <joseph@liquidsdr.org>
-Date: Thu, 25 Feb 2016 17:47:07 -0500
-Subject: [PATCH] math/poly: wrapping isnan in T_ABS to help compilation w/
- certain gcc versions
-
-This is an upstreamed patch backported from here:
-
-https://github.com/jgaeddert/liquid-dsp/commit/3055eb3da9d0a202c1a975f7db0c8370a09a30bc
-
-It fixes the following error:
-
-src/math/src/poly.findroots.c: In function
-'polyc_findroots_bairstow_recursion':
-src/math/src/poly.findroots.c:305:9: error: non-floating-point argument
-in call to function '__builtin_isnan'
-         if (isnan(du) || isnan(dv)) {
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- src/math/src/poly.findroots.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/math/src/poly.findroots.c b/src/math/src/poly.findroots.c
-index 21b5756..e000ee8 100644
---- a/src/math/src/poly.findroots.c
-+++ b/src/math/src/poly.findroots.c
-@@ -302,7 +302,7 @@ void POLY(_findroots_bairstow_recursion)(T *          _p,
- #endif
- 
-         // adjust u, v
--        if (isnan(du) || isnan(dv)) {
-+        if (isnan(T_ABS(du)) || isnan(T_ABS(dv))) {
-             u *= 0.5f;
-             v *= 0.5f;
-         } else {
--- 
-2.7.3
-
diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index 5c1c0a8..e32d829 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4b6dcb0846ed884c55984494adef721f910ac6f895174b31ec52138263842637 liquid-dsp-df5a459fa05dba4199c1299555891104cc1fdca7.tar.gz
+sha256 d0f050b9d5137c43ba45a35b6c82bc8222eba86f772f4e2e46c91427647bb847 liquid-dsp-1191179b786703b3af20abf7e1404d91099b335d.tar.gz
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index e7bb686..b5fb44c 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = df5a459fa05dba4199c1299555891104cc1fdca7
+LIQUID_DSP_VERSION = 1191179b786703b3af20abf7e1404d91099b335d
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
