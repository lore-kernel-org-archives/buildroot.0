From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat,  7 Mar 2015 19:38:20 +0100
Subject: [Buildroot] [PATCH v2 2/2] imlib2: use giflib instead of soon to be
	deprecated libungif
In-Reply-To: <1425753500-22942-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425753500-22942-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425753500-22942-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add three upstream patch to support giflib version 5.1

Also rename the previous patches to match the order of the commits in
the upstream master branch.

Fixes:
http://autobuild.buildroot.net/results/2255be9a80551dcf92b12de4b5c53d4b02245669
http://autobuild.buildroot.net/results/4b0b86adb660a38c405abffc681a8edd6834825a

Those failures happen when giflib was installed after libungif so
overwritting libungif installed files.

To prevent other build failures when libungif is installed after giflib
the libungif must be deprecated.
Switching to giflib is the first step before deprecating libungif.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v2:
     - Add references to autobuild failures

 .../0001-GIF-loader-Fix-for-libgif-version-5.patch |  43 +++++
 .../0002-GIF-loader-Simplify-error-handling.patch  | 175 +++++++++++++++++++++
 ...Y_MISSING-redefined-warnings-when-X-is-d.patch} |   4 +-
 ...-not-link-with-X-libs-when-X-is-disabled.patch} |   4 +-
 ...005-GIF-loader-Fix-for-libgif-version-5.1.patch |  44 ++++++
 package/imlib2/Config.in                           |   2 +-
 package/imlib2/imlib2.mk                           |   2 +-
 7 files changed, 268 insertions(+), 6 deletions(-)
 create mode 100644 package/imlib2/0001-GIF-loader-Fix-for-libgif-version-5.patch
 create mode 100644 package/imlib2/0002-GIF-loader-Simplify-error-handling.patch
 rename package/imlib2/{0001-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch => 0003-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch} (92%)
 rename package/imlib2/{0002-do-not-link-with-X-libs-when-X-is-disabled.patch => 0004-do-not-link-with-X-libs-when-X-is-disabled.patch} (84%)
 create mode 100644 package/imlib2/0005-GIF-loader-Fix-for-libgif-version-5.1.patch

diff --git a/package/imlib2/0001-GIF-loader-Fix-for-libgif-version-5.patch b/package/imlib2/0001-GIF-loader-Fix-for-libgif-version-5.patch
new file mode 100644
index 0000000..e39eb94
--- /dev/null
+++ b/package/imlib2/0001-GIF-loader-Fix-for-libgif-version-5.patch
@@ -0,0 +1,43 @@
+From 17bf7bf95da6ed5b522205c321efcf838c48b13d Mon Sep 17 00:00:00 2001
+From: Kim Woelders <kim@woelders.dk>
+Date: Sun, 4 Aug 2013 08:05:27 +0200
+Subject: [PATCH 1/5] GIF loader: Fix for libgif version 5.
+
+---
+ src/modules/loaders/loader_gif.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/modules/loaders/loader_gif.c b/src/modules/loaders/loader_gif.c
+index 23b8fd0..d1c2ae2 100644
+--- a/src/modules/loaders/loader_gif.c
++++ b/src/modules/loaders/loader_gif.c
+@@ -29,6 +29,7 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+    /* already data in this image - dont load it again */
+    if (im->data)
+       return 0;
++
+ #ifndef __EMX__
+    fd = open(im->real_file, O_RDONLY);
+ #else
+@@ -36,12 +37,18 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+ #endif
+    if (fd < 0)
+       return 0;
++
++#if GIFLIB_MAJOR >= 5
++   gif = DGifOpenFileHandle(fd, NULL);
++#else
+    gif = DGifOpenFileHandle(fd);
++#endif
+    if (!gif)
+      {
+         close(fd);
+         return 0;
+      }
++
+    do
+      {
+         if (DGifGetRecordType(gif, &rec) == GIF_ERROR)
+-- 
+2.3.1
+
diff --git a/package/imlib2/0002-GIF-loader-Simplify-error-handling.patch b/package/imlib2/0002-GIF-loader-Simplify-error-handling.patch
new file mode 100644
index 0000000..c2b5254
--- /dev/null
+++ b/package/imlib2/0002-GIF-loader-Simplify-error-handling.patch
@@ -0,0 +1,175 @@
+From 908a179726d010963f4fe1b57fb5f7bf590d7d64 Mon Sep 17 00:00:00 2001
+From: Kim Woelders <kim@woelders.dk>
+Date: Tue, 31 Dec 2013 18:13:45 +0100
+Subject: [PATCH 2/5] GIF loader: Simplify error handling.
+
+Also:
+- Fix memory leak when image data allocation fails.
+- Some aux data arrays may as well be const.
+---
+ src/modules/loaders/loader_gif.c | 80 ++++++++++++++++------------------------
+ 1 file changed, 32 insertions(+), 48 deletions(-)
+
+diff --git a/src/modules/loaders/loader_gif.c b/src/modules/loaders/loader_gif.c
+index d1c2ae2..a39c860 100644
+--- a/src/modules/loaders/loader_gif.c
++++ b/src/modules/loaders/loader_gif.c
+@@ -8,6 +8,9 @@ char
+ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+      char immediate_load)
+ {
++   static const int    intoffset[] = { 0, 4, 2, 1 };
++   static const int    intjump[] = { 8, 8, 4, 2 };
++   int                 rc;
+    DATA32             *ptr;
+    GifFileType        *gif;
+    GifRowType         *rows;
+@@ -16,8 +19,6 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+    int                 i, j, done, bg, r, g, b, w = 0, h = 0;
+    float               per = 0.0, per_inc;
+    int                 last_per = 0, last_y = 0;
+-   int                 intoffset[] = { 0, 4, 2, 1 };
+-   int                 intjump[] = { 8, 8, 4, 2 };
+    int                 transp;
+    int                 fd;
+ 
+@@ -49,6 +50,8 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+         return 0;
+      }
+ 
++   rc = 0;                      /* Failure */
++
+    do
+      {
+         if (DGifGetRecordType(gif, &rec) == GIF_ERROR)
+@@ -66,37 +69,19 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+              w = gif->Image.Width;
+              h = gif->Image.Height;
+              if (!IMAGE_DIMENSIONS_OK(w, h))
+-               {
+-                  DGifCloseFile(gif);
+-                  return 0;
+-               }
+-             rows = malloc(h * sizeof(GifRowType *));
++                goto quit2;
++
++             rows = calloc(h, sizeof(GifRowType *));
+              if (!rows)
+-               {
+-                  DGifCloseFile(gif);
+-                  return 0;
+-               }
+-             for (i = 0; i < h; i++)
+-               {
+-                  rows[i] = NULL;
+-               }
++                goto quit2;
++
+              for (i = 0; i < h; i++)
+                {
+                   rows[i] = malloc(w * sizeof(GifPixelType));
+                   if (!rows[i])
+-                    {
+-                       DGifCloseFile(gif);
+-                       for (i = 0; i < h; i++)
+-                         {
+-                            if (rows[i])
+-                              {
+-                                 free(rows[i]);
+-                              }
+-                         }
+-                       free(rows);
+-                       return 0;
+-                    }
++                     goto quit;
+                }
++
+              if (gif->Image.Interlace)
+                {
+                   for (i = 0; i < 4; i++)
+@@ -135,6 +120,7 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+           }
+      }
+    while (rec != TERMINATE_RECORD_TYPE);
++
+    if (transp >= 0)
+      {
+         SET_FLAG(im->flags, F_HAS_ALPHA);
+@@ -143,6 +129,7 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+      {
+         UNSET_FLAG(im->flags, F_HAS_ALPHA);
+      }
++
+    /* set the format string member to the lower-case full extension */
+    /* name for the format - so example names would be: */
+    /* "png", "jpeg", "tiff", "ppm", "pgm", "pbm", "gif", "xpm" ... */
+@@ -150,17 +137,15 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+    im->h = h;
+    if (!im->format)
+       im->format = strdup("gif");
++
+    if (im->loader || immediate_load || progress)
+      {
+         bg = gif->SBackGroundColor;
+         cmap = (gif->Image.ColorMap ? gif->Image.ColorMap : gif->SColorMap);
+         im->data = (DATA32 *) malloc(sizeof(DATA32) * w * h);
+         if (!im->data)
+-          {
+-             DGifCloseFile(gif);
+-             free(rows);
+-             return 0;
+-          }
++           goto quit;
++
+         ptr = im->data;
+         per_inc = 100.0 / (((float)w) * h);
+         for (i = 0; i < h; i++)
+@@ -188,30 +173,29 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+                        last_per = (int)per;
+                        if (!(progress(im, (int)per, 0, last_y, w, i)))
+                          {
+-                            DGifCloseFile(gif);
+-                            for (i = 0; i < h; i++)
+-                              {
+-                                 free(rows[i]);
+-                              }
+-                            free(rows);
+-                            return 2;
++                            rc = 2;
++                            goto quit;
+                          }
+                        last_y = i;
+                     }
+                }
+           }
++
++        if (progress)
++           progress(im, 100, 0, last_y, w, h);
+      }
+-   if (progress)
+-     {
+-        progress(im, 100, 0, last_y, w, h);
+-     }
+-   DGifCloseFile(gif);
++
++   rc = 1;                      /* Success */
++
++ quit:
+    for (i = 0; i < h; i++)
+-     {
+-        free(rows[i]);
+-     }
++      free(rows[i]);
+    free(rows);
+-   return 1;
++
++ quit2:
++   DGifCloseFile(gif);
++
++   return rc;
+ }
+ 
+ void
+-- 
+2.3.1
+
diff --git a/package/imlib2/0001-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch b/package/imlib2/0003-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
similarity index 92%
rename from package/imlib2/0001-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
rename to package/imlib2/0003-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
index f3327a0..b5d451d 100644
--- a/package/imlib2/0001-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
+++ b/package/imlib2/0003-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
@@ -1,7 +1,7 @@
-From 49e3034ab714c9f05a6c0a04cf85ecbdb65c02d5 Mon Sep 17 00:00:00 2001
+From aaf62d4c605726e6c5f6869bd6834eca03c50d9c Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Mon, 28 Jul 2014 22:59:35 -0400
-Subject: [PATCH 1/2] fix X_DISPLAY_MISSING redefined warnings when X is
+Subject: [PATCH 3/5] fix X_DISPLAY_MISSING redefined warnings when X is
  disabled
 
 This is set up in config.h by configure, so avoid defining it again.
diff --git a/package/imlib2/0002-do-not-link-with-X-libs-when-X-is-disabled.patch b/package/imlib2/0004-do-not-link-with-X-libs-when-X-is-disabled.patch
similarity index 84%
rename from package/imlib2/0002-do-not-link-with-X-libs-when-X-is-disabled.patch
rename to package/imlib2/0004-do-not-link-with-X-libs-when-X-is-disabled.patch
index e34f9bc..11611eb 100644
--- a/package/imlib2/0002-do-not-link-with-X-libs-when-X-is-disabled.patch
+++ b/package/imlib2/0004-do-not-link-with-X-libs-when-X-is-disabled.patch
@@ -1,7 +1,7 @@
-From f5caf5432609938794d7a72afe059cfcfccd38bf Mon Sep 17 00:00:00 2001
+From c7f6ae523bbe165e50c44c21744f56f6f4b575c5 Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Mon, 28 Jul 2014 23:01:23 -0400
-Subject: [PATCH 2/2] do not link with X libs when X is disabled
+Subject: [PATCH 4/5] do not link with X libs when X is disabled
 
 URL: https://bugs.gentoo.org/517670
 ---
diff --git a/package/imlib2/0005-GIF-loader-Fix-for-libgif-version-5.1.patch b/package/imlib2/0005-GIF-loader-Fix-for-libgif-version-5.1.patch
new file mode 100644
index 0000000..63e0ef1
--- /dev/null
+++ b/package/imlib2/0005-GIF-loader-Fix-for-libgif-version-5.1.patch
@@ -0,0 +1,44 @@
+From 8531957235f8702f8bdafac31059812d66e95c23 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Mon, 13 Oct 2014 17:41:25 +0200
+Subject: [PATCH 5/5] GIF loader: Fix for libgif version 5.1
+
+Summary:
+From giflib-5.1.0's NEWS:
+"A small change to the API: DGifClose() and EGifClose() now take a
+pointer-to-int second argument (like the corresponding openers)
+where a diagnostic code will be deposited when they return
+GIF_ERROR."
+
+Test Plan:
+I've built imlib2 against giflib-4.2.3 and 5.1.0 and opened a few
+gif files with feh.
+
+Reviewers: kwo
+
+Reviewed By: kwo
+
+Differential Revision: https://phab.enlightenment.org/D1529
+---
+ src/modules/loaders/loader_gif.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/modules/loaders/loader_gif.c b/src/modules/loaders/loader_gif.c
+index a39c860..c53f62c 100644
+--- a/src/modules/loaders/loader_gif.c
++++ b/src/modules/loaders/loader_gif.c
+@@ -193,7 +193,11 @@ load(ImlibImage * im, ImlibProgressFunction progress, char progress_granularity,
+    free(rows);
+ 
+  quit2:
++#if GIFLIB_MAJOR > 5 || (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1)
++   DGifCloseFile(gif, NULL);
++#else
+    DGifCloseFile(gif);
++#endif
+ 
+    return rc;
+ }
+-- 
+2.3.1
+
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index a323a8d..7aac074 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_IMLIB2_PNG
 
 config BR2_PACKAGE_IMLIB2_GIF
 	bool "GIF support"
-	select BR2_PACKAGE_LIBUNGIF
+	select BR2_PACKAGE_GIFLIB
 
 config BR2_PACKAGE_IMLIB2_TIFF
 	bool "TIFF support"
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 6539246..0378429 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -39,7 +39,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_GIF),y)
 	IMLIB2_CONF_OPTS += --with-gif
-	IMLIB2_DEPENDENCIES += libungif
+	IMLIB2_DEPENDENCIES += giflib
 else
 	IMLIB2_CONF_OPTS += --without-gif
 endif
-- 
2.3.1
