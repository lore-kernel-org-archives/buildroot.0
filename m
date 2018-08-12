From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:32:03 +0200
Subject: [Buildroot] [PATCH/next 4/6] package/mediastreamer: Fix build with
 FFmpeg 4.0
In-Reply-To: <20180812203205.7251-1-bernd.kuhls@t-online.de>
References: <20180812203205.7251-1-bernd.kuhls@t-online.de>
Message-ID: <20180812203205.7251-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mediastreamer/0002-ffmpeg4.patch | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/mediastreamer/0002-ffmpeg4.patch

diff --git a/package/mediastreamer/0002-ffmpeg4.patch b/package/mediastreamer/0002-ffmpeg4.patch
new file mode 100644
index 0000000000..e0424e09b6
--- /dev/null
+++ b/package/mediastreamer/0002-ffmpeg4.patch
@@ -0,0 +1,30 @@
+Fix build with ffmpeg4
+
+videofilters/nowebcam.c:251:49: error: use of undeclared identifier 'FF_INPUT_BUFFER_PADDING_SIZE'
+                jpgbuf=(uint8_t*)ms_malloc0(statbuf.st_size + FF_INPUT_BUFFER_PADDING_SIZE);
+                                                              ^
+Downloaded from
+https://svnweb.freebsd.org/ports/head/net/mediastreamer/files/patch-src_videofilters_nowebcam.c?view=markup
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/src/videofilters/nowebcam.c.orig	2016-08-18 14:17:37 UTC
++++ b/src/videofilters/nowebcam.c
+@@ -32,7 +32,7 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston,
+ #ifndef NO_FFMPEG
+ #include "ffmpeg-priv.h"
+ #else
+-#define FF_INPUT_BUFFER_PADDING_SIZE 32
++#define AV_INPUT_BUFFER_PADDING_SIZE 32
+ #endif
+ 
+ #if TARGET_OS_IPHONE
+@@ -248,7 +248,7 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpat
+ 			ms_error("Cannot load %s",jpgpath);
+ 			return NULL;
+ 		}
+-		jpgbuf=(uint8_t*)ms_malloc0(statbuf.st_size + FF_INPUT_BUFFER_PADDING_SIZE);
++		jpgbuf=(uint8_t*)ms_malloc0(statbuf.st_size + AV_INPUT_BUFFER_PADDING_SIZE);
+ 		if (jpgbuf==NULL)
+ 		{
+ 			close(fd);
-- 
2.18.0
