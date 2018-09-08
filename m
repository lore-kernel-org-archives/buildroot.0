From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:02:12 +0200
Subject: [Buildroot] [git commit] package/aubio: fix build with FFmpeg 4.0
Message-ID: <20180908210220.B84C283706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f46d73adf14c171fac0cfd83c5c4e1bec8786f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch b/package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch
new file mode 100644
index 0000000000..40ff2dfb89
--- /dev/null
+++ b/package/aubio/0001-Fix-build-with-FFmpeg-4.0.patch
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
+2.14.4
+
