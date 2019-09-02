From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 12:40:49 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/imagemagick:
 security bump version to 7.0.8-59
Message-ID: <20190902103644.DC40988F37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0239de3c5bd421bcb04c4fa71a64007a3b26bccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes
https://github.com/ImageMagick/ImageMagick/issues/1641 (no CVE id yet)
https://github.com/ImageMagick/ImageMagick/issues/1644 (no CVE id yet)

Removed patch included in version 7.0.8-54.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e9811b52fc050bedae23bdb10acba26aa180cb53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/0001-CVE-2019-13454.patch | 92 ---------------------------
 package/imagemagick/imagemagick.hash          |  2 +-
 package/imagemagick/imagemagick.mk            |  2 +-
 3 files changed, 2 insertions(+), 94 deletions(-)

diff --git a/package/imagemagick/0001-CVE-2019-13454.patch b/package/imagemagick/0001-CVE-2019-13454.patch
deleted file mode 100644
index dce28cc3d1..0000000000
--- a/package/imagemagick/0001-CVE-2019-13454.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 1ddcf2e4f28029a888cadef2e757509ef5047ad8 Mon Sep 17 00:00:00 2001
-From: Cristy <urban-warrior@imagemagick.org>
-Date: Mon, 8 Jul 2019 06:14:34 -0400
-Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/1629
-
-Downloaded from upstream commit
-https://github.com/ImageMagick/ImageMagick/commit/1ddcf2e4f28029a888cadef2e757509ef5047ad8
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- MagickCore/layer.c | 56 ++++++++++++++++++++++++----------------------
- 1 file changed, 29 insertions(+), 27 deletions(-)
-
-diff --git a/MagickCore/layer.c b/MagickCore/layer.c
-index b520e9247d..48632885ae 100644
---- a/MagickCore/layer.c
-+++ b/MagickCore/layer.c
-@@ -1584,45 +1584,47 @@ MagickExport void OptimizeImageTransparency(const Image *image,
- %    o exception: return any errors or warnings in this structure.
- %
- */
--MagickExport void RemoveDuplicateLayers(Image **images,
--     ExceptionInfo *exception)
-+MagickExport void RemoveDuplicateLayers(Image **images,ExceptionInfo *exception)
- {
--  register Image
--    *curr,
--    *next;
--
-   RectangleInfo
-     bounds;
- 
-+  register Image
-+    *image,
-+    *next;
-+
-   assert((*images) != (const Image *) NULL);
-   assert((*images)->signature == MagickCoreSignature);
-   if ((*images)->debug != MagickFalse)
--    (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",(*images)->filename);
-+    (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",
-+      (*images)->filename);
-   assert(exception != (ExceptionInfo *) NULL);
-   assert(exception->signature == MagickCoreSignature);
--
--  curr=GetFirstImageInList(*images);
--  for (; (next=GetNextImageInList(curr)) != (Image *) NULL; curr=next)
-+  image=GetFirstImageInList(*images);
-+  for ( ; (next=GetNextImageInList(image)) != (Image *) NULL; image=next)
-   {
--    if ( curr->columns != next->columns || curr->rows != next->rows
--         || curr->page.x != next->page.x || curr->page.y != next->page.y )
-+    if ((image->columns != next->columns) || (image->rows != next->rows) ||
-+        (image->page.x != next->page.x) || (image->page.y != next->page.y))
-       continue;
--    bounds=CompareImagesBounds(curr,next,CompareAnyLayer,exception);
--    if ( bounds.x < 0 ) {
--      /*
--        the two images are the same, merge time delays and delete one.
--      */
--      size_t time;
--      time = curr->delay*1000/curr->ticks_per_second;
--      time += next->delay*1000/next->ticks_per_second;
--      next->ticks_per_second = 100L;
--      next->delay = time*curr->ticks_per_second/1000;
--      next->iterations = curr->iterations;
--      *images = curr;
--      (void) DeleteImageFromList(images);
--    }
-+    bounds=CompareImagesBounds(image,next,CompareAnyLayer,exception);
-+    if (bounds.x < 0)
-+      {
-+        /*
-+          Two images are the same, merge time delays and delete one.
-+        */
-+        size_t
-+          time;
-+
-+        time=1000*image->delay*PerceptibleReciprocal(image->ticks_per_second);
-+        time+=1000*next->delay*PerceptibleReciprocal(next->ticks_per_second);
-+        next->ticks_per_second=100L;
-+        next->delay=time*image->ticks_per_second/1000;
-+        next->iterations=image->iterations;
-+        *images=image;
-+        (void) DeleteImageFromList(images);
-+      }
-   }
--  *images = GetFirstImageInList(*images);
-+  *images=GetFirstImageInList(*images);
- }
- 
- /*
diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index e5f8733d7a..f95fa275d1 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b8c35e03fc4bd2bf66bddfe232a34473e7df68c3716c831ba76dc30520e7b490  7.0.8-53.tar.gz
+sha256 238ee17196fcb80bb58485910aaefc12d48f99e4043c2a28f06ff9588161c4e3  7.0.8-59.tar.gz
 sha256 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index df1dbe86da..a0c91f9183 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.8-53
+IMAGEMAGICK_VERSION = 7.0.8-59
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
