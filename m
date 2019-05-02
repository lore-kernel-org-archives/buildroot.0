From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  2 May 2019 11:16:20 -0400
Subject: [Buildroot] [PATCH v5 6/8] package/gstreamer1/gst1-libav: bump to
 version 1.16.0
In-Reply-To: <20190502151622.80865-1-aduskett@gmail.com>
References: <20190502151622.80865-1-aduskett@gmail.com>
Message-ID: <20190502151622.80865-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In addition:
  - Allow gst1-libav to use the system ffmpeg, as 1.16.0 is compatible with
    ffmpeg 4.x.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - None

Changes v3 -> v4:
  - Revert the following commits:
    902d3d27bc729b5466fcb3eb130525f26f6d81b8
    0c6f83c3eb63940808644281575844573c45477a
    07415ad214373c787962a1479514739045916001
    (Bernd)

Changes v4 -> v5:
  - None

 package/gstreamer1/gst1-libav/Config.in       |  5 ++
 package/gstreamer1/gst1-libav/gst1-libav.hash |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 69 ++-----------------
 3 files changed, 13 insertions(+), 65 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index 2ff6028231..23d78b6ad1 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GST1_LIBAV
 	bool "gst1-libav"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  GStreamer plugin (formerly gst-ffmpeg).
@@ -8,4 +10,7 @@ config BR2_PACKAGE_GST1_LIBAV
 	  This package contains GStreamer plugins based on
 	  the libav project.
 
+	  The codecs, muxers, bitstreams and filters to build can be
+	  selected in the ffmpeg package.
+
 	  http://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 741c582319..bcd4e251d2 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.4.tar.xz.sha256sum
-sha256 dfd78591901df7853eab7e56a86c34a1b03635da0d3d56b89aa577f1897865da gst-libav-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.0.tar.xz.sha256sum
+sha256 dfac119043a9cfdcacd7acde77f674ab172cf2537b5812be52f49e9cddc53d9a gst-libav-1.16.0.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 73e47a0639..05bc3ebe0f 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,19 +4,20 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.14.4
+GST1_LIBAV_VERSION = 1.16.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
+
 GST1_LIBAV_DEPENDENCIES = \
-	host-pkgconf gstreamer1 gst1-plugins-base \
+	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	$(if $(BR2_PACKAGE_XZ),xz)
 GST1_LIBAV_LICENSE = GPL-2.0+
 GST1_LIBAV_LICENSE_FILES = COPYING
 GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
 
-# fixes arm/powerpc build: https://bugzilla.gnome.org/show_bug.cgi?id=694416
-ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
+# fixes arm build: https://bugzilla.gnome.org/show_bug.cgi?id=694416
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
 GST1_LIBAV_CONF_ENV = AS="$(TARGET_CROSS)gcc"
 endif
 
@@ -34,66 +35,8 @@ else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
 endif
 
-# Generic CPU setup for bundled ffmpeg
-# Default to --cpu=generic for MIPS architecture, in order to avoid a
-# build failure on mips64r6.
-ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=generic
-else ifneq ($(GCC_TARGET_CPU),)
-GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(GCC_TARGET_CPU)
-else ifneq ($(GCC_TARGET_ARCH),)
-GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(GCC_TARGET_ARCH)
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-yasm
-GST1_LIBAV_DEPENDENCIES += host-yasm
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-yasm
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-mmx
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-sse
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-sse
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-ssse3
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-ssse3
-endif
-
-# Explicitly disable everything that doesn't match for ARM
-# FFMPEG "autodetects" by compiling an extended instruction via AS
-# This works on compilers that aren't built for generic by default
-ifeq ($(BR2_ARM_CPU_ARMV4),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv5te
-endif
-ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-armv6
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
-endif
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-neon
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-neon
-endif
-ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-vfp
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-vfp
-endif
-
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-altivec
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
-endif
-
 GST1_LIBAV_CONF_OPTS = \
+	--with-system-libav \
 	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
-- 
2.21.0
