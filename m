From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 20 Jun 2013 17:07:46 -0500
Subject: [Buildroot] [PATCH v12 11/11] gst-libav: add libav plugin for
	gtreamer 1.x
In-Reply-To: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1371766066-676-12-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/gst-libav/Config.in    |   16 ++++++++++++++++
 package/multimedia/gst-libav/gst-libav.mk |   18 ++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/multimedia/gst-libav/Config.in
 create mode 100644 package/multimedia/gst-libav/gst-libav.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 4d5219d..cbf583a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -25,6 +25,7 @@ source "package/multimedia/gst1-plugins-good/Config.in"
 source "package/multimedia/gst1-plugins-bad/Config.in"
 source "package/multimedia/gst1-plugins-ugly/Config.in"
 source "package/multimedia/gst-omx/Config.in"
+source "package/multimedia/gst-libav/Config.in"
 
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/libav/Config.in"
diff --git a/package/multimedia/gst-libav/Config.in b/package/multimedia/gst-libav/Config.in
new file mode 100644
index 0000000..5bb7ca0
--- /dev/null
+++ b/package/multimedia/gst-libav/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GST_LIBAV
+	bool "gst-libav"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_LIBAV
+	select BR2_PACKAGE_LIBAV_GPL
+	select BR2_PACKAGE_LIBAV_SWSCALE
+	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
+	help
+	  GStreamer plugin using libav.
+
+	  http://gstreamer.freedesktop.org/
+
+comment "gst-libav requires a toolchain with LARGEFILE and IPV6 support"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/multimedia/gst-libav/gst-libav.mk b/package/multimedia/gst-libav/gst-libav.mk
new file mode 100644
index 0000000..3f959db
--- /dev/null
+++ b/package/multimedia/gst-libav/gst-libav.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# gst-libav
+#
+################################################################################
+
+GST_LIBAV_VERSION = 1.1.1
+GST_LIBAV_SOURCE = gst-libav-$(GST_LIBAV_VERSION).tar.xz
+GST_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
+GST_LIBAV_INSTALL_STAGING = YES
+GST_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base libav
+GST_LIBAV_CONF_OPT = --with-system-libav
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GST_LIBAV_DEPENDENCIES += bzip2
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
