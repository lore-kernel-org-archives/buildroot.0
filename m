From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Dec 2012 08:27:30 +0100
Subject: [Buildroot] [git commit] pulseaudio: needs threads
Message-ID: <20121223073742.C860F9A424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b603449fd0dcbaf22188e1f2e149da115ff2ea1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4d6a5793e475683fbc58ccaf03cf7816233a5052/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-good/Config.in |    1 +
 package/multimedia/mpd/Config.in              |    1 +
 package/multimedia/pulseaudio/Config.in       |    5 +++--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 33ecb5c..b5006e6 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -193,6 +193,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 	bool "oss4 (Open Sound System 4)"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 5d08182..2e44741 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 
 config BR2_PACKAGE_MPD_PULSEAUDIO
 	bool "pulseaudio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
 	select BR2_PACKAGE_PULSEAUDIO
 	help
 	  Enable pulseaudio output support.
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 6c767bb..eeb8b5a 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
@@ -17,5 +18,5 @@ config BR2_PACKAGE_PULSEAUDIO
 
 	  http://pulseaudio.org
 
-comment "pulseaudio requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "pulseaudio requires a toolchain with WCHAR and threads support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
