From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:30:45 +0200
Subject: [Buildroot] [git commit] package/mpd: add fluidsynth optional
 dependency
Message-ID: <20200813212441.EA653863E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d859e891147bbf188a154c787d339848be60eac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fluidsynth is an optional dependency of mpd since version 0.18.5 and
https://github.com/MusicPlayerDaemon/MPD/commit/727c6226597fb710239b14e7985d97ec6b53f0ee

It is enabled by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/Config.in | 10 ++++++++++
 package/mpd/mpd.mk    |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e9e7b83cbd..1b3ab8fa5d 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -114,6 +114,16 @@ config BR2_PACKAGE_MPD_FLAC
 	  Enable flac input/streaming support.
 	  Select this if you want to play back FLAC files.
 
+config BR2_PACKAGE_MPD_FLUIDSYNTH
+	bool "fluidsynth"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_FLUIDSYNTH
+	help
+	  Enable fluidsynth MIDI decoder support.
+
+comment "fluidsynth support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_MPD_LIBSNDFILE
 	bool "libsndfile"
 	select BR2_PACKAGE_LIBSNDFILE
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a1fa4b0a5e..b8df04f084 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -97,6 +97,13 @@ else
 MPD_CONF_OPTS += -Dflac=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_FLUIDSYNTH),y)
+MPD_DEPENDENCIES += fluidsynth
+MPD_CONF_OPTS += -Dfluidsynth=enabled
+else
+MPD_CONF_OPTS += -Dfluidsynth=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_HTTPD_OUTPUT),y)
 MPD_CONF_OPTS += -Dhttpd=true
 else
