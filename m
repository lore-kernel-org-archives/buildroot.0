From: Allan W. Nielsen <a@awn.dk>
Date: Thu,  3 Nov 2011 18:09:30 +0100
Subject: [Buildroot] [PATCH 1/2] gst-plugins-bad: Explicit disable all non
	used options
In-Reply-To: <1320340171-19905-1-git-send-email-a@awn.dk>
References: <1320340171-19905-1-git-send-email-a@awn.dk>
Message-ID: <1320340171-19905-2-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- All the options which is not explicit set by gst-plugins-bad
Config.in file is now disabled. This is because the configure script
in some circumstances decides to enable non-wanted or non-working
features.

- The make file has been reordered to make all the settings appear in
the same order as they appear in ./configure --help

- The configure --help text has been in-lined, to make it easier to
spot new/changed/removed settings in further versions. To do this, one
can simply use a diff tool to compare the gst-plugins-bad.mk file and
the output from configure.

Example:
(cd output/build/gst-plugins-bad-0.10.21; \
 ./configure --help | \
 sed s/^/#/ > /tmp/gst-plugins-bad.help )
vimdiff package/multimedia/gst-plugins-bad/gst-plugins-bad.mk \
        /tmp/gst-plugins-bad.help

Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |  440 +++++++++++++++++---
 1 files changed, 378 insertions(+), 62 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 5012be2..afab0eb 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -6,402 +6,541 @@
 GST_PLUGINS_BAD_VERSION = 0.10.21
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
-
-GST_PLUGINS_BAD_CONF_OPT = \
-		--disable-examples
-
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
 
+GST_PLUGINS_BAD_CONF_OPT =
+
+#Optional Features:
+#  --disable-option-checking  ignore unrecognized --enable/--with options
+#  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
+#  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
+#  --enable-maintainer-mode  enable make rules and dependencies not useful
+#			  (and sometimes confusing) to the casual installer
+#  --enable-silent-rules          less verbose build output (undo: `make V=1')
+#  --disable-silent-rules         verbose build output (undo: `make V=0')
+#  --enable-shared[=PKGS]  build shared libraries [default=yes]
+#  --enable-static[=PKGS]  build static libraries [default=yes]
+#  --enable-fast-install[=PKGS]
+#                          optimize for fast installation [default=yes]
+#  --disable-dependency-tracking  speeds up one-time build
+#  --enable-dependency-tracking   do not reject slow dependency extractors
+#  --disable-libtool-lock  avoid locking (might break parallel builds)
+#  --disable-nls           do not use Native Language Support
+#  --disable-rpath         do not hardcode runtime library paths
+#  --disable-debug         disable addition of -g debugging info
+#  --enable-profiling      adds -pg to compiler commandline, for profiling
+#  --disable-valgrind      disable run-time valgrind detection
+#  --enable-gcov           compile with coverage profiling instrumentation (gcc
+#                          only)
+#  --disable-examples      disable building examples
+GST_PLUGINS_BAD_CONF_OPT += --disable-examples
+
+#  --disable-external           disable building of plug-ins with external deps
+#  --enable-experimental        enable building of experimental plug-ins
+#  --enable-gtk-doc        use gtk-doc to build documentation [[default=no]]
+#  --enable-gobject-cast-checks=[no/auto/yes]
+#                          Enable GObject cast checks
+#  --enable-glib-asserts=[no/auto/yes]
+#                          Enable GLib assertion
+
+
+#  --enable-orc            use Orc if installed
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST_PLUGINS_BAD_DEPENDENCIES += orc
 endif
 
+#  --disable-adpcmdec      disable dependency-less adpcmdec plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-adpcmdec
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-adpcmdec
 endif
 
+#  --disable-adpcmenc      disable dependency-less adpcmenc plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-adpcmenc
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-adpcmenc
 endif
 
+#  --disable-aiff          disable dependency-less aiff plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-aiff
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-aiff
 endif
 
+#  --disable-asfmux        disable dependency-less asfmux plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-asfmux
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-asfmux
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-apexsink
-GST_PLUGINS_BAD_DEPENDENCIES += openssl
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
-endif
-
+#  --disable-audioparsers  disable dependency-less audioparsers plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOPARSERS),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-audioparsers
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-audioparsers
 endif
 
+#  --disable-autoconvert   disable dependency-less autoconvert plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-autoconvert
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin
+#  --disable-bayer         disable dependency-less bayer plugin
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-bayer
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
+GST_PLUGINS_BAD_CONF_OPT += --disable-bayer
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
-endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-colorspace
+#  --disable-camerabin     disable dependency-less camerabin plugin
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-colorspace
+GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-legacyresample
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-legacyresample
-endif
+#  --disable-camerabin2    disable dependency-less camerabin2 plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin2
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-bayer
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-bayer
-endif
 
+#  --disable-cdxaparse     disable dependency-less cdxaparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-cdxaparse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-cdxaparse
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
-GST_PLUGINS_BAD_DEPENDENCIES += libcdaudio
+#  --disable-coloreffects  disable dependency-less coloreffects plugin
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+GST_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
 endif
 
+#  --disable-colorspace    disable dependency-less colorspace plugin
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-colorspace
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-colorspace
+endif
+
+#  --disable-dataurisrc    disable dependency-less dataurisrc plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dataurisrc
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dataurisrc
 endif
 
+#  --disable-dccp          disable dependency-less dccp plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dccp
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dccp
 endif
 
+#  --disable-debugutils    disable dependency-less debugutils plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-debugutils
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-debugutils
 endif
 
+#  --disable-dtmf          disable dependency-less dtmf plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dtmf
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dtmf
 endif
 
+#  --disable-dvbsuboverlay disable dependency-less dvbsuboverlay plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dvbsuboverlay
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dvbsuboverlay
 endif
 
+#  --disable-dvdspu        disable dependency-less dvdspu plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dvdspu
 endif
 
+#  --disable-festival      disable dependency-less festival plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-festival
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-festival
 endif
 
+#  --disable-freeze        disable dependency-less freeze plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-freeze
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-freeze
 endif
 
+#  --disable-frei0r        disable dependency-less frei0r plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-frei0r
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-frei0r
 endif
 
+#  --disable-gaudieffects  disable dependency-less gaudieffects plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-gaudieffects
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-gaudieffects
 endif
 
+#  --disable-geometrictransform
+#                          disable dependency-less geometrictransform plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-geometrictransform
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-geometrictransform
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GSETTINGS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-gsettings
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-gsettings
-endif
-
+#  --disable-h264parse     disable dependency-less h264parse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-h264parse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-h264parse
 endif
 
+#  --disable-hdvparse      disable dependency-less hdvparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-hdvparse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
 endif
 
+#  --disable-id3tag        disable dependency-less id3tag plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-id3tag
+
+#  --disable-interlace     disable dependency-less interlace plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-interlace
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-interlace
 endif
 
+#  --disable-invtelecine   disable dependency-less invtelecine plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-invtelecine
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-invtelecine
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-invtelecine
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-invtelecine
-endif
-
+#  --disable-ivfparse      disable dependency-less ivfparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-ivfparse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-ivfparse
 endif
 
+#  --disable-jp2kdecimator disable dependency-less jp2kdecimator plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-jp2kdecimator
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-jp2kdecimator
 endif
 
+#  --disable-jpegformat    disable dependency-less jpegformat plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-jpegformat
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-jpegformat
 endif
 
+#  --disable-legacyresample
+#                          disable dependency-less legacyresample plugin
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-legacyresample
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-legacyresample
+endif
+
+#  --disable-librfb        disable dependency-less librfb plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-librfb
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-librfb
 endif
 
+#  --disable-liveadder     disable dependency-less liveadder plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-liveadder
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-liveadder
 endif
 
+#  --disable-mpegdemux     disable dependency-less mpegdemux plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpegdemux
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpegdemux
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mpegpsmux
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mpegpsmux
-endif
-
+#  --disable-mpegtsmux     disable dependency-less mpegtsmux plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpegtsmux
 endif
 
+#  --disable-mpegpsmux     disable dependency-less mpegpsmux plugin
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpegpsmux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpegpsmux
+endif
+
+#  --disable-mpeg4videoparse
+#                          disable dependency-less mpeg4videoparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEG4VIDEOPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpeg4videoparse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpeg4videoparse
 endif
 
+#  --disable-mpegvideoparse
+#                          disable dependency-less mpegvideoparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpegvideoparse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpegvideoparse
 endif
 
+#  --disable-mve           disable dependency-less mve plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MVE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mve
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mve
 endif
 
+#  --disable-mxf           disable dependency-less mxf plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MXF),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mxf
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mxf
 endif
 
+#  --disable-nsf           disable dependency-less nsf plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-nsf
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-nsf
 endif
 
+#  --disable-nuvdemux      disable dependency-less nuvdemux plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-nuvdemux
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-nuvdemux
 endif
 
+#  --disable-pcapparse     disable dependency-less pcapparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-pcapparse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-pcapparse
 endif
 
+#  --disable-pnm           disable dependency-less pnm plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PNM),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-pnm
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-pnm
 endif
 
+#  --disable-qtmux         disable dependency-less qtmux plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-qtmux
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-qtmux
 endif
 
+#  --disable-rawparse      disable dependency-less rawparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-rawparse
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-rawparse
 endif
 
+#  --disable-real          disable dependency-less real plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-real
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-real
 endif
 
+#  --disable-rtpmux        disable dependency-less rtpmux plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-rtpmux
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-rtpmux
 endif
 
+#  --disable-scaletempo    disable dependency-less scaletempo plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-scaletempo
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-scaletempo
 endif
 
+#  --disable-sdp           disable dependency-less sdp plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-sdp
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-sdp
 endif
 
+#  --disable-segmentclip   disable dependency-less segmentclip plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-segmentclip
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-segmentclip
 endif
 
+#  --disable-siren         disable dependency-less siren plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-siren
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-siren
 endif
 
+#  --disable-speed         disable dependency-less speed plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-speed
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-speed
 endif
 
+#  --disable-subenc        disable dependency-less subenc plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-subenc
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-subenc
 endif
 
+#  --disable-stereo        disable dependency-less stereo plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-stereo
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-stereo
 endif
 
+#  --disable-tta           disable dependency-less tta plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-tta
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-tta
 endif
 
+#  --disable-videomaxrate  disable dependency-less videomaxrate plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-videomaxrate
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-videomaxrate
 endif
 
+#  --disable-videomeasure  disable dependency-less videomeasure plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-videomeasure
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-videomeasure
 endif
 
+#  --disable-videosignal   disable dependency-less videosignal plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-videosignal
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-videosignal
 endif
 
+#  --disable-vmnc          disable dependency-less vmnc plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-vmnc
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-vmnc
 endif
 
+#  --disable-y4m           disable dependency-less y4m plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-y4m
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-y4m
 endif
 
+#  --disable-directsound        disable DirectSound: directsoundsrc
+GST_PLUGINS_BAD_CONF_OPT += --disable-directsound
+
+#  --disable-directdraw         disable DirectDraw plug-in: directdrawsink
+GST_PLUGINS_BAD_CONF_OPT += --disable-directdraw
+
+#  --disable-apple_media        disable Apple video: applemedia
+GST_PLUGINS_BAD_CONF_OPT += --disable-apple_media
+
+#  --disable-osx_video          disable OSX video: osxvideosrc
+GST_PLUGINS_BAD_CONF_OPT += --disable-osx_video
+
+#  --disable-quicktime          disable QuickTime wrapper: qtwrapper
+GST_PLUGINS_BAD_CONF_OPT += --disable-quicktime
+
+#  --disable-shm                disable POSIX shared memory source and sink: shm
+GST_PLUGINS_BAD_CONF_OPT += --disable-shm
+
+#  --disable-vcd                disable Video CD: vcdsrc
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
+endif
+
+#  --disable-assrender          disable ASS/SSA renderer: assrender
+GST_PLUGINS_BAD_CONF_OPT += --disable-assrender
+
+#  --disable-amrwb              disable amrwb library: amrwbenc
+GST_PLUGINS_BAD_CONF_OPT += --disable-amrwb
+
+#  --disable-apexsink           disable AirPort Express Wireless sink: apexsink
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-apexsink
+GST_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
+endif
+
+#  --disable-bz2                disable bz2 library: bz2
+GST_PLUGINS_BAD_CONF_OPT += --disable-bz2
+
+#  --disable-cdaudio            disable cdaudio: cdaudio
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
+GST_PLUGINS_BAD_DEPENDENCIES += libcdaudio
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+endif
+
+#  --disable-celt               disable celt: celt
+GST_PLUGINS_BAD_CONF_OPT += --disable-celt
+
+#  --disable-cog                disable Cog plugin: cog
+GST_PLUGINS_BAD_CONF_OPT += --disable-cog
+
+#  --disable-dc1394             disable libdc1394: dc1394
+GST_PLUGINS_BAD_CONF_OPT += --disable-dc1394
+
+#  --disable-directfb           disable directfb: dfbvideosink
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-directfb
 GST_PLUGINS_BAD_DEPENDENCIES += directfb
@@ -409,18 +548,80 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-directfb
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dvb
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dvb
-endif
+#  --disable-dirac              disable dirac: dirac
+GST_PLUGINS_BAD_CONF_OPT += --disable-dirac
+
+#  --disable-dts                disable dts library: dtsdec
+GST_PLUGINS_BAD_CONF_OPT += --disable-dts
+
+#  --disable-divx               disable divx plugins: divx
+GST_PLUGINS_BAD_CONF_OPT += --disable-divx
+
+#  --disable-resindvd           disable resindvd plugin: resindvd
+GST_PLUGINS_BAD_CONF_OPT += --disable-resindvd
 
+#  --disable-exif               disable exif: exif
+GST_PLUGINS_BAD_CONF_OPT += --disable-exif
+
+#  --disable-faac               disable AAC encoder plug-in: faac
+GST_PLUGINS_BAD_CONF_OPT += --disable-faac
+
+#  --disable-faad               disable AAC decoder plug-in: faad
+GST_PLUGINS_BAD_CONF_OPT += --disable-faad
+
+#  --disable-fbdev              disable linux framebuffer: fbdevsink
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-fbdev
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-fbdev
 endif
 
+#  --disable-flite              disable Flite plugin: flite
+GST_PLUGINS_BAD_CONF_OPT += --disable-flite
+
+#  --disable-gsm                disable GSM library: gsmenc gsmdec
+GST_PLUGINS_BAD_CONF_OPT += --disable-gsm
+
+#  --disable-jp2k               disable jp2k: jp2kdec jp2kenc
+GST_PLUGINS_BAD_CONF_OPT += --disable-jp2k
+
+#  --disable-kate               disable Kate: kate
+GST_PLUGINS_BAD_CONF_OPT += --disable-kate
+
+#  --disable-ladspa             disable ladspa: ladspa
+GST_PLUGINS_BAD_CONF_OPT += --disable-ladspa
+
+#  --disable-lv2                disable lv2: lv2
+GST_PLUGINS_BAD_CONF_OPT += --disable-lv2
+
+#  --disable-libmms             disable mms protocol library: libmms
+GST_PLUGINS_BAD_CONF_OPT += --disable-libmms
+
+#  --disable-modplug            disable modplug: modplug
+GST_PLUGINS_BAD_CONF_OPT += --disable-modplug
+
+#  --disable-mimic              disable libmimic library: mimic
+GST_PLUGINS_BAD_CONF_OPT += --disable-mimic
+
+#  --disable-mpeg2enc           disable mpeg2enc: mpeg2enc
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpeg2enc
+
+#  --disable-mplex              disable mplex: mplex
+GST_PLUGINS_BAD_CONF_OPT += --disable-mplex
+
+#  --disable-musepack           disable musepackdec: musepack
+GST_PLUGINS_BAD_CONF_OPT += --disable-musepack
+
+#  --disable-musicbrainz        disable musicbrainz tag generation: musicbrainz
+GST_PLUGINS_BAD_CONF_OPT += --disable-musicbrainz
+
+#  --disable-mythtv             disable MythTV client plugins: mythtvsrc
+GST_PLUGINS_BAD_CONF_OPT += --disable-mythtv
+
+#  --disable-nas                disable nas plug-in: nassink
+GST_PLUGINS_BAD_CONF_OPT += --disable-nas
+
+#  --disable-neon               disable neon http client plugins: neonhttpsrc
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-neon
 GST_PLUGINS_BAD_DEPENDENCIES += neon
@@ -428,6 +629,22 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-neon
 endif
 
+#  --disable-ofa                disable ofa plugins: ofa
+GST_PLUGINS_BAD_CONF_OPT += --disable-ofa
+
+#  --disable-opencv             disable opencv plugins: opencv
+GST_PLUGINS_BAD_CONF_OPT += --disable-opencv
+
+#  --disable-rsvg               disable rsvg decoder: rsvg
+GST_PLUGINS_BAD_CONF_OPT += --disable-rsvg
+
+#  --disable-timidity           disable timidity midi soft synth plugin: timidity
+GST_PLUGINS_BAD_CONF_OPT += --disable-timidity
+
+#  --disable-wildmidi           disable wildmidi midi soft synth plugin: wildmidi
+GST_PLUGINS_BAD_CONF_OPT += --disable-wildmidi
+
+#  --disable-sdl                disable SDL plug-in: sdlvideosink sdlaudiosink
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL),y)
 GST_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST_PLUGINS_BAD_CONF_OPT += --enable-sdl
@@ -436,10 +653,109 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-sdl
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
+#  --disable-sdltest       do not try to compile and run a test SDL program
+GST_PLUGINS_BAD_CONF_OPT += --disable-sdltest
+
+#  --disable-sndfile            disable sndfile plug-in: sfsrc sfsink
+GST_PLUGINS_BAD_CONF_OPT += --disable-sndfile
+
+#  --disable-soundtouch         disable soundtouch plug-in: soundtouch
+GST_PLUGINS_BAD_CONF_OPT += --disable-soundtouch
+
+#  --disable-spc                disable spc decoder: spc
+GST_PLUGINS_BAD_CONF_OPT += --disable-spc
+
+#  --disable-gme                disable gme decoder: gme
+GST_PLUGINS_BAD_CONF_OPT += --disable-gme
+
+#  --disable-swfdec             disable swfdec plug-in: swfdec
+GST_PLUGINS_BAD_CONF_OPT += --disable-swfdec
+
+#  --disable-theoradec          disable ogg theora codec: theoraexpdec
+GST_PLUGINS_BAD_CONF_OPT += --disable-theoradec
+
+#  --disable-xvid               disable xvid plugins: xvid
+GST_PLUGINS_BAD_CONF_OPT += --disable-xvid
+
+#  --disable-dvb                disable DVB Source: dvb
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dvb
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
+GST_PLUGINS_BAD_CONF_OPT += --disable-dvb
 endif
 
+#  --disable-wininet            disable Windows internet library: wininet
+GST_PLUGINS_BAD_CONF_OPT += --disable-wininet
+
+#  --disable-acm                disable Windows ACM library: acm
+GST_PLUGINS_BAD_CONF_OPT += --disable-acm
+
+#  --disable-vdpau              disable VDPAU: vdpau
+GST_PLUGINS_BAD_CONF_OPT += --disable-vdpau
+
+#  --disable-schro              disable Schroedinger video codec: schro
+GST_PLUGINS_BAD_CONF_OPT += --disable-schro
+
+#  --disable-zbar               disable ZBar barcode detector: zbar
+GST_PLUGINS_BAD_CONF_OPT += --disable-zbar
+
+#  --disable-vp8                disable VP8 decoder: vp8
+GST_PLUGINS_BAD_CONF_OPT += 
+
+#  --disable-rtmp               disable rtmp library: rtmp
+GST_PLUGINS_BAD_CONF_OPT += --disable-rtmp
+
+#  --disable-gsettings          disable GSettings plugin: gsettings
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GSETTINGS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-gsettings
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-gsettings
+endif
+
+#  --disable-schemas-compile
+#                          Disable regeneration of gschemas.compiled on install
+GST_PLUGINS_BAD_CONF_OPT += --disable-schemas-compile
+
+#
+#Optional Packages:
+#  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
+#  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
+#  --with-pic              try to use only PIC/non-PIC objects [default=use
+#                          both]
+#  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+#  --with-autoconf         use a different autoconf for regeneration of
+#                          Makefiles
+#  --with-autoheader       use a different autoheader for regeneration of
+#                          Makefiles
+#  --with-automake         use a different automake for regeneration of
+#                          Makefiles
+#  --with-aclocal          use a different aclocal for regeneration of
+#                          Makefiles
+#  --with-gnu-ld           assume the C compiler uses GNU ld default=no
+#  --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
+#  --without-libiconv-prefix     don't search for libiconv in includedir and libdir
+#  --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
+#  --without-libintl-prefix     don't search for libintl in includedir and libdir
+#  --with-pkg-config-path  colon-separated list of pkg-config(1) dirs
+#  --with-package-name     specify package name to use in plugins
+#  --with-package-origin   specify package origin URL to use in plugins
+#  --with-plugins          comma-separated list of dependencyless plug-ins to
+#                          compile
+#  --with-html-dir=PATH    path to installed docs
+#  --with-gtk=3.0|2.0      which gtk+ version to compile against (default: 2.0)
+#  --with-default-audiosink
+#                          specify default audio sink
+#  --with-default-audiosrc specify default audio source
+#  --with-default-videosink
+#                          specify default video sink
+#  --with-default-videosrc specify default video source
+#  --with-default-visualizer
+#                          specify default visualizer
+#  --with-x                use the X Window System
+GST_PLUGINS_BAD_CONF_OPT += --with-x
+
+#  --with-sdl-prefix=PFX   prefix where SDL is installed (optional)
+#  --with-sdl-exec-prefix=PFX
+#                          exec prefix where SDL is installed (optional)
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-bad))
-- 
1.7.3.4
