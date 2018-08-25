From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 09:31:12 +0200
Subject: [Buildroot] [PATCH/next v3 1/7] package/aubio: Fix build with
 FFmpeg 4.0
Message-ID: <20180825073118.14980-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: re-integrated in ffmpeg bump series
v2: split patch from v1 series

 package/aubio/0001-ffmpeg4.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/aubio/0001-ffmpeg4.patch

diff --git a/package/aubio/0001-ffmpeg4.patch b/package/aubio/0001-ffmpeg4.patch
new file mode 100644
index 0000000000..bdaac55a3d
--- /dev/null
+++ b/package/aubio/0001-ffmpeg4.patch
@@ -0,0 +1,32 @@
+From 5690daf759b473b9d13b4547ef37adc2695cf524 Mon Sep 17 00:00:00 2001
+From: James Cowgill <jcowgill@jcowgill.uk>
+Date: Sun, 25 Feb 2018 14:23:25 +0000
+Subject: [PATCH] Fix build with FFmpeg 4.0
+
+Downloaded from upstream commit
+https://git.aubio.org/?p=aubio.git;a=commitdiff;h=5690daf759b473b9d13b4547ef37adc2695cf524
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/io/source_avcodec.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/io/source_avcodec.c b/src/io/source_avcodec.c
+index ccdce807..8197445c 100644
+--- a/src/io/source_avcodec.c
++++ b/src/io/source_avcodec.c
+@@ -58,7 +58,11 @@
+ #include "fmat.h"
+ #include "source_avcodec.h"
+ 
++#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(56, 56, 0)
+ #define AUBIO_AVCODEC_MAX_BUFFER_SIZE FF_MIN_BUFFER_SIZE
++#else
++#define AUBIO_AVCODEC_MAX_BUFFER_SIZE AV_INPUT_BUFFER_MIN_SIZE
++#endif
+ 
+ struct _aubio_source_avcodec_t {
+   uint_t hop_size;
+-- 
+2.11.0
+
-- 
2.18.0
