From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:26:07 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: cleanup of build options
Message-ID: <20160625132733.5BCBC81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5baa92b0925fbd784c5be96eaed94d70d2286714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove non-existing options:
 * --disable-wsap
 * --disable-direct3d
 * --disable-gsettings

Remove options that are already handled later in the .mk file, using
optional dependencies:
 * --disable-rtmp
 * --disable-hls
 * --disable-dash

Rename disable->strp to disable-srtp, which essentially fixes a typo.

Remove liveadder plugin - no longer a separate built option, it's been
merged into audiomixer. Config.in.legacy handling is added for the
removed option.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
[Thomas: add Config.in.legacy handling for the liveaddr plugin option,
tweaks to the commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                        |  8 ++++++++
 package/gstreamer1/gst1-plugins-bad/Config.in           |  5 -----
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 +-------------
 3 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bb12d7b..34bdaf0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER
+	bool "gst1-plugins-bad liveadder plugin removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER
+	help
+	  The functionality of the liveadder plugin of the
+	  gst1-plugins-bad package has been merged into audiomixer.
+
 config BR2_PACKAGE_LIBFSLVPUWRAP
 	bool "libfslvpuwrap has been renamed to imx-vpuwrap"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 046c2aa..0f9fb15 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -312,11 +312,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBRFB
 	help
 	  Connects to a VNC server and decodes RFB stream
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER
-	bool "liveadder"
-	help
-	  Adds multiple live discontinuous streams
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI
 	bool "midi"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 271569e..8f739ec 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -17,9 +17,7 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
 	--disable-valgrind \
 	--disable-directsound \
-	--disable-wsapi \
 	--disable-direct3d \
-	--disable-direct3d9 \
 	--disable-winks \
 	--disable-android_media \
 	--disable-apple_media \
@@ -35,7 +33,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-voamrwbenc \
 	--disable-bs2b \
 	--disable-chromaprint \
-	--disable-dash \
 	--disable-dc1394 \
 	--disable-dts \
 	--disable-resindvd \
@@ -47,7 +44,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-ladspa \
 	--disable-lv2 \
 	--disable-libde265 \
-	--disable-strp \
+	--disable-srtp \
 	--disable-linsys \
 	--disable-modplug \
 	--disable-mimic \
@@ -69,11 +66,8 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-vdpau \
 	--disable-schro \
 	--disable-zbar \
-	--disable-rtmp \
 	--disable-spandsp \
-	--disable-gsettings \
 	--disable-sndio \
-	--disable-hls \
 	--disable-gtk3 \
 	--disable-qt
 
@@ -376,12 +370,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-librfb
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-liveadder
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-liveadder
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-midi
 else
