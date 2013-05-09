From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 15:51:17 -0500
Subject: [Buildroot] [PATCH v2 6/6] libvpx: new package libvpx
In-Reply-To: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
References: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368132677-1261-6-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds webm multimedia support and VP8 encoder decoder library. This library is
used by gst-plugins-good1.

http://www.webmproject.org/

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-good1/Config.in     |    4 ++
 .../gst-plugins-good1/gst-plugins-good1.mk         |   10 +++-
 package/multimedia/libvpx/Config.in                |    6 +++
 package/multimedia/libvpx/libvpx.mk                |   52 ++++++++++++++++++++
 5 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 package/multimedia/libvpx/Config.in
 create mode 100644 package/multimedia/libvpx/libvpx.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 99d7f50..658a740 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -20,6 +20,7 @@ source "package/multimedia/gst-plugins-bad1/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/gst-plugins-ugly1/Config.in"
 source "package/multimedia/lame/Config.in"
+source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
diff --git a/package/multimedia/gst-plugins-good1/Config.in b/package/multimedia/gst-plugins-good1/Config.in
index 8cc8f20..bfbe999 100644
--- a/package/multimedia/gst-plugins-good1/Config.in
+++ b/package/multimedia/gst-plugins-good1/Config.in
@@ -206,6 +206,10 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_SPEEX
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VPX
+	bool "vpx (webm)"
+	select BR2_PACKAGE_LIBVPX
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVPACK
 	bool "wavpack (*.wv audio)"
 	select BR2_PACKAGE_WAVPACK
diff --git a/package/multimedia/gst-plugins-good1/gst-plugins-good1.mk b/package/multimedia/gst-plugins-good1/gst-plugins-good1.mk
index befc9a7..f1b4a2a 100644
--- a/package/multimedia/gst-plugins-good1/gst-plugins-good1.mk
+++ b/package/multimedia/gst-plugins-good1/gst-plugins-good1.mk
@@ -27,8 +27,7 @@ GST_PLUGINS_GOOD1_CONF_OPT += \
 		--disable-jack \
 		--disable-libdv \
 		--disable-dv1394 \
-		--disable-taglib \
-		--disable-vpx
+		--disable-taglib
 
 GST_PLUGINS_GOOD1_DEPENDENCIES = gstreamer1 gst-plugins-base1
 
@@ -390,6 +389,13 @@ else
 GST_PLUGINS_GOOD1_CONF_OPT += --disable-speex
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VPX),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-vpx
+GST_PLUGINS_GOOD1_DEPENDENCIES += libvpx
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-vpx
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVPACK),y)
 GST_PLUGINS_GOOD1_CONF_OPT += --enable-wavpack
 GST_PLUGINS_GOOD1_DEPENDENCIES += wavpack
diff --git a/package/multimedia/libvpx/Config.in b/package/multimedia/libvpx/Config.in
new file mode 100644
index 0000000..2327971
--- /dev/null
+++ b/package/multimedia/libvpx/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBVPX
+	bool "libvpx"
+	help
+	  a high-quality, open video format that's freely available to everyone.
+
+	  http://webmproject.org
diff --git a/package/multimedia/libvpx/libvpx.mk b/package/multimedia/libvpx/libvpx.mk
new file mode 100644
index 0000000..879a531
--- /dev/null
+++ b/package/multimedia/libvpx/libvpx.mk
@@ -0,0 +1,52 @@
+#############################################################
+#
+# libvpx
+#
+#############################################################
+
+LIBVPX_VERSION = v1.2.0
+LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
+LIBVPX_SITE_METHOD = git
+
+LIBVPX_INSTALL_STAGING = YES
+LIBVPX_LICENSE = BSD-3c 
+LIBVPX_LICENSE_FILES = LICENSE PATENTS 
+
+LIBVPX_INSTALL_STAGING = YES
+
+LIBVPX_CONF_ENV = \
+	LD=$$CC \
+	CROSS=$(GNU_TARGET_NAME)
+
+LIBVPX_CONF_OPT = \
+	--disable-examples \
+	--disable-docs \
+	--disable-unit-tests
+
+define LIBVPX_CONFIGURE_CMDS
+	(cd $(LIBVPX_SRCDIR) && rm -rf config.cache && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$(LIBVPX_CONF_ENV) \
+	./configure \
+		--target=generic-gnu \
+		--enable-pic \
+		--prefix=/usr \
+		$(SHARED_STATIC_LIBS_OPTS) \
+		$(LIBVPX_CONF_OPT) \
+	)
+endef
+
+define LIBVPX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define LIBVPX_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
+endef
+
+define LIBVPX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
