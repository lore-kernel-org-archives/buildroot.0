From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 16 Apr 2015 21:59:15 +0200
Subject: [Buildroot] [PATCH] ffmpeg: explicitly pass --ranlib
Message-ID: <1429214355-29429-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems that ffmpeg's custom configure doesn't observe the RANLIB
environment variable, and incorrectly uses the host's ranlib to
check if the -D option is supported. Blackfin's ranlib doesn't, most
others do.

I also checked if there are any more mistakes like that in ffmpeg's
configure script, but it looked OK.

Fixes:
http://autobuild.buildroot.net/results/d13488a43f6e034623104a36c07114db99325b8d

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Bernd Kuhs <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 787dbb1..59c49ee 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -18,6 +18,7 @@ endif
 
 FFMPEG_CONF_OPTS = \
 	--prefix=/usr \
+	--ranlib=$(TARGET_RANLIB) \
 	--enable-avfilter \
 	--disable-version3 \
 	--enable-logging \
-- 
2.1.4
