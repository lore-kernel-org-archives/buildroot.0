From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Apr 2021 16:25:37 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/ffmpeg: security
 bump to version 4.3.2
Message-ID: <20210424140042.1F9428489B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=049221fd03716eac05fb9765aca1ed60db12dfbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2020-35964: track_header in libavformat/vividas.c in FFmpeg 4.3.1 has
  an out-of-bounds write because of incorrect extradata packing.

- CVE-2020-35965: decode_frame in libavcodec/exr.c in FFmpeg 4.3.1 has an
  out-of-bounds write because of errors in calculations of when to perform
  memset zero operations.

Removed patch which was applied upstream:
https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/ca55240b8c1fd4cfdb61f88fd2cb378d475d910a

Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=28d79ea1aed0a59f43ee922f5b6efa82dc7e2b18;hb=refs/heads/release/4.3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2a3cfb2381d0254ee57debb7bd520f0e89843345)
[Peter: mark as security fix, extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pegts-make-sure-mpegts-read-header-always.patch | 38 ----------------------
 package/ffmpeg/ffmpeg.hash                         |  2 +-
 package/ffmpeg/ffmpeg.mk                           |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/ffmpeg/0004-avformat-mpegts-make-sure-mpegts-read-header-always.patch b/package/ffmpeg/0004-avformat-mpegts-make-sure-mpegts-read-header-always.patch
deleted file mode 100644
index 75a39d16fa..0000000000
--- a/package/ffmpeg/0004-avformat-mpegts-make-sure-mpegts-read-header-always.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3136f41e6db8189994a8e4f72eacc92b669776d1 Mon Sep 17 00:00:00 2001
-From: Marton Balint <cus@passwd.hu>
-Date: Sun, 15 Nov 2020 00:39:41 +0100
-Subject: [PATCH] avformat/mpegts: make sure mpegts_read_header always stops at
- the first pmt
-
-mpegts_read_header stops parsing the file at the first PMT. However the check
-that ensured this was wrong because streams can also be added before the first
-PMT is received (e.g. EIT).
-
-So let's make sure we are in the header reading phase by checking if ts->pkt is
-unset instead of checking if the number of streams found so far is 0.
-
-Downloaded from Kodi ffmpeg repo:
-https://github.com/xbmc/FFmpeg/commit/3136f41e6db8189994a8e4f72eacc92b669776d1
-
-Patch was committed upstream:
-http://git.videolan.org/?p=ffmpeg.git;a=patch;h=ca55240b8c1fd4cfdb61f88fd2cb378d475d910a
-
-Signed-off-by: Marton Balint <cus@passwd.hu>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libavformat/mpegts.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
-index c6fd3e1cef63..1da81a0fe62a 100644
---- a/libavformat/mpegts.c
-+++ b/libavformat/mpegts.c
-@@ -2352,7 +2352,7 @@ static void pmt_cb(MpegTSFilter *filter, const uint8_t *section, int section_len
-         goto out;
- 
-     // stop parsing after pmt, we found header
--    if (!ts->stream->nb_streams)
-+    if (!ts->pkt)
-         ts->stop_parse = 2;
- 
-     set_pmt_found(ts, h->id);
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 959a562b8d..81dc0d3e6b 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb  ffmpeg-4.3.1.tar.xz
+sha256  46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb  ffmpeg-4.3.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6d28bfbed7..9b79dff48e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.3.1
+FFMPEG_VERSION = 4.3.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
