From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 22:00:00 +0100
Subject: [Buildroot] [git commit] package/gst1-plugins-bayer2rgb-neon: new
 package
Message-ID: <20190329205632.95A2A890AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9b95112f1978f8fc628577c3f6c30496b36b354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst1-plugins-bayer2rgb-neon[1] is a gstreamer1 plugin which uses
bayer2rgb-neon library to decode raw camera bayer to RGB using NEON
hardware acceleration.

[1] https://git.phytec.de/gst-bayer2rgb-neon

Signed-off-by: Eloi Bail <eloi.bail@savoirfairelinux.com>
[Thomas:
 - add entry to DEVELOPERS file
 - add .hash file
 - adjust Config.in to match bayer2rgb-neon
 - add Config.in comment
 - drop --prefix=/usr from CONF_OPTS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/gstreamer1/Config.in                       |  1 +
 .../gst1-plugins-bayer2rgb-neon/Config.in          | 20 ++++++++++++++++
 .../gst1-plugins-bayer2rgb-neon.hash               |  3 +++
 .../gst1-plugins-bayer2rgb-neon.mk                 | 28 ++++++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7bdcbc9f3d..69b1890fcf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -650,6 +650,7 @@ F:	package/xxhash/
 
 N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
+F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
 
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
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
index 0000000000..b7cac08d7d
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
@@ -0,0 +1,20 @@
+menuconfig BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
+	bool "gst1-plugins-bayer2rgb-neon"
+	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON # bayer2rgb-neon
+	depends on !BR2_STATIC_LIBS # bayer2rgb-neon
+	depends on BR2_INSTALL_LIBSTDCPP # bayer2rgb-neon
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # bayer2rgb-neon
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_BAYER2RGB_NEON
+	help
+	  gst1-plugins-bayer2rgb-neon is a gstreamer1
+	  plugin which uses bayer2rgb-neon library to
+	  decode raw camera bayer to RGB using
+	  NEON hardware acceleration.
+
+	  https://git.phytec.de/gst-bayer2rgb-neon
+
+comment "gst1-plugins-bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc >= 4.9"
+	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
new file mode 100644
index 0000000000..129be67c34
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 8d317b892bf1c99e9999a6d9b027a22c4ea2940f1ac504c03560b3d476e1c9c8 gst-bayer2rgb-neon-v0.3.tar.bz2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
new file mode 100644
index 0000000000..e430865e31
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# gst1-plugins-bayer2rgb-neon
+#
+################################################################################
+
+GST1_PLUGINS_BAYER2RGB_NEON_VERSION = v0.3
+GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
+GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://git.phytec.de/gst-bayer2rgb-neon/snapshot
+GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
+GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
+
+GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING = YES
+
+GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
+	host-pkgconf \
+	gstreamer1 \
+	gst1-plugins-base \
+	bayer2rgb-neon
+
+GST1_PLUGINS_BAYER2RGB_NEON_AUTORECONF = YES
+
+define GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+	mkdir -p $(@D)/m4
+endef
+GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_HOOKS += GST1_PLUGINS_BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
