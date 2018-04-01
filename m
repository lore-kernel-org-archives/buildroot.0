From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 19:29:59 +0200
Subject: [Buildroot] [git commit] gstreamer1-editing-services: new package
Message-ID: <20180401173531.8ED0D83472@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ca425d4d2efae531225fbeaeab4ba588c247fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: select and add to dependencies good/bad plugins,
	enable/disable examples if gtk2/3 with x11 backend is available]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/Config.in                       |  1 +
 .../gstreamer1-editing-services/Config.in          | 19 ++++++++++
 .../gstreamer1-editing-services.hash               |  6 ++++
 .../gstreamer1-editing-services.mk                 | 40 ++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 8553cd2b2d..28b1ed25c5 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -14,4 +14,5 @@ source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
+source "package/gstreamer1/gstreamer1-editing-services/Config.in"
 endif
diff --git a/package/gstreamer1/gstreamer1-editing-services/Config.in b/package/gstreamer1/gstreamer1-editing-services/Config.in
new file mode 100644
index 0000000000..716a4e5ef7
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
+	bool "gstreamer1-editing-services"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE # runtime
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER # runtime
+	help
+	  GStreamer Editing Services is a high-level library for
+	  facilitating the creation of audio/video non-linear editors.
+
+	  http://gstreamer.freedesktop.org
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
new file mode 100644
index 0000000000..e2d31922a7
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -0,0 +1,6 @@
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.12.3.tar.xz.sha256sum
+sha256 032e2fd040079259aec060d526bcb021c670f8d953219c229f80fdc541465f76 gstreamer-editing-services-1.12.3.tar.xz
+
+# Hashes for license files:
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
new file mode 100644
index 0000000000..bd51cb5351
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -0,0 +1,40 @@
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
+	gst1-plugins-good \
+	gst1-plugins-bad \
+	$(if $(BR2_PACKAGE_GST1_VALIDATE),gst1-validate) \
+	libxml2
+
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS = --disable-benchmarks
+
+# examples need GTK2/3 with X11 backend
+ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3_X11),)
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --enable-examples
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=2.0
+GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk2
+else
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=3.0
+GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk3
+endif
+
+else
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --disable-examples
+endif
+
+$(eval $(autotools-package))
