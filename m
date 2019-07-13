From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Jul 2019 14:32:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/imagemagick: add upstream security
 fix for CVE-2019-13454
In-Reply-To: <20190713123234.9340-1-bernd.kuhls@t-online.de>
References: <20190713123234.9340-1-bernd.kuhls@t-online.de>
Message-ID: <20190713123234.9340-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/0001-CVE-2019-13454.patch | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 package/imagemagick/0001-CVE-2019-13454.patch

diff --git a/package/imagemagick/0001-CVE-2019-13454.patch b/package/imagemagick/0001-CVE-2019-13454.patch
new file mode 100644
index 0000000000..dce28cc3d1
--- /dev/null
+++ b/package/imagemagick/0001-CVE-2019-13454.patch
@@ -0,0 +1,92 @@
+From 1ddcf2e4f28029a888cadef2e757509ef5047ad8 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Mon, 8 Jul 2019 06:14:34 -0400
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/1629
+
+Downloaded from upstream commit
+https://github.com/ImageMagick/ImageMagick/commit/1ddcf2e4f28029a888cadef2e757509ef5047ad8
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ MagickCore/layer.c | 56 ++++++++++++++++++++++++----------------------
+ 1 file changed, 29 insertions(+), 27 deletions(-)
+
+diff --git a/MagickCore/layer.c b/MagickCore/layer.c
+index b520e9247d..48632885ae 100644
+--- a/MagickCore/layer.c
++++ b/MagickCore/layer.c
+@@ -1584,45 +1584,47 @@ MagickExport void OptimizeImageTransparency(const Image *image,
+ %    o exception: return any errors or warnings in this structure.
+ %
+ */
+-MagickExport void RemoveDuplicateLayers(Image **images,
+-     ExceptionInfo *exception)
++MagickExport void RemoveDuplicateLayers(Image **images,ExceptionInfo *exception)
+ {
+-  register Image
+-    *curr,
+-    *next;
+-
+   RectangleInfo
+     bounds;
+ 
++  register Image
++    *image,
++    *next;
++
+   assert((*images) != (const Image *) NULL);
+   assert((*images)->signature == MagickCoreSignature);
+   if ((*images)->debug != MagickFalse)
+-    (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",(*images)->filename);
++    (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",
++      (*images)->filename);
+   assert(exception != (ExceptionInfo *) NULL);
+   assert(exception->signature == MagickCoreSignature);
+-
+-  curr=GetFirstImageInList(*images);
+-  for (; (next=GetNextImageInList(curr)) != (Image *) NULL; curr=next)
++  image=GetFirstImageInList(*images);
++  for ( ; (next=GetNextImageInList(image)) != (Image *) NULL; image=next)
+   {
+-    if ( curr->columns != next->columns || curr->rows != next->rows
+-         || curr->page.x != next->page.x || curr->page.y != next->page.y )
++    if ((image->columns != next->columns) || (image->rows != next->rows) ||
++        (image->page.x != next->page.x) || (image->page.y != next->page.y))
+       continue;
+-    bounds=CompareImagesBounds(curr,next,CompareAnyLayer,exception);
+-    if ( bounds.x < 0 ) {
+-      /*
+-        the two images are the same, merge time delays and delete one.
+-      */
+-      size_t time;
+-      time = curr->delay*1000/curr->ticks_per_second;
+-      time += next->delay*1000/next->ticks_per_second;
+-      next->ticks_per_second = 100L;
+-      next->delay = time*curr->ticks_per_second/1000;
+-      next->iterations = curr->iterations;
+-      *images = curr;
+-      (void) DeleteImageFromList(images);
+-    }
++    bounds=CompareImagesBounds(image,next,CompareAnyLayer,exception);
++    if (bounds.x < 0)
++      {
++        /*
++          Two images are the same, merge time delays and delete one.
++        */
++        size_t
++          time;
++
++        time=1000*image->delay*PerceptibleReciprocal(image->ticks_per_second);
++        time+=1000*next->delay*PerceptibleReciprocal(next->ticks_per_second);
++        next->ticks_per_second=100L;
++        next->delay=time*image->ticks_per_second/1000;
++        next->iterations=image->iterations;
++        *images=image;
++        (void) DeleteImageFromList(images);
++      }
+   }
+-  *images = GetFirstImageInList(*images);
++  *images=GetFirstImageInList(*images);
+ }
+ 
+ /*
-- 
2.20.1
