From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Oct 2011 11:13:31 +0200
Subject: [Buildroot] [git commit] Add the libplayer package
Message-ID: <20111006091346.64CEA8E189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddb3e10707eb5da80d0a9d57d251fbf626127178
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use select instead of depends for mplayer/gstreamer, small tweaks]
Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libplayer/Config.in    |   30 +++++++++++++++++++
 package/multimedia/libplayer/libplayer.mk |   44 +++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 0 deletions(-)

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
index 0000000..c9add53
--- /dev/null
+++ b/package/multimedia/libplayer/Config.in
@@ -0,0 +1,30 @@
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
+if BR2_PACKAGE_LIBPLAYER
+config BR2_PACKAGE_LIBPLAYER_MPLAYER
+	bool "mplayer backend"
+	select BR2_PACKAGE_MPLAYER
+
+config BR2_PACKAGE_LIBPLAYER_GSTREAMER
+	bool "gstreamer backend"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_GSTREAMER
+
+comment "gstreamer backend requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_LIBPLAYER_PYTHON
+	depends on BR2_PACKAGE_PYTHON
+	bool "Libplayer python bindings"
+endif
+
+comment "libplayer requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/multimedia/libplayer/libplayer.mk b/package/multimedia/libplayer/libplayer.mk
new file mode 100644
index 0000000..1552431
--- /dev/null
+++ b/package/multimedia/libplayer/libplayer.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# libplayer
+#
+#############################################################
+LIBPLAYER_VERSION = 2.0.1
+LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
+LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
+
+# When passing the standard buildroot configure arguments, the configure script
+# breaks on --target and --host options. Thus we need to define a configure cmd
+# ourselves.
+define LIBPLAYER_CONFIGURE_CMDS
+	(cd $(@D) && rm -rf config.cache && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
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
