From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  3 Apr 2019 20:32:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/mpd: bump to version 0.21.7
In-Reply-To: <20190403183202.19682-1-joerg.krause@embedded.rocks>
References: <20190403183202.19682-1-joerg.krause@embedded.rocks>
Message-ID: <20190403183202.19682-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MPD changed from Autotools to the Meson build system.

Add config options for the qobuz and tidal plugins and group them
together with the soundcloud plugin under "Commercial services".

Note, that MPD cannot be build with both Tremor (libvorbis soft float library)
and libvorbis (hard float library) support. Therefore, default to Tremor
on soft float targets and to libvorbis otherwise.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...gure.ac-check-if-libatomic-is-needed.patch |  40 ----
 package/mpd/Config.in                         |  36 +++-
 package/mpd/mpd.hash                          |   2 +-
 package/mpd/mpd.mk                            | 175 ++++++++++--------
 4 files changed, 121 insertions(+), 132 deletions(-)
 delete mode 100644 package/mpd/0001-configure.ac-check-if-libatomic-is-needed.patch

diff --git a/package/mpd/0001-configure.ac-check-if-libatomic-is-needed.patch b/package/mpd/0001-configure.ac-check-if-libatomic-is-needed.patch
deleted file mode 100644
index a9873a741f..0000000000
--- a/package/mpd/0001-configure.ac-check-if-libatomic-is-needed.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8eaf14a17244aaf000b4d19e4fde4a637576939f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 7 Feb 2016 21:40:47 +0100
-Subject: [PATCH] configure.ac: check if libatomic is needed
-
-The mpd source code uses the C++11 <atomic> functionality, which
-internally is implemented using the __atomic_*() gcc built-ins. On
-certain architectures, the __atomic_*() built-ins are implemented in
-the libatomic library that comes with the rest of the gcc runtime. Due
-to this, code using <atomic> might need to link against libatomic,
-otherwise one hits build issues such as:
-
-GlobalEvents.cxx:(.text._ZN12GlobalEvents4EmitENS_5EventE+0x14): undefined reference to `__atomic_fetch_or_4'
-
-on an architecture like SPARC.
-
-To solve this, a configure.ac check is added to know if we need to
-link against libatomic or not.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 107b45a..8e6fab7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -233,6 +233,8 @@ if test x$have_pthread_setname_np = xyes; then
- 	AC_DEFINE(HAVE_PTHREAD_SETNAME_NP, 1, [Is pthread_setname_np() available?])
- fi
- 
-+AC_SEARCH_LIBS([__atomic_load_4], [atomic])
-+
- dnl ---------------------------------------------------------------------------
- dnl Event loop selection
- dnl ---------------------------------------------------------------------------
--- 
-2.6.4
-
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index d3844391a2..84108428ee 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_MPD
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
 	help
 	  MPD is a flexible, powerful, server-side application
 	  for playing music. Through plugins and libraries
@@ -35,6 +34,29 @@ config BR2_PACKAGE_MPD_SQLITE
 	  Enable sqlite database support.
 	  If you don't use sqlite it will use an ASCII database.
 
+comment "Commercial services"
+
+config BR2_PACKAGE_MPD_QOBUZ
+	bool "qobuz"
+	select BR2_PACKAGE_MPD_CURL
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_YAJL
+	help
+	  Play songs from the commercial streaming service Qobuz.
+
+config BR2_PACKAGE_MPD_SOUNDCLOUD
+	bool "soundcloud"
+	select BR2_PACKAGE_YAJL
+	help
+	  Enable soundcloud.com playlist support.
+
+config BR2_PACKAGE_MPD_TIDAL
+	bool "tidal"
+	select BR2_PACKAGE_MPD_CURL
+	select BR2_PACKAGE_YAJL
+	help
+	  Play songs from the commercial streaming service TIDAL.
+
 comment "Converter plugins"
 
 config BR2_PACKAGE_MPD_LIBSAMPLERATE
@@ -132,18 +154,20 @@ config BR2_PACKAGE_MPD_OPUS
 	  Select this if you want to play back OPUS encoded files.
 
 config BR2_PACKAGE_MPD_TREMOR
-	bool "tremor"
+	bool "tremor" if BR2_SOFT_FLOAT
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_TREMOR
+	default y if BR2_SOFT_FLOAT
 	help
 	  Enable vorbis input support.
 	  Select this if you want to play back OGG files on softfloat
 	  targets.
 
 config BR2_PACKAGE_MPD_VORBIS
-	bool "vorbis"
+	bool "vorbis" if !BR2_SOFT_FLOAT
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
+	default y if !BR2_SOFT_FLOAT
 	help
 	  Enable vorbis input/streaming support.
 	  Select this if you want to play back OGG files on hardfloat
@@ -217,12 +241,6 @@ config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	help
 	  Enable Samba support.
 
-config BR2_PACKAGE_MPD_SOUNDCLOUD
-	bool "soundcloud"
-	select BR2_PACKAGE_YAJL
-	help
-	  Enable soundcloud.com playlist support.
-
 comment "Output plugins"
 
 config BR2_PACKAGE_MPD_ALSA
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index b80bfc82a4..cb9749cd52 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  503e5f9f237290f568ff7956ab2f9aed563594bf749f19b8fe994fb21434afea  mpd-0.20.23.tar.xz
+sha256  512062bc529bee04d4ccfaa2c6e720afc85bb071e49850a096b5ed518b3b412c  mpd-0.21.7.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f410c1fd95..69bbfed941 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).23
+MPD_VERSION_MAJOR = 0.21
+MPD_VERSION = $(MPD_VERSION_MAJOR).7
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
@@ -13,270 +13,281 @@ MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
 
-# Some options need an explicit --disable or --enable
-
 # Zeroconf support depends on libdns_sd from avahi.
 ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
 MPD_DEPENDENCIES += avahi
-MPD_CONF_OPTS += --with-zeroconf=avahi
+MPD_CONF_OPTS += -Dzeroconf=avahi
 else
-MPD_CONF_OPTS += --with-zeroconf=no
+MPD_CONF_OPTS += -Dzeroconf=disabled
 endif
 
 # MPD prefers libicu for utf8 collation instead of libglib2.
 ifeq ($(BR2_PACKAGE_ICU),y)
 MPD_DEPENDENCIES += icu
-MPD_CONF_OPTS += --enable-icu
+MPD_CONF_OPTS += -Dicu=enabled
 else
-MPD_CONF_OPTS += --disable-icu
+MPD_CONF_OPTS += -Dicu=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
 MPD_DEPENDENCIES += alsa-lib
-MPD_CONF_OPTS += --enable-alsa
+MPD_CONF_OPTS += -Dalsa=enabled
 else
-MPD_CONF_OPTS += --disable-alsa
+MPD_CONF_OPTS += -Dalsa=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_AO),y)
 MPD_DEPENDENCIES += libao
-MPD_CONF_OPTS += --enable-ao
+MPD_CONF_OPTS += -Dao=enabled
 else
-MPD_CONF_OPTS += --disable-ao
+MPD_CONF_OPTS += -Dao=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_AUDIOFILE),y)
 MPD_DEPENDENCIES += audiofile
-MPD_CONF_OPTS += --enable-audiofile
+MPD_CONF_OPTS += -Daudiofile=enabled
 else
-MPD_CONF_OPTS += --disable-audiofile
+MPD_CONF_OPTS += -Daudiofile=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
 MPD_DEPENDENCIES += bzip2
-MPD_CONF_OPTS += --enable-bzip2
+MPD_CONF_OPTS += -Dbzip2=enabled
 else
-MPD_CONF_OPTS += --disable-bzip2
+MPD_CONF_OPTS += -Dbzip2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CDIO_PARANOIA),y)
 MPD_DEPENDENCIES += libcdio-paranoia
-MPD_CONF_OPTS += --enable-cdio-paranoia
+MPD_CONF_OPTS += -Dcdio_paranoia=enabled
 else
-MPD_CONF_OPTS += --disable-cdio-paranoia
+MPD_CONF_OPTS += -Dcdio_paranoia=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
 MPD_DEPENDENCIES += libcurl
-MPD_CONF_OPTS += --enable-curl
+MPD_CONF_OPTS += -Dcurl=enabled
 else
-MPD_CONF_OPTS += --disable-curl
+MPD_CONF_OPTS += -Dcurl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_DSD),y)
-MPD_CONF_OPTS += --enable-dsd
+MPD_CONF_OPTS += -Ddsd=true
 else
-MPD_CONF_OPTS += --disable-dsd
+MPD_CONF_OPTS += -Ddsd=false
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
-MPD_CONF_OPTS += --enable-aac
+MPD_CONF_OPTS += -Dfaad=enabled
 else
-MPD_CONF_OPTS += --disable-aac
+MPD_CONF_OPTS += -Dfaad=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FFMPEG),y)
 MPD_DEPENDENCIES += ffmpeg
-MPD_CONF_OPTS += --enable-ffmpeg
+MPD_CONF_OPTS += -Dffmpeg=enabled
 else
-MPD_CONF_OPTS += --disable-ffmpeg
+MPD_CONF_OPTS += -Dffmpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
-MPD_CONF_OPTS += --enable-flac
+MPD_CONF_OPTS += -Dflac=enabled
 else
-MPD_CONF_OPTS += --disable-flac
+MPD_CONF_OPTS += -Dflac=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_HTTPD_OUTPUT),y)
-MPD_CONF_OPTS += --enable-httpd-output
+MPD_CONF_OPTS += -Dhttpd=true
 else
-MPD_CONF_OPTS += --disable-httpd-output
+MPD_CONF_OPTS += -Dhttpd=false
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
 MPD_DEPENDENCIES += jack2
-MPD_CONF_OPTS += --enable-jack
+MPD_CONF_OPTS += -Djack=enabled
 else
-MPD_CONF_OPTS += --disable-jack
+MPD_CONF_OPTS += -Djack=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LAME),y)
 MPD_DEPENDENCIES += lame
-MPD_CONF_OPTS += --enable-lame-encoder
+MPD_CONF_OPTS += -Dlame=enabled
 else
-MPD_CONF_OPTS += --disable-lame-encoder
+MPD_CONF_OPTS += -Dlame=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBMPDCLIENT),y)
 MPD_DEPENDENCIES += libmpdclient
-MPD_CONF_OPTS += --enable-libmpdclient
+MPD_CONF_OPTS += -Dlibmpdclient=enabled
 else
-MPD_CONF_OPTS += --disable-libmpdclient
+MPD_CONF_OPTS += -Dlibmpdclient=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBMMS),y)
 MPD_DEPENDENCIES += libmms
-MPD_CONF_OPTS += --enable-mms
+MPD_CONF_OPTS += -Dmms=enabled
 else
-MPD_CONF_OPTS += --disable-mms
+MPD_CONF_OPTS += -Dmms=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
 MPD_DEPENDENCIES += libnfs
-MPD_CONF_OPTS += --enable-nfs
+MPD_CONF_OPTS += -Dnfs=enabled
 else
-MPD_CONF_OPTS += --disable-nfs
+MPD_CONF_OPTS += -Dnfs=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSMBCLIENT),y)
 MPD_DEPENDENCIES += samba4
-MPD_CONF_OPTS += --enable-smbclient
+MPD_CONF_OPTS += -Dsmbclient=enabled
 else
-MPD_CONF_OPTS += --disable-smbclient
+MPD_CONF_OPTS += -Dsmbclient=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
 MPD_DEPENDENCIES += libsamplerate
-MPD_CONF_OPTS += --enable-lsr
+MPD_CONF_OPTS += -Dlibsamplerate=enabled
 else
-MPD_CONF_OPTS += --disable-lsr
+MPD_CONF_OPTS += -Dlibsamplerate=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSNDFILE),y)
 MPD_DEPENDENCIES += libsndfile
-MPD_CONF_OPTS += --enable-sndfile
+MPD_CONF_OPTS += -Dsndfile=enabled
 else
-MPD_CONF_OPTS += --disable-sndfile
+MPD_CONF_OPTS += -Dsndfile=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSOXR),y)
 MPD_DEPENDENCIES += libsoxr
-MPD_CONF_OPTS += --enable-soxr
+MPD_CONF_OPTS += -Dsoxr=enabled
 else
-MPD_CONF_OPTS += --disable-soxr
+MPD_CONF_OPTS += -Dsoxr=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MAD),y)
 MPD_DEPENDENCIES += libid3tag libmad
-MPD_CONF_OPTS += --enable-mad
+MPD_CONF_OPTS += -Dmad=enabled
 else
-MPD_CONF_OPTS += --disable-mad
+MPD_CONF_OPTS += -Dmad=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
 MPD_DEPENDENCIES += libid3tag mpg123
-MPD_CONF_OPTS += --enable-mpg123
+MPD_CONF_OPTS += -Dmpg123=enabled
 else
-MPD_CONF_OPTS += --disable-mpg123
+MPD_CONF_OPTS += -Dmpg123=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MUSEPACK),y)
 MPD_DEPENDENCIES += musepack
-MPD_CONF_OPTS += --enable-mpc
+MPD_CONF_OPTS += -Dmpcdec=enabled
 else
-MPD_CONF_OPTS += --disable-mpc
+MPD_CONF_OPTS += -Dmpcdec=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_NEIGHBOR_DISCOVERY_SUPPORT),y)
-MPD_CONF_OPTS += --enable-neighbor-plugins
+MPD_CONF_OPTS += -Dneighbor=true
 else
-MPD_CONF_OPTS += --disable-neighbor-plugins
+MPD_CONF_OPTS += -Dneighbor=false
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
 MPD_DEPENDENCIES += opus libogg
-MPD_CONF_OPTS += --enable-opus
+MPD_CONF_OPTS += -Dopus=enabled
 else
-MPD_CONF_OPTS += --disable-opus
+MPD_CONF_OPTS += -Dopus=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_OSS),y)
-MPD_CONF_OPTS += --enable-oss
+MPD_CONF_OPTS += -Doss=enabled
 else
-MPD_CONF_OPTS += --disable-oss
+MPD_CONF_OPTS += -Doss=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
 MPD_DEPENDENCIES += pulseaudio
-MPD_CONF_OPTS += --enable-pulse
+MPD_CONF_OPTS += -Dpulse=enabled
 else
-MPD_CONF_OPTS += --disable-pulse
+MPD_CONF_OPTS += -Dpulse=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_MPD_QOBUZ),y)
+MPD_DEPENDENCIES += libgcrypt yajl
+MPD_CONF_OPTS += -Dqobuz=auto
+else
+MPD_CONF_OPTS += -Dqobuz=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SHOUTCAST),y)
 MPD_DEPENDENCIES += libshout
-MPD_CONF_OPTS += --enable-shout
+MPD_CONF_OPTS += -Dshout=enabled
 else
-MPD_CONF_OPTS += --disable-shout
+MPD_CONF_OPTS += -Dshout=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
 MPD_DEPENDENCIES += yajl
-MPD_CONF_OPTS += --enable-soundcloud
+MPD_CONF_OPTS += -Dsoundcloud=enabled
 else
-MPD_CONF_OPTS += --disable-soundcloud
+MPD_CONF_OPTS += -Dsoundcloud=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
 MPD_DEPENDENCIES += sqlite
-MPD_CONF_OPTS += --enable-sqlite
+MPD_CONF_OPTS += -Dsqlite=enabled
 else
-MPD_CONF_OPTS += --disable-sqlite
+MPD_CONF_OPTS += -Dsqlite=disabled
 endif
 
 ifneq ($(BR2_PACKAGE_MPD_TCP),y)
-MPD_CONF_OPTS += --disable-tcp
+MPD_CONF_OPTS += -Dtcp=true
+endif
+
+ifeq ($(BR2_PACKAGE_MPD_TIDAL),y)
+MPD_DEPENDENCIES += yajl
+MPD_CONF_OPTS += -Dtidal=enabled
+else
+MPD_CONF_OPTS += -Dtidal=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
 MPD_DEPENDENCIES += tremor
-# Help mpd to find tremor in static linking scenarios
-MPD_CONF_ENV += \
-	TREMOR_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs vorbisidec`"
-MPD_CONF_OPTS += --with-tremor=$(STAGING_DIR)/usr
+MPD_CONF_OPTS += -Dtremor=enabled
+else
+MPD_CONF_OPTS += -Dtremor=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_TWOLAME),y)
 MPD_DEPENDENCIES += twolame
-MPD_CONF_OPTS += --enable-twolame-encoder
+MPD_CONF_OPTS += -Dtwolame=enabled
 else
-MPD_CONF_OPTS += --disable-twolame-encoder
+MPD_CONF_OPTS += -Dtwolame=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_UPNP),y)
 MPD_DEPENDENCIES += \
 	expat \
 	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
-MPD_CONF_OPTS += --enable-upnp
+MPD_CONF_OPTS += -Dupnp=enabled
 else
-MPD_CONF_OPTS += --disable-upnp
+MPD_CONF_OPTS += -Dupnp=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
-MPD_CONF_OPTS += --enable-vorbis --enable-vorbis-encoder
+MPD_CONF_OPTS += -Dvorbis=enabled -Dvorbisenc=enabled
 else
-MPD_CONF_OPTS += --disable-vorbis --disable-vorbis-encoder
+MPD_CONF_OPTS += -Dvorbis=disabled -Dvorbisenc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_WAVPACK),y)
 MPD_DEPENDENCIES += wavpack
-MPD_CONF_OPTS += --enable-wavpack
+MPD_CONF_OPTS += -Dwavpack=enabled
 else
-MPD_CONF_OPTS += --disable-wavpack
+MPD_CONF_OPTS += -Dwavpack=disabled
 endif
 
 define MPD_INSTALL_EXTRA_FILES
@@ -290,4 +301,4 @@ define MPD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S95mpd
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.21.0
