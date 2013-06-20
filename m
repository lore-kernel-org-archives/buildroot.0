From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 19 Jun 2013 23:14:00 -0500
Subject: [Buildroot] [PATCH v11 01/11] gstreamer1: Add gstreamer version
	1.1.1 package
In-Reply-To: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
References: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1371701651-7739-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the gstreamer version 1.x series to buildroot.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/gstreamer1/Config.in     |   55 +++++++++++++++++++++++++++
 package/multimedia/gstreamer1/gstreamer1.mk |   40 +++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 package/multimedia/gstreamer1/Config.in
 create mode 100644 package/multimedia/gstreamer1/gstreamer1.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 77c0a22..1427a27 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -6,6 +6,7 @@ source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
+source "package/multimedia/gstreamer1/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
 source "package/multimedia/gst-fsl-plugins/Config.in"
diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
new file mode 100644
index 0000000..2bd911a
--- /dev/null
+++ b/package/multimedia/gstreamer1/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_GSTREAMER1
+	bool "gstreamer1"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  GStreamer is an open source multimedia framework. This 1.x version of
+	  Gstreamer is incompatible with Gstreamer 0.10.x.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GSTREAMER1
+
+config BR2_PACKAGE_GSTREAMER1_PARSE
+	bool "enable command-line parser"
+	default y
+	help
+	  Enable command line parser for gstreamer. This may incrase the CPu
+	  overhead by a small amount.
+
+config BR2_PACKAGE_GSTREAMER1_TRACE
+	bool "enable tracing subsystem"
+	default y
+	help
+	  Enable the tracing subsystem within gstreamer.  This may increase CPU
+	  overhead by a small amount.
+
+config BR2_PACKAGE_GSTREAMER1_GST_DEBUG
+	bool "enable gst-debug trace support"
+	default y
+	help
+	  Enable support for the gst-debug tracing functionality in gstreamer.
+	  This has limited CPU overhead, but does increase the rootfs size
+	  somewhat.
+
+config BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY
+	bool "enable plugin registry"
+	default y
+	help
+	  Enable support for the GStreamer plugin registry. This may increase
+	  the launch-time for a GStreamer application.
+
+config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
+	bool "install gst-launch & gst-inspect"
+	default y
+	help
+	  Install the gst-launch and gst-inspect tools. This will take up
+	  additional space on the target.
+
+endif
+
+comment "gstreamer1 requires a toolchain with WCHAR and threads support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+
diff --git a/package/multimedia/gstreamer1/gstreamer1.mk b/package/multimedia/gstreamer1/gstreamer1.mk
new file mode 100644
index 0000000..af464e0
--- /dev/null
+++ b/package/multimedia/gstreamer1/gstreamer1.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# gstreamer1
+#
+#############################################################
+
+GSTREAMER1_VERSION = 1.1.1
+GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
+GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
+GSTREAMER1_INSTALL_STAGING = YES
+GSTREAMER1_LICENSE_FILES = COPYING
+GSTREAMER1_LICENSE = LGPLv2+ LGPLv2.1+
+
+# Checking if unaligned memory access works correctly cannot be done when cross
+# compiling. For the following architectures there is no information available
+# in the configure script.
+ifeq ($(BR2_avr32),y)
+GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
+endif
+ifeq ($(BR2_aarch64),y)
+GSTREAMER1_CONF_ENV = as_cv_unaligned_access=yes
+endif
+
+GSTREAMER1_CONF_OPT = \
+	--disable-examples \
+	--disable-tests \
+	--disable-failing-tests \
+	--disable-debug \
+	--disable-valgrind \
+	--disable-benchmarks \
+	--disable-check \
+	$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),,--disable-trace) \
+	$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),,--disable-parse) \
+	$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),,--disable-gst-debug) \
+	$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),,--disable-registry) \
+	$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),,--disable-tools)
+
+GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
+
+$(eval $(autotools-package))
-- 
1.7.9.5
