From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:24:13 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: add fixes from Kodi project
Message-ID: <20210117090528.B064283537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc76c0c6e38b26047673cb1360ac705575046393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding these patches brings our ffmpeg package to the same level as the
kodi-provided ffmpeg package allowing us to switch the kodi build to
use the system-provided ffmpeg instead of its internal build when kodi
is bumped to version 19.0-Matrix.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...api_h264-skip-decode-if-pic-has-no-slices.patch | 36 ++++++++++++++++++++
 ...pegts-make-sure-mpegts-read-header-always.patch | 38 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/package/ffmpeg/0003-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch b/package/ffmpeg/0003-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
new file mode 100644
index 0000000000..2892df9d81
--- /dev/null
+++ b/package/ffmpeg/0003-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
@@ -0,0 +1,36 @@
+From 2c6b3f357331e203ad87214984661c40704aceb7 Mon Sep 17 00:00:00 2001
+From: Rainer Hochecker <fernetmenta@online.de>
+Date: Sat, 26 Jan 2019 19:48:35 +0100
+Subject: [PATCH] avcodec/vaapi_h264: skip decode if pic has no slices
+
+This fixes / workarounds https://bugs.freedesktop.org/show_bug.cgi?id=105368.
+It was hit frequently when watching h264 channels received via DVB-X.
+Corresponding kodi bug: https://github.com/xbmc/xbmc/issues/15704
+
+Downloaded from Kodi ffmpeg repo:
+https://github.com/xbmc/FFmpeg/commit/2c6b3f357331e203ad87214984661c40704aceb7
+
+Patch was sent upstream:
+http://ffmpeg.org/pipermail/ffmpeg-devel/2019-March/240863.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libavcodec/vaapi_h264.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavcodec/vaapi_h264.c b/libavcodec/vaapi_h264.c
+index dd2a6571604..e521a05c4ff 100644
+--- a/libavcodec/vaapi_h264.c
++++ b/libavcodec/vaapi_h264.c
+@@ -314,6 +314,11 @@ static int vaapi_h264_end_frame(AVCodecContext *avctx)
+     H264SliceContext *sl = &h->slice_ctx[0];
+     int ret;
+ 
++    if (pic->nb_slices == 0) {
++        ret = AVERROR_INVALIDDATA;
++        goto finish;
++    }
++
+     ret = ff_vaapi_decode_issue(avctx, pic);
+     if (ret < 0)
+         goto finish;
diff --git a/package/ffmpeg/0004-avformat-mpegts-make-sure-mpegts-read-header-always.patch b/package/ffmpeg/0004-avformat-mpegts-make-sure-mpegts-read-header-always.patch
new file mode 100644
index 0000000000..75a39d16fa
--- /dev/null
+++ b/package/ffmpeg/0004-avformat-mpegts-make-sure-mpegts-read-header-always.patch
@@ -0,0 +1,38 @@
+From 3136f41e6db8189994a8e4f72eacc92b669776d1 Mon Sep 17 00:00:00 2001
+From: Marton Balint <cus@passwd.hu>
+Date: Sun, 15 Nov 2020 00:39:41 +0100
+Subject: [PATCH] avformat/mpegts: make sure mpegts_read_header always stops at
+ the first pmt
+
+mpegts_read_header stops parsing the file at the first PMT. However the check
+that ensured this was wrong because streams can also be added before the first
+PMT is received (e.g. EIT).
+
+So let's make sure we are in the header reading phase by checking if ts->pkt is
+unset instead of checking if the number of streams found so far is 0.
+
+Downloaded from Kodi ffmpeg repo:
+https://github.com/xbmc/FFmpeg/commit/3136f41e6db8189994a8e4f72eacc92b669776d1
+
+Patch was committed upstream:
+http://git.videolan.org/?p=ffmpeg.git;a=patch;h=ca55240b8c1fd4cfdb61f88fd2cb378d475d910a
+
+Signed-off-by: Marton Balint <cus@passwd.hu>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libavformat/mpegts.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
+index c6fd3e1cef63..1da81a0fe62a 100644
+--- a/libavformat/mpegts.c
++++ b/libavformat/mpegts.c
+@@ -2352,7 +2352,7 @@ static void pmt_cb(MpegTSFilter *filter, const uint8_t *section, int section_len
+         goto out;
+ 
+     // stop parsing after pmt, we found header
+-    if (!ts->stream->nb_streams)
++    if (!ts->pkt)
+         ts->stop_parse = 2;
+ 
+     set_pmt_found(ts, h->id);
