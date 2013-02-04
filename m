From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Mon,  4 Feb 2013 23:26:13 +0100
Subject: [Buildroot] [PATCH 2/2] Add HW decoding support for Hantro x170
In-Reply-To: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
References: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 package/multimedia/Config.in                       |    2 ++
 package/multimedia/gst-plugin-x170/Config.in       |   10 ++++++++++
 .../multimedia/gst-plugin-x170/gst-plugin-x170.mk  |   11 +++++++++++
 package/multimedia/on2-8170-libs/Config.in         |    5 +++++
 package/multimedia/on2-8170-libs/on2-8170-libs.mk  |   20 ++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/multimedia/gst-plugin-x170/Config.in
 create mode 100644 package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
 create mode 100644 package/multimedia/on2-8170-libs/Config.in
 create mode 100644 package/multimedia/on2-8170-libs/on2-8170-libs.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 931e6d3..e13e9da 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -14,12 +14,14 @@ source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/gst-plugin-x170/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
+source "package/multimedia/on2-8170-libs/Config.in"
 source "package/opus-tools/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/multimedia/gst-plugin-x170/Config.in
new file mode 100644
index 0000000..abbfa5e
--- /dev/null
+++ b/package/multimedia/gst-plugin-x170/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GST_PLUGIN_X170
+	bool "gst-plugin-x170"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_ON2_8170_LIBS
+	help
+	  GStreamer plug-in to use the Hantro X170 video decoder present on
+	  ATMEL AT91SAM9M10 SoC.
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
new file mode 100644
index 0000000..0e14185
--- /dev/null
+++ b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
@@ -0,0 +1,11 @@
+GST_PLUGIN_X170_VERSION=1.0
+GST_PLUGIN_X170_SOURCE=gst-plugin-x170-$(GST_PLUGIN_X170_VERSION).tar.gz
+GST_PLUGIN_X170_SITE=ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+
+GST_PLUGIN_X170_AUTORECONF = YES
+GST_PLUGIN_X170_AUTORECONF_OPT = -Im4/
+GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
+
+GST_PLUGIN_X170_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include -I$(STAGING_DIR)/usr/include/gstreamer-0.10 -I$(STAGING_DIR)/usr/include/libxml2/"
+
+$(eval $(autotools-package))
diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
new file mode 100644
index 0000000..35eb628
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_ON2_8170_LIBS
+	bool "on2-8170-libs"
+	help
+	  Libraries for Hantro X170 video decoder
+
diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
new file mode 100644
index 0000000..edb1c5d
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
@@ -0,0 +1,20 @@
+ON2_8170_LIBS_VERSION=1.0
+ON2_8170_LIBS_SOURCE=on2-8170-libs-$(ON2_8170_LIBS_VERSION).tar.gz
+ON2_8170_LIBS_SITE=ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+
+ON2_8170_LIBS_INSTALL_STAGING = YES
+
+define ON2_8170_LIBS_BUILD_CMDS
+endef
+
+define ON2_8170_LIBS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/*.a $(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include
+	$(INSTALL) -D -m 0755 $(@D)/*.so $(STAGING_DIR)/usr/lib
+endef
+
+define ON2_8170_LIBS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/*.so $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
