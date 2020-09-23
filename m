From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:22:53 +0200
Subject: [Buildroot] [git commit] package/gst1-plugins-bad: bump version to
 1.18.0
Message-ID: <20200923201700.4785C83C43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8a02bbad04b583528619a03ebd840507a328706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change home page url to https

- remove 0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
  (upstream [1])

- remove 002-meson-allow-the-user-to-disable-opencv.patch
  (upstream [2])

- add option for new plugins dvbsubenc, rist, rtmp2, rtp, switchbin
  and v4l2codecs

- removed yadif plugin (functionality moved to gst1-plugins-good
  deinterlace [3])

- meson options: avtp=disabled, d3d11=disabled, mediafoundation=disabled,
  microdns=disabled, svthevcenc=disabled, transcode=disabled, wasapi2=disabled
  zxing=disabled, magicleap=disabled, extra-checks=disabled, doc=disabled

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19.patch
[2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/833a65cc3c993b864f077152ace95d660d6a9625.patch
[3] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/c7095abd31a2828ef7832744bc2e221650c6502e.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  9 ++++
 ...ven-when-cross-compiling-if-introspection.patch | 36 -------------
 ...02-meson-allow-the-user-to-disable-opencv.patch | 31 ------------
 package/gstreamer1/gst1-plugins-bad/Config.in      | 39 +++++++++++---
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  8 +--
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 59 ++++++++++++++++++----
 6 files changed, 96 insertions(+), 86 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ae583b912f..fddabfe223 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF
+	bool "gst1-plugins-bad yadif plugin was removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE
+	help
+	  This plugin was removed with gst1-plugins-bad-1.18.0, the
+	  same functionality has moved to gst1-plugins-good
+	  deinterlace plugin (method=yadif).
+
 config BR2_PACKAGE_GQVIEW
 	bool "gqview package was removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gst1-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
deleted file mode 100644
index dd3b6eca7d..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
-From: Tim Philipp <tim@centricular.com>
-Date: Fri, 18 Oct 2019 00:39:12 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream commit: 97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19
-Signed-off-by: Tim Philipp <tim@centricular.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 67aeeb4d03..7b3314bd9f 100644
---- a/meson.build
-+++ b/meson.build
-@@ -405,7 +405,7 @@ python3 = import('python').find_installation()
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
-     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
--- 
-2.24.1
-
diff --git a/package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch b/package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch
deleted file mode 100644
index 02e91e33ed..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1bc387f8feaab9020be72e88cf26ccc1a67a6a10 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 22 Aug 2020 23:33:48 +0200
-Subject: [PATCH] meson: allow the user to disable opencv
-
-Allow the user to really disable opencv through meson (i.e.
--Dopencv=disabled).
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/1533]
----
- gst-libs/gst/opencv/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
-index 6cc4602f3..fb6c46e40 100644
---- a/gst-libs/gst/opencv/meson.build
-+++ b/gst-libs/gst/opencv/meson.build
-@@ -13,7 +13,7 @@ opencv_dep = dependency('opencv', version : '>= 3.0.0', required : false)
- if not opencv_dep.found()
-   opencv_dep = dependency('opencv4', version : '>= 4.0.0', required : false)
- endif
--if opencv_dep.found()
-+if not get_option('opencv').disabled() and opencv_dep.found()
-   gstopencv = library('gstopencv-' + api_version,
-     opencv_sources,
-     c_args : gst_plugins_bad_args + ['-DBUILDING_GST_OPENCV'],
--- 
-2.28.0
-
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d387709de2..a7ad74b8e2 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -5,7 +5,7 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
 	  A set of plug-ins for GStreamer that may be of poor quality
 	  or lacking some features.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
 
 if BR2_PACKAGE_GST1_PLUGINS_BAD
 
@@ -87,6 +87,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	  Collection of elements that may or may not be useful for
 	  debugging
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBENC
+	bool "dvdsubenc"
+	help
+	  DVB subpicture encoding support
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
 	bool "dvdsuboverlay"
 	help
@@ -232,6 +237,21 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	help
 	  Removes silence from an audio stream
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RIST
+	bool "rist"
+	help
+	  RIST streaming
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP2
+	bool "rtmp2"
+	help
+	  RTMP sink/source (rtmp2sink, rtmp2src)
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP2
+	bool "rtp"
+	help
+	  RTP (rtpsrc/rtpsink)
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
@@ -268,6 +288,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 	help
 	  subtitle encoders
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SWITCHBIN
+	bool "switchbin"
+	help
+	  Switching between paths based on input caps
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE
 	bool "timecode"
 
@@ -297,11 +322,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
 	help
 	  Demuxes/decodes YUV4MPEG streams
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF
-	bool "yadif"
-	help
-	  YADIF deinterlacing filter
-
 comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
@@ -619,6 +639,13 @@ comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
 	depends on !BR2_PACKAGE_WPEWEBKIT \
 		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS
+	bool "v4l2codecs"
+	depends on BR2_PACKAGE_HAS_UDEV # libgudev
+	select BR2_PACKAGE_LIBGUDEV
+	help
+	  Video4Linux Stateless CODECs support
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 7b59b4dbec..23cf43f543 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.16.2.tar.xz.sha256sum
-sha256 f1cb7aa2389569a5343661aae473f0a940a90b872001824bc47fa8072a041e74 gst-plugins-bad-1.16.2.tar.xz
-sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
-sha256 cf9b86bcf2d298e8cf5b9d8982f9dab296465b002fdfa0347357a0732f961e03 COPYING.LIB
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.0.tar.xz.sha256sum
+sha256  f382ab1caddd64aaa7acb7c4787487f63fd39bd0fde9c757655cbaa457c1185f  gst-plugins-bad-1.18.0.tar.xz
+sha256  0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223  COPYING
+sha256  cf9b86bcf2d298e8cf5b9d8982f9dab296465b002fdfa0347357a0732f961e03  COPYING.LIB
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index e020c587d3..ec5097fc69 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.16.2
+GST1_PLUGINS_BAD_VERSION = 1.18.0
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -25,16 +25,20 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	-Dapplemedia=disabled \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled
+	-Dglib-checks=disabled \
+	-Dextra-checks=disabled \
+	-Ddoc=disabled
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BAD_CONF_OPTS += \
+	-Davtp=disabled \
 	-Dopensles=disabled \
 	-Duvch264=disabled \
 	-Dmsdk=disabled \
 	-Dvoamrwbenc=disabled \
 	-Dbs2b=disabled \
 	-Dchromaprint=disabled \
+	-Dd3d11=disabled \
 	-Ddc1394=disabled \
 	-Ddts=disabled \
 	-Dresindvd=disabled \
@@ -44,6 +48,8 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dkate=disabled \
 	-Dladspa=disabled \
 	-Dlv2=disabled \
+	-Dmediafoundation=disabled \
+	-Dmicrodns=disabled \
 	-Dlibde265=disabled \
 	-Dmodplug=disabled \
 	-Dmplex=disabled \
@@ -57,6 +63,11 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dgme=disabled \
 	-Dvdpau=disabled \
 	-Dspandsp=disabled \
+	-Dsvthevcenc=disabled \
+	-Dtranscode=disabled \
+	-Dwasapi2=disabled \
+	-Dzxing=disabled \
+	-Dmagicleap=disabled \
 	-Diqa=disabled \
 	-Dopencv=disabled
 
@@ -180,6 +191,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddebugutils=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBENC),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsubenc=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsubenc=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsuboverlay=enabled
 else
@@ -368,6 +385,24 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dremovesilence=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RIST),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Drist=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Drist=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP2),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp2=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp2=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP2),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Drtp=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Drtp=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += rtmpdump
@@ -411,6 +446,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dsubenc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SWITCHBIN),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dswitchbin=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dswitchbin=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dtimecode=enabled
 else
@@ -453,13 +494,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF),y)
-GST1_PLUGINS_BAD_CONF_OPTS += -Dyadif=enabled
-GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
-else
-GST1_PLUGINS_BAD_CONF_OPTS += -Dyadif=disabled
-endif
-
 # Plugins with dependencies
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER),y)
@@ -711,6 +745,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dwpe=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dv4l2codecs=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libgudev
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dv4l2codecs=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dx265=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += x265
