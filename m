From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 28 Sep 2011 13:48:34 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <cover.1317210509.git.maxime.ripard@free-electrons.com>
References: <cover.1317210509.git.maxime.ripard@free-electrons.com>
Message-ID: <fe12fce8c39412837610eba989ec416ec7049e35.1317210509.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime@free-electrons.com>

Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libplayer/Config.in    |   20 +++++++++++++
 package/multimedia/libplayer/libplayer.mk |   42 +++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libplayer/Config.in
 create mode 100644 package/multimedia/libplayer/libplayer.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 40760b7..7b63c14 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -26,6 +26,7 @@ source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libmpeg2/Config.in"
 source "package/multimedia/libogg/Config.in"
+source "package/multimedia/libplayer/Config.in"
 source "package/multimedia/libreplaygain/Config.in"
 source "package/multimedia/libsamplerate/Config.in"
 source "package/multimedia/libsndfile/Config.in"
diff --git a/package/multimedia/libplayer/Config.in b/package/multimedia/libplayer/Config.in
new file mode 100644
index 0000000..1c7e490
--- /dev/null
+++ b/package/multimedia/libplayer/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBPLAYER
+	depends on BR2_LARGEFILE
+	bool "libplayer"
+	help
+	  libplayer provides a generic A/V API that relies on various multimedia
+	  player for Linux systems. It currently supports MPlayer, xine VLC and
+	  GStreamer only
+
+	  http://libplayer.geexbox.org/
+
+comment "Libplayer requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_LIBPLAYER_MPLAYER
+	depends on BR2_PACKAGE_MPLAYER
+	bool "Libplayer mplayer backend"
+
+config BR2_PACKAGE_LIBPLAYER_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER
+	bool "Libplayer GStreamer backend"
diff --git a/package/multimedia/libplayer/libplayer.mk b/package/multimedia/libplayer/libplayer.mk
new file mode 100644
index 0000000..a284830
--- /dev/null
+++ b/package/multimedia/libplayer/libplayer.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# libplayer
+#
+#############################################################
+LIBPLAYER_VERSION = 2.0.1
+LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
+LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
+
+define LIBPLAYER_CONFIGURE_CMDS
+	(cd $(@D) && rm -rf config.cache && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$(LIBPLAYER_CONF_ENV) \
+	./configure \
+		--prefix=/usr \
+		--cross-compile \
+		$(SHARED_STATIC_LIBS_OPTS) \
+		$(QUIET) $(LIBPLAYER_CONF_OPT) \
+	)
+endef
+
+ifeq ($(BR2_PACKAGE_LIBPLAYER_MPLAYER),y)
+	LIBPLAYER_DEPENDENCIES += mplayer
+	LIBPLAYER_CONF_OPT += --enable-mplayer
+else
+	LIBPLAYER_CONF_OPT += --disable-mplayer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
+	LIBPLAYER_DEPENDENCIES += gstreamer
+	LIBPLAYER_CONF_OPT += --enable-gstreamer
+else
+	LIBPLAYER_CONF_OPT += --disable-gstreamer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
+	LIBPLAYER_DEPENDENCIES += python
+	LIBPLAYER_CONF_OPT += --enable-binding-python
+endif
+
+$(eval $(call AUTOTARGETS,package,libplayer))
-- 
1.7.4.1
