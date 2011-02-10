From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Feb 2011 22:47:19 +0100
Subject: [Buildroot] [git commit master 1/1] mpd: new features
Message-ID: <20110210214825.204658F483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a74b4044b00b19055474c3d3dc2c069fc26a38c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Add libcue support (.cue file parsing)
* Add lame support (mp3 encoding)
* Fix slight typo in Config.in wrt LIBCUEFILE

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/Config.in |   14 +++++++++++++-
 package/multimedia/mpd/mpd.mk    |   12 ++++++++++++
 2 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 3906a5f..e418d32 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -53,6 +53,18 @@ config BR2_PACKAGE_MPD_FLAC
 	  Enable flac input/streaming support.
 	  Select this if you want to play back FLAC files.
 
+config BR2_PACKAGE_MPD_LAME
+	bool "lame"
+	select BR2_PACKAGE_LAME
+	help
+	  Enable lame (mp3) encoding support.
+
+config BR2_PACKAGE_MPD_LIBCUE
+	bool "libcue"
+	select BR2_PACKAGE_LIBCUE
+	help
+	  Enable cue file support.
+
 config BR2_PACKAGE_MPD_LIBSAMPLERATE
 	bool "libsamplerate"
 	select BR2_PACKAGE_LIBSAMPLERATE
@@ -86,7 +98,7 @@ config BR2_PACKAGE_MPD_MPG123
 
 config BR2_PACKAGE_MPD_MUSEPACK
 	bool "musepack"
-	select BR2_PACKAGE_LIBCUE
+	select BR2_PACKAGE_LIBCUEFILE
 	select BR2_PACKAGE_LIBREPLAYGAIN
 	select BR2_PACKAGE_MUSEPACK
 	help
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 61b107b..728feaa 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -44,6 +44,18 @@ else
 MPD_CONF_OPT += --disable-curl
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LAME),y)
+MPD_DEPENDENCIES += lame
+else
+MPD_CONF_OPT += --disable-lame-encoder
+endif
+
+ifeq ($(BR2_PACKAGE_MPD_LIBCUE),y)
+MPD_DEPENDENCIES += libcue
+else
+MPD_CONF_OPT += --disable-cue
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
 MPD_DEPENDENCIES += libsamplerate
 else
-- 
1.7.3.4
