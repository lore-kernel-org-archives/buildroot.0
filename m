From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Apr 2019 21:26:25 +0200
Subject: [Buildroot] [PATCH v4 04/10]
 package/gstreamer1/gst1-plugins-{base, good, bad, ugly}: bump to 1.16.0
In-Reply-To: <20190430142715.66338-4-aduskett@gmail.com>
References: <20190430142715.66338-1-aduskett@gmail.com>
 <20190430142715.66338-4-aduskett@gmail.com>
Message-ID: <20190430212625.2b793130@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

thanks for the new patch iteration, some comments below...

On Tue, 30 Apr 2019 10:27:09 -0400, aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
>
> Group these patches because of several changes to the plugin packages.
>
> Changes:
>   - Remove upstreamed patches:
>       - 0001-fdkaacenc-Remove-MODE_2_1.patch
>       - 0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
>
>   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR to Config.in.legacy as
>     this plugin is moved to gst1-plugins-base.
>
>   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA to Config.in.legacy as this the
>     plugin is now removed.
>
>   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV to Config.in.legacy as the
>     plugin now requires opencv3 with the bgsegm opencv_contrib module, which is
>     not in Buildroot.
>
>   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO to Config.in.legacy as this
>     plugin is merged with the audiofx plugin in gst1-plugins-good.
>
>   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD to Config.in.legacy as this
>     plugin is removed.
>
>   - Remove COPYING.LIB from gst-plugins-base mk file and hash file as it no
>     longer exists.
>
>   - Add BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR to gst1-plugins-base.mk
>
>   - Add BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION to
>     gst1-plugins-base.
>
>   - Add mjpegtools to the dependencies of
>     BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
>
>   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA because it now depends on
>     the package dssim which isn't available in Buildroot.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - removed IQA plugin because of the dependency on the package dssim which does
>     not exist in Buildroot.
>   - Added mjpegtools to the dependencies of the mpeg2enc plugin.
>   - Moved BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR to the correct location
>     in Config.in.legacy.
>   - Added BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA to Config.in.legacy
>
> Changes v2 -> v3:
>   - Clean up commit message.
>   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO (Peter)
>   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO (Peter)

Nitpick, should be BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD?

>   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV (Peter)
>   - Add BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION to
>     gst1-plugins-base. (Peter)
>
> Changes v3 -> v4:
>   - Rebase because of commit 80a5217476c45e765db45acd8782f7f854783f93 (Bernd)
>   - Remove newly commited patch 0001-gstrtspconnection-Security-loophole-making-heap-over.patch
>
>  Config.in.legacy                              | 35 +++++++++++++
>  .../0001-fdkaacenc-Remove-MODE_2_1.patch      | 32 ------------
>  ...V-channel-mapping-instead-of-interle.patch | 49 -------------------
>  package/gstreamer1/gst1-plugins-bad/Config.in | 46 ++++-------------
>  .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +-
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      | 40 ++-------------
>  ...n-Security-loophole-making-heap-over.patch | 31 ------------
>  .../gstreamer1/gst1-plugins-base/Config.in    | 10 ++++
>  .../gst1-plugins-base/gst1-plugins-base.hash  |  7 ++-
>  .../gst1-plugins-base/gst1-plugins-base.mk    | 16 +++++-
>  .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +-
>  .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
>  .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +-
>  .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  2 +-
>  14 files changed, 83 insertions(+), 199 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
>  delete mode 100644 package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
>  delete mode 100644 package/gstreamer1/gst1-plugins-base/0001-gstrtspconnection-Security-loophole-making-heap-over.patch
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index ec5079da65..85d74bbaf4 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,41 @@ endif
>
>  comment "Legacy options removed in 2019.05"
>
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
> +	bool "compositor moved to gst1-plugins-base"
> +	select BR2_LEGACY

missing (see some others examples of moved gstreamer
plugins in Config.in.legacy)...

select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR

> +	help
> +	  The gst1-plugins-bad compositor plugin has moved
> +	  to gst1-plugins-base.
> +
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA
> +	bool "gst-plugins-bad IQA option was removed"
> +	select BR2_LEGACY
> +	help
> +	  The gst1-plugins-bad IQA option was removed.
> +
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
> +	bool "gst-plugins-bad opencv option was removed"
> +	select BR2_LEGACY
> +	help
> +	  The gst1-plugins-bad opencv option was removed because
> +	  buildroot does not have the opencv_contrib package which
> +	  is required for the bgsegm module which gst1-plugins-bad
> +	  now requires along with opencv3.
> +
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO
> +	bool "stereo was merged into audiofx in gst1-plugins-good"
> +	select BR2_LEGACY

missing
select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX

> +	help
> +	  The gst1-plugins-bad stereo plugin has merged with the
> +	  gst1-plugins-base audiofx plugin.
> +
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD
> +	bool "gst-plugins-bad vcd plugin was removed."
> +	select BR2_LEGACY
> +	help
> +	  The gst1-plugins-bad vcd plugin was removed.
> +
>  config BR2_PACKAGE_LUNIT
>  	bool "lunit package removed"
>  	select BR2_LEGACY
> diff --git a/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch b/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
> deleted file mode 100644
> index a9c5d44d92..0000000000
> --- a/package/gstreamer1/gst1-plugins-bad/0001-fdkaacenc-Remove-MODE_2_1.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From f4fdb9770c76113f38515245fecc5f11b3ace20d Mon Sep 17 00:00:00 2001
> -From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
> -Date: Tue, 4 Dec 2018 17:54:42 +0100
> -Subject: [PATCH] fdkaacenc: Remove MODE_2_1
> -
> -This is not a standard mode and no longer supported by fdk-aac 2.0.0.
> -
> -For https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/issues/825
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - ext/fdkaac/gstfdkaacenc.c | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/ext/fdkaac/gstfdkaacenc.c b/ext/fdkaac/gstfdkaacenc.c
> -index ad2bcb492..8410e684c 100644
> ---- a/ext/fdkaac/gstfdkaacenc.c
> -+++ b/ext/fdkaac/gstfdkaacenc.c
> -@@ -71,10 +71,6 @@ static const struct
> -   GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER,
> -           GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
> -           GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}}, {
> --    3, MODE_2_1, {
> --  GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
> --          GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT,
> --          GST_AUDIO_CHANNEL_POSITION_LFE1}}, {
> -     4, MODE_1_2_1, {
> -   GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER,
> -           GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT,
> ---
> -2.11.0
> -
> diff --git a/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch b/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
> deleted file mode 100644
> index 0049714266..0000000000
> --- a/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 19d34f6b5e1633d5ec4bb2832c58470f0c829cab Mon Sep 17 00:00:00 2001
> -From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
> -Date: Wed, 5 Dec 2018 10:10:39 +0100
> -Subject: [PATCH] fdkaacdec: Use WAV channel mapping instead of interleave
> - setting
> -
> -The latter is going away in libfdk-aac 2.0.0. Instead, MPEG-style output
> -is always non-interleaved and WAV-style output is always interleaved.
> -Earlier libfdk-aac also defaults interleaving accordingly.
> -
> -Since our reordering looks at the associated PCE indices instead of the
> -actual channel order, we're agnostic to the mapping.
> -
> -For https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/issues/825
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - ext/fdkaac/gstfdkaacdec.c | 12 ++++--------
> - 1 file changed, 4 insertions(+), 8 deletions(-)
> -
> -diff --git a/ext/fdkaac/gstfdkaacdec.c b/ext/fdkaac/gstfdkaacdec.c
> -index c27183752..f5136b334 100644
> ---- a/ext/fdkaac/gstfdkaacdec.c
> -+++ b/ext/fdkaac/gstfdkaacdec.c
> -@@ -151,17 +151,13 @@ gst_fdkaacdec_set_format (GstAudioDecoder * dec, GstCaps * caps)
> -     gst_buffer_unref (codec_data);
> -   }
> -
> -+  /* Choose WAV channel mapping to get interleaving even with libfdk-aac 2.0.0
> -+   * The pChannelIndices retain the indices from the standard MPEG mapping so
> -+   * we're agnostic to the actual order. */
> -   if ((err =
> -           aacDecoder_SetParam (self->dec, AAC_PCM_OUTPUT_CHANNEL_MAPPING,
> --              0)) != AAC_DEC_OK) {
> --    GST_ERROR_OBJECT (self, "Failed to set output channel mapping: %d", err);
> --    return FALSE;
> --  }
> --
> --  if ((err =
> --          aacDecoder_SetParam (self->dec, AAC_PCM_OUTPUT_INTERLEAVED,
> -               1)) != AAC_DEC_OK) {
> --    GST_ERROR_OBJECT (self, "Failed to set interleaved output: %d", err);
> -+    GST_ERROR_OBJECT (self, "Failed to set output channel mapping: %d", err);
> -     return FALSE;
> -   }
> -
> ---
> -2.11.0
> -
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 6830902f3a..e0757e96c9 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -51,11 +51,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX
>  	help
>  	  Audio N:M mixer plugin
>
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
> -	bool "compositor"
> -	help
> -	  Video compositor plugin
> -
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
>  	bool "audiovisualizers"
>  	help
> @@ -263,9 +258,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
>  	help
>  	  subtitle encoders
>
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO
> -	bool "stereo"
> -
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE
>  	bool "timecode"
>
> @@ -279,11 +271,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFRAME_AUDIOLEVEL
>  	help
>  	  videoframe_audiolevel
>
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA
> -	bool "iqa"
> -	help
> -	  Image Quality Assessment
> -
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS
>  	bool "videoparsers"
>  	help
> @@ -434,10 +421,19 @@ comment "ttml needs a toolchain w/ wchar, threads, C++"
>
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
>  	bool "mpeg2enc"
> +	depends on BR2_USE_MMU # fork
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBMPEG2
> +	select BR2_PACKAGE_MJPEGTOOLS
>  	help
>  	  High-quality MPEG-1/2 video encoder
>
> +comment "mpeg2enc needs a toolchain w/ threads, C++"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_INSTALL_LIBSTDCPP
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK
>  	bool "musepack"
>  	select BR2_PACKAGE_MUSEPACK
> @@ -460,27 +456,6 @@ comment "openal plugin needs a toolchain w/ NPTL, C++"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| !BR2_INSTALL_LIBSTDCPP
>
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
> -	bool "opencv"
> -	depends on BR2_PACKAGE_OPENCV
> -	# Remove the following opencv modules when gstreamer fixes the
> -	# problem of including the old "cv.h" header
> -	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_FLANN
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_LEGACY
> -	select BR2_PACKAGE_OPENCV_LIB_ML
> -	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> -	help
> -	  GStreamer OpenCV Plugins
> -
> -comment "opencv plugin needs OpenCV-2.4"
> -	depends on !BR2_PACKAGE_OPENCV
> -
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
>  	bool "openh264"
>  	depends on BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS
> @@ -537,9 +512,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SRTP
>  	bool "srtp"
>  	select BR2_PACKAGE_LIBSRTP
>
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD
> -	bool "vcd"
> -
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
>  	bool "voaacenc"
>  	select BR2_PACKAGE_VO_AACENC
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
> index cb4bf64677..0c1627de86 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
> @@ -1,4 +1,4 @@
> -# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.4.tar.xz.sha256sum
> -sha256 910b4e0e2e897e8b6d06767af1779d70057c309f67292f485ff988d087aa0de5 gst-plugins-bad-1.14.4.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.16.0.tar.xz.sha256sum
> +sha256 22139de35626ada6090bdfa3423b27b7fc15a0198331d25c95e6b12cb1072b05 gst-plugins-bad-1.16.0.tar.xz
>  sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
>  sha256 cf9b86bcf2d298e8cf5b9d8982f9dab296465b002fdfa0347357a0732f961e03 COPYING.LIB
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index e4e7661ac4..a1e74a2d96 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GST1_PLUGINS_BAD_VERSION = 1.14.4
> +GST1_PLUGINS_BAD_VERSION = 1.16.0
>  GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
>  GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
>  GST1_PLUGINS_BAD_INSTALL_STAGING = YES
> @@ -21,7 +21,6 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
>  	--disable-winks \
>  	--disable-android_media \
>  	--disable-apple_media \
> -	--disable-acm \
>  	--disable-introspection
>
>  # Options which require currently unpackaged libraries
> @@ -53,12 +52,12 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>  	--disable-wildmidi \
>  	--disable-smoothstreaming \
>  	--disable-soundtouch \
> -	--disable-spc \
>  	--disable-gme \
>  	--disable-vdpau \
>  	--disable-schro \
>  	--disable-spandsp \
> -	--disable-gtk3
> +	--disable-gtk3 \
> +	--disable-iqa
>
>  GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
>
> @@ -138,12 +137,6 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiomixmatrix
>  endif
>
> -ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR),y)
> -GST1_PLUGINS_BAD_CONF_OPTS += --enable-compositor
> -else
> -GST1_PLUGINS_BAD_CONF_OPTS += --disable-compositor
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
>  else
> @@ -405,12 +398,6 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-subenc
>  endif
>
> -ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO),y)
> -GST1_PLUGINS_BAD_CONF_OPTS += --enable-stereo
> -else
> -GST1_PLUGINS_BAD_CONF_OPTS += --disable-stereo
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-timecode
>  else
> @@ -429,12 +416,6 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-videoframe_audiolevel
>  endif
>
> -ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA),y)
> -GST1_PLUGINS_BAD_CONF_OPTS += --enable-iqa
> -else
> -GST1_PLUGINS_BAD_CONF_OPTS += --disable-iqa
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-videoparsers
>  else
> @@ -593,7 +574,7 @@ endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpeg2enc
> -GST1_PLUGINS_BAD_DEPENDENCIES += libmpeg2
> +GST1_PLUGINS_BAD_DEPENDENCIES += libmpeg2 mjpegtools
>  GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
>  else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpeg2enc
> @@ -620,13 +601,6 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-openal
>  endif
>
> -ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV),y)
> -GST1_PLUGINS_BAD_CONF_OPTS += --enable-opencv
> -GST1_PLUGINS_BAD_DEPENDENCIES += opencv
> -else
> -GST1_PLUGINS_BAD_CONF_OPTS += --disable-opencv
> -endifOptions which require currently unpackaged libraries
> -

Unconditional --disable-opencv is missing (above at the
'Options which require currently unpackaged libraries' place)...

Regards,
Peter

>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-openh264
>  GST1_PLUGINS_BAD_DEPENDENCIES += libopenh264
> @@ -683,12 +657,6 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-srtp
>  endif
>
> -ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD),y)
> -GST1_PLUGINS_BAD_CONF_OPTS += --enable-vcd
> -else
> -GST1_PLUGINS_BAD_CONF_OPTS += --disable-vcd
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-voaacenc
>  GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
> diff --git a/package/gstreamer1/gst1-plugins-base/0001-gstrtspconnection-Security-loophole-making-heap-over.patch b/package/gstreamer1/gst1-plugins-base/0001-gstrtspconnection-Security-loophole-making-heap-over.patch
> deleted file mode 100644
> index de88f67a39..0000000000
> --- a/package/gstreamer1/gst1-plugins-base/0001-gstrtspconnection-Security-loophole-making-heap-over.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From f672277509705c4034bc92a141eefee4524d15aa Mon Sep 17 00:00:00 2001
> -From: Tobias Ronge <tobiasr@axis.com>
> -Date: Thu, 14 Mar 2019 10:12:27 +0100
> -Subject: [PATCH] gstrtspconnection: Security loophole making heap overflow
> -
> -The former code allowed an attacker to create a heap overflow by
> -sending a longer than allowed session id in a response and including a
> -semicolon to change the maximum length. With this change, the parser
> -will never go beyond 512 bytes.
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - gst-libs/gst/rtsp/gstrtspconnection.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gst-libs/gst/rtsp/gstrtspconnection.c b/gst-libs/gst/rtsp/gstrtspconnection.c
> -index a6755bedd..c0429064a 100644
> ---- a/gst-libs/gst/rtsp/gstrtspconnection.c
> -+++ b/gst-libs/gst/rtsp/gstrtspconnection.c
> -@@ -2461,7 +2461,7 @@ build_next (GstRTSPBuilder * builder, GstRTSPMessage * message,
> -           maxlen = sizeof (conn->session_id) - 1;
> -           /* the sessionid can have attributes marked with ;
> -            * Make sure we strip them */
> --          for (i = 0; session_id[i] != '\0'; i++) {
> -+          for (i = 0; i < maxlen && session_id[i] != '\0'; i++) {
> -             if (session_id[i] == ';') {
> -               maxlen = i;
> -               /* parse timeout */
> ---
> -2.11.0
> -
> diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
> index 340926ecb9..29f8001f3a 100644
> --- a/package/gstreamer1/gst1-plugins-base/Config.in
> +++ b/package/gstreamer1/gst1-plugins-base/Config.in
> @@ -43,6 +43,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
>  	help
>  	  Creates audio test signals of given frequency and volume
>
> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR
> +	bool "compositor"
> +	help
> +	  Video compositor plugin
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING
>  	bool "encoding"
>  	help
> @@ -58,6 +63,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
>  	help
>  	  GIO elements
>
> +config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION
> +	bool "overlaycomposition"
> +	help
> +	  Overlaycomposition plugin.
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
>  	bool "playback"
>  	default y
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
> index c508bdc00d..b1fc68d93b 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
> @@ -1,4 +1,3 @@
> -# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.4.tar.xz.sha256sum
> -sha256 ca6139490e48863e7706d870ff4e8ac9f417b56f3b9e4b3ce490c13b09a77461 gst-plugins-base-1.14.4.tar.xz
> -sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING
> -sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB
> +# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.16.0.tar.xz.sha256sum
> +sha256 4093aa7b51e28fb24dfd603893fead8d1b7782f088b05ed0f22a21ef176fb5ae gst-plugins-base-1.16.0.tar.xz
> +sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> index 5b7db0814f..60f2d4856b 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>
> -GST1_PLUGINS_BASE_VERSION = 1.14.4
> +GST1_PLUGINS_BASE_VERSION = 1.16.0
>  GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
>  GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
>  GST1_PLUGINS_BASE_INSTALL_STAGING = YES
> -GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
> +GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
>  GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
>
>  GST1_PLUGINS_BASE_CONF_OPTS = \
> @@ -118,6 +118,12 @@ else
>  GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiotestsrc
>  endif
>
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR),y)
> +GST1_PLUGINS_BASE_CONF_OPTS += --enable-compositor
> +else
> +GST1_PLUGINS_BASE_CONF_OPTS += --disable-compositor
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING),y)
>  GST1_PLUGINS_BASE_CONF_OPTS += --enable-encoding
>  else
> @@ -136,6 +142,12 @@ else
>  GST1_PLUGINS_BASE_CONF_OPTS += --disable-gio
>  endif
>
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION),y)
> +GST1_PLUGINS_BASE_CONF_OPTS += --enable-overlaycomposition
> +else
> +GST1_PLUGINS_BASE_CONF_OPTS += --disable-overlaycomposition
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
>  GST1_PLUGINS_BASE_CONF_OPTS += --enable-playback
>  else
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
> index 1d08938e09..be837ab569 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
> @@ -1,3 +1,3 @@
> -# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.4.tar.xz.sha256sum
> -sha256 5f8b553260cb0aac56890053d8511db1528d53cae10f0287cfce2cb2acc70979 gst-plugins-good-1.14.4.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.16.0.tar.xz.sha256sum
> +sha256 654adef33380d604112f702c2927574cfc285e31307b79e584113858838bb0fd gst-plugins-good-1.16.0.tar.xz
>  sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index f6a3037be0..4ef128229a 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GST1_PLUGINS_GOOD_VERSION = 1.14.4
> +GST1_PLUGINS_GOOD_VERSION = 1.16.0
>  GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
>  GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
>  GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
> diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
> index f93c7e2340..b80887a0cc 100644
> --- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
> +++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
> @@ -1,3 +1,3 @@
> -# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.4.tar.xz.sha256sum
> -sha256 ac02d837f166c35ff6ce0738e281680d0b90052cfb1f0255dcf6aaca5f0f6d23 gst-plugins-ugly-1.14.4.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.16.0.tar.xz.sha256sum
> +sha256 e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2 gst-plugins-ugly-1.16.0.tar.xz
>  sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
> diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> index 25546258cd..f3ac2f79d3 100644
> --- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> +++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GST1_PLUGINS_UGLY_VERSION = 1.14.4
> +GST1_PLUGINS_UGLY_VERSION = 1.16.0
>  GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
>  GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
>  GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
