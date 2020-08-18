From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:34:59 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gd: fix
 CVE-2018-14553 and CVE-2019-6977
Message-ID: <20200818153621.8E02486312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b70686422d1663a61df8668cee7abae4dead3817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Fix CVE-2018-14553 : gdImageClone in gd.c in libgd 2.1.0-rc2 through
  2.2.5 has a NULL pointer dereference allowing attackers to crash an
  application via a specific function call sequence.

- Fix CVE-2019-6977: gdImageColorMatch in gd_color_match.c in the GD
  Graphics Library (aka LibGD) 2.2.5, as used in the imagecolormatch
  function in PHP before 5.6.40, 7.x before 7.1.26, 7.2.x before 7.2.14,
  and 7.3.x before 7.3.1, has a heap-based buffer overflow. This can be
  exploited by an attacker who is able to trigger imagecolormatch calls
  with crafted image data.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6fa1a32dac3cb4ee03fd11bb965cd4b57d14e86a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-NULL-pointer-dereference-in-gdImageClone.patch | 44 ++++++++++++++++++++++
 ...Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch | 39 +++++++++++++++++++
 package/gd/gd.mk                                   | 13 +++++++
 3 files changed, 96 insertions(+)

diff --git a/package/gd/0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch b/package/gd/0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch
new file mode 100644
index 0000000000..8234de45a2
--- /dev/null
+++ b/package/gd/0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch
@@ -0,0 +1,44 @@
+From a93eac0e843148dc2d631c3ba80af17e9c8c860f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?F=C3=A1bio=20Cabral=20Pacheco?= <fcabralpacheco@gmail.com>
+Date: Fri, 20 Dec 2019 12:03:33 -0300
+Subject: [PATCH] Fix potential NULL pointer dereference in gdImageClone()
+
+[Retrieved (and updated to remove .gitignore and tests) from:
+https://github.com/libgd/libgd/commit/a93eac0e843148dc2d631c3ba80af17e9c8c860f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/gd.c                          |  9 +--------
+ tests/gdimageclone/.gitignore     |  1 +
+ tests/gdimageclone/CMakeLists.txt |  1 +
+ tests/gdimageclone/Makemodule.am  |  3 ++-
+ tests/gdimageclone/style.c        | 30 ++++++++++++++++++++++++++++++
+ 5 files changed, 35 insertions(+), 9 deletions(-)
+ create mode 100644 tests/gdimageclone/style.c
+
+diff --git a/src/gd.c b/src/gd.c
+index 592a0286..d564d1f9 100644
+--- a/src/gd.c
++++ b/src/gd.c
+@@ -2865,14 +2865,6 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
+ 		}
+ 	}
+ 
+-	if (src->styleLength > 0) {
+-		dst->styleLength = src->styleLength;
+-		dst->stylePos    = src->stylePos;
+-		for (i = 0; i < src->styleLength; i++) {
+-			dst->style[i] = src->style[i];
+-		}
+-	}
+-
+ 	dst->interlace   = src->interlace;
+ 
+ 	dst->alphaBlendingFlag = src->alphaBlendingFlag;
+@@ -2907,6 +2899,7 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
+ 
+ 	if (src->style) {
+ 		gdImageSetStyle(dst, src->style, src->styleLength);
++		dst->stylePos = src->stylePos;
+ 	}
+ 
+ 	for (i = 0; i < gdMaxColors; i++) {
diff --git a/package/gd/0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch b/package/gd/0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch
new file mode 100644
index 0000000000..11c7575dd4
--- /dev/null
+++ b/package/gd/0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch
@@ -0,0 +1,39 @@
+From 2e886046f86d0d6bfc14aab94a881259a081e3f4 Mon Sep 17 00:00:00 2001
+From: wilson chen <willson.chenwx@gmail.com>
+Date: Fri, 20 Dec 2019 10:12:04 +0800
+Subject: [PATCH] Fix #497: gdImageColorMatch Out Of Bounds Write on Heap
+ (CVE-2019-6977)
+
+Fixed CVE-2019-6977 and add corresponding testcase.
+
+Original patch by Christoph M. Bechker <cmbecker69@gmx.de>
+https://gist.github.com/cmb69/1f36d285eb297ed326f5c821d7aafced
+
+[Retrieved (and updated to remove .gitignore and tests) from:
+https://github.com/libgd/libgd/commit/2e886046f86d0d6bfc14aab94a881259a081e3f4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/gd_color_match.c                    |  5 ++---
+ tests/gdimagecolormatch/.gitignore      |  1 +
+ tests/gdimagecolormatch/CMakeLists.txt  |  1 +
+ tests/gdimagecolormatch/Makemodule.am   |  1 +
+ tests/gdimagecolormatch/cve_2019_6977.c | 25 +++++++++++++++++++++++++
+ 5 files changed, 30 insertions(+), 3 deletions(-)
+ create mode 100644 tests/gdimagecolormatch/cve_2019_6977.c
+
+diff --git a/src/gd_color_match.c b/src/gd_color_match.c
+index f0842b69..f0194302 100644
+--- a/src/gd_color_match.c
++++ b/src/gd_color_match.c
+@@ -31,9 +31,8 @@ BGD_DECLARE(int) gdImageColorMatch (gdImagePtr im1, gdImagePtr im2)
+ 		return -4; /* At least 1 color must be allocated */
+ 	}
+ 
+-	buf = (unsigned long *)gdMalloc(sizeof(unsigned long) * 5 * im2->colorsTotal);
+-	memset (buf, 0, sizeof(unsigned long) * 5 * im2->colorsTotal );
+-
++	buf = (unsigned long *)gdMalloc(sizeof(unsigned long) * 5 * gdMaxColors);
++	memset (buf, 0, sizeof(unsigned long) * 5 * gdMaxColors );
+ 	for (x=0; x < im1->sx; x++) {
+ 		for( y=0; y<im1->sy; y++ ) {
+ 			color = im2->pixels[y][x];
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index e2a46dca3c..419d9a6384 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -14,6 +14,19 @@ GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
+# 0001-bmp-check-return-value-in-gdImageBmpPtr.patch
+GD_IGNORE_CVES += CVE-2018-1000222
+# 0002-Fix-420-Potential-infinite-loop-in-gdImageCreateFrom.patch
+GD_IGNORE_CVES += CVE-2018-5711
+# 0003-Fix-501-Uninitialized-read-in-gdImageCreateFromXbm-C.patch
+GD_IGNORE_CVES += CVE-2019-11038
+# 0004-Fix-492-Potential-double-free-in-gdImage-Ptr.patch
+GD_IGNORE_CVES += CVE-2019-6978
+# 0005-Fix-potential-NULL-pointer-dereference-in-gdImageClone.patch
+GD_IGNORE_CVES += CVE-2018-14553
+# 0006-Fix-497-gdImageColorMatch-Out-Of-Bounds-Write-on-Heap-CVE-2019-6977.patch
+GD_IGNORE_CVES += CVE-2019-6977
+
 # gd forgets to link utilities with -pthread even though it uses
 # pthreads, causing linking errors with static linking
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
