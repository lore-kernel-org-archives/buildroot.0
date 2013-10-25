From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 08:34:41 -0300
Subject: [Buildroot] [PATCH 4/4] matchbox-lib: patch up support for libpng
	1.5+
In-Reply-To: <1382700881-28336-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382700881-28336-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1382700881-28336-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../matchbox-lib/matchbox-lib-1.9-libpng15.patch   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/matchbox/matchbox-lib/matchbox-lib-1.9-libpng15.patch

diff --git a/package/matchbox/matchbox-lib/matchbox-lib-1.9-libpng15.patch b/package/matchbox/matchbox-lib/matchbox-lib-1.9-libpng15.patch
new file mode 100644
index 0000000..3d68573
--- /dev/null
+++ b/package/matchbox/matchbox-lib/matchbox-lib-1.9-libpng15.patch
@@ -0,0 +1,26 @@
+Support for libpng 1.5+ shamelessly taken from Gentoo.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/libmb/mbpixbuf.c
++++ b/libmb/mbpixbuf.c
+@@ -247,7 +247,7 @@
+     return NULL;
+   }
+ 
+-  if ( setjmp( png_ptr->jmpbuf ) ) {
++  if ( setjmp( png_jmpbuf(png_ptr) ) ) {
+     png_destroy_read_struct( &png_ptr, &info_ptr, NULL);
+     fclose(fd);
+     return NULL;
+@@ -269,8 +269,8 @@
+       ( color_type == PNG_COLOR_TYPE_GRAY_ALPHA ))
+     png_set_gray_to_rgb(png_ptr);
+  
+-  if ( info_ptr->color_type == PNG_COLOR_TYPE_RGB_ALPHA 
+-       || info_ptr->color_type == PNG_COLOR_TYPE_GRAY_ALPHA
++  if ( color_type == PNG_COLOR_TYPE_RGB_ALPHA 
++       || color_type == PNG_COLOR_TYPE_GRAY_ALPHA
+        )
+     *has_alpha = 1;
+   else
-- 
1.8.1.5
