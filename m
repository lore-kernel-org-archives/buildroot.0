From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 28 Jan 2020 10:36:47 +0100
Subject: [Buildroot] [RFC-for-2019.02 v1] package/qt5webengine: fix LTS/5.6
 jpec_codec compile failures
Message-ID: <20200128093647.12106-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix some jpeg_codec bool/boolean/int mismatch
compile issues.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
Send as RFC because only tested for one defconfig provided
by Rafa using the RPi provided pre-build toolchain ([1]).

Send only for 2019.02 as the same defconfig failes with
2019.11 for qt5webengine later on with some libav/ffmpeg
version mismatch errors.

[1] http://lists.busybox.net/pipermail/buildroot/2020-January/272189.html
---
 ...ome-bool-boolean-int-mismatch-compil.patch | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.6.3/0003-jpeg_codec-fix-some-bool-boolean-int-mismatch-compil.patch

diff --git a/package/qt5/qt5webengine/5.6.3/0003-jpeg_codec-fix-some-bool-boolean-int-mismatch-compil.patch b/package/qt5/qt5webengine/5.6.3/0003-jpeg_codec-fix-some-bool-boolean-int-mismatch-compil.patch
new file mode 100644
index 0000000000..57c781563d
--- /dev/null
+++ b/package/qt5/qt5webengine/5.6.3/0003-jpeg_codec-fix-some-bool-boolean-int-mismatch-compil.patch
@@ -0,0 +1,98 @@
+From 99c96f1d5e3efbed066f11ff8384b13ca8a7056e Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 28 Jan 2020 10:08:09 +0100
+Subject: [PATCH] jpeg_codec: fix some bool/boolean/int mismatch compile issues
+
+Fixes:
+
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc: In function 'boolean gfx::{anonymous}::EmptyOutputBuffer(jpeg_compress_struct*)':
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:123:10: error: invalid conversion from 'int' to 'boolean' [-fpermissive]
+     return 1;
+            ^
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc: In static member function 'static bool gfx::JPEGCodec::Encode(const unsigned char*, gfx::JPEGCodec::ColorFormat, int, int, int, int, std::vector<unsigned char>*)':
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:264:38: error: invalid conversion from 'int' to 'boolean' [-fpermissive]
+     jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
+                                        ^
+  In file included from .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:16:0:
+  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:991:14: note: initializing argument 3 of 'void jpeg_set_quality(j_compress_ptr, int, boolean)'
+   EXTERN(void) jpeg_set_quality JPP((j_compress_ptr cinfo, int quality,
+                ^
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:276:32: error: invalid conversion from 'int' to 'boolean' [-fpermissive]
+     jpeg_start_compress(&cinfo, 1);
+                                  ^
+  In file included from .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:16:0:
+  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:1010:14: note: initializing argument 2 of 'void jpeg_start_compress(j_compress_ptr, boolean)'
+   EXTERN(void) jpeg_start_compress JPP((j_compress_ptr cinfo,
+                ^
+  In file included from .../tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3/bits/atomic_base.h:36:0,
+                   from .../tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3/atomic:41,
+                   from .../build/qt5webengine-5.6.3/src/3rdparty/chromium/third_party/skia/include/core/../private/../private/SkAtomics.h:13,
+                   from .../build/qt5webengine-5.6.3/src/3rdparty/chromium/third_party/skia/include/core/../private/SkOncePtr.h:11,
+                   from .../build/qt5webengine-5.6.3/src/3rdparty/chromium/third_party/skia/include/core/SkColorTable.h:13,
+                   from .../build/qt5webengine-5.6.3/src/3rdparty/chromium/third_party/skia/include/core/SkBitmap.h:12,
+                   from .../qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:11:
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc: In function 'boolean gfx::{anonymous}::FillInputBuffer(j_decompress_ptr)':
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:362:10: error: cannot convert 'bool' to 'boolean' in return
+     return false;
+            ^
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc: In static member function 'static bool gfx::JPEGCodec::Decode(const unsigned char*, size_t, gfx::JPEGCodec::ColorFormat, std::vector<unsigned char>*, int*, int*)':
+  .../build/qt5webengine-5.6.3/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc:490:36: error: cannot convert 'bool' to 'boolean' for argument '2' to 'int jpeg_read_header(j_decompress_ptr, boolean)'
+     if (jpeg_read_header(&cinfo, true) != JPEG_HEADER_OK)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
+index 8a08fe029..38d886c01 100644
+--- a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
++++ b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
+@@ -120,7 +120,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
+   // tell libjpeg where to write the next data
+   cinfo->dest->next_output_byte = &(*state->out)[state->image_buffer_used];
+   cinfo->dest->free_in_buffer = state->out->size() - state->image_buffer_used;
+-  return 1;
++  return TRUE;
+ }
+ 
+ // Cleans up the JpegEncoderState to prepare for returning in the final form.
+@@ -261,7 +261,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
+   cinfo.data_precision = 8;
+ 
+   jpeg_set_defaults(&cinfo);
+-  jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
++  jpeg_set_quality(&cinfo, quality, TRUE);  // quality here is 0-100
+ 
+   // set up the destination manager
+   jpeg_destination_mgr destmgr;
+@@ -273,7 +273,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
+   JpegEncoderState state(output);
+   cinfo.client_data = &state;
+ 
+-  jpeg_start_compress(&cinfo, 1);
++  jpeg_start_compress(&cinfo, TRUE);
+ 
+   // feed it the rows, doing necessary conversions for the color format
+ #ifdef JCS_EXTENSIONS
+@@ -359,7 +359,7 @@ void InitSource(j_decompress_ptr cinfo) {
+ //   set to a positive value if TRUE is returned. A FALSE return should only
+ //   be used when I/O suspension is desired."
+ boolean FillInputBuffer(j_decompress_ptr cinfo) {
+-  return false;
++  return FALSE;
+ }
+ 
+ // Skip data in the buffer. Since we have all the data at once, this operation
+@@ -487,7 +487,7 @@ bool JPEGCodec::Decode(const unsigned char* input, size_t input_size,
+   cinfo.client_data = &state;
+ 
+   // fill the file metadata into our buffer
+-  if (jpeg_read_header(&cinfo, true) != JPEG_HEADER_OK)
++  if (jpeg_read_header(&cinfo, TRUE) != JPEG_HEADER_OK)
+     return false;
+ 
+   // we want to always get RGB data out
+-- 
+2.25.0
+
-- 
2.25.0
