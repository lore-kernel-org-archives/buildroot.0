From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:16:41 +0200
Subject: [Buildroot] [git commit] package/gst1-libav: bump version to 1.18.0
 and convert to meson
Message-ID: <20201015212340.74DE78160D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15dc48ca9becafec6ba11b08af18453bc0e40c9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change home page url to https

- convert to meson build

- drop all libav extra options as the internal libav is
  gone since commit [1]

- meson options: add doc=disabled

[1] https://gitlab.freedesktop.org/gstreamer/gst-libav/-/commit/ca478e7546c059574e0f134125deb38c8cbc9111

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-libav/Config.in       |  2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash |  6 ++---
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 35 +++------------------------
 3 files changed, 8 insertions(+), 35 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index 23d78b6ad1..e58a3532f0 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_GST1_LIBAV
 	  The codecs, muxers, bitstreams and filters to build can be
 	  selected in the ffmpeg package.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 15e4d859ee..9a74465e09 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.2.tar.xz.sha256sum
-sha256 c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2 gst-libav-1.16.2.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.0.tar.xz.sha256sum
+sha256  42f93f5ce9a3fc22051e5f783a4574b56ebf213f331f75dcbc3552459bd3a06a  gst-libav-1.18.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index fdd4d6cc2e..3fd23b8185 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,39 +4,12 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.16.2
+GST1_LIBAV_VERSION = 1.18.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
-
-GST1_LIBAV_DEPENDENCIES = \
-	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
-	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
-	$(if $(BR2_PACKAGE_XZ),xz)
 GST1_LIBAV_LICENSE = GPL-2.0+
 GST1_LIBAV_LICENSE_FILES = COPYING
-GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
-
-# fixes arm build: https://bugzilla.gnome.org/show_bug.cgi?id=694416
-ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
-GST1_LIBAV_CONF_ENV = AS="$(TARGET_CROSS)gcc"
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
-GST1_LIBAV_DEPENDENCIES += zlib
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-zlib
-endif
-
-ifeq ($(BR2_PACKAGE_BZIP2),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-bzlib
-GST1_LIBAV_DEPENDENCIES += bzip2
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
-endif
-
-GST1_LIBAV_CONF_OPTS = \
-	--with-system-libav \
-	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
+GST1_LIBAV_DEPENDENCIES =  host-pkgconf ffmpeg gstreamer1 gst1-plugins-base
+GST1_LIBAV_CONF_OPTS = -Ddoc=disabled
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
