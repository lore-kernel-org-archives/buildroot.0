From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 20 Jun 2013 17:07:39 -0500
Subject: [Buildroot] [PATCH v12 04/11] gst1-plugins-good: add gstreamer1
	good plugins
In-Reply-To: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1371766066-676-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds gstreamer 1.X good plugins.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst1-plugins-good/Config.in     |  326 ++++++++++++++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |  404 ++++++++++++++++++++
 3 files changed, 731 insertions(+)
 create mode 100644 package/multimedia/gst1-plugins-good/Config.in
 create mode 100644 package/multimedia/gst1-plugins-good/gst1-plugins-good.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 6e21fc6..935fde8 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -14,6 +14,7 @@ source "package/multimedia/gst-omapfb/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst1-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
+source "package/multimedia/gst1-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/gst-plugin-x170/Config.in"
diff --git a/package/multimedia/gst1-plugins-good/Config.in b/package/multimedia/gst1-plugins-good/Config.in
new file mode 100644
index 0000000..9b7eba0
--- /dev/null
+++ b/package/multimedia/gst1-plugins-good/Config.in
@@ -0,0 +1,326 @@
+menuconfig BR2_PACKAGE_GST1_PLUGINS_GOOD
+	bool "gst1-plugins-good"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  A set of well-supported plug-ins for GStreamer under the preferred
+	  license.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST1_PLUGINS_GOOD
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_JPEG
+	bool "jpeg (JPEG support)"
+	select BR2_PACKAGE_JPEG
+	help
+	  JPeg plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PNG
+	bool "png (PNG support)"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  PNG plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2
+	bool "bz2 support"
+	depends on BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bz2 support for the following plugins:
+	  matroska
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
+	bool "zlib support"
+	depends on BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QTDEMUX || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable zlib support for the following plugins:
+	  id3demux, qtdemux, matroska
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA
+	bool "alpha"
+	help
+	  adds an alpha channel to video - constant or via chroma-keying
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_APETAG
+	bool "apetag"
+	help
+	  APEv1/2 tag reader
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
+	bool "audiofx"
+	help
+	  Audio effects plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS
+	bool "audioparsers"
+	help
+	  Parsers for various audio formats
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUPARSE
+	bool "auparse"
+	help
+	  parses au streams
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
+	bool "autodetect"
+	help
+	  Plugin contains auto-detection plugins for video/audio in- and outputs
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AVI
+	bool "avi (*.avi video)"
+	default y
+	help
+	  AVI stream handling
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CUTTER
+	bool "cutter"
+	help
+	  Audio Cutter to split audio into non-silent bits
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEBUGUTILS
+	bool "debugutils"
+	help
+	  elements for testing and debugging
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE
+	bool "deinterlace"
+	help
+	  Deinterlacer
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EFFECTV
+	bool "effectv"
+	help
+	  effect plugins from the effectv project
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EQUALIZER
+	bool "equalizer"
+	help
+	  GStreamer audio equalizers
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLV
+	bool "flv"
+	help
+	  FLV muxing and demuxing plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLX
+	bool "flx"
+	help
+	  FLC/FLI/FLX video decoder
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM
+	bool "goom"
+	help
+	  GOOM visualization filter
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM2K1
+	bool "goom2k1"
+	help
+	  GOOM 2k1 visualization filter
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ICYDEMUX
+	bool "icydemux"
+	help
+	  Demux ICY tags from a stream
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX
+	bool "id3demux (*.mp3 audio)"
+	help
+	  Demux ID3v1 and ID3v2 tags from a file
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE
+	bool "imagefreeze"
+	help
+	  Still frame stream generator
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_INTERLEAVE
+	bool "interleave"
+	help
+	  Audio interleaver/deinterleaver
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
+	bool "isomp4"
+	default y
+	help
+	  ISO base media file format support (mp4, 3gpp, qt, mj2)
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAW
+	bool "law"
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LEVEL
+	bool "level"
+	help
+	  Audio level plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
+	bool "matroska"
+	help
+	  Matroska and WebM stream handling
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MONOSCOPE
+	bool "monoscope"
+	help
+	  Monoscope visualization
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIFILE
+	bool "multifile"
+	help
+	  Reads/Writes buffers from/to sequentially named files
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIPART
+	bool "multipart"
+	help
+	  multipart stream manipulation
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_REPLAYGAIN
+	bool "replaygain"
+	help
+	  ReplayGain volume normalization
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP
+	bool "rtp"
+	help
+	  Real-time protocol plugins
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTPMANAGER
+	bool "rtpmanager"
+	help
+	  RTP session management plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
+	bool "rtsp"
+	help
+	  transfer data via RTSP
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHAPEWIPE
+	bool "shapewipe"
+	help
+	  Shape Wipe transition filter
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SMPTE
+	bool "smpte"
+	help
+	  Apply the standard SMPTE transitions on video images
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPECTRUM
+	bool "spectrum"
+	help
+	  Run an FFT on the audio signal, output spectrum data
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_UDP
+	depends on BR2_INET_IPV6
+	bool "udp"
+	help
+	  transfer data via UDP
+
+comment "udp requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOBOX
+	bool "videobox"
+	help
+	  resizes a video by adding borders or cropping
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOCROP
+	bool "videocrop"
+	help
+	  Crops video into a user-defined region
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOFILTER
+	bool "videofilter"
+	help
+	  Video filters plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOMIXER
+	bool "videomixer"
+	help
+	  Video mixer
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVENC
+	bool "wavenc"
+	help
+	  Encode raw audio into WAV
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPARSE
+	bool "wavparse (*.wav audio)"
+	default y
+	help
+	  Parse a .wav file into raw audio
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
+	bool "y4m"
+	help
+	  Encodes a YUV frame into the yuv4mpeg format (mjpegtools)
+
+comment "plugins with external dependencies"
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS
+	bool "ossaudio (OSS audio)"
+	help
+	  OSS (Open Sound System) support for GStreamer
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4
+	bool "oss4 (Open Sound System 4)"
+	help
+	  Open Sound System (OSS) version 4 support for GStreamer
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
+	bool "v4l2"
+	help
+	  elements for Video 4 Linux
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
+	bool "cairo"
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	help
+	  Cairo-based elements
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC
+	bool "flac (libFLAC)"
+	select BR2_PACKAGE_FLAC
+	help
+	  The FLAC Lossless compressor Codec
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF
+	bool "gdkpixbuf"
+	select BR2_PACKAGE_GDK_PIXBUF
+	help
+	  GdkPixbuf-based image decoder, overlay and sink
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	select BR2_PACKAGE_PULSEAUDIO
+	bool "pulseaudio"
+	help
+	  PulseAudio plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
+	bool "souphttpsrc (http client)"
+	select BR2_PACKAGE_LIBSOUP
+	help
+	  libsoup HTTP client src/sink
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
+	bool "speex"
+	select BR2_PACKAGE_SPEEX
+	help
+	  Speex plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
+	bool "vpx (webm)"
+	select BR2_PACKAGE_LIBVPX
+	help
+	  VP8 plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
+	bool "wavpack (*.wv audio)"
+	select BR2_PACKAGE_WAVPACK
+	help
+	  Wavpack lossless/lossy audio format handling
+
+endif
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
new file mode 100644
index 0000000..f177ed1
--- /dev/null
+++ b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
@@ -0,0 +1,404 @@
+###############################################################################
+#
+# gst1-plugins-good
+#
+###############################################################################
+
+GST1_PLUGINS_GOOD_VERSION = 1.0.7
+GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
+GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
+GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
+GST1_PLUGINS_GOOD_LICENSE = LGPLv2.1+
+
+GST1_PLUGINS_GOOD_CONF_OPT = \
+	--disable-debug \
+	--disable-valgrind \
+	--disable-examples \
+	--disable-directsound \
+	--disable-waveform \
+	--disable-sunaudio \
+	--disable-osx_audio \
+	--disable-osx_video \
+	--disable-aalib \
+	--disable-aalibtest \
+	--disable-libcaca \
+	--disable-esd \
+	--disable-esdtest
+
+
+# Options which require currently unpackaged libraries
+GST1_PLUGINS_GOOD_CONF_OPT += \
+	--disable-jack \
+	--disable-libdv \
+	--disable-dv1394 \
+	--disable-shout2 \
+	--disable-taglib
+
+GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-orc
+GST1_PLUGINS_GOOD_DEPENDENCIES += orc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-alpha
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-alpha
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_APETAG),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-apetag
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-apetag
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-audiofx
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-audiofx
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-audioparsers
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-audioparsers
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUPARSE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-auparse
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-auparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-autodetect
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-autodetect
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AVI),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-avi
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-avi
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CUTTER),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-cutter
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-cutter
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEBUGUTILS),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-debugutils
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-debugutils
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-deinterlace
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-deinterlace
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-effectv
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-effectv
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EQUALIZER),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-equalizer
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-equalizer
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLV),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-flv
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-flv
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLX),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-flx
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-flx
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-goom
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-goom
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-goom2k1
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-goom2k1
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ICYDEMUX),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-icydemux
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-icydemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-id3demux
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-id3demux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-imagefreeze
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-imagefreeze
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_INTERLEAVE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-interleave
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-interleave
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-isomp4
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-isomp4
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAW),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-law
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-law
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LEVEL),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-level
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-level
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-matroska
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-matroska
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MONOSCOPE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-monoscope
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-monoscope
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIFILE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-multifile
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-multifile
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIPART),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-multipart
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-multipart
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_REPLAYGAIN),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-replaygain
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-replaygain
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-rtp
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-rtp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTPMANAGER),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-rtpmanager
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-rtpmanager
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-rtsp
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-rtsp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHAPEWIPE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-shapewipe
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-shapewipe
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SMPTE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-smpte
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-smpte
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPECTRUM),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-spectrum
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-spectrum
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_UDP),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-udp
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-udp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOBOX),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-videobox
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-videobox
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOCROP),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-videocrop
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-videocrop
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-videofilter
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOMIXER),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-videomixer
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-videomixer
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVENC),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-wavenc
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-wavenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-wavparse
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-wavparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-y4m
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-y4m
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-oss
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-oss
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-oss4
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-oss4
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-gst_v4l2
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-gst_v4l2
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
+GST1_PLUGINS_GOOD_CONF_OPT += \
+	--enable-x \
+	--enable-xshm \
+	--enable-xvideo
+else
+GST1_PLUGINS_GOOD_CONF_OPT += \
+	--disable-x \
+	--disable-xshm \
+	--disable-xvideo
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-cairo
+GST1_PLUGINS_GOOD_DEPENDENCIES += cairo
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-cairo
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-flac
+GST1_PLUGINS_GOOD_DEPENDENCIES += flac
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-flac
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-gdk_pixbuf
+GST1_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-gdk_pixbuf
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_JPEG),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
+GST1_PLUGINS_GOOD_DEPENDENCIES += jpeg
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PNG),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-libpng
+GST1_PLUGINS_GOOD_DEPENDENCIES += libpng
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-pulse
+GST1_PLUGINS_GOOD_DEPENDENCIES += pulseaudio
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-soup
+GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-soup
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-speex
+GST1_PLUGINS_GOOD_DEPENDENCIES += speex
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-speex
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-wavpack
+GST1_PLUGINS_GOOD_DEPENDENCIES += wavpack
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-wavpack
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-zlib
+GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-bz2
+GST1_PLUGINS_GOOD_DEPENDENCIES += bzip2
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-bz2
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
