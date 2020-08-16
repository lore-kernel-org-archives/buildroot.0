From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 22:48:16 +0200
Subject: [Buildroot] [git commit] package/opencv: fix build with jasper >=
 2.0.17
Message-ID: <20200816204145.A04CF83FE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=521854251f5a1e1082dbed503772969cd5797c41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/656e2232a0566ba8f7826a87b1fab9cc2c3d8e46

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Fix-build-of-grfmt_jpeg2000-cpp.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/opencv/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch b/package/opencv/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
new file mode 100644
index 0000000000..683dd95d97
--- /dev/null
+++ b/package/opencv/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
@@ -0,0 +1,37 @@
+From f66fc199a20882c546fa31142e9c0f5a8b3cf983 Mon Sep 17 00:00:00 2001
+From: Florian Jung <flo@windfis.ch>
+Date: Wed, 29 Jul 2020 18:51:55 +0200
+Subject: [PATCH] Fix build of grfmt_jpeg2000.cpp
+
+libjasper has recently changed `jas_matrix_get` from a macro to an inline function
+(389951d071 in https://github.com/jasper-software/jasper), causing the build to fail.
+
+[Retrieved (and backported) from:
+https://github.com/opencv/opencv/commit/f66fc199a20882c546fa31142e9c0f5a8b3cf983]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/imgcodecs/src/grfmt_jpeg2000.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/highgui/src/grfmt_jpeg2000.cpp b/modules/highgui/src/grfmt_jpeg2000.cpp
+index fe69f80c86f..0f4d28d6f4d 100644
+--- a/modules/highgui/src/grfmt_jpeg2000.cpp
++++ b/modules/highgui/src/grfmt_jpeg2000.cpp
+@@ -377,7 +377,7 @@ bool  Jpeg2KDecoder::readComponent8u( uchar *data, void *_buffer,
+ 
+     for( y = 0; y < yend - ystart; )
+     {
+-        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
++        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
+         uchar* dst = data + (y - yoffset) * step - xoffset;
+ 
+         if( xstep == 1 )
+@@ -443,7 +443,7 @@ bool  Jpeg2KDecoder::readComponent16u( unsigned short *data, void *_buffer,
+ 
+     for( y = 0; y < yend - ystart; )
+     {
+-        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
++        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
+         ushort* dst = data + (y - yoffset) * step - xoffset;
+ 
+         if( xstep == 1 )
