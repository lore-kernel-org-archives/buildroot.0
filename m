From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 12:39:20 +0200
Subject: [Buildroot] [PATCH 4/8] package/mpd: enable support for libsoxr
In-Reply-To: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
References: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413369564-22124-4-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 7 +++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e170b26..4ab4a36 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -44,6 +44,13 @@ config BR2_PACKAGE_MPD_LIBSAMPLERATE
 		Enable libsamplerate input support.
 		Select this for software sample rate conversion.
 
+config BR2_PACKAGE_MPD_LIBSOXR
+	bool "libsoxr"
+	select BR2_PACKAGE_LIBSOXR
+	help
+		Enable libsoxr resampler support.
+		The SoX Resampler library performs software sample-rate conversion.
+
 comment "Decoder plugins"
 
 config BR2_PACKAGE_MPD_AUDIOFILE
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b10a60a..92d7292 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -104,6 +104,13 @@ else
 MPD_CONF_OPTS += --disable-sndfile
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBSOXR),y)
+MPD_DEPENDENCIES += libsoxr
+MPD_CONF_OPTS += --enable-soxr
+else
+MPD_CONF_OPTS += --disable-soxr
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_MAD),y)
 MPD_DEPENDENCIES += libid3tag libmad
 MPD_CONF_OPTS += --enable-mad
-- 
2.1.2
