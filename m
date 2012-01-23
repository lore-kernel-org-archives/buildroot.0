From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 23 Jan 2012 22:41:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] baresip: new package
In-Reply-To: <1327354915-2278-1-git-send-email-arnout@mind.be>
References: <1327354915-2278-1-git-send-email-arnout@mind.be>
Message-ID: <1327354915-2278-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Laurent Kersten <laurent.kersten@essensium.com>
---
v2: renamed re -> libre
    Fix cross-compilation and ccache problems
---
 package/multimedia/Config.in          |    1 +
 package/multimedia/baresip/Config.in  |   33 ++++++++++++
 package/multimedia/baresip/baresip.mk |   88 +++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/baresip/Config.in
 create mode 100644 package/multimedia/baresip/baresip.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index a05d1d9..b21d24f 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -2,6 +2,7 @@ menu "Audio and video libraries and applications"
 source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/baresip/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
diff --git a/package/multimedia/baresip/Config.in b/package/multimedia/baresip/Config.in
new file mode 100644
index 0000000..eb98753
--- /dev/null
+++ b/package/multimedia/baresip/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_BARESIP
+	bool "baresip"
+	select BR2_PACKAGE_LIBRE
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	help
+	  baresip is a bare-bones SIP user agent.
+	  It supports SIP, SDP, RTP/RTCP, and STUN/TURN/ICE, and IPv4 and
+	  IPv6, is RFC-compliant and has portable C89 and C99 source code.
+
+	  A modular plugin architecture provides:
+	    - stdio, cons, and evdev user interfaces,
+	    - celt, g711, g722, gsm, ilbc, l16, and speex audio codecs
+	    - alsa, coreaudio, gst portaudio, oss, winwav, and mda audio
+	      drivers
+	    - speex_pp, speex_aec, speex_resamp, and sndfile audio filters
+	    - the avcodec video codec, avformat, quicktime, qtcapture, v4l,
+	      v4l2 video sources
+	    - sdl, opengl, and x11 video display drivers
+	    - srtp media encoding.
+
+	  To select the plugins, just enable the corresponding libraries in
+	  buildroot:
+	    - SPEEX for speex audio codec
+	    - ALSA_LIB for alsa audio driver
+	    - LIBSNDFILE for sndfile audio filters
+	    - FFMPEG (with SWSCALE) for avcodec, avformat, v4l, v4l2 video sources
+	    - SDL for sdl video display driver
+	    - XORG7 for x11 video display drivers
+	    - GSTREAMER for GStreamer's audio and video codecs
+
+	  http://www.creytiv.com
+
diff --git a/package/multimedia/baresip/baresip.mk b/package/multimedia/baresip/baresip.mk
new file mode 100644
index 0000000..04d19ec
--- /dev/null
+++ b/package/multimedia/baresip/baresip.mk
@@ -0,0 +1,88 @@
+#############################################################
+#
+# BARESIP
+#
+#############################################################
+
+BARESIP_VERSION = 0.2.0
+BARESIP_SITE = http://www.creytiv.com/pub
+BARESIP_DEPENDENCIES = libre zlib
+
+BARESIP_MAKE_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	SYSROOT=$(STAGING_DIR)/usr \
+
+BARESIP_MAKE_OPT = \
+	LIBRE_MK="$(STAGING_DIR)/usr/share/re/re.mk" \
+	LIBRE_INC="$(STAGING_DIR)/usr/include/re" \
+	LIBRE_SO="$(STAGING_DIR)/usr/lib" \
+	CC="$(TARGET_CC_NOCCACHE)" \
+	LD="$(TARGET_CC)" \
+	LFLAGS="$(TARGET_LDFLAGS)" \
+	ARCH="$(ARCH)" \
+	OS=linux
+
+ifeq ($(BR2_CCACHE),y)
+BARESIP_MAKE_OPT += \
+	CCACHE=$(CCACHE)
+endif
+
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+BARESIP_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
+BARESIP_DEPENDENCIES += ffmpeg
+BARESIP_MAKE_ENV += \
+	CFLAGS+=-DCODEC_TYPE_VIDEO=AVMEDIA_TYPE_VIDEO
+endif
+
+ifeq ($(BR2_PACKAGE_GSTREAMER),y)
+BARESIP_DEPENDENCIES += gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+BARESIP_DEPENDENCIES += portaudio
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+BARESIP_DEPENDENCIES += sdl
+BARESIP_MAKE_ARGS += SDL_VERSION=1.2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+BARESIP_DEPENDENCIES += libsndfile
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+BARESIP_DEPENDENCIES += speex
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+BARESIP_DEPENDENCIES += util-linux
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+BARESIP_DEPENDENCIES += xlib_libXext
+endif
+
+define BARESIP_BUILD_CMDS
+	$(BARESIP_MAKE_ENV) $(MAKE) $(BARESIP_MAKE_OPT) -C $(@D) all
+endef
+
+define BARESIP_CLEAN_CMDS
+	$(BARESIP_MAKE_ENV) $(MAKE) $(BARESIP_MAKE_OPT) -C $(@D) clean
+endef
+
+define BARESIP_INSTALL_TARGET_CMDS       
+	$(BARESIP_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(MAKE) $(BARESIP_MAKE_OPT) -C $(@D) install
+endef
+
+define BARESIP_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/bin/baresip
+	$(RM) -r $(TARGET_DIR)/usr/lib/baresip
+	$(RM) -r $(TARGET_DIR)/usr/share/baresip
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.8.3
