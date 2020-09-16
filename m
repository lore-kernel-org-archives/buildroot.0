From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 21:49:32 +0200
Subject: [Buildroot] [RFC v1 12/13] package/gstreamer1-editing-services:
 bump version to 1.18.0 and convert to meson
In-Reply-To: <20200916194933.24921-1-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
Message-ID: <20200916194933.24921-12-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change home page url to https

- change download url to https

- download source renamed from gstreamer-editing-services to
  gst-editing-services

- convert to meson build

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services/Config.in     |  2 +-
 .../gstreamer1-editing-services.hash          |  8 ++--
 .../gstreamer1-editing-services.mk            | 37 +++++++++++++------
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/Config.in b/package/gstreamer1/gstreamer1-editing-services/Config.in
index fe46870491..9c41e8142b 100644
--- a/package/gstreamer1/gstreamer1-editing-services/Config.in
+++ b/package/gstreamer1/gstreamer1-editing-services/Config.in
@@ -15,4 +15,4 @@ config BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
 	  GStreamer Editing Services is a high-level library for
 	  facilitating the creation of audio/video non-linear editors.
 
-	  http://gstreamer.freedesktop.org
+	  https://gstreamer.freedesktop.org
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 8724f39498..7ac263f978 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,6 +1,6 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.16.2.tar.xz.sha256sum
-sha256 0e06a6191a0c6c16e16272bf2573cecaeb245f10629486ad940a299bef700c16 gstreamer-editing-services-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.18.0.tar.xz.sha256sum
+sha256  4daef0d4875415ea262f7fb1287d4a33939a9594f3c1e661f8587ab00f7000a8  gst-editing-services-1.18.0.tar.xz
 
 # Hashes for license files:
-sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
-sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB
+sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
+sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 4b0b61e877..46375f2225 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.16.2
-GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
-GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.18.0
+GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
+GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
 GSTREAMER1_EDITING_SERVICES_LICENSE_FILES = COPYING COPYING.LIB
 GSTREAMER1_EDITING_SERVICES_INSTALL_STAGING = YES
@@ -15,27 +15,42 @@ GSTREAMER1_EDITING_SERVICES_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
 	gst1-plugins-good \
-	$(if $(BR2_PACKAGE_GST1_VALIDATE),gst1-validate) \
 	libxml2
 
 GSTREAMER1_EDITING_SERVICES_CONF_OPTS = \
-	--disable-benchmarks \
-	--disable-introspection
+	-Ddoc=disabled \
+	-Dintrospection=disabled \
+	-Dtests=disabled \
+	-Dtools=enabled \
+	-Dbash-completion=disabled \
+	-Dxptv=disabled \
+	-Dpython=disabled
+
+ifeq ($(BR2_PACKAGE_GST1_VALIDATE),y)
+GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += gst1-validate
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += -Dvalidate=enabled
+else
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += -Dvalidate=disabled
+endif
 
 # examples need GTK2/3 with X11 backend
 ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3_X11),)
-GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --enable-examples
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += -Dexamples=enabled
 
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=2.0
+# ToDo: meson.build states 'TODO Properly port to Gtk 3'
+# ToDo: examples/c/ges-ui.glade states 'requires lib="gtk+" version="2.16"'
+# GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=2.0
 GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk2
 else
-GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=3.0
+# ToDo: meson.build states 'TODO Properly port to Gtk 3'
+# ToDo: examples/c/ges-ui.glade states 'requires lib="gtk+" version="2.16"'
+# GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=3.0
 GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk3
 endif
 
 else
-GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --disable-examples
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += -Dexamples=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.28.0
