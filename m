From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Jun 2017 22:39:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: fix static linking with alsa
In-Reply-To: <20170601203930.1069-1-bernd.kuhls@t-online.de>
References: <20170601203930.1069-1-bernd.kuhls@t-online.de>
Message-ID: <20170601203930.1069-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_PACKAGE_ALSA_LIB_RAWMIDI is enabled ffmpeg needs also
BR2_PACKAGE_ALSA_LIB_SEQ to link against alsa.

A similar patch was committed to alsa-utils:
https://git.buildroot.net/buildroot/commit/package/alsa-utils?id=c69088b8c35177cecdd0f1f385c13f5b2c509f1d

Fixes
http://autobuild.buildroot.net/results/7ba/7ba485532fcab74928246a8f95dba7e5eea9d4a5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 279f94f0d..da1a47e86 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -167,10 +167,12 @@ config BR2_PACKAGE_FFMPEG_FILTERS
 
 config BR2_PACKAGE_FFMPEG_INDEVS
 	bool "Enable input devices"
+	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	default y
 
 config BR2_PACKAGE_FFMPEG_OUTDEVS
 	bool "Enable output devices"
+	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	default y
 
 config BR2_PACKAGE_FFMPEG_EXTRACONF
-- 
2.11.0
