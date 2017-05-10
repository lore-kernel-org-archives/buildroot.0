From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:34:53 +0200
Subject: [Buildroot] [git commit] package/expedite: bump to the current
	master
Message-ID: <20170510213502.BAC1982908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=027e0765b5d0f1f0773a987a6cf22b7071939929
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current master is ahead of one commit, this commit include
the fix for the build issue reported upstream [1].
Remove the patch 0001 which is no longer necessary.

[1] https://phab.enlightenment.org/T5440

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-build-failure-with-gcc-5.patch        | 289 ---------------------
 package/expedite/expedite.hash                     |   2 +-
 package/expedite/expedite.mk                       |   2 +-
 3 files changed, 2 insertions(+), 291 deletions(-)

diff --git a/package/expedite/0001-fix-build-failure-with-gcc-5.patch b/package/expedite/0001-fix-build-failure-with-gcc-5.patch
deleted file mode 100644
index 2d5d6ef..0000000
--- a/package/expedite/0001-fix-build-failure-with-gcc-5.patch
+++ /dev/null
@@ -1,289 +0,0 @@
-From 01a29e6a1d2ed083d1a1884dbca37ae518f354c7 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 30 Apr 2017 12:07:02 +0200
-Subject: [PATCH] fix build failure with gcc < 5
-
-Definition of variables inside the initialization part of for() loops
-was added by [1] and produce some build failure with "old" gcc version
-(gcc < 5).
-
-This way of writing for loop is not consistent with the rest of the
-code. So revert to the C89 for loop syntax.
-
-Reported upstream:
-https://phab.enlightenment.org/T5440
-
-[1] https://git.enlightenment.org/tools/expedite.git/commit/?id=0529ce56b6fb01e9651e76461e9608e15a040fb3
-
-Fixes:
-http://autobuild.buildroot.net/results/930/930796603d37bc309a591eec68037192c51028ce
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/bin/image_data_argb.c                               |  9 ++++++---
- src/bin/image_data_argb_alpha.c                         |  6 ++++--
- src/bin/image_data_ycbcr601pl.c                         | 12 ++++++++----
- .../image_data_ycbcr601pl_map_nearest_solid_rotate.c    | 12 ++++++++----
- src/bin/image_data_ycbcr601pl_map_solid_rotate.c        | 12 ++++++++----
- src/bin/image_data_ycbcr601pl_wide_stride.c             | 17 +++++++++++------
- 6 files changed, 45 insertions(+), 23 deletions(-)
-
-diff --git a/src/bin/image_data_argb.c b/src/bin/image_data_argb.c
-index d5889ce..9c607b2 100644
---- a/src/bin/image_data_argb.c
-+++ b/src/bin/image_data_argb.c
-@@ -20,12 +20,13 @@ static Evas_Object *o_images[1];
- /* setup */
- static void _setup(void)
- {
-+   int i;
-    Evas_Object *o;
-    Eina_Slice sl;
- 
-    sl.len = 640 * 480 * 4;
-    sl.mem = malloc(sl.len);
--   for (int i = 0; i < 1; i++)
-+   for (i = 0; i < 1; i++)
-      {
-         o = efl_add(EFL_CANVAS_IMAGE_CLASS, evas);
-         o_images[i] = o;
-@@ -42,7 +43,8 @@ static void _setup(void)
- /* cleanup */
- static void _cleanup(void)
- {
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-         Evas_Object *o = o_images[i];
-         Eina_Slice sl = {};
-@@ -56,7 +58,8 @@ static void _cleanup(void)
- /* loop - do things */
- static void _loop(double t, int f)
- {
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-         Evas_Object *o = o_images[i];
-         unsigned int *data, *p;
-diff --git a/src/bin/image_data_argb_alpha.c b/src/bin/image_data_argb_alpha.c
-index 79f4c54..ffbe57e 100644
---- a/src/bin/image_data_argb_alpha.c
-+++ b/src/bin/image_data_argb_alpha.c
-@@ -20,12 +20,13 @@ static Evas_Object *o_images[1];
- /* setup */
- static void _setup(void)
- {
-+   int i;
-    Evas_Object *o;
-    Eina_Slice sl;
- 
-    sl.len = 640 * 480 * 4;
-    sl.mem = malloc(sl.len);
--   for (int i = 0; i < 1; i++)
-+   for (i = 0; i < 1; i++)
-      {
-         o = efl_add(EFL_CANVAS_IMAGE_CLASS, evas);
-         o_images[i] = o;
-@@ -42,7 +43,8 @@ static void _setup(void)
- /* cleanup */
- static void _cleanup(void)
- {
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-         Evas_Object *o = o_images[i];
-         Eina_Slice sl = {};
-diff --git a/src/bin/image_data_ycbcr601pl.c b/src/bin/image_data_ycbcr601pl.c
-index 032d5b3..e126e98 100644
---- a/src/bin/image_data_ycbcr601pl.c
-+++ b/src/bin/image_data_ycbcr601pl.c
-@@ -21,9 +21,11 @@ static Eina_Slice slice[3];
- /* setup */
- static void _setup(void)
- {
-+   int i;
-    FILE *f;
--   for (int i = 0; i < 1; i++)
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = efl_add(EFL_CANVAS_IMAGE_CLASS, evas);
-         o_images[i] = o;
-         efl_image_content_hint_set(o, EVAS_IMAGE_CONTENT_HINT_DYNAMIC);
-@@ -37,7 +39,7 @@ static void _setup(void)
-         slice[2].len = 320 * 240;
-         f = fopen(build_path("tp.yuv"), "rb");
-         if (!f) continue;
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              slice[p].mem = malloc(slice[p].len);
-              fread((void *) slice[p].mem, slice[p].len, 1, f);
-@@ -51,10 +53,12 @@ static void _setup(void)
- /* cleanup */
- static void _cleanup(void)
- {
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = o_images[i];
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              efl_gfx_buffer_managed_set(o, NULL, 640, 480, 0, EFL_GFX_COLORSPACE_YCBCR422P601_PL, p);
-              free((void *) slice[p].mem);
-diff --git a/src/bin/image_data_ycbcr601pl_map_nearest_solid_rotate.c b/src/bin/image_data_ycbcr601pl_map_nearest_solid_rotate.c
-index 0a5bcf4..db52b0b 100644
---- a/src/bin/image_data_ycbcr601pl_map_nearest_solid_rotate.c
-+++ b/src/bin/image_data_ycbcr601pl_map_nearest_solid_rotate.c
-@@ -21,9 +21,11 @@ static Eina_Slice slice[3];
- /* setup */
- static void _setup(void)
- {
-+   int i;
-    FILE *f;
--   for (int i = 0; i < 1; i++)
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = efl_add(EFL_CANVAS_IMAGE_CLASS, evas);
-         o_images[i] = o;
-         efl_image_content_hint_set(o, EVAS_IMAGE_CONTENT_HINT_DYNAMIC);
-@@ -37,7 +39,7 @@ static void _setup(void)
-         slice[2].len = 320 * 240;
-         f = fopen(build_path("tp.yuv"), "rb");
-         if (!f) continue;
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              slice[p].mem = malloc(slice[p].len);
-              fread((void *) slice[p].mem, slice[p].len, 1, f);
-@@ -51,10 +53,12 @@ static void _setup(void)
- /* cleanup */
- static void _cleanup(void)
- {
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = o_images[i];
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              efl_gfx_buffer_managed_set(o, NULL, 640, 480, 0, EFL_GFX_COLORSPACE_YCBCR422P601_PL, p);
-              free((void *) slice[p].mem);
-diff --git a/src/bin/image_data_ycbcr601pl_map_solid_rotate.c b/src/bin/image_data_ycbcr601pl_map_solid_rotate.c
-index 355293f..ac4364d 100644
---- a/src/bin/image_data_ycbcr601pl_map_solid_rotate.c
-+++ b/src/bin/image_data_ycbcr601pl_map_solid_rotate.c
-@@ -22,8 +22,10 @@ static Eina_Slice slice[3];
- static void _setup(void)
- {
-    FILE *f;
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = efl_add(EFL_CANVAS_IMAGE_CLASS, evas);
-         o_images[i] = o;
-         efl_image_content_hint_set(o, EVAS_IMAGE_CONTENT_HINT_DYNAMIC);
-@@ -37,7 +39,7 @@ static void _setup(void)
-         slice[2].len = 320 * 240;
-         f = fopen(build_path("tp.yuv"), "rb");
-         if (!f) continue;
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              slice[p].mem = malloc(slice[p].len);
-              fread((void *) slice[p].mem, slice[p].len, 1, f);
-@@ -51,10 +53,12 @@ static void _setup(void)
- /* cleanup */
- static void _cleanup(void)
- {
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = o_images[i];
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              efl_gfx_buffer_managed_set(o, NULL, 640, 480, 0, EFL_GFX_COLORSPACE_YCBCR422P601_PL, p);
-              free((void *) slice[p].mem);
-diff --git a/src/bin/image_data_ycbcr601pl_wide_stride.c b/src/bin/image_data_ycbcr601pl_wide_stride.c
-index d4e8fa2..9adb62f 100644
---- a/src/bin/image_data_ycbcr601pl_wide_stride.c
-+++ b/src/bin/image_data_ycbcr601pl_wide_stride.c
-@@ -21,11 +21,13 @@ static Eina_Slice slice[3];
- /* setup */
- static void _setup(void)
- {
-+   int i;
-    int stride;
-    FILE *f;
-    int w = 320 - 16;
--   for (int i = 0; i < 1; i++)
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = efl_add(EFL_CANVAS_IMAGE_CLASS, evas);
-         o_images[i] = o;
-         efl_image_content_hint_set(o, EVAS_IMAGE_CONTENT_HINT_DYNAMIC);
-@@ -41,7 +43,7 @@ static void _setup(void)
-         f = fopen(build_path("tp.yuv"), "rb");
-         if (!f) continue;
-         stride = 640;
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              slice[p].mem = malloc(slice[p].len);
-              fread((void *) slice[p].mem, slice[p].len, 1, f);
-@@ -57,10 +59,12 @@ static void _setup(void)
- /* cleanup */
- static void _cleanup(void)
- {
--   for (int i = 0; i < 1; i++)
-+   int i;
-+   for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = o_images[i];
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              efl_gfx_buffer_managed_set(o, NULL, 640, 480, 0,
-                                         EFL_GFX_COLORSPACE_YCBCR422P601_PL, p);
-@@ -77,11 +81,12 @@ static void _loop(double t, int f)
-    Evas_Coord x, y, w, h;
-    for (i = 0; i < 1; i++)
-      {
-+        int p;
-         Evas_Object *o = o_images[i];
-         Eina_Slice sl[3];
-         int stride;
- 
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           efl_gfx_buffer_managed_get(o, &sl[p], p);
- 
-         w = 640;
-@@ -97,7 +102,7 @@ static void _loop(double t, int f)
-         if (w > 640) w = 320;
- 
-         stride = 640;
--        for (int p = 0; p < 3; p++)
-+        for (p = 0; p < 3; p++)
-           {
-              efl_gfx_buffer_managed_set(o, &sl[p], w, 480, stride,
-                                         EFL_GFX_COLORSPACE_YCBCR422P601_PL, p);
--- 
-2.9.3
-
diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
index 2d1db59..828ee05 100644
--- a/package/expedite/expedite.hash
+++ b/package/expedite/expedite.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 007e382861555f1023b679e21ff44122b0622c514ce8ef9d7c390b9ac1511009 expedite-0529ce56b6fb01e9651e76461e9608e15a040fb3.tar.gz
+sha256 56e1dbd9826d932f0ef72a10dfdf32b6e0f680ab6830f8a8cfc60644ac69dbf1 expedite-e7b11dd328d9db82b49cde795944a721beaf0112.tar.gz
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index d49e87a..6bd4b00 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = 0529ce56b6fb01e9651e76461e9608e15a040fb3
+EXPEDITE_VERSION = e7b11dd328d9db82b49cde795944a721beaf0112
 EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
 EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2-Clause
