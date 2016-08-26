From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 23:17:16 +0200
Subject: [Buildroot] [PATCH] libraw: fix build with gcc 6.x
Message-ID: <1472246236-31129-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit backports two commits from the upstream libraw project, to
fix build with gcc 6.x.

Note that the second patch from libraw upstream looks like a revert of
the first one. It is indeed a revert, but in the same commit, the
upstream developer made the new gcc 6.x fix. Therefore, we have to
backport both commits, and the second one is not only a revert of the
first one.

Fixes:

  http://autobuild.buildroot.net/results/7e950e681a183cdc94fa8d2b38a1b17557926064/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw/0003-gcc6-compatibility.patch       | 196 +++++++++++++++++++
 .../libraw/0004-Revert-gcc6-compatibility.patch    | 216 +++++++++++++++++++++
 2 files changed, 412 insertions(+)
 create mode 100644 package/libraw/0003-gcc6-compatibility.patch
 create mode 100644 package/libraw/0004-Revert-gcc6-compatibility.patch

diff --git a/package/libraw/0003-gcc6-compatibility.patch b/package/libraw/0003-gcc6-compatibility.patch
new file mode 100644
index 0000000..550519b
--- /dev/null
+++ b/package/libraw/0003-gcc6-compatibility.patch
@@ -0,0 +1,196 @@
+From 45d09985264d233e52771e14254102b839e85ac7 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sun, 20 Mar 2016 16:32:58 +0300
+Subject: [PATCH] gcc6 compatibility
+
+[Thomas: backport from upstream commit eba7a66e23f2f62cc4c8115af8066f2df5da085a.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ dcraw/dcraw.c             | 65 ++++++++++++++++++++++++++---------------------
+ internal/dcraw_common.cpp | 65 ++++++++++++++++++++++++++---------------------
+ libraw/libraw_const.h     |  3 +--
+ 3 files changed, 73 insertions(+), 60 deletions(-)
+
+diff --git a/dcraw/dcraw.c b/dcraw/dcraw.c
+index a6937af..3bb7f93 100755
+--- a/dcraw/dcraw.c
++++ b/dcraw/dcraw.c
+@@ -5687,30 +5687,37 @@ void CLASS lin_interpolate()
+  */
+ void CLASS vng_interpolate()
+ {
+-  static const signed char *cp, terms[] = {
+-    -2,-2,+0,-1,0,0x01, -2,-2,+0,+0,1,0x01, -2,-1,-1,+0,0,0x01,
+-    -2,-1,+0,-1,0,0x02, -2,-1,+0,+0,0,0x03, -2,-1,+0,+1,1,0x01,
+-    -2,+0,+0,-1,0,0x06, -2,+0,+0,+0,1,0x02, -2,+0,+0,+1,0,0x03,
+-    -2,+1,-1,+0,0,0x04, -2,+1,+0,-1,1,0x04, -2,+1,+0,+0,0,0x06,
+-    -2,+1,+0,+1,0,0x02, -2,+2,+0,+0,1,0x04, -2,+2,+0,+1,0,0x04,
+-    -1,-2,-1,+0,0,0x80, -1,-2,+0,-1,0,0x01, -1,-2,+1,-1,0,0x01,
+-    -1,-2,+1,+0,1,0x01, -1,-1,-1,+1,0,0x88, -1,-1,+1,-2,0,0x40,
+-    -1,-1,+1,-1,0,0x22, -1,-1,+1,+0,0,0x33, -1,-1,+1,+1,1,0x11,
+-    -1,+0,-1,+2,0,0x08, -1,+0,+0,-1,0,0x44, -1,+0,+0,+1,0,0x11,
+-    -1,+0,+1,-2,1,0x40, -1,+0,+1,-1,0,0x66, -1,+0,+1,+0,1,0x22,
+-    -1,+0,+1,+1,0,0x33, -1,+0,+1,+2,1,0x10, -1,+1,+1,-1,1,0x44,
+-    -1,+1,+1,+0,0,0x66, -1,+1,+1,+1,0,0x22, -1,+1,+1,+2,0,0x10,
+-    -1,+2,+0,+1,0,0x04, -1,+2,+1,+0,1,0x04, -1,+2,+1,+1,0,0x04,
+-    +0,-2,+0,+0,1,0x80, +0,-1,+0,+1,1,0x88, +0,-1,+1,-2,0,0x40,
+-    +0,-1,+1,+0,0,0x11, +0,-1,+2,-2,0,0x40, +0,-1,+2,-1,0,0x20,
+-    +0,-1,+2,+0,0,0x30, +0,-1,+2,+1,1,0x10, +0,+0,+0,+2,1,0x08,
+-    +0,+0,+2,-2,1,0x40, +0,+0,+2,-1,0,0x60, +0,+0,+2,+0,1,0x20,
+-    +0,+0,+2,+1,0,0x30, +0,+0,+2,+2,1,0x10, +0,+1,+1,+0,0,0x44,
+-    +0,+1,+1,+2,0,0x10, +0,+1,+2,-1,1,0x40, +0,+1,+2,+0,0,0x60,
+-    +0,+1,+2,+1,0,0x20, +0,+1,+2,+2,0,0x10, +1,-2,+1,+0,0,0x80,
+-    +1,-1,+1,+1,0,0x88, +1,+0,+1,+2,0,0x08, +1,+0,+2,-1,0,0x40,
+-    +1,+0,+2,+1,0,0x10
+-  }, chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
++  struct interpolate_terms {
++    signed char y1, x1, y2, x2, weight;
++    unsigned char grads;
++  };
++  static const interpolate_terms terms[] = {
++    {-2,-2,+0,-1,0,0x01}, {-2,-2,+0,+0,1,0x01}, {-2,-1,-1,+0,0,0x01},
++    {-2,-1,+0,-1,0,0x02}, {-2,-1,+0,+0,0,0x03}, {-2,-1,+0,+1,1,0x01},
++    {-2,+0,+0,-1,0,0x06}, {-2,+0,+0,+0,1,0x02}, {-2,+0,+0,+1,0,0x03},
++    {-2,+1,-1,+0,0,0x04}, {-2,+1,+0,-1,1,0x04}, {-2,+1,+0,+0,0,0x06},
++    {-2,+1,+0,+1,0,0x02}, {-2,+2,+0,+0,1,0x04}, {-2,+2,+0,+1,0,0x04},
++    {-1,-2,-1,+0,0,0x80}, {-1,-2,+0,-1,0,0x01}, {-1,-2,+1,-1,0,0x01},
++    {-1,-2,+1,+0,1,0x01}, {-1,-1,-1,+1,0,0x88}, {-1,-1,+1,-2,0,0x40},
++    {-1,-1,+1,-1,0,0x22}, {-1,-1,+1,+0,0,0x33}, {-1,-1,+1,+1,1,0x11},
++    {-1,+0,-1,+2,0,0x08}, {-1,+0,+0,-1,0,0x44}, {-1,+0,+0,+1,0,0x11},
++    {-1,+0,+1,-2,1,0x40}, {-1,+0,+1,-1,0,0x66}, {-1,+0,+1,+0,1,0x22},
++    {-1,+0,+1,+1,0,0x33}, {-1,+0,+1,+2,1,0x10}, {-1,+1,+1,-1,1,0x44},
++    {-1,+1,+1,+0,0,0x66}, {-1,+1,+1,+1,0,0x22}, {-1,+1,+1,+2,0,0x10},
++    {-1,+2,+0,+1,0,0x04}, {-1,+2,+1,+0,1,0x04}, {-1,+2,+1,+1,0,0x04},
++    {+0,-2,+0,+0,1,0x80}, {+0,-1,+0,+1,1,0x88}, {+0,-1,+1,-2,0,0x40},
++    {+0,-1,+1,+0,0,0x11}, {+0,-1,+2,-2,0,0x40}, {+0,-1,+2,-1,0,0x20},
++    {+0,-1,+2,+0,0,0x30}, {+0,-1,+2,+1,1,0x10}, {+0,+0,+0,+2,1,0x08},
++    {+0,+0,+2,-2,1,0x40}, {+0,+0,+2,-1,0,0x60}, {+0,+0,+2,+0,1,0x20},
++    {+0,+0,+2,+1,0,0x30}, {+0,+0,+2,+2,1,0x10}, {+0,+1,+1,+0,0,0x44},
++    {+0,+1,+1,+2,0,0x10}, {+0,+1,+2,-1,1,0x40}, {+0,+1,+2,+0,0,0x60},
++    {+0,+1,+2,+1,0,0x20}, {+0,+1,+2,+2,0,0x10}, {+1,-2,+1,+0,0,0x80},
++    {+1,-1,+1,+1,0,0x88}, {+1,+0,+1,+2,0,0x08}, {+1,+0,+2,-1,0,0x40},
++    {+1,+0,+2,+1,0,0x10}
++  };
++  const interpolate_terms *cpt;
++  signed char *cp;
++  signed char chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
+   ushort (*brow[5])[4], *pix;
+   int prow=8, pcol=2, *ip, *code[16][16], gval[8], gmin, gmax, sum[4];
+   int row, col, x, y, x1, x2, y1, y2, t, weight, grads, color, diag;
+@@ -5728,11 +5735,11 @@ void CLASS vng_interpolate()
+   for (row=0; row < prow; row++)		/* Precalculate for VNG */
+     for (col=0; col < pcol; col++) {
+       code[row][col] = ip;
+-      for (cp=terms, t=0; t < 64; t++) {
+-	y1 = *cp++;  x1 = *cp++;
+-	y2 = *cp++;  x2 = *cp++;
+-	weight = *cp++;
+-	grads = *cp++;
++      for (cpt=&terms[0], t=0; t < 64, cpt = &terms[t]; t++) {
++	y1 = cpt->y1;  x1 = cpt->x1;
++	y2 = cpt->y2;  x2 = cpt->x2;
++	weight = cpt->weight;
++	grads = cpt->grads;
+ 	color = fcol(row+y1,col+x1);
+ 	if (fcol(row+y2,col+x2) != color) continue;
+ 	diag = (fcol(row,col+1) == color && fcol(row+1,col) == color) ? 2:1;
+diff --git a/internal/dcraw_common.cpp b/internal/dcraw_common.cpp
+index 0c7c07a..308ecd9 100644
+--- a/internal/dcraw_common.cpp
++++ b/internal/dcraw_common.cpp
+@@ -4513,30 +4513,37 @@ void CLASS lin_interpolate()
+  */
+ void CLASS vng_interpolate()
+ {
+-  static const signed char *cp, terms[] = {
+-    -2,-2,+0,-1,0,0x01, -2,-2,+0,+0,1,0x01, -2,-1,-1,+0,0,0x01,
+-    -2,-1,+0,-1,0,0x02, -2,-1,+0,+0,0,0x03, -2,-1,+0,+1,1,0x01,
+-    -2,+0,+0,-1,0,0x06, -2,+0,+0,+0,1,0x02, -2,+0,+0,+1,0,0x03,
+-    -2,+1,-1,+0,0,0x04, -2,+1,+0,-1,1,0x04, -2,+1,+0,+0,0,0x06,
+-    -2,+1,+0,+1,0,0x02, -2,+2,+0,+0,1,0x04, -2,+2,+0,+1,0,0x04,
+-    -1,-2,-1,+0,0,0x80, -1,-2,+0,-1,0,0x01, -1,-2,+1,-1,0,0x01,
+-    -1,-2,+1,+0,1,0x01, -1,-1,-1,+1,0,0x88, -1,-1,+1,-2,0,0x40,
+-    -1,-1,+1,-1,0,0x22, -1,-1,+1,+0,0,0x33, -1,-1,+1,+1,1,0x11,
+-    -1,+0,-1,+2,0,0x08, -1,+0,+0,-1,0,0x44, -1,+0,+0,+1,0,0x11,
+-    -1,+0,+1,-2,1,0x40, -1,+0,+1,-1,0,0x66, -1,+0,+1,+0,1,0x22,
+-    -1,+0,+1,+1,0,0x33, -1,+0,+1,+2,1,0x10, -1,+1,+1,-1,1,0x44,
+-    -1,+1,+1,+0,0,0x66, -1,+1,+1,+1,0,0x22, -1,+1,+1,+2,0,0x10,
+-    -1,+2,+0,+1,0,0x04, -1,+2,+1,+0,1,0x04, -1,+2,+1,+1,0,0x04,
+-    +0,-2,+0,+0,1,0x80, +0,-1,+0,+1,1,0x88, +0,-1,+1,-2,0,0x40,
+-    +0,-1,+1,+0,0,0x11, +0,-1,+2,-2,0,0x40, +0,-1,+2,-1,0,0x20,
+-    +0,-1,+2,+0,0,0x30, +0,-1,+2,+1,1,0x10, +0,+0,+0,+2,1,0x08,
+-    +0,+0,+2,-2,1,0x40, +0,+0,+2,-1,0,0x60, +0,+0,+2,+0,1,0x20,
+-    +0,+0,+2,+1,0,0x30, +0,+0,+2,+2,1,0x10, +0,+1,+1,+0,0,0x44,
+-    +0,+1,+1,+2,0,0x10, +0,+1,+2,-1,1,0x40, +0,+1,+2,+0,0,0x60,
+-    +0,+1,+2,+1,0,0x20, +0,+1,+2,+2,0,0x10, +1,-2,+1,+0,0,0x80,
+-    +1,-1,+1,+1,0,0x88, +1,+0,+1,+2,0,0x08, +1,+0,+2,-1,0,0x40,
+-    +1,+0,+2,+1,0,0x10
+-  }, chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
++  struct interpolate_terms {
++    signed char y1, x1, y2, x2, weight;
++    unsigned char grads;
++  };
++  static const interpolate_terms terms[] = {
++    {-2,-2,+0,-1,0,0x01}, {-2,-2,+0,+0,1,0x01}, {-2,-1,-1,+0,0,0x01},
++    {-2,-1,+0,-1,0,0x02}, {-2,-1,+0,+0,0,0x03}, {-2,-1,+0,+1,1,0x01},
++    {-2,+0,+0,-1,0,0x06}, {-2,+0,+0,+0,1,0x02}, {-2,+0,+0,+1,0,0x03},
++    {-2,+1,-1,+0,0,0x04}, {-2,+1,+0,-1,1,0x04}, {-2,+1,+0,+0,0,0x06},
++    {-2,+1,+0,+1,0,0x02}, {-2,+2,+0,+0,1,0x04}, {-2,+2,+0,+1,0,0x04},
++    {-1,-2,-1,+0,0,0x80}, {-1,-2,+0,-1,0,0x01}, {-1,-2,+1,-1,0,0x01},
++    {-1,-2,+1,+0,1,0x01}, {-1,-1,-1,+1,0,0x88}, {-1,-1,+1,-2,0,0x40},
++    {-1,-1,+1,-1,0,0x22}, {-1,-1,+1,+0,0,0x33}, {-1,-1,+1,+1,1,0x11},
++    {-1,+0,-1,+2,0,0x08}, {-1,+0,+0,-1,0,0x44}, {-1,+0,+0,+1,0,0x11},
++    {-1,+0,+1,-2,1,0x40}, {-1,+0,+1,-1,0,0x66}, {-1,+0,+1,+0,1,0x22},
++    {-1,+0,+1,+1,0,0x33}, {-1,+0,+1,+2,1,0x10}, {-1,+1,+1,-1,1,0x44},
++    {-1,+1,+1,+0,0,0x66}, {-1,+1,+1,+1,0,0x22}, {-1,+1,+1,+2,0,0x10},
++    {-1,+2,+0,+1,0,0x04}, {-1,+2,+1,+0,1,0x04}, {-1,+2,+1,+1,0,0x04},
++    {+0,-2,+0,+0,1,0x80}, {+0,-1,+0,+1,1,0x88}, {+0,-1,+1,-2,0,0x40},
++    {+0,-1,+1,+0,0,0x11}, {+0,-1,+2,-2,0,0x40}, {+0,-1,+2,-1,0,0x20},
++    {+0,-1,+2,+0,0,0x30}, {+0,-1,+2,+1,1,0x10}, {+0,+0,+0,+2,1,0x08},
++    {+0,+0,+2,-2,1,0x40}, {+0,+0,+2,-1,0,0x60}, {+0,+0,+2,+0,1,0x20},
++    {+0,+0,+2,+1,0,0x30}, {+0,+0,+2,+2,1,0x10}, {+0,+1,+1,+0,0,0x44},
++    {+0,+1,+1,+2,0,0x10}, {+0,+1,+2,-1,1,0x40}, {+0,+1,+2,+0,0,0x60},
++    {+0,+1,+2,+1,0,0x20}, {+0,+1,+2,+2,0,0x10}, {+1,-2,+1,+0,0,0x80},
++    {+1,-1,+1,+1,0,0x88}, {+1,+0,+1,+2,0,0x08}, {+1,+0,+2,-1,0,0x40},
++    {+1,+0,+2,+1,0,0x10}
++  };
++  const interpolate_terms *cpt;
++  signed char *cp;
++  signed char chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
+   ushort (*brow[5])[4], *pix;
+   int prow=8, pcol=2, *ip, *code[16][16], gval[8], gmin, gmax, sum[4];
+   int row, col, x, y, x1, x2, y1, y2, t, weight, grads, color, diag;
+@@ -4554,11 +4561,11 @@ void CLASS vng_interpolate()
+   for (row=0; row < prow; row++)		/* Precalculate for VNG */
+     for (col=0; col < pcol; col++) {
+       code[row][col] = ip;
+-      for (cp=terms, t=0; t < 64; t++) {
+-	y1 = *cp++;  x1 = *cp++;
+-	y2 = *cp++;  x2 = *cp++;
+-	weight = *cp++;
+-	grads = *cp++;
++      for (cpt=&terms[0], t=0; t < 64, cpt = &terms[t]; t++) {
++	y1 = cpt->y1;  x1 = cpt->x1;
++	y2 = cpt->y2;  x2 = cpt->x2;
++	weight = cpt->weight;
++	grads = cpt->grads;
+ 	color = fcol(row+y1,col+x1);
+ 	if (fcol(row+y2,col+x2) != color) continue;
+ 	diag = (fcol(row,col+1) == color && fcol(row+1,col) == color) ? 2:1;
+diff --git a/libraw/libraw_const.h b/libraw/libraw_const.h
+index b2b32a7..62fed45 100644
+--- a/libraw/libraw_const.h
++++ b/libraw/libraw_const.h
+@@ -191,8 +191,7 @@ enum LibRaw_progress
+ 
+     LIBRAW_PROGRESS_THUMB_LOAD          = 1<<28,
+     LIBRAW_PROGRESS_TRESERVED1          = 1<<29,
+-    LIBRAW_PROGRESS_TRESERVED2          = 1<<30,
+-    LIBRAW_PROGRESS_TRESERVED3          = 1<<31
++    LIBRAW_PROGRESS_TRESERVED2          = 1<<30
+ };
+ #define LIBRAW_PROGRESS_THUMB_MASK 0x0fffffff
+ 
+-- 
+2.7.4
+
diff --git a/package/libraw/0004-Revert-gcc6-compatibility.patch b/package/libraw/0004-Revert-gcc6-compatibility.patch
new file mode 100644
index 0000000..55a8dfe
--- /dev/null
+++ b/package/libraw/0004-Revert-gcc6-compatibility.patch
@@ -0,0 +1,216 @@
+From 1710804fa3256ab3fdad5c72b4caed6585d9783b Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Wed, 20 Jul 2016 19:38:40 +0300
+Subject: [PATCH] Revert "gcc6 compatibility"
+
+This reverts commit eba7a66e23f2f62cc4c8115af8066f2df5da085a.
+
+new gcc6 compatibility patch
+
+[Thomas: backport from upstream commit
+8a8723b0da66f8d858d93c23f2aeda265f35af61, plus adaptations for the
+backport.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ dcraw/dcraw.c             | 67 +++++++++++++++++++++--------------------------
+ internal/dcraw_common.cpp | 67 +++++++++++++++++++++--------------------------
+ internal/libraw_x3f.cpp   |  2 +-
+ libraw/libraw_const.h     |  3 ++-
+ 4 files changed, 63 insertions(+), 76 deletions(-)
+
+diff --git a/dcraw/dcraw.c b/dcraw/dcraw.c
+index 3bb7f93..9914169 100755
+--- a/dcraw/dcraw.c
++++ b/dcraw/dcraw.c
+@@ -5687,37 +5687,30 @@ void CLASS lin_interpolate()
+  */
+ void CLASS vng_interpolate()
+ {
+-  struct interpolate_terms {
+-    signed char y1, x1, y2, x2, weight;
+-    unsigned char grads;
+-  };
+-  static const interpolate_terms terms[] = {
+-    {-2,-2,+0,-1,0,0x01}, {-2,-2,+0,+0,1,0x01}, {-2,-1,-1,+0,0,0x01},
+-    {-2,-1,+0,-1,0,0x02}, {-2,-1,+0,+0,0,0x03}, {-2,-1,+0,+1,1,0x01},
+-    {-2,+0,+0,-1,0,0x06}, {-2,+0,+0,+0,1,0x02}, {-2,+0,+0,+1,0,0x03},
+-    {-2,+1,-1,+0,0,0x04}, {-2,+1,+0,-1,1,0x04}, {-2,+1,+0,+0,0,0x06},
+-    {-2,+1,+0,+1,0,0x02}, {-2,+2,+0,+0,1,0x04}, {-2,+2,+0,+1,0,0x04},
+-    {-1,-2,-1,+0,0,0x80}, {-1,-2,+0,-1,0,0x01}, {-1,-2,+1,-1,0,0x01},
+-    {-1,-2,+1,+0,1,0x01}, {-1,-1,-1,+1,0,0x88}, {-1,-1,+1,-2,0,0x40},
+-    {-1,-1,+1,-1,0,0x22}, {-1,-1,+1,+0,0,0x33}, {-1,-1,+1,+1,1,0x11},
+-    {-1,+0,-1,+2,0,0x08}, {-1,+0,+0,-1,0,0x44}, {-1,+0,+0,+1,0,0x11},
+-    {-1,+0,+1,-2,1,0x40}, {-1,+0,+1,-1,0,0x66}, {-1,+0,+1,+0,1,0x22},
+-    {-1,+0,+1,+1,0,0x33}, {-1,+0,+1,+2,1,0x10}, {-1,+1,+1,-1,1,0x44},
+-    {-1,+1,+1,+0,0,0x66}, {-1,+1,+1,+1,0,0x22}, {-1,+1,+1,+2,0,0x10},
+-    {-1,+2,+0,+1,0,0x04}, {-1,+2,+1,+0,1,0x04}, {-1,+2,+1,+1,0,0x04},
+-    {+0,-2,+0,+0,1,0x80}, {+0,-1,+0,+1,1,0x88}, {+0,-1,+1,-2,0,0x40},
+-    {+0,-1,+1,+0,0,0x11}, {+0,-1,+2,-2,0,0x40}, {+0,-1,+2,-1,0,0x20},
+-    {+0,-1,+2,+0,0,0x30}, {+0,-1,+2,+1,1,0x10}, {+0,+0,+0,+2,1,0x08},
+-    {+0,+0,+2,-2,1,0x40}, {+0,+0,+2,-1,0,0x60}, {+0,+0,+2,+0,1,0x20},
+-    {+0,+0,+2,+1,0,0x30}, {+0,+0,+2,+2,1,0x10}, {+0,+1,+1,+0,0,0x44},
+-    {+0,+1,+1,+2,0,0x10}, {+0,+1,+2,-1,1,0x40}, {+0,+1,+2,+0,0,0x60},
+-    {+0,+1,+2,+1,0,0x20}, {+0,+1,+2,+2,0,0x10}, {+1,-2,+1,+0,0,0x80},
+-    {+1,-1,+1,+1,0,0x88}, {+1,+0,+1,+2,0,0x08}, {+1,+0,+2,-1,0,0x40},
+-    {+1,+0,+2,+1,0,0x10}
+-  };
+-  const interpolate_terms *cpt;
+-  signed char *cp;
+-  signed char chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
++  static const signed char *cp, terms[] = {
++    -2,-2,+0,-1,0,0x01, -2,-2,+0,+0,1,0x01, -2,-1,-1,+0,0,0x01,
++    -2,-1,+0,-1,0,0x02, -2,-1,+0,+0,0,0x03, -2,-1,+0,+1,1,0x01,
++    -2,+0,+0,-1,0,0x06, -2,+0,+0,+0,1,0x02, -2,+0,+0,+1,0,0x03,
++    -2,+1,-1,+0,0,0x04, -2,+1,+0,-1,1,0x04, -2,+1,+0,+0,0,0x06,
++    -2,+1,+0,+1,0,0x02, -2,+2,+0,+0,1,0x04, -2,+2,+0,+1,0,0x04,
++    -1,-2,-1,+0,0,(signed char)0x80, -1,-2,+0,-1,0,0x01, -1,-2,+1,-1,0,0x01,
++    -1,-2,+1,+0,1,0x01, -1,-1,-1,+1,0,(signed char)0x88, -1,-1,+1,-2,0,0x40,
++    -1,-1,+1,-1,0,0x22, -1,-1,+1,+0,0,0x33, -1,-1,+1,+1,1,0x11,
++    -1,+0,-1,+2,0,0x08, -1,+0,+0,-1,0,0x44, -1,+0,+0,+1,0,0x11,
++    -1,+0,+1,-2,1,0x40, -1,+0,+1,-1,0,0x66, -1,+0,+1,+0,1,0x22,
++    -1,+0,+1,+1,0,0x33, -1,+0,+1,+2,1,0x10, -1,+1,+1,-1,1,0x44,
++    -1,+1,+1,+0,0,0x66, -1,+1,+1,+1,0,0x22, -1,+1,+1,+2,0,0x10,
++    -1,+2,+0,+1,0,0x04, -1,+2,+1,+0,1,0x04, -1,+2,+1,+1,0,0x04,
++    +0,-2,+0,+0,1,(signed char)0x80, +0,-1,+0,+1,1,(signed char)0x88, +0,-1,+1,-2,0,0x40,
++    +0,-1,+1,+0,0,0x11, +0,-1,+2,-2,0,0x40, +0,-1,+2,-1,0,0x20,
++    +0,-1,+2,+0,0,0x30, +0,-1,+2,+1,1,0x10, +0,+0,+0,+2,1,0x08,
++    +0,+0,+2,-2,1,0x40, +0,+0,+2,-1,0,0x60, +0,+0,+2,+0,1,0x20,
++    +0,+0,+2,+1,0,0x30, +0,+0,+2,+2,1,0x10, +0,+1,+1,+0,0,0x44,
++    +0,+1,+1,+2,0,0x10, +0,+1,+2,-1,1,0x40, +0,+1,+2,+0,0,0x60,
++    +0,+1,+2,+1,0,0x20, +0,+1,+2,+2,0,0x10, +1,-2,+1,+0,0,(signed char)0x80,
++    +1,-1,+1,+1,0,(signed char)0x88, +1,+0,+1,+2,0,0x08, +1,+0,+2,-1,0,0x40,
++    +1,+0,+2,+1,0,0x10
++  }, chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
+   ushort (*brow[5])[4], *pix;
+   int prow=8, pcol=2, *ip, *code[16][16], gval[8], gmin, gmax, sum[4];
+   int row, col, x, y, x1, x2, y1, y2, t, weight, grads, color, diag;
+@@ -5735,11 +5728,11 @@ void CLASS vng_interpolate()
+   for (row=0; row < prow; row++)		/* Precalculate for VNG */
+     for (col=0; col < pcol; col++) {
+       code[row][col] = ip;
+-      for (cpt=&terms[0], t=0; t < 64, cpt = &terms[t]; t++) {
+-	y1 = cpt->y1;  x1 = cpt->x1;
+-	y2 = cpt->y2;  x2 = cpt->x2;
+-	weight = cpt->weight;
+-	grads = cpt->grads;
++      for (cp=terms, t=0; t < 64; t++) {
++	y1 = *cp++;  x1 = *cp++;
++	y2 = *cp++;  x2 = *cp++;
++	weight = *cp++;
++	grads = *cp++;
+ 	color = fcol(row+y1,col+x1);
+ 	if (fcol(row+y2,col+x2) != color) continue;
+ 	diag = (fcol(row,col+1) == color && fcol(row+1,col) == color) ? 2:1;
+diff --git a/internal/dcraw_common.cpp b/internal/dcraw_common.cpp
+index 308ecd9..3e8769b 100644
+--- a/internal/dcraw_common.cpp
++++ b/internal/dcraw_common.cpp
+@@ -4513,37 +4513,30 @@ void CLASS lin_interpolate()
+  */
+ void CLASS vng_interpolate()
+ {
+-  struct interpolate_terms {
+-    signed char y1, x1, y2, x2, weight;
+-    unsigned char grads;
+-  };
+-  static const interpolate_terms terms[] = {
+-    {-2,-2,+0,-1,0,0x01}, {-2,-2,+0,+0,1,0x01}, {-2,-1,-1,+0,0,0x01},
+-    {-2,-1,+0,-1,0,0x02}, {-2,-1,+0,+0,0,0x03}, {-2,-1,+0,+1,1,0x01},
+-    {-2,+0,+0,-1,0,0x06}, {-2,+0,+0,+0,1,0x02}, {-2,+0,+0,+1,0,0x03},
+-    {-2,+1,-1,+0,0,0x04}, {-2,+1,+0,-1,1,0x04}, {-2,+1,+0,+0,0,0x06},
+-    {-2,+1,+0,+1,0,0x02}, {-2,+2,+0,+0,1,0x04}, {-2,+2,+0,+1,0,0x04},
+-    {-1,-2,-1,+0,0,0x80}, {-1,-2,+0,-1,0,0x01}, {-1,-2,+1,-1,0,0x01},
+-    {-1,-2,+1,+0,1,0x01}, {-1,-1,-1,+1,0,0x88}, {-1,-1,+1,-2,0,0x40},
+-    {-1,-1,+1,-1,0,0x22}, {-1,-1,+1,+0,0,0x33}, {-1,-1,+1,+1,1,0x11},
+-    {-1,+0,-1,+2,0,0x08}, {-1,+0,+0,-1,0,0x44}, {-1,+0,+0,+1,0,0x11},
+-    {-1,+0,+1,-2,1,0x40}, {-1,+0,+1,-1,0,0x66}, {-1,+0,+1,+0,1,0x22},
+-    {-1,+0,+1,+1,0,0x33}, {-1,+0,+1,+2,1,0x10}, {-1,+1,+1,-1,1,0x44},
+-    {-1,+1,+1,+0,0,0x66}, {-1,+1,+1,+1,0,0x22}, {-1,+1,+1,+2,0,0x10},
+-    {-1,+2,+0,+1,0,0x04}, {-1,+2,+1,+0,1,0x04}, {-1,+2,+1,+1,0,0x04},
+-    {+0,-2,+0,+0,1,0x80}, {+0,-1,+0,+1,1,0x88}, {+0,-1,+1,-2,0,0x40},
+-    {+0,-1,+1,+0,0,0x11}, {+0,-1,+2,-2,0,0x40}, {+0,-1,+2,-1,0,0x20},
+-    {+0,-1,+2,+0,0,0x30}, {+0,-1,+2,+1,1,0x10}, {+0,+0,+0,+2,1,0x08},
+-    {+0,+0,+2,-2,1,0x40}, {+0,+0,+2,-1,0,0x60}, {+0,+0,+2,+0,1,0x20},
+-    {+0,+0,+2,+1,0,0x30}, {+0,+0,+2,+2,1,0x10}, {+0,+1,+1,+0,0,0x44},
+-    {+0,+1,+1,+2,0,0x10}, {+0,+1,+2,-1,1,0x40}, {+0,+1,+2,+0,0,0x60},
+-    {+0,+1,+2,+1,0,0x20}, {+0,+1,+2,+2,0,0x10}, {+1,-2,+1,+0,0,0x80},
+-    {+1,-1,+1,+1,0,0x88}, {+1,+0,+1,+2,0,0x08}, {+1,+0,+2,-1,0,0x40},
+-    {+1,+0,+2,+1,0,0x10}
+-  };
+-  const interpolate_terms *cpt;
+-  signed char *cp;
+-  signed char chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
++  static const signed char *cp, terms[] = {
++    -2,-2,+0,-1,0,0x01, -2,-2,+0,+0,1,0x01, -2,-1,-1,+0,0,0x01,
++    -2,-1,+0,-1,0,0x02, -2,-1,+0,+0,0,0x03, -2,-1,+0,+1,1,0x01,
++    -2,+0,+0,-1,0,0x06, -2,+0,+0,+0,1,0x02, -2,+0,+0,+1,0,0x03,
++    -2,+1,-1,+0,0,0x04, -2,+1,+0,-1,1,0x04, -2,+1,+0,+0,0,0x06,
++    -2,+1,+0,+1,0,0x02, -2,+2,+0,+0,1,0x04, -2,+2,+0,+1,0,0x04,
++    -1,-2,-1,+0,0,(signed char)0x80, -1,-2,+0,-1,0,0x01, -1,-2,+1,-1,0,0x01,
++    -1,-2,+1,+0,1,0x01, -1,-1,-1,+1,0,(signed char)0x88, -1,-1,+1,-2,0,0x40,
++    -1,-1,+1,-1,0,0x22, -1,-1,+1,+0,0,0x33, -1,-1,+1,+1,1,0x11,
++    -1,+0,-1,+2,0,0x08, -1,+0,+0,-1,0,0x44, -1,+0,+0,+1,0,0x11,
++    -1,+0,+1,-2,1,0x40, -1,+0,+1,-1,0,0x66, -1,+0,+1,+0,1,0x22,
++    -1,+0,+1,+1,0,0x33, -1,+0,+1,+2,1,0x10, -1,+1,+1,-1,1,0x44,
++    -1,+1,+1,+0,0,0x66, -1,+1,+1,+1,0,0x22, -1,+1,+1,+2,0,0x10,
++    -1,+2,+0,+1,0,0x04, -1,+2,+1,+0,1,0x04, -1,+2,+1,+1,0,0x04,
++    +0,-2,+0,+0,1,(signed char)0x80, +0,-1,+0,+1,1,(signed char)0x88, +0,-1,+1,-2,0,0x40,
++    +0,-1,+1,+0,0,0x11, +0,-1,+2,-2,0,0x40, +0,-1,+2,-1,0,0x20,
++    +0,-1,+2,+0,0,0x30, +0,-1,+2,+1,1,0x10, +0,+0,+0,+2,1,0x08,
++    +0,+0,+2,-2,1,0x40, +0,+0,+2,-1,0,0x60, +0,+0,+2,+0,1,0x20,
++    +0,+0,+2,+1,0,0x30, +0,+0,+2,+2,1,0x10, +0,+1,+1,+0,0,0x44,
++    +0,+1,+1,+2,0,0x10, +0,+1,+2,-1,1,0x40, +0,+1,+2,+0,0,0x60,
++    +0,+1,+2,+1,0,0x20, +0,+1,+2,+2,0,0x10, +1,-2,+1,+0,0,(signed char)0x80,
++    +1,-1,+1,+1,0,(signed char)0x88, +1,+0,+1,+2,0,0x08, +1,+0,+2,-1,0,0x40,
++    +1,+0,+2,+1,0,0x10
++  }, chood[] = { -1,-1, -1,0, -1,+1, 0,+1, +1,+1, +1,0, +1,-1, 0,-1 };
+   ushort (*brow[5])[4], *pix;
+   int prow=8, pcol=2, *ip, *code[16][16], gval[8], gmin, gmax, sum[4];
+   int row, col, x, y, x1, x2, y1, y2, t, weight, grads, color, diag;
+@@ -4561,11 +4554,11 @@ void CLASS vng_interpolate()
+   for (row=0; row < prow; row++)		/* Precalculate for VNG */
+     for (col=0; col < pcol; col++) {
+       code[row][col] = ip;
+-      for (cpt=&terms[0], t=0; t < 64, cpt = &terms[t]; t++) {
+-	y1 = cpt->y1;  x1 = cpt->x1;
+-	y2 = cpt->y2;  x2 = cpt->x2;
+-	weight = cpt->weight;
+-	grads = cpt->grads;
++      for (cp=terms, t=0; t < 64; t++) {
++	y1 = *cp++;  x1 = *cp++;
++	y2 = *cp++;  x2 = *cp++;
++	weight = *cp++;
++	grads = *cp++;
+ 	color = fcol(row+y1,col+x1);
+ 	if (fcol(row+y2,col+x2) != color) continue;
+ 	diag = (fcol(row,col+1) == color && fcol(row+1,col) == color) ? 2:1;
+diff --git a/internal/libraw_x3f.cpp b/internal/libraw_x3f.cpp
+index 67047ab..ca335d7 100644
+--- a/internal/libraw_x3f.cpp
++++ b/internal/libraw_x3f.cpp
+@@ -1246,7 +1246,7 @@ static void huffman_decode_row(x3f_info_t *I,
+   x3f_image_data_t *ID = &DEH->data_subsection.image_data;
+   x3f_huffman_t *HUF = ID->huffman;
+ 
+-  int16_t c[3] = {offset,offset,offset};
++  int16_t c[3] = {(int16_t)offset,(int16_t)offset,(int16_t)offset};
+   int col;
+   bit_state_t BS;
+   
+diff --git a/libraw/libraw_const.h b/libraw/libraw_const.h
+index 62fed45..b2b32a7 100644
+--- a/libraw/libraw_const.h
++++ b/libraw/libraw_const.h
+@@ -191,7 +191,8 @@ enum LibRaw_progress
+ 
+     LIBRAW_PROGRESS_THUMB_LOAD          = 1<<28,
+     LIBRAW_PROGRESS_TRESERVED1          = 1<<29,
+-    LIBRAW_PROGRESS_TRESERVED2          = 1<<30
++    LIBRAW_PROGRESS_TRESERVED2          = 1<<30,
++    LIBRAW_PROGRESS_TRESERVED3          = 1<<31
+ };
+ #define LIBRAW_PROGRESS_THUMB_MASK 0x0fffffff
+ 
+-- 
+2.7.4
+
-- 
2.7.4
