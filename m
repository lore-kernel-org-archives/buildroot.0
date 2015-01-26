From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 Jan 2015 20:24:18 +0100
Subject: [Buildroot] [PATCH 3/5] package/imlib2: Switch to giflib
In-Reply-To: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1422300260-5361-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imlib2/0001-giflib51.patch |   71 ++++++++++++++++++++++++++++++++++++
 package/imlib2/Config.in           |    2 +-
 package/imlib2/imlib2.mk           |    2 +-
 3 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 package/imlib2/0001-giflib51.patch

diff --git a/package/imlib2/0001-giflib51.patch b/package/imlib2/0001-giflib51.patch
new file mode 100644
index 0000000..2b46329
--- /dev/null
+++ b/package/imlib2/0001-giflib51.patch
@@ -0,0 +1,71 @@
+Adjust source code to work with giflib 5.1x
+
+Downloaded from
+https://projects.archlinux.org/svntogit/packages.git/plain/trunk/imlib2-giflib51.patch?h=packages/imlib2
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -ruN imlib2-1.4.6.orig/src/modules/loaders/loader_gif.c imlib2-1.4.6/src/modules/loaders/loader_gif.c
+--- imlib2-1.4.6.orig/src/modules/loaders/loader_gif.c	2013-12-21 10:16:10.000000000 +0000
++++ imlib2-1.4.6/src/modules/loaders/loader_gif.c	2014-05-27 09:52:35.857291512 +0000
+@@ -36,7 +36,7 @@
+ #endif
+    if (fd < 0)
+       return 0;
+-   gif = DGifOpenFileHandle(fd);
++   gif = DGifOpenFileHandle(fd, NULL);
+    if (!gif)
+      {
+         close(fd);
+@@ -60,13 +60,13 @@
+              h = gif->Image.Height;
+              if (!IMAGE_DIMENSIONS_OK(w, h))
+                {
+-                  DGifCloseFile(gif);
++                  DGifCloseFile(gif, NULL);
+                   return 0;
+                }
+              rows = malloc(h * sizeof(GifRowType *));
+              if (!rows)
+                {
+-                  DGifCloseFile(gif);
++                  DGifCloseFile(gif, NULL);
+                   return 0;
+                }
+              for (i = 0; i < h; i++)
+@@ -78,7 +78,7 @@
+                   rows[i] = malloc(w * sizeof(GifPixelType));
+                   if (!rows[i])
+                     {
+-                       DGifCloseFile(gif);
++                       DGifCloseFile(gif, NULL);
+                        for (i = 0; i < h; i++)
+                          {
+                             if (rows[i])
+@@ -150,7 +150,7 @@
+         im->data = (DATA32 *) malloc(sizeof(DATA32) * w * h);
+         if (!im->data)
+           {
+-             DGifCloseFile(gif);
++             DGifCloseFile(gif, NULL);
+              free(rows);
+              return 0;
+           }
+@@ -181,7 +181,7 @@
+                        last_per = (int)per;
+                        if (!(progress(im, (int)per, 0, last_y, w, i)))
+                          {
+-                            DGifCloseFile(gif);
++                            DGifCloseFile(gif, NULL);
+                             for (i = 0; i < h; i++)
+                               {
+                                  free(rows[i]);
+@@ -198,7 +198,7 @@
+      {
+         progress(im, 100, 0, last_y, w, h);
+      }
+-   DGifCloseFile(gif);
++   DGifCloseFile(gif, NULL);
+    for (i = 0; i < h; i++)
+      {
+         free(rows[i]);
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
index 62f3989..d8feeb6 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -38,7 +38,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_GIF),y)
 	IMLIB2_CONF_OPTS += --with-gif
-	IMLIB2_DEPENDENCIES += libungif
+	IMLIB2_DEPENDENCIES += giflib
 else
 	IMLIB2_CONF_OPTS += --without-gif
 endif
-- 
1.7.10.4
