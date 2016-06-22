From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jun 2016 07:08:04 -0300
Subject: [Buildroot] [PATCH 2/2] audacious-plugins: new package
In-Reply-To: <1466590084-21798-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466590084-21798-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1466590084-21798-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Audacious itself is not very useful without the plugins and they're a
runtime dependency of it.
The plugins can't be built without audacious itself and has the same
constraints so it doesn't make sense to show a comment about it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                |   1 +
 package/audacious-plugins/Config.in              |  10 ++
 package/audacious-plugins/audacious-plugins.hash |   2 +
 package/audacious-plugins/audacious-plugins.mk   | 159 +++++++++++++++++++++++
 package/audacious/Config.in                      |   1 +
 5 files changed, 173 insertions(+)
 create mode 100644 package/audacious-plugins/Config.in
 create mode 100644 package/audacious-plugins/audacious-plugins.hash
 create mode 100644 package/audacious-plugins/audacious-plugins.mk

diff --git a/package/Config.in b/package/Config.in
index 2f2c255..3335d4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -6,6 +6,7 @@ menu "Target packages"
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/audacious/Config.in"
+	source "package/audacious-plugins/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/dvblast/Config.in"
diff --git a/package/audacious-plugins/Config.in b/package/audacious-plugins/Config.in
new file mode 100644
index 0000000..38073b2
--- /dev/null
+++ b/package/audacious-plugins/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_AUDACIOUS_PLUGINS
+	bool "audacious-plugins"
+	depends on BR2_PACKAGE_AUDACIOUS
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Audacious is an open source audio player. A descendant of
+	  XMMS, Audacious plays your music how you want it, without
+	  stealing away your computer?s resources from other tasks.
+
+	  http://audacious-media-player.org/
diff --git a/package/audacious-plugins/audacious-plugins.hash b/package/audacious-plugins/audacious-plugins.hash
new file mode 100644
index 0000000..f47bb19
--- /dev/null
+++ b/package/audacious-plugins/audacious-plugins.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5b6c17b6f97ec0e123c59af16b71de6da0ed79327d21fcba9865a8742950b33f	audacious-plugins-3.7.2-gtk3.tar.bz2
diff --git a/package/audacious-plugins/audacious-plugins.mk b/package/audacious-plugins/audacious-plugins.mk
new file mode 100644
index 0000000..fcb95fc
--- /dev/null
+++ b/package/audacious-plugins/audacious-plugins.mk
@@ -0,0 +1,159 @@
+################################################################################
+#
+# audacious-plugins
+#
+################################################################################
+
+AUDACIOUS_PLUGINS_VERSION = 3.7.2
+AUDACIOUS_PLUGINS_SITE = http://distfiles.audacious-media-player.org
+AUDACIOUS_PLUGINS_SOURCE = audacious-plugins-$(AUDACIOUS_PLUGINS_VERSION)-gtk3.tar.bz2
+AUDACIOUS_PLUGINS_DEPENDENCIES = audacious libxml2 host-pkgconf
+AUDACIOUS_CONF_OPTS = \
+	--disable-amidplug \
+	--disable-bs2b \
+	--disable-cdaudio \
+	--disable-sid
+AUDACIOUS_PLUGINS_LICENSE = BSD-2c
+AUDACIOUS_PLUGINS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-alsa
+AUDACIOUS_PLUGINS_DEPENDENCIES += alsa-lib
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_FAAD2),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-aac
+AUDACIOUS_PLUGINS_DEPENDENCIES += faad2
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-aac
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --with-ffmpeg=ffmpeg
+AUDACIOUS_PLUGINS_DEPENDENCIES += ffmpeg
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --with-ffmpeg=none
+endif
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-flacng --enable-filewriter_flac
+AUDACIOUS_PLUGINS_DEPENDENCIES += flac
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-flacng --disable-filewriter_flac
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-jack
+AUDACIOUS_PLUGINS_DEPENDENCIES += jack2
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-jack
+endif
+
+ifeq ($(BR2_PACKAGE_LAME),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-filewriter_mp3
+AUDACIOUS_PLUGINS_DEPENDENCIES += lame
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-filewriter_mp3
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCUE),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-cue
+AUDACIOUS_PLUGINS_DEPENDENCIES += libcue
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-cue
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-scrobbler2
+AUDACIOUS_PLUGINS_DEPENDENCIES += libcurl
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-scrobbler2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMMS),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-mms
+AUDACIOUS_PLUGINS_DEPENDENCIES += libmms
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-mms
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-modplug
+AUDACIOUS_PLUGINS_DEPENDENCIES += libmodplug
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-modplug
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-speedpitch
+AUDACIOUS_PLUGINS_DEPENDENCIES += libsamplerate
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-speedpitch
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-sndfile
+AUDACIOUS_PLUGINS_DEPENDENCIES += libsndfile
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-sndfile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSOXR),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-soxr
+AUDACIOUS_PLUGINS_DEPENDENCIES += libsoxr
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-soxr
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-vorbis --enable-filewriter_vorbis
+AUDACIOUS_PLUGINS_DEPENDENCIES += libvorbis
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-vorbis --disable-filewriter_vorbis
+endif
+
+ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-lirc
+AUDACIOUS_PLUGINS_DEPENDENCIES += lirc-tools
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-lirc
+endif
+
+ifeq ($(BR2_PACKAGE_MPG123),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-mp3
+AUDACIOUS_PLUGINS_DEPENDENCIES += mpg123
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-mp3
+endif
+
+ifeq ($(BR2_PACKAGE_NEON),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-neon
+AUDACIOUS_PLUGINS_DEPENDENCIES += neon
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-neon
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-pulse
+AUDACIOUS_PLUGINS_DEPENDENCIES += pulseaudio
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_WAVPACK),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-wavpack
+AUDACIOUS_PLUGINS_DEPENDENCIES += wavpack
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-wavpack
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+AUDACIOUS_PLUGINS_CONF_OPTS += --enable-console
+AUDACIOUS_PLUGINS_DEPENDENCIES += zlib
+else
+AUDACIOUS_PLUGINS_CONF_OPTS += --disable-console
+endif
+
+$(eval $(autotools-package))
diff --git a/package/audacious/Config.in b/package/audacious/Config.in
index a7520cf..f484d5e 100644
--- a/package/audacious/Config.in
+++ b/package/audacious/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_AUDACIOUS
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_AUDACIOUS_PLUGINS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
-- 
2.7.3
