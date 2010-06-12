From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 12 Jun 2010 18:22:41 +0200
Subject: [Buildroot] [PATCH 4/4] ffmpeg: add user-defined configure
	parameters
In-Reply-To: <1276359761-13721-1-git-send-email-luca@lucaceresoli.net>
References: <1276359761-13721-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1276359761-13721-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/multimedia/ffmpeg/Config.in |    7 +++++++
 package/multimedia/ffmpeg/ffmpeg.mk |    2 ++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index 7530929..1049903 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -135,4 +135,11 @@ config BR2_PACKAGE_FFMPEG_OUTDEVS
 	bool "Enable output devices"
 	default y
 
+config BR2_PACKAGE_FFMPEG_EXTRACONF
+	string "Additional parameters for ./configure"
+	default ""
+	help
+	 Extra parameters that will be appended to FFmpeg's
+	 ./configure commandline.
+
 endif
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 3fc4990..d23f0e9 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -120,6 +120,8 @@ else
 FFMPEG_CONF_OPT += --disable-zlib
 endif
 
+FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
+
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
 	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
-- 
1.7.0.4
