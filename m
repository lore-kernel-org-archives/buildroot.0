From: Eloi Bail <eloi.bail@savoirfairelinux.com>
Date: Thu, 14 Mar 2019 16:34:35 +0100
Subject: [Buildroot] [PATCH 2/2] package/gst1-plugins-bayer2rgb-neon: new
 package
In-Reply-To: <20190314153435.6317-1-eloi.bail@savoirfairelinux.com>
References: <20190314153435.6317-1-eloi.bail@savoirfairelinux.com>
Message-ID: <20190314153435.6317-2-eloi.bail@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1-plugins-bayer2rgb-neon[1] is a gstreamer1 plugin which uses
bayer2rgb-neon library to decode raw camera bayer to RGB using NEON
hardware acceleration.

[1] https://git.phytec.de/gst-bayer2rgb-neon

Signed-off-by: Eloi Bail <eloi.bail@savoirfairelinux.com>
---
 package/gstreamer1/Config.in                  |  1 +
 .../gst1-plugins-bayer2rgb-neon/Config.in     | 15 +++++++++
 .../gst1-plugins-bayer2rgb-neon.mk            | 31 +++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
 create mode 100644 package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 922ecefcff..bb5c1d2af8 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -4,6 +4,7 @@ source "package/gstreamer1/gstreamer1/Config.in"
 if BR2_PACKAGE_GSTREAMER1
 source "package/gstreamer1/gstreamer1-mm/Config.in"
 source "package/gstreamer1/gst1-plugins-base/Config.in"
+source "package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
new file mode 100644
index 0000000000..3fae9ac494
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
@@ -0,0 +1,15 @@
+menuconfig BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
+	bool "gst1-plugins-bayer2rgb-neon"
+	depends on BR2_arm # bayer2rgb-neon
+	depends on !BR2_STATIC_LIBS # bayer2rgb-neon
+	depends on BR2_ARM_ENABLE_NEON # bayer2rgb-neon
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX # bayer2rgb-neon
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_BAYER2RGB_NEON
+	help
+	  gst1-plugins-bayer2rgb-neon is a gstreamer1
+	  plugin which uses bayer2rgb-neon library to
+	  decode raw camera bayer to RGB using
+	  NEON hardware acceleration.
+
+	  https://git.phytec.de/gst-bayer2rgb-neon
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
new file mode 100644
index 0000000000..722a71c318
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# gst1-plugins-bayer2rgb-neon
+#
+################################################################################
+
+GST1_PLUGINS_BAYER2RGB_NEON_VERSION = v0.3
+GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
+GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://git.phytec.de/gst-bayer2rgb-neon/snapshot
+
+GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
+GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
+
+GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING = YES
+
+GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES += \
+	host-pkgconf \
+	gstreamer1 \
+	gst1-plugins-base \
+	bayer2rgb-neon
+
+GST1_PLUGINS_BAYER2RGB_NEON_CONF_OPTS = --prefix="/usr"
+GST1_PLUGINS_BAYER2RGB_NEON_AUTORECONF = YES
+
+define GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+	mkdir -p $(@D)/m4
+endef
+
+GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_HOOKS += GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
-- 
2.20.1
