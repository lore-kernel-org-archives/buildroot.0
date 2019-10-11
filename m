From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:23:34 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good:
 convert package type to meson
Message-ID: <20191011224157.188248D55F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc7ca780a01766ab689407427d2bb6ee53ed7b55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Remove BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
    Existing configs will already have BR2_PACKAGE_ZLIB selected, so no legacy
    entry is needed for BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Arnout: fix merge conflict with shout2]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-good/Config.in     |   8 -
 .../gst1-plugins-good/gst1-plugins-good.mk         | 305 ++++++++++-----------
 2 files changed, 152 insertions(+), 161 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 40e21985d9..c8bf58bb89 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -32,14 +32,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2
 	  Enable bz2 support for the following plugins:
 	  matroska
 
-config BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
-	bool "zlib support"
-	depends on BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4 || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable zlib support for the following plugins:
-	  id3demux, isomp4, matroska
-
 comment "dependency-less plugins"
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 55ff511628..9812ab07fe 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -10,464 +10,463 @@ GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 
+GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 GST1_PLUGINS_GOOD_CONF_OPTS = \
-	--disable-valgrind \
-	--disable-examples \
-	--disable-directsound \
-	--disable-waveform \
-	--disable-sunaudio \
-	--disable-osx_audio \
-	--disable-osx_video \
-	--disable-aalib \
-	--disable-aalibtest \
-	--disable-libcaca
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Ddirectsound=disabled \
+	-Dwaveform=disabled \
+	-Dosxaudio=disabled \
+	-Dosxvideo=disabled \
+	-Daalib=disabled \
+	-Dlibcaca=disabled
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
-	--disable-libdv \
-	--disable-dv1394
+	-Ddv=disabled \
+	-Ddv1394=disabled \
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_JACK),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-jack
+GST1_PLUGINS_GOOD_CONF_OPTS += -Djack=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += jack2
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-jack
+GST1_PLUGINS_GOOD_CONF_OPTS += -Djack=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --with-libv4l2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-libv4l2=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += libv4l
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --without-libv4l2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-libv4l2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ORC),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-orc
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dorc=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += orc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-alpha
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-alpha
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_APETAG),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-apetag
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dapetag=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-apetag
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dapetag=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-audiofx
+GST1_PLUGINS_GOOD_CONF_OPTS += -Daudiofx=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-audiofx
+GST1_PLUGINS_GOOD_CONF_OPTS += -Daudiofx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-audioparsers
+GST1_PLUGINS_GOOD_CONF_OPTS += -Daudioparsers=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-audioparsers
+GST1_PLUGINS_GOOD_CONF_OPTS += -Daudioparsers=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUPARSE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-auparse
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dauparse=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-auparse
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dauparse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-autodetect
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dautodetect=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-autodetect
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dautodetect=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AVI),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-avi
+GST1_PLUGINS_GOOD_CONF_OPTS += -Davi=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-avi
+GST1_PLUGINS_GOOD_CONF_OPTS += -Davi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CUTTER),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-cutter
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dcutter=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-cutter
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dcutter=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEBUGUTILS),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-debugutils
+GST1_PLUGINS_GOOD_CONF_OPTS += -Ddebugutils=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-debugutils
+GST1_PLUGINS_GOOD_CONF_OPTS += -Ddebugutils=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-deinterlace
+GST1_PLUGINS_GOOD_CONF_OPTS += -Ddeinterlace=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-deinterlace
+GST1_PLUGINS_GOOD_CONF_OPTS += -Ddeinterlace=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DTMF),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-dtmf
+GST1_PLUGINS_GOOD_CONF_OPTS += -Ddtmf=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-dtmf
+GST1_PLUGINS_GOOD_CONF_OPTS += -Ddtmf=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-effectv
+GST1_PLUGINS_GOOD_CONF_OPTS += -Deffectv=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-effectv
+GST1_PLUGINS_GOOD_CONF_OPTS += -Deffectv=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EQUALIZER),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-equalizer
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dequalizer=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-equalizer
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dequalizer=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLV),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-flv
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dflv=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-flv
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dflv=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLX),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-flx
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dflx=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-flx
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dflx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-goom
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dgoom=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-goom
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dgoom=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-goom2k1
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dgoom2k1=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-goom2k1
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dgoom2k1=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ICYDEMUX),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-icydemux
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dicydemux=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-icydemux
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dicydemux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-id3demux
+GST1_PLUGINS_GOOD_CONF_OPTS += -Did3demux=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-id3demux
+GST1_PLUGINS_GOOD_CONF_OPTS += -Did3demux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-imagefreeze
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dimagefreeze=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-imagefreeze
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dimagefreeze=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_INTERLEAVE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-interleave
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dinterleave=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-interleave
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dinterleave=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-isomp4
+GST1_PLUGINS_GOOD_CONF_OPTS += -Disomp4=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-isomp4
+GST1_PLUGINS_GOOD_CONF_OPTS += -Disomp4=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-lame
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dlame=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += lame
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-lame
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dlame=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MPG123),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-mpg123
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmpg123=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += mpg123
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-mpg123
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmpg123=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAW),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-law
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dlaw=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-law
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dlaw=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LEVEL),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-level
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dlevel=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-level
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dlevel=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-matroska
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmatroska=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-matroska
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmatroska=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MONOSCOPE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-monoscope
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmonoscope=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-monoscope
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmonoscope=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIFILE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-multifile
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmultifile=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-multifile
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmultifile=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIPART),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-multipart
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmultipart=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-multipart
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dmultipart=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_REPLAYGAIN),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-replaygain
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dreplaygain=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-replaygain
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dreplaygain=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-rtp
+GST1_PLUGINS_GOOD_CONF_OPTS += -Drtp=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-rtp
+GST1_PLUGINS_GOOD_CONF_OPTS += -Drtp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTPMANAGER),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-rtpmanager
+GST1_PLUGINS_GOOD_CONF_OPTS += -Drtpmanager=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-rtpmanager
+GST1_PLUGINS_GOOD_CONF_OPTS += -Drtpmanager=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-rtsp
+GST1_PLUGINS_GOOD_CONF_OPTS += -Drtsp=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-rtsp
+GST1_PLUGINS_GOOD_CONF_OPTS += -Drtsp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHAPEWIPE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-shapewipe
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dshapewipe=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-shapewipe
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dshapewipe=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SMPTE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-smpte
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dsmpte=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-smpte
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dsmpte=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPECTRUM),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-spectrum
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dspectrum=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-spectrum
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dspectrum=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_UDP),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-udp
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dudp=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-udp
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dudp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOBOX),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videobox
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideobox=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videobox
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideobox=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOCROP),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videocrop
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideocrop=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videocrop
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideocrop=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videofilter
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideofilter=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videofilter
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideofilter=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOMIXER),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videomixer
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideomixer=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videomixer
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvideomixer=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVENC),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-wavenc
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavenc=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-wavenc
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavenc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-wavparse
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavparse=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-wavparse
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavparse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-y4m
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dy4m=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-y4m
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dy4m=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-oss
+GST1_PLUGINS_GOOD_CONF_OPTS += -Doss=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-oss
+GST1_PLUGINS_GOOD_CONF_OPTS += -Doss=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-oss4
+GST1_PLUGINS_GOOD_CONF_OPTS += -Doss4=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-oss4
+GST1_PLUGINS_GOOD_CONF_OPTS += -Doss4=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-qt
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dqt5=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += qt5declarative
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += qt5x11extras
 endif
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-qt
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dqt5=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-shout2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dshout2=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += libshout
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-shout2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dshout2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=enabled
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-gst_v4l2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-v4l2-probe
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-probe=true
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-v4l2-probe
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-probe=false
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
 GST1_PLUGINS_GOOD_CONF_OPTS += \
-	--enable-x \
-	$(if $(BR2_PACKAGE_XLIB_LIBXFIXES),xlib_libXfixes) \
-	$(if $(BR2_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
+	-Dximagesrc=enabled \
+	$(if $(BR2_PACKAGE_XLIB_LIBXFIXES),-Dximagesrc-xfixes=enabled) \
+	$(if $(BR2_PACKAGE_XLIB_LIBXDAMAGE),-Dximagesrc-xdamage=enabled)
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += \
-	--disable-x
+	-Dximagesrc=disabled \
+	-Dximagesrc-xfixes=disabled \
+	-Dximagesrc-xdamage=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-cairo
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dcairo=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += cairo
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-cairo
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dcairo=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-flac
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dflac=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += flac
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-flac
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dflac=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gdk_pixbuf
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dgdk-pixbuf=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-gdk_pixbuf
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dgdk-pixbuf=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_JPEG),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-jpeg
+GST1_PLUGINS_GOOD_CONF_OPTS += -Djpeg=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += jpeg
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-jpeg
+GST1_PLUGINS_GOOD_CONF_OPTS += -Djpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PNG),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-libpng
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dpng=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += libpng
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-libpng
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dpng=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-pulse
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dpulse=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += pulseaudio
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-pulse
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dpulse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-soup
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dsoup=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-soup
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dsoup=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-speex
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dspeex=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += speex
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-speex
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dspeex=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-taglib
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dtaglib=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += taglib
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-taglib
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dtaglib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TWOLAME),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-twolame
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dtwolame=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += twolame
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-twolame
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dtwolame=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-vpx
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvpx=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += libvpx
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-vpx
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dvpx=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-wavpack
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavpack=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += wavpack
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-wavpack
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavpack=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-zlib
 GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
-else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2),y)
-GST1_PLUGINS_GOOD_CONF_OPTS += --enable-bz2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dbz2=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += bzip2
 else
-GST1_PLUGINS_GOOD_CONF_OPTS += --disable-bz2
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dbz2=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
