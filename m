From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:49:04 +0200
Subject: [Buildroot] [git commit] package/mpd: add libsidplay2 optional
 dependency
Message-ID: <20200818214248.D4C7D8230F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db61a89648b19a90a59a58d4d46c5b8ad156c9d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsidplay2 is an optional dependency since version 0.15.0 and
https://github.com/MusicPlayerDaemon/MPD/commit/1136f6fb7a2a6a0a5bfba0dcf99410d1bbf04252

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 791fb0f54a..baaaa7f1ae 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -165,6 +165,12 @@ config BR2_PACKAGE_MPD_OPUS
 	  Enable opus input support.
 	  Select this if you want to play back OPUS encoded files.
 
+config BR2_PACKAGE_MPD_SIDPLAY
+	bool "sidplay"
+	select BR2_PACKAGE_LIBSIDPLAY2
+	help
+	  Enable C64 SID support.
+
 config BR2_PACKAGE_MPD_TREMOR
 	bool "tremor"
 	depends on !BR2_PACKAGE_MPD_VORBIS
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a3b90aa55f..51bc1719a7 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -241,6 +241,13 @@ else
 MPD_CONF_OPTS += -Dshout=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_SIDPLAY),y)
+MPD_DEPENDENCIES += libsidplay2
+MPD_CONF_OPTS += -Dsidplay=enabled
+else
+MPD_CONF_OPTS += -Dsidplay=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
 MPD_DEPENDENCIES += yajl
 MPD_CONF_OPTS += -Dsoundcloud=enabled
