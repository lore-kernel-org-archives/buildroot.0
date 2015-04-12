From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Apr 2015 23:45:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: Fix build errors due to new
	ffmpeg
In-Reply-To: <1428875137-16284-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1428875137-16284-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1428875137-16284-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We bumped ffmpeg to 2.6.1, the commit log makes a reference to:
 https://github.com/xbmc/xbmc/pull/6636

But this pull request was only merged for Isengard which is the next
version of Kodi, with the current Helix version, it doesn't build.

It doesn't seem a good idea to revert the cited commit, so while
Isengard is not out, we can live with that small patch to Kodi.

This patch applies what can be found with in the pull request:
https://github.com/xbmc/xbmc/commit/dfe123f23a5e933c8f0f3367f24630de2beb29ec

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../0002-Fix-build-error-with-ffmpeg-2.6.1.patch   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/kodi/0002-Fix-build-error-with-ffmpeg-2.6.1.patch

diff --git a/package/kodi/0002-Fix-build-error-with-ffmpeg-2.6.1.patch b/package/kodi/0002-Fix-build-error-with-ffmpeg-2.6.1.patch
new file mode 100644
index 0000000..5e5f5b6
--- /dev/null
+++ b/package/kodi/0002-Fix-build-error-with-ffmpeg-2.6.1.patch
@@ -0,0 +1,41 @@
+From 0d0c975f87bbf0fff008b091485c5f2e26f5ef5e Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Wed, 8 Apr 2015 17:44:38 +0200
+Subject: [PATCH] Fix build error with ffmpeg 2.6.1
+
+With this commit: 4d094d9eb4edba5b6c3c229a2c02da1427e43fe5
+
+We bumped ffmpeg to 2.6.1, the commit log makes a reference to:
+ https://github.com/xbmc/xbmc/pull/6636
+
+But this pull request was only merged for Isengard which is the next
+version of Kodi, with the current Helix version, it won't build.
+
+This patch applies what can be found in the pull request:
+https://github.com/xbmc/xbmc/commit/dfe123f23a5e933c8f0f3367f24630de2beb29ec
+
+So it builds with the newer ffmpeg.
+
+This patch *MUST* be removed when we bump Kodi to Isengard.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp b/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
+index 6f37758..fdb770e 100644
+--- a/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
++++ b/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
+@@ -541,7 +541,7 @@ void CDVDDemuxFFmpeg::Flush()
+ {
+   // naughty usage of an internal ffmpeg function
+   if (m_pFormatContext)
+-    av_read_frame_flush(m_pFormatContext);
++    avformat_flush(m_pFormatContext);
+
+   m_currentPts = DVD_NOPTS_VALUE;
+
+--
+2.1.4
+
-- 
2.1.4
