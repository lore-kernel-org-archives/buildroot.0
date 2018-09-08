From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:09:24 +0200
Subject: [Buildroot] [git commit] package/mediastreamer: fix build with
 FFmpeg 4.0
Message-ID: <20180908210901.7CF778370B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebc948ffaf329891e80b92f2f33a565418e940cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...T_BUFFER_PADDING_SIZE-to-determine-paddin.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
new file mode 100644
index 0000000000..792c3eeb44
--- /dev/null
+++ b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
@@ -0,0 +1,64 @@
+From 84b1919124884232e0fa30b30458470db27c73fc Mon Sep 17 00:00:00 2001
+From: James Cowgill <jcowgill@debian.org>
+Date: Sat, 18 Aug 2018 12:56:38 +0200
+Subject: [PATCH] Use AV_INPUT_BUFFER_PADDING_SIZE to determine padding
+ size
+
+Hardcoding the value for FF_INPUT_BUFFER_PADDING_SIZE is not safe
+because  upstream FFmpeg might change it (as they did in FFmpeg 4.0).
+
+Instead, use FFmpeg's AV_INPUT_BUFFER_PADDING_SIZE if available and
+only hardcode a value if FFmpeg is disabled (in which case the value
+doesn't particularly matter anyway). For compatibility with older
+FFmpeg versions, define AV_INPUT_BUFFER_PADDING_SIZE if hasn't been
+defined yet.
+
+Downloaded from
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901735
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/utils/ffmpeg-priv.h     | 4 ++++
+ src/videofilters/nowebcam.c | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/utils/ffmpeg-priv.h b/src/utils/ffmpeg-priv.h
+index c0745a9a..d59ea0e1 100644
+--- a/src/utils/ffmpeg-priv.h
++++ b/src/utils/ffmpeg-priv.h
+@@ -102,6 +102,10 @@ static inline int avcodec_decode_video2(AVCodecContext *avctx, AVFrame *picture,
+ #endif
+ #endif
+ 
++#ifndef AV_INPUT_BUFFER_PADDING_SIZE
++#define AV_INPUT_BUFFER_PADDING_SIZE FF_INPUT_BUFFER_PADDING_SIZE
++#endif
++
+ #ifndef HAVE_FUN_avcodec_encode_video2
+ int avcodec_encode_video2 (AVCodecContext *avctx, AVPacket *avpkt, const AVFrame *frame, int *got_packet_ptr);
+ #endif
+diff --git a/src/videofilters/nowebcam.c b/src/videofilters/nowebcam.c
+index bd2ca838..4783de05 100644
+--- a/src/videofilters/nowebcam.c
++++ b/src/videofilters/nowebcam.c
+@@ -32,7 +32,7 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+ #ifndef NO_FFMPEG
+ #include "ffmpeg-priv.h"
+ #else
+-#define FF_INPUT_BUFFER_PADDING_SIZE 32
++#define AV_INPUT_BUFFER_PADDING_SIZE 32
+ #endif
+ 
+ #if TARGET_OS_IPHONE
+@@ -248,7 +248,7 @@ static mblk_t *_ms_load_jpeg_as_yuv(const char *jpgpath, MSVideoSize *reqsize){
+ 			ms_error("Cannot load %s",jpgpath);
+ 			return NULL;
+ 		}
+-		jpgbuf=(uint8_t*)ms_malloc0(statbuf.st_size + FF_INPUT_BUFFER_PADDING_SIZE);
++		jpgbuf=(uint8_t*)ms_malloc0(statbuf.st_size + AV_INPUT_BUFFER_PADDING_SIZE);
+ 		if (jpgbuf==NULL)
+ 		{
+ 			close(fd);
+-- 
+2.18.0
+
