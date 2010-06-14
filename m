From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Jun 2010 21:41:44 +0200
Subject: [Buildroot] [PATCH v2 3/4] ffmpeg: allow customization of codecs,
	(de)muxers and other components
In-Reply-To: <1276544505-2969-1-git-send-email-luca@lucaceresoli.net>
References: <1276544505-2969-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1276544505-2969-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the option to customize the list of decoders, encoders, muxers, demuxers,
parsers, protocols, bsfs and filters to be built into ffmpeg, and to compile or
exclude input and output devices.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/multimedia/ffmpeg/Config.in |   88 +++++++++++++++++++++++++++++++++++
 package/multimedia/ffmpeg/ffmpeg.mk |   52 ++++++++++++++++++++
 2 files changed, 140 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index fe6814f..d8661e9 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -43,4 +43,92 @@ config BR2_PACKAGE_FFMPEG_FFSERVER
 	help
          FFserver is a streaming server for both audio and video.
 
+config BR2_PACKAGE_FFMPEG_ENCODERS
+	string "Enabled encoders"
+	default "all"
+	help
+	 Space-separated list of encoders to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-encoders in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_DECODERS
+	string "Enabled decoders"
+	default "all"
+	help
+	 Space-separated list of decoders to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-decoders in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_MUXERS
+	string "Enabled muxers"
+	default "all"
+	help
+	 Space-separated list of muxers to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-muxers in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_DEMUXERS
+	string "Enabled demuxers"
+	default "all"
+	help
+	 Space-separated list of demuxers to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-demuxers in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_PARSERS
+	string "Enabled parsers"
+	default "all"
+	help
+	 Space-separated list of parsers to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-parsers in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_BSFS
+	string "Enabled bitstreams"
+	default "all"
+	help
+	 Space-separated list of bitstream filters to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-bsfs in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_PROTOCOLS
+	string "Enabled protocols"
+	default "all"
+	help
+	 Space-separated list of protocols to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-protocols in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_FILTERS
+	string "Enabled filters"
+	default "all"
+	help
+	 Space-separated list of filters to build in FFmpeg,
+	 or "all" to build all of them.
+
+	 Run ./configure --list-filters in the ffmpeg sources
+	 directory to know the available options.
+
+config BR2_PACKAGE_FFMPEG_INDEVS
+	bool "Enable input devices"
+	default y
+
+config BR2_PACKAGE_FFMPEG_OUTDEVS
+	bool "Enable output devices"
+	default y
+
 endif
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index c38f7c3..7cb9cdf 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -49,6 +49,58 @@ else
 FFMPEG_CONF_OPT += --disable-ffserver
 endif
 
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),all)
+FFMPEG_CONF_OPT += --disable-encoders \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),--enable-encoder=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_DECODERS),all)
+FFMPEG_CONF_OPT += --disable-decoders \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_DECODERS)),--enable-decoder=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_MUXERS),all)
+FFMPEG_CONF_OPT += --disable-muxers \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_MUXERS)),--enable-muxer=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_DEMUXERS),all)
+FFMPEG_CONF_OPT += --disable-demuxers \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_DEMUXERS)),--enable-demuxer=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_PARSERS),all)
+FFMPEG_CONF_OPT += --disable-parsers \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_PARSERS)),--enable-parser=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS),all)
+FFMPEG_CONF_OPT += --disable-bsfs \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsf=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_PROTOCOLS),all)
+FFMPEG_CONF_OPT += --disable-protocols \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_PROTOCOLS)),--enable-protocol=$(x))
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_FILTERS),all)
+FFMPEG_CONF_OPT += --disable-filters \
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_FILTERS)),--enable-filter=$(x))
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_INDEVS),y)
+FFMPEG_CONF_OPT += --enable-indevs
+else
+FFMPEG_CONF_OPT += --disable-indevs
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_OUTDEVS),y)
+FFMPEG_CONF_OPT += --enable-outdevs
+else
+FFMPEG_CONF_OPT += --disable-outdevs
+endif
+
 ifeq ($(BR2_PTHREADS_NONE),y)
 FFMPEG_CONF_OPT += --disable-pthreads
 else
-- 
1.7.0.4
