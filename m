From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 11:07:59 +0200
Subject: [Buildroot] [git commit] matchbox-lib: patch up support for libpng
	1.5+
Message-ID: <20131026093658.A07449B851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70da2ae5ff0c816c7a0c500293b50d3d0dd9b641
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../matchbox-lib/matchbox-lib-1.9-libpng15.patch   |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

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
