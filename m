From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  5 Mar 2015 22:01:05 +0100
Subject: [Buildroot] [PATCH v1] libsvg: fix undefined symbol
	png_set_gray_1_2_4_to_8
Message-ID: <1425589265-16605-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following runtime error e.g. from df_texture:

(!) Direct/Interface: Unable to dlopen `/usr/lib/directfb-1.6-0/interfaces/IDirectFBImageProvider/libidirectfbimageprovider_svg.so'!
    --> /usr/lib/libsvg.so.1: undefined symbol: png_set_gray_1_2_4_to_8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-undefined-symbol-png_set_gray_1_2_4_to_8.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch

diff --git a/package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch b/package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch
new file mode 100644
index 0000000..d0bbeab
--- /dev/null
+++ b/package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch
@@ -0,0 +1,32 @@
+From 213e5749947fad08d985eda8d06839efedda78ef Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 5 Mar 2015 21:42:52 +0100
+Subject: [PATCH] Fix undefined symbol png_set_gray_1_2_4_to_8
+
+Since libpng-1.4.0 the function png_set_gray_1_2_4_to_8() was
+removed, the replacement function is called
+png_set_expand_gray_1_2_4_to_8() (see [1]).
+
+[1] http://libpng.sourceforge.net/ANNOUNCE-1.4.0.txt
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/svg_image.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/svg_image.c b/src/svg_image.c
+index cd8a95a..f256943 100755
+--- a/src/svg_image.c
++++ b/src/svg_image.c
+@@ -271,7 +271,7 @@ _svg_image_read_png (const char		*filename,
+ 
+     /* expand gray bit depth if needed */
+     if (color_type == PNG_COLOR_TYPE_GRAY && depth < 8)
+-	png_set_gray_1_2_4_to_8 (png);
++	png_set_expand_gray_1_2_4_to_8 (png);
+ 
+     /* transform transparency to alpha */
+     if (png_get_valid(png, info, PNG_INFO_tRNS))
+-- 
+2.1.4
+
-- 
2.1.4
