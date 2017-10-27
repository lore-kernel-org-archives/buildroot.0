From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 19:44:26 +0200
Subject: [Buildroot] [PATCH v1] gstreamer1-editing-services: new package
Message-ID: <20171027174426.23753-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/Config.in                       |  1 +
 .../gstreamer1-editing-services/Config.in          | 18 +++++++++++++++
 .../gstreamer1-editing-services.hash               |  7 ++++++
 .../gstreamer1-editing-services.mk                 | 27 ++++++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/gstreamer1/gstreamer1-editing-services/Config.in
 create mode 100644 package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
 create mode 100644 package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index aef75b55bf..6dddc276e1 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -12,4 +12,5 @@ source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
+source "package/gstreamer1/gstreamer1-editing-services/Config.in"
 endif
diff --git a/package/gstreamer1/gstreamer1-editing-services/Config.in b/package/gstreamer1/gstreamer1-editing-services/Config.in
new file mode 100644
index 0000000000..42261da358
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
+	bool "gstreamer1-editing-services"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER # runtime
+
+	help
+	  GStreamer Editing Services is a high-level library for
+	  facilitating the creation of audio/video non-linear editors.
+
+	  http://gstreamer.freedesktop.org
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
new file mode 100644
index 0000000000..6e0741da00
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -0,0 +1,7 @@
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.12.3.tar.xz.sha256sum
+sha256 032e2fd040079259aec060d526bcb021c670f8d953219c229f80fdc541465f76 gstreamer-editing-services-1.12.3.tar.xz
+
+# Hashes for license files:
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB
+
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
new file mode 100644
index 0000000000..6e0e58654b
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# gstreamer1-editing-services
+#
+################################################################################
+
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.12.3
+GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
+GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
+GSTREAMER1_EDITING_SERVICES_LICENSE = LGPLv2+
+GSTREAMER1_EDITING_SERVICES_LICENSE_FILES = COPYING COPYING.LIB
+GSTREAMER1_EDITING_SERVICES_INSTALL_STAGING = YES
+GSTREAMER1_EDITING_SERVICES_DEPENDENCIES = \
+	host-pkgconf \
+	gstreamer1 \
+	gst1-plugins-base \
+	$(if $(BR2_PACKAGE_GST1_VALIDATE),gst1-validate) \
+	libxml2
+
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS = --disable-benchmarks
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+	GSTREAMER1_EDITING_SERVICES_CONF_OPTS = --with-gtk=3.0
+	GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk3
+endif
+
+$(eval $(autotools-package))
-- 
2.14.2
