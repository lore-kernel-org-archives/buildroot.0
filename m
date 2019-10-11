From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:28:49 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad:
 convert package type to meson
Message-ID: <20191011224157.20C818D4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d6c408e9535be4b5ba0c8a49215d2d03dcb5cd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Add 0002-fix-hls-meson-logic.patch:
    If one was to set -Dhls-crypto to either libgcrypt or openssl
    instead of auto, the following lines in ext/hls/meson.build would fail
    because hls_crypto_dep is not yet set:

    if not hls_crypto_dep.found() and ['auto', 'libgcrypt'].contains(hls_crypto)
    if not hls_crypto_dep.found() and ['auto', 'openssl'].contains(hls_crypto)

    Instead, change "if not hls_crypto_dep.found()" to "if not have_hls_crypto"
    which fixes the error. This patch is upstream.

  - Remove --disable-avc, this option is no longer in any of the plugin
    packages.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-fix-hls-meson-logic.patch                 |  48 ++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 506 +++++++++++----------
 2 files changed, 302 insertions(+), 252 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/0002-fix-hls-meson-logic.patch b/package/gstreamer1/gst1-plugins-bad/0002-fix-hls-meson-logic.patch
new file mode 100644
index 0000000000..84b0739110
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0002-fix-hls-meson-logic.patch
@@ -0,0 +1,48 @@
+From 172e4bc2a694162c1a38a758874b647234081b4c Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Wed, 29 May 2019 13:29:51 -0400
+Subject: [PATCH] ext/hls/meson.build: fix dependency logic
+
+Currently, if one was to set -Dhls-crypto to either libgcrypt or openssl
+instead of auto, the following lines would fail because hls_crypto_dep is not
+yet set:
+
+if not hls_crypto_dep.found() and ['auto', 'libgcrypt'].contains(hls_crypto)
+if not hls_crypto_dep.found() and ['auto', 'openssl'].contains(hls_crypto)
+
+Instead, change "if not hls_crypto_dep.found()" to "if not have_hls_crypto"
+which fixes the error.
+
+Upstream status: Accepted
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/merge_requests/372
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ ext/hls/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ext/hls/meson.build b/ext/hls/meson.build
+index fb5a7d4cc..0d33327ad 100644
+--- a/ext/hls/meson.build
++++ b/ext/hls/meson.build
+@@ -23,7 +23,7 @@ if not hls_option.disabled()
+     endif
+   endif
+ 
+-  if not hls_crypto_dep.found() and ['auto', 'libgcrypt'].contains(hls_crypto)
++  if not have_hls_crypto and ['auto', 'libgcrypt'].contains(hls_crypto)
+     hls_crypto_dep = cc.find_library('gcrypt', required : false)
+     if hls_crypto_dep.found()
+       have_hls_crypto = true
+@@ -31,7 +31,7 @@ if not hls_option.disabled()
+     endif
+   endif
+ 
+-  if not hls_crypto_dep.found() and ['auto', 'openssl'].contains(hls_crypto)
++  if not have_hls_crypto and ['auto', 'openssl'].contains(hls_crypto)
+     hls_crypto_dep = dependency('openssl', required : false)
+     if hls_crypto_dep.found()
+       have_hls_crypto = true
+-- 
+2.21.0
+
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index b3aaa37143..f4a7a65871 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -13,711 +13,713 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
 GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+
 
+GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 GST1_PLUGINS_BAD_CONF_OPTS = \
-	--disable-examples \
-	--disable-valgrind \
-	--disable-directsound \
-	--disable-direct3d \
-	--disable-winks \
-	--disable-android_media \
-	--disable-apple_media \
-	--disable-introspection
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Ddirectsound=disabled \
+	-Dd3dvideosink=disabled \
+	-Dwinks=disabled \
+	-Dandroidmedia=disabled \
+	-Dapplemedia=disabled \
+	-Dintrospection=disabled \
+	-Dgobject-cast-checks=disabled \
+	-Dglib-asserts=disabled \
+	-Dglib-checks=disabled
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BAD_CONF_OPTS += \
-	--disable-avc \
-	--disable-opensles \
-	--disable-uvch264 \
-	--disable-msdk \
-	--disable-voamrwbenc \
-	--disable-bs2b \
-	--disable-chromaprint \
-	--disable-dc1394 \
-	--disable-dts \
-	--disable-resindvd \
-	--disable-faac \
-	--disable-flite \
-	--disable-gsm \
-	--disable-fluidsynth \
-	--disable-kate \
-	--disable-ladspa \
-	--disable-lv2 \
-	--disable-libde265 \
-	--disable-modplug \
-	--disable-mplex \
-	--disable-ofa \
-	--disable-openexr \
-	--disable-openni2 \
-	--disable-teletextdec \
-	--disable-wildmidi \
-	--disable-smoothstreaming \
-	--disable-soundtouch \
-	--disable-gme \
-	--disable-vdpau \
-	--disable-schro \
-	--disable-spandsp \
-	--disable-gtk3 \
-	--disable-iqa \
-	--disable-opencv
+	-Dopensles=disabled \
+	-Duvch264=disabled \
+	-Dmsdk=disabled \
+	-Dvoamrwbenc=disabled \
+	-Dbs2b=disabled \
+	-Dchromaprint=disabled \
+	-Ddc1394=disabled \
+	-Ddts=disabled \
+	-Dresindvd=disabled \
+	-Dfaac=disabled \
+	-Dflite=disabled \
+	-Dgsm=disabled \
+	-Dfluidsynth=disabled \
+	-Dkate=disabled \
+	-Dladspa=disabled \
+	-Dlv2=disabled \
+	-Dlibde265=disabled \
+	-Dmodplug=disabled \
+	-Dmplex=disabled \
+	-Dofa=disabled \
+	-Dopenexr=disabled \
+	-Dopenni2=disabled \
+	-Dteletextdec=disabled \
+	-Dwildmidi=disabled \
+	-Dsmoothstreaming=disabled \
+	-Dsoundtouch=disabled \
+	-Dgme=disabled \
+	-Dvdpau=disabled \
+	-Dspandsp=disabled \
+	-Diqa=disabled \
+	-Dopencv=disabled
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 # RPI has odd locations for several required headers.
-GST1_PLUGINS_BAD_CONF_ENV += \
-	CPPFLAGS="$(TARGET_CPPFLAGS) \
-	-I$(STAGING_DIR)/usr/include/IL \
-	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+GST1_PLUGINS_BAD_CFLAGS=$(TARGET_CPPFLAGS) \
+	$(STAGING_DIR)/usr/include/IL \
+	$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+	$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += orc
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dorc=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dorc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += bluez5_utils
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-bluez
+GST1_PLUGINS_BAD_CONF_OPTS += -Dbluez=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-bluez
+GST1_PLUGINS_BAD_CONF_OPTS += -Dbluez=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-accurip
+GST1_PLUGINS_BAD_CONF_OPTS += -Daccurip=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-accurip
+GST1_PLUGINS_BAD_CONF_OPTS += -Daccurip=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-adpcmdec
+GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmdec=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-adpcmdec
+GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmdec=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-adpcmenc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmenc=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-adpcmenc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dadpcmenc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AIFF),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-aiff
+GST1_PLUGINS_BAD_CONF_OPTS += -Daiff=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-aiff
+GST1_PLUGINS_BAD_CONF_OPTS += -Daiff=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-asfmux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dasfmux=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-asfmux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dasfmux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOBUFFERSPLIT),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiobuffersplit
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiobuffersplit=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiobuffersplit
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiobuffersplit=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiofxbad
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiofxbad=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiofxbad
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiofxbad=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOLATENCY),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiolatency
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiolatency=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiolatency
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiolatency=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiomixmatrix
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiomixmatrix=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiomixmatrix
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiomixmatrix=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiovisualizers=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiovisualizers
+GST1_PLUGINS_BAD_CONF_OPTS += -Daudiovisualizers=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-autoconvert
+GST1_PLUGINS_BAD_CONF_OPTS += -Dautoconvert=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-autoconvert
+GST1_PLUGINS_BAD_CONF_OPTS += -Dautoconvert=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BAYER),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-bayer
+GST1_PLUGINS_BAD_CONF_OPTS += -Dbayer=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-bayer
+GST1_PLUGINS_BAD_CONF_OPTS += -Dbayer=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-camerabin2
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcamerabin2=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-camerabin2
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcamerabin2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-coloreffects
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcoloreffects=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-coloreffects
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcoloreffects=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-debugutils
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddebugutils=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-debugutils
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddebugutils=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvbsuboverlay
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsuboverlay=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvbsuboverlay
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvbsuboverlay=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVDSPU),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvdspu
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvdspu=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvdspu
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvdspu=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FACEOVERLAY),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-faceoverlay
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfaceoverlay=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-faceoverlay
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfaceoverlay=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-festival
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfestival=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-festival
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfestival=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FIELDANALYSIS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-fieldanalysis
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfieldanalysis=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-fieldanalysis
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfieldanalysis=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREEVERB),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-freeverb
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfreeverb=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-freeverb
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfreeverb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREI0R),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-frei0r
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfrei0r=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-frei0r
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfrei0r=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-gaudieffects
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgaudieffects=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-gaudieffects
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgaudieffects=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-geometrictransform
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgeometrictransform=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-geometrictransform
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgeometrictransform=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GDP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-gdp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgdp=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-gdp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgdp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-id3tag
+GST1_PLUGINS_BAD_CONF_OPTS += -Did3tag=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-id3tag
+GST1_PLUGINS_BAD_CONF_OPTS += -Did3tag=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTER),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-inter
+GST1_PLUGINS_BAD_CONF_OPTS += -Dinter=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-inter
+GST1_PLUGINS_BAD_CONF_OPTS += -Dinter=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTERLACE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-interlace
+GST1_PLUGINS_BAD_CONF_OPTS += -Dinterlace=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-interlace
+GST1_PLUGINS_BAD_CONF_OPTS += -Dinterlace=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-ivfparse
+GST1_PLUGINS_BAD_CONF_OPTS += -Divfparse=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-ivfparse
+GST1_PLUGINS_BAD_CONF_OPTS += -Divfparse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVTC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-ivtc
+GST1_PLUGINS_BAD_CONF_OPTS += -Divtc=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-ivtc
+GST1_PLUGINS_BAD_CONF_OPTS += -Divtc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-jp2kdecimator
+GST1_PLUGINS_BAD_CONF_OPTS += -Djp2kdecimator=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-jp2kdecimator
+GST1_PLUGINS_BAD_CONF_OPTS += -Djp2kdecimator=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-jpegformat
+GST1_PLUGINS_BAD_CONF_OPTS += -Djpegformat=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-jpegformat
+GST1_PLUGINS_BAD_CONF_OPTS += -Djpegformat=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBRFB),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-librfb
+GST1_PLUGINS_BAD_CONF_OPTS += -Dlibrfb=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-librfb
+GST1_PLUGINS_BAD_CONF_OPTS += -Dlibrfb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-midi
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmidi=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-midi
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmidi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegdemux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegdemux=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegdemux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegdemux=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsdemux
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegpsmux=enabled
 GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsdemux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegpsmux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsmux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsmux=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsmux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsmux=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegpsmux
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsdemux=enabled
 GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegpsmux
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpegtsdemux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mxf
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmxf=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mxf
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmxf=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NETSIM),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-netsim
+GST1_PLUGINS_BAD_CONF_OPTS += -Dnetsim=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-netsim
+GST1_PLUGINS_BAD_CONF_OPTS += -Dnetsim=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ONVIF),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-onvif
+GST1_PLUGINS_BAD_CONF_OPTS += -Donvif=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-onvif
+GST1_PLUGINS_BAD_CONF_OPTS += -Donvif=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-pcapparse
+GST1_PLUGINS_BAD_CONF_OPTS += -Dpcapparse=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-pcapparse
+GST1_PLUGINS_BAD_CONF_OPTS += -Dpcapparse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-pnm
+GST1_PLUGINS_BAD_CONF_OPTS += -Dpnm=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-pnm
+GST1_PLUGINS_BAD_CONF_OPTS += -Dpnm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PROXY),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-proxy
+GST1_PLUGINS_BAD_CONF_OPTS += -Dproxy=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-proxy
+GST1_PLUGINS_BAD_CONF_OPTS += -Dproxy=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
+GST1_PLUGINS_BAD_CONF_OPTS += -Drawparse=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-rawparse
+GST1_PLUGINS_BAD_CONF_OPTS += -Drawparse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-removesilence
+GST1_PLUGINS_BAD_CONF_OPTS += -Dremovesilence=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
+GST1_PLUGINS_BAD_CONF_OPTS += -Dremovesilence=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtmp
+GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += rtmpdump
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtmp
+GST1_PLUGINS_BAD_CONF_OPTS += -Drtmp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsdp=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-sdp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsdp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-segmentclip
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsegmentclip=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-segmentclip
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsegmentclip=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SIREN),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-siren
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsiren=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-siren
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsiren=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SMOOTH),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-smooth
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsmooth=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-smooth
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsmooth=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SPEED),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-speed
+GST1_PLUGINS_BAD_CONF_OPTS += -Dspeed=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-speed
+GST1_PLUGINS_BAD_CONF_OPTS += -Dspeed=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-subenc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsubenc=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-subenc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsubenc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-timecode
+GST1_PLUGINS_BAD_CONF_OPTS += -Dtimecode=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-timecode
+GST1_PLUGINS_BAD_CONF_OPTS += -Dtimecode=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-videofilters
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideofilters=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-videofilters
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideofilters=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFRAME_AUDIOLEVEL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-videoframe_audiolevel
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoframe_audiolevel=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-videoframe_audiolevel
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoframe_audiolevel=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-videoparsers
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoparsers=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-videoparsers
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideoparsers=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-videosignal
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideosignal=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-videosignal
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvideosignal=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VMNC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-vmnc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvmnc=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-vmnc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvmnc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-y4m
+GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-y4m
+GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-yadif
+GST1_PLUGINS_BAD_CONF_OPTS += -Dyadif=enabled
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-yadif
+GST1_PLUGINS_BAD_CONF_OPTS += -Dyadif=disabled
 endif
 
 # Plugins with dependencies
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-assrender
+GST1_PLUGINS_BAD_CONF_OPTS += -Dassrender=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libass
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-assrender
+GST1_PLUGINS_BAD_CONF_OPTS += -Dassrender=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-bz2
+GST1_PLUGINS_BAD_CONF_OPTS += -Dbz2=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += bzip2
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-bz2
+GST1_PLUGINS_BAD_CONF_OPTS += -Dbz2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-curl
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcurl=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libcurl
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-curl
+GST1_PLUGINS_BAD_CONF_OPTS += -Dcurl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dash
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddash=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libxml2
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dash
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddash=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-decklink
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddecklink=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-decklink
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddecklink=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-directfb
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += directfb
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-directfb
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddirectfb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvb
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvb=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvb
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddvb=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-faad
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfaad=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += faad2
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-faad
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfaad=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-fbdev
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfbdev=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-fbdev
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfbdev=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK_AAC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-fdk_aac
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfdkaac=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += fdk-aac
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-fdk_aac
+GST1_PLUGINS_BAD_CONF_OPTS += -Dfdkaac=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-gl
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgl=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-gl
+GST1_PLUGINS_BAD_CONF_OPTS += -Dgl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-hls
+GST1_PLUGINS_BAD_CONF_OPTS += -Dhls=enabled
 
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += nettle
-GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=nettle
+GST1_PLUGINS_BAD_CONF_OPTS += -Dhls-crypto='nettle'
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += libgcrypt
-GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=libgcrypt \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+GST1_PLUGINS_BAD_CONF_OPTS += -Dhls-crypto='libgcrypt'
 else
 GST1_PLUGINS_BAD_DEPENDENCIES += openssl
-GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=openssl
+GST1_PLUGINS_BAD_CONF_OPTS += -Dhls-crypto='openssl'
 endif
 
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
+GST1_PLUGINS_BAD_CONF_OPTS += -Dhls=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-kms
+GST1_PLUGINS_BAD_CONF_OPTS += -Dkms=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-kms
+GST1_PLUGINS_BAD_CONF_OPTS += -Dkms=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-libmms
+GST1_PLUGINS_BAD_CONF_OPTS += -Dlibmms=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libmms
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-libmms
+GST1_PLUGINS_BAD_CONF_OPTS += -Dlibmms=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dtls
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddtls=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += openssl
 GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dtls
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddtls=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-ttml
+GST1_PLUGINS_BAD_CONF_OPTS += -Dttml=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += cairo libxml2 pango
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-ttml
+GST1_PLUGINS_BAD_CONF_OPTS += -Dttml=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpeg2enc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpeg2enc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libmpeg2 mjpegtools
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpeg2enc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmpeg2enc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-musepack
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmusepack=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += musepack
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-musepack
+GST1_PLUGINS_BAD_CONF_OPTS += -Dmusepack=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-neon
+GST1_PLUGINS_BAD_CONF_OPTS += -Dneon=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += neon
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-neon
+GST1_PLUGINS_BAD_CONF_OPTS += -Dneon=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-openal
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopenal=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += openal
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-openal
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopenal=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-openh264
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopenh264=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libopenh264
 GST1_PLUGINS_BAD_HAS_BSD2C_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-openh264
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopenh264=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-openjpeg
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopenjpeg=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += openjpeg
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-openjpeg
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopenjpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-opus
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopus=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += opus
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-opus
+GST1_PLUGINS_BAD_CONF_OPTS += -Dopus=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-rsvg
+GST1_PLUGINS_BAD_CONF_OPTS += -Drsvg=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += librsvg
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
+GST1_PLUGINS_BAD_CONF_OPTS += -Drsvg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-sbc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsbc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += sbc
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-sbc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsbc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-shm
+GST1_PLUGINS_BAD_CONF_OPTS += -Dshm=enabled
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-shm
+GST1_PLUGINS_BAD_CONF_OPTS += -Dshm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-sndfile
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsndfile=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libsndfile
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-sndfile
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsndfile=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SRTP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-srtp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsrtp=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libsrtp
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-srtp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dsrtp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-voaacenc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-voaacenc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dvoaacenc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-webp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwebp=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += webp
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwebp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtc=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += gst1-plugins-base libnice
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtc
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-webrtcdsp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtcdsp=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += webrtc-audio-processing
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtcdsp
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwebrtcdsp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-wpe
-GST1_PLUGINS_BAD_DEPENDENCIES += wpewebkit
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwpe=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libwpe wpewebkit wpebackend-fdo
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-wpe
+GST1_PLUGINS_BAD_CONF_OPTS += -Dwpe=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
+GST1_PLUGINS_BAD_CONF_OPTS += -Dx265=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += x265
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-x265
+GST1_PLUGINS_BAD_CONF_OPTS += -Dx265=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_ZBAR),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-zbar
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzbar=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += zbar
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-zbar
+GST1_PLUGINS_BAD_CONF_OPTS += -Dzbar=disabled
 endif
 
 # Add GPL license if GPL licensed plugins enabled.
@@ -739,4 +741,4 @@ endif
 # Use the following command to extract license info for plugins.
 # # find . -name 'plugin-*.xml' | xargs grep license
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
