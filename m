From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:51:09 +0100
Subject: [Buildroot] [git commit] package/mpd: enable support for libsoxr
Message-ID: <20141027220850.9C0BCB1AB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc26b41ac35a52ac34dfd65257210f117f20f6e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    7 +++++++
 package/mpd/mpd.mk    |    7 +++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5ef1d3f..e62a37d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -46,6 +46,13 @@ config BR2_PACKAGE_MPD_LIBSAMPLERATE
 	  Enable libsamplerate input support.
 	  Select this for software sample rate conversion.
 
+config BR2_PACKAGE_MPD_LIBSOXR
+	bool "libsoxr"
+	select BR2_PACKAGE_LIBSOXR
+	help
+	  Enable libsoxr resampler support.
+	  The SoX Resampler library performs software sample-rate conversion.
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
