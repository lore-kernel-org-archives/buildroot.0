From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:14:24 +0100
Subject: [Buildroot] [git commit] kodi-texturepacker: fix compilation error
 with host gcc 7.x
Message-ID: <20180129221636.B8E9C88056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceec22f56994a7d7a370a3807cc4a8f07b3749da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When host-kodi-texturepacker is built on a machine using gcc 7.x, it
fails to build with:

/usr/include/stdlib.h:443:14: error: declaration of ???void* reallocarray(void*, size_t, size_t) throw ()??? has a different exception specifier
 extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)

This commit backports the upstream fix for this problem.

The issue could be reproduced with the following defconfig (and a gcc
7.x host compiler):

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-texturepacker/0002-fix_reallocarray.patch | 170 +++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/package/kodi-texturepacker/0002-fix_reallocarray.patch b/package/kodi-texturepacker/0002-fix_reallocarray.patch
new file mode 100644
index 0000000000..e32d09ef53
--- /dev/null
+++ b/package/kodi-texturepacker/0002-fix_reallocarray.patch
@@ -0,0 +1,170 @@
+From ebc5dfcad836936a14e6f18fd7faa377b3c804e7 Mon Sep 17 00:00:00 2001
+From: MilhouseVH <milhouseVH.github@nmacleod.com>
+Date: Mon, 6 Nov 2017 11:47:28 +0000
+Subject: [PATCH] TexturePacker: use C++ headers
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+---
+ tools/depends/native/TexturePacker/src/SimpleFS.h            | 4 ++--
+ tools/depends/native/TexturePacker/src/TexturePacker.cpp     | 2 +-
+ tools/depends/native/TexturePacker/src/XBTFWriter.cpp        | 6 +++---
+ tools/depends/native/TexturePacker/src/XBTFWriter.h          | 2 +-
+ tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp | 2 +-
+ tools/depends/native/TexturePacker/src/md5.h                 | 4 ++--
+ 6 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/SimpleFS.h b/tools/depends/native/TexturePacker/src/SimpleFS.h
+index c48814c0ad..c2288cf8de 100644
+--- a/tools/depends/native/TexturePacker/src/SimpleFS.h
++++ b/tools/depends/native/TexturePacker/src/SimpleFS.h
+@@ -20,9 +20,9 @@
+  *
+  */
+ 
+-#include <stdio.h>
++#include <cstdio>
+ #include <string>
+-#include <stdint.h>
++#include <cstdint>
+ 
+ class CFile
+ {
+diff --git a/tools/depends/native/TexturePacker/src/TexturePacker.cpp b/tools/depends/native/TexturePacker/src/TexturePacker.cpp
+index ba618be574..045c5ce38d 100644
+--- a/tools/depends/native/TexturePacker/src/TexturePacker.cpp
++++ b/tools/depends/native/TexturePacker/src/TexturePacker.cpp
+@@ -22,7 +22,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #define __STDC_FORMAT_MACROS
+-#include <inttypes.h>
++#include <cinttypes>
+ #define platform_stricmp _stricmp
+ #else
+ #define platform_stricmp stricmp
+diff --git a/tools/depends/native/TexturePacker/src/XBTFWriter.cpp b/tools/depends/native/TexturePacker/src/XBTFWriter.cpp
+index 9e2493369b..2e80ba674c 100644
+--- a/tools/depends/native/TexturePacker/src/XBTFWriter.cpp
++++ b/tools/depends/native/TexturePacker/src/XBTFWriter.cpp
+@@ -19,14 +19,14 @@
+  */
+ 
+ #define __STDC_FORMAT_MACROS
+-#include <inttypes.h>
++#include <cinttypes>
+ #if defined(TARGET_FREEBSD) || defined(TARGET_DARWIN)
+-#include <stdlib.h>
++#include <cstdlib>
+ #elif !defined(TARGET_DARWIN)
+ #include <malloc.h>
+ #endif
+ #include <memory.h>
+-#include <string.h>
++#include <cstring>
+ 
+ #include "XBTFWriter.h"
+ #include "guilib/XBTFReader.h"
+diff --git a/tools/depends/native/TexturePacker/src/XBTFWriter.h b/tools/depends/native/TexturePacker/src/XBTFWriter.h
+index 7509303a51..d5cf1a2965 100644
+--- a/tools/depends/native/TexturePacker/src/XBTFWriter.h
++++ b/tools/depends/native/TexturePacker/src/XBTFWriter.h
+@@ -23,7 +23,7 @@
+ 
+ #include <vector>
+ #include <string>
+-#include <stdio.h>
++#include <cstdio>
+ 
+ #include "guilib/XBTF.h"
+ 
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+index 56c22f7c3a..3ddb20fe88 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+@@ -20,7 +20,7 @@
+ 
+ #include "GifHelper.h"
+ #include <algorithm>
+-#include <stdlib.h>
++#include <cstdlib>
+ #include <cstring>
+ 
+ #define UNSIGNED_LITTLE_ENDIAN(lo, hi)	((lo) | ((hi) << 8))
+diff --git a/tools/depends/native/TexturePacker/src/md5.h b/tools/depends/native/TexturePacker/src/md5.h
+index 456e5be17f..4bb48e0810 100644
+--- a/tools/depends/native/TexturePacker/src/md5.h
++++ b/tools/depends/native/TexturePacker/src/md5.h
+@@ -23,8 +23,8 @@
+ #ifndef MD5_H
+ #define MD5_H
+ 
+-#include <string.h>		/* for memcpy() */
+-#include <stdint.h>
++#include <cstring>		/* for memcpy() */
++#include <cstdint>
+ 
+ struct MD5Context 
+ {
+-- 
+2.16.0
+
+From ff3e6dad5fdb7b9a2985b2547c8020c709af0340 Mon Sep 17 00:00:00 2001
+From: MilhouseVH <milhouseVH.github@nmacleod.com>
+Date: Mon, 6 Nov 2017 18:05:17 +0000
+Subject: [PATCH] TexturePacker: drop unused variable
+
+---
+ tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp b/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp
+index 53f5e9beb7..b0f18bed68 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp
++++ b/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp
+@@ -72,7 +72,6 @@ bool JPGDecoder::LoadFile(const std::string &filename, DecodedFrames &frames)
+   struct jpeg_decompress_struct cinfo;
+   struct jpeg_error_mgr jerr;
+   
+-  char *linha;
+   int ImageSize;
+   
+   cinfo.err = jpeg_std_error(&jerr);
+@@ -89,7 +88,6 @@ bool JPGDecoder::LoadFile(const std::string &filename, DecodedFrames &frames)
+   DecodedFrame frame;
+   
+   frame.rgbaImage.pixels = (char *)new char[ImageSize];
+-  linha = (char *)frame.rgbaImage.pixels;
+   
+   unsigned char *scanlinebuff = new unsigned char[3 * cinfo.image_width];
+   unsigned char *dst = (unsigned char *)frame.rgbaImage.pixels;
+-- 
+2.16.0
+
+From ee441543be07de1222bcff2587bfcdb5c1231989 Mon Sep 17 00:00:00 2001
+From: MilhouseVH <milhouseVH.github@nmacleod.com>
+Date: Mon, 6 Nov 2017 21:02:06 +0000
+Subject: [PATCH] TexturePacker: include GifHelper after system headers
+
+---
+ tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+index 3ddb20fe88..9ced4ec5bc 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
++++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
+@@ -18,10 +18,10 @@
+  *
+  */
+ 
+-#include "GifHelper.h"
+ #include <algorithm>
+ #include <cstdlib>
+ #include <cstring>
++#include "GifHelper.h"
+ 
+ #define UNSIGNED_LITTLE_ENDIAN(lo, hi)	((lo) | ((hi) << 8))
+ #define GIF_MAX_MEMORY 82944000U // about 79 MB, which is equivalent to 10 full hd frames.
+-- 
+2.16.0
+
