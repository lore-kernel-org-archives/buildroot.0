From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 18:42:05 +0200
Subject: [Buildroot] [git commit] package/efl/libevas: Switch to giflib
Message-ID: <20150404164503.A9E44818EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfb54898133210a40bafdfbca72d9186d65c1b66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/0001-giflib.patch |   98 +++++++++++++++++++++++++++++++++
 package/efl/libevas/Config.in         |    2 +-
 package/efl/libevas/libevas.mk        |    2 +-
 3 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/package/efl/libevas/0001-giflib.patch b/package/efl/libevas/0001-giflib.patch
new file mode 100644
index 0000000..9342687
--- /dev/null
+++ b/package/efl/libevas/0001-giflib.patch
@@ -0,0 +1,98 @@
+Adjust source code to work with giflib 5.1x
+
+From http://giflib.sourceforge.net/gif_lib.html: GIF file openers and
+closers - DGifOpenFileName(), DGifOpenFileHandle(), DGifOpen(),
+DGifClose(), EGifOpenFileName(), EGifOpenFileHandle(), EGifOpen(), and
+EGifClose() - all now take a final integer address argument. If
+non-null, this is used to pass back an error code when the function
+returns NULL.
+
+Downloaded from
+http://commit.cvs.pld.groups.com.ru/332837-packagesevas_fix_building_with_giflib_51_rel_6
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c
+--- evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c	2013-08-01 17:41:35.000000000 +0200
++++ evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c	2015-01-26 19:44:20.132955194 +0100
+@@ -338,7 +338,7 @@
+ 
+    if (!cmap)
+      {
+-        DGifCloseFile(gif);
++        DGifCloseFile(gif, NULL);
+         for (i = 0; i < scale_h; i++)
+           {
+              free(rows[i]);
+@@ -725,7 +725,7 @@
+    if ((w < 1) || (h < 1) || (w > IMG_MAX_SIZE) || (h > IMG_MAX_SIZE) ||
+        IMG_TOO_BIG(w, h))
+      {
+-        DGifCloseFile(gif);
++        DGifCloseFile(gif, NULL);
+         if (IMG_TOO_BIG(w, h))
+           *error = EVAS_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED;
+         else
+@@ -740,7 +740,7 @@
+         if (DGifGetRecordType(gif, &rec) == GIF_ERROR)
+           {
+              /* PrintGifError(); */
+-             DGifCloseFile(gif);
++             DGifCloseFile(gif, NULL);
+              *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+              return EINA_FALSE;
+           }
+@@ -754,7 +754,7 @@
+              if (DGifGetImageDesc(gif) == GIF_ERROR)
+                {
+                   /* PrintGifError(); */
+-                  DGifCloseFile(gif);
++                  DGifCloseFile(gif, NULL);
+                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+                   return EINA_FALSE;
+                }
+@@ -762,7 +762,7 @@
+              if (DGifGetCode(gif, &img_code, &img) == GIF_ERROR)
+                {
+                   /* PrintGifError(); */
+-                  DGifCloseFile(gif);
++                  DGifCloseFile(gif, NULL);
+                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+                   return EINA_FALSE;
+                }
+@@ -818,7 +818,7 @@
+         ie->frames = NULL;
+      }
+ 
+-   DGifCloseFile(gif);
++   DGifCloseFile(gif, NULL);
+    *error = EVAS_LOAD_ERROR_NONE;
+    return EINA_TRUE;
+ }
+@@ -885,7 +885,7 @@
+      }
+ 
+    ie->frames = eina_list_append(ie->frames, frame);
+-   DGifCloseFile(gif);
++   DGifCloseFile(gif, NULL);
+    return EINA_TRUE;
+ }
+ 
+@@ -959,7 +959,7 @@
+                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
+                   return EINA_FALSE;
+                }
+-             DGifCloseFile(gif);
++             DGifCloseFile(gif, NULL);
+              *error = EVAS_LOAD_ERROR_NONE;
+              return EINA_TRUE;
+           }
+@@ -1080,7 +1080,7 @@
+          }
+      } while (rec != TERMINATE_RECORD_TYPE);
+ 
+-   DGifCloseFile(gif);
++   DGifCloseFile(gif, NULL);
+    return duration;
+ }
+ 
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 1fefe3b..6645a14 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -175,7 +175,7 @@ config BR2_PACKAGE_LIBEVAS_JPEG
 
 config BR2_PACKAGE_LIBEVAS_GIF
 	bool "libevas gif loader"
-	select BR2_PACKAGE_LIBUNGIF
+	select BR2_PACKAGE_GIFLIB
 	help
 	  This enables the loader code that loads gif files using
 	  libungif.
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 10c3bc3..8312902 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -180,7 +180,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GIF),y)
 LIBEVAS_CONF_OPTS += --enable-image-loader-gif
-LIBEVAS_DEPENDENCIES += libungif
+LIBEVAS_DEPENDENCIES += giflib
 else
 LIBEVAS_CONF_OPTS += --disable-image-loader-gif
 endif
