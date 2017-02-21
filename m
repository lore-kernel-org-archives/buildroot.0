From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Feb 2017 23:04:28 +0100
Subject: [Buildroot] [PATCH 2/2] rygel: new package
In-Reply-To: <1487714668-73512-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1487714668-73512-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <1487714668-73512-2-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rygel is a home media solution (UPnP AV MediaServer) that allows you to
easily share audio, video and pictures to other devices.

Additionally, media player software may use Rygel to become a
MediaRenderer that may be controlled remotely by a UPnP or DLNA
Controller.

Rygel achieves interoperability with other devices in the market by
trying to conform to the very strict requirements of DLNA and by
converting media on-the-fly to formats that client devices can handle.

Most Rygel functionality is implemented through a plug-in mechanism.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/Config.in           |  1 +
 package/rygel/Config.in     | 49 ++++++++++++++++++++++++++++++
 package/rygel/S99rygel      | 37 +++++++++++++++++++++++
 package/rygel/rygel.hash    |  2 ++
 package/rygel/rygel.mk      | 72 +++++++++++++++++++++++++++++++++++++++++++++
 package/rygel/rygel.service | 10 +++++++
 6 files changed, 171 insertions(+)
 create mode 100644 package/rygel/Config.in
 create mode 100644 package/rygel/S99rygel
 create mode 100644 package/rygel/rygel.hash
 create mode 100644 package/rygel/rygel.mk
 create mode 100644 package/rygel/rygel.service

diff --git a/package/Config.in b/package/Config.in
index 57494e7..0b82013 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1633,6 +1633,7 @@ endif
 	source "package/rsync/Config.in"
 	source "package/rtorrent/Config.in"
 	source "package/rtptools/Config.in"
+	source "package/rygel/Config.in"
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
diff --git a/package/rygel/Config.in b/package/rygel/Config.in
new file mode 100644
index 0000000..16d318c
--- /dev/null
+++ b/package/rygel/Config.in
@@ -0,0 +1,49 @@
+config BR2_PACKAGE_RYGEL
+	bool "rygel"
+	depends on BR2_USE_WCHAR # gupnp-av
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gupnp-av
+	depends on BR2_USE_MMU # gupnp-av
+	select BR2_PACKAGE_GUPNP_AV
+	select BR2_PACKAGE_LIBGEE
+	select BR2_PACKAGE_LIBMEDIAART
+	select BR2_PACKAGE_SQLITE
+        help
+	  Rygel is a home media solution (UPnP AV MediaServer) that
+	  allows you to easily share audio, video and pictures to other
+	  devices.
+
+	  Additionally, media player software may use Rygel to become a
+	  MediaRenderer that may be controlled remotely by a UPnP or
+	  DLNA Controller.
+
+	  Rygel achieves interoperability with other devices in the
+	  market by trying to conform to the very strict requirements of
+	  DLNA and by converting media on-the-fly to formats that client
+	  devices can handle.
+
+	  Most Rygel functionality is implemented through a plug-in
+	  mechanism.
+
+comment "rygel needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_RYGEL
+
+choice
+	prompt "media engine"
+	default BR2_PACKAGE_RYGEL_MEDIA_ENGINE_SIMPLE
+
+config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_SIMPLE
+	bool "simple"
+
+config BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1
+	bool "gstreamer1"
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GUPNP_DLNA
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+
+endchoice
+
+endif # BR2_PACKAGE_RYGEL
diff --git a/package/rygel/S99rygel b/package/rygel/S99rygel
new file mode 100644
index 0000000..ee832e9
--- /dev/null
+++ b/package/rygel/S99rygel
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+NAME=rygel
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/bin/$NAME
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/rygel/rygel.hash b/package/rygel/rygel.hash
new file mode 100644
index 0000000..982709a
--- /dev/null
+++ b/package/rygel/rygel.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.33/rygel-0.33.1.sha256sum:
+sha256	bfbcf3f22caae2121267cbfe5c92b9133e15b133f5dd1baf3a8930b4c0c7e7ac	rygel-0.33.1.tar.xz
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
new file mode 100644
index 0000000..28e8495
--- /dev/null
+++ b/package/rygel/rygel.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# rygel
+#
+################################################################################
+
+RYGEL_VERSION_MAJOR = 0.33
+RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).1
+RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
+RYGEL_SITE = http://ftp.gnome.org/pub/gnome/sources/rygel/$(RYGEL_VERSION_MAJOR)
+RYGEL_LICENSE = LGPLv2+
+RYGEL_LICENSE_FILES = COPYING
+RYGEL_DEPENDENCIES = \
+	gupnp-av \
+	libgee \
+	libmediaart \
+	sqlite
+RYGEL_INSTALL_STAGING = YES
+
+RYGEL_CONF_OPTS += \
+	--disable-apidocs \
+	--disable-coverage \
+	--disable-example-plugins \
+	--enable-external-plugin \
+	--enable-lms-plugin \
+	--enable-mpris-plugin \
+	--enable-ruih-plugin \
+	--disable-tracker-plugin
+
+ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
+RYGEL_DEPENDENCIES += gdk-pixbuf
+endif
+
+ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_GSTREAMER1),y)
+RYGEL_CONF_OPTS += \
+	--with-media-engine=gstreamer \
+	--enable-playbin-plugin \
+	--enable-media_export-plugin \
+	--enable-gst-launch-plugin
+RYGEL_DEPENDENCIES += \
+	gupnp-dlna \
+	gst1-plugins-base \
+	gstreamer1
+else ifeq ($(BR2_PACKAGE_RYGEL_MEDIA_ENGINE_SIMPLE),y)
+RYGEL_CONF_OPTS += \
+	--with-media-engine=simple \
+	--disable-playbin-plugin \
+	--disable-media_export-plugin \
+	--disable-gst-launch-plugin
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+RYGEL_CONF_OPTS += --with-ui
+RYGEL_DEPENDENCIES += libgtk3
+else
+RYGEL_CONF_OPTS += --without-ui
+endif
+
+define RYGEL_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/rygel/S99rygel \
+		$(TARGET_DIR)/etc/init.d/S99rygel
+endef
+
+define RYGEL_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/rygel/rygel.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/rygel.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/rygel.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rygel.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/rygel/rygel.service b/package/rygel/rygel.service
new file mode 100644
index 0000000..6ae8ee7
--- /dev/null
+++ b/package/rygel/rygel.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Rygel DLNA server
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/rygel
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.5.0
