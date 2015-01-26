From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 Jan 2015 20:24:19 +0100
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/efl/libevas/0001-giflib.patch |   91 +++++++++++++++++++++++++++++++++
 package/efl/libevas/Config.in         |    2 +-
 package/efl/libevas/libevas.mk        |    2 +-
 3 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 package/efl/libevas/0001-giflib.patch

diff --git a/package/efl/libevas/0001-giflib.patch b/package/efl/libevas/0001-giflib.patch
new file mode 100644
index 0000000..1176721
--- /dev/null
+++ b/package/efl/libevas/0001-giflib.patch
@@ -0,0 +1,91 @@
+Adjust source code to work with giflib 5.1x
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
index febc115..fa36e80 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -177,7 +177,7 @@ config BR2_PACKAGE_LIBEVAS_JPEG
 
 config BR2_PACKAGE_LIBEVAS_GIF
 	bool "libevas gif loader"
-	select BR2_PACKAGE_LIBUNGIF
+	select BR2_PACKAGE_GIFLIB
 	help
 	  This enables the loader code that loads gif files using
 	  libungif.
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index b5a2d72..9f2e801 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -167,7 +167,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GIF),y)
 LIBEVAS_CONF_OPTS += --enable-image-loader-gif
-LIBEVAS_DEPENDENCIES += libungif
+LIBEVAS_DEPENDENCIES += giflib
 else
 LIBEVAS_CONF_OPTS += --disable-image-loader-gif
 endif
-- 
1.7.10.4
