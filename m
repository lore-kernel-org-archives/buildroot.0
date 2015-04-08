From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Apr 2015 22:21:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Fix Kodi 14.2 compile
Message-ID: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removing 0013-add-public-version-of-ff_read_frame_flush.patch in
http://git.buildroot.net/buildroot/commit/package/ffmpeg?id=4d094d9eb4edba5b6c3c229a2c02da1427e43fe5
was a bit too early since Kodi 14.2 still uses it, so re-add
0013-add-public-version-of-ff_read_frame_flush.patch
and rename 0013-fix-ff-thread-get-format.patch.

When Kodi 15.0 is released the file
0013-add-public-version-of-ff_read_frame_flush.patch
can be removed again.

Fixes
http://autobuild.buildroot.net/results/1c1/1c12779e67ddc6d3dffbc1d2e5ebf9887ae721ca/
http://autobuild.buildroot.net/results/c63/c6301fc6f11204ee157a4f6a848dda9666cfb450/
http://autobuild.buildroot.net/results/e61/e6138bac331370b02af746e319ce8fd6fe51b793/
http://autobuild.buildroot.net/results/c3d/c3dbb01608debd1bf0af6acd6eb9de6d01424982/
http://autobuild.buildroot.net/results/e1b/e1b0fbc6631a0073d743705400460b8679b28a0f/
http://autobuild.buildroot.net/results/180/1803aa8bd62e4fc126d0a791456804bb9b036e6d/
http://autobuild.buildroot.net/results/d2e/d2e9571f5747e609eb4f9b64ac6ab99bccb92767/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...add-public-version-of-ff_read_frame_flush.patch |   54 ++++++++++++++++++++
 ...t.patch => 0014-fix-ff-thread-get-format.patch} |    0
 2 files changed, 54 insertions(+)
 create mode 100644 package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
 rename package/ffmpeg/{0013-fix-ff-thread-get-format.patch => 0014-fix-ff-thread-get-format.patch} (100%)

diff --git a/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch b/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
new file mode 100644
index 0000000..cf07bd2
--- /dev/null
+++ b/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
@@ -0,0 +1,54 @@
+From 7d7ce18ff0d24b586634fa6e631fa0eec7865aae Mon Sep 17 00:00:00 2001
+From: elupus <elupus@xbmc.org>
+Date: Tue, 1 Nov 2011 20:18:35 +0100
+Subject: [PATCH 13/13] add public version of ff_read_frame_flush
+
+We need this since we sometimes seek on the
+input stream behind ffmpeg's back. After this
+all data need to be flushed completely.
+
+Patch part of the XBMC patch set for ffmpeg, downloaded from
+https://github.com/xbmc/FFmpeg/.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libavformat/avformat.h | 5 +++++
+ libavformat/utils.c    | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/libavformat/avformat.h b/libavformat/avformat.h
+index 2e54ed1..3a9f292 100644
+--- a/libavformat/avformat.h
++++ b/libavformat/avformat.h
+@@ -2121,6 +2121,11 @@ int av_find_best_stream(AVFormatContext *ic,
+ int av_read_frame(AVFormatContext *s, AVPacket *pkt);
+ 
+ /**
++ * Clear out any buffered data in context
++ */
++void av_read_frame_flush(AVFormatContext *s);
++
++/**
+  * Seek to the keyframe at timestamp.
+  * 'timestamp' in 'stream_index'.
+  *
+diff --git a/libavformat/utils.c b/libavformat/utils.c
+index f4fb172..10dda18 100644
+--- a/libavformat/utils.c
++++ b/libavformat/utils.c
+@@ -1624,6 +1624,11 @@ void ff_read_frame_flush(AVFormatContext *s)
+     }
+ }
+ 
++void av_read_frame_flush(AVFormatContext *s)
++{
++  ff_read_frame_flush(s);
++}
++
+ void ff_update_cur_dts(AVFormatContext *s, AVStream *ref_st, int64_t timestamp)
+ {
+     int i;
+-- 
+2.1.0
+
diff --git a/package/ffmpeg/0013-fix-ff-thread-get-format.patch b/package/ffmpeg/0014-fix-ff-thread-get-format.patch
similarity index 100%
rename from package/ffmpeg/0013-fix-ff-thread-get-format.patch
rename to package/ffmpeg/0014-fix-ff-thread-get-format.patch
-- 
1.7.10.4
