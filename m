From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Mar 2019 13:28:17 +0100
Subject: [Buildroot] [PATCH v5 1/2] Revert "gst1-libav: switch to unbundled"
Message-ID: <20190323122818.32101-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 5dcb8aa0ba46e16b929c7c7fc9cea2d6c26201f4.

This patch re-enables the usage of bundled ffmpeg code because
gst1-libav 1.14.x is blocking the bump to ffmpeg 4.x.

A fix to build the bundled ffmpeg code on arm/aarch64 was added.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: no changes, gstreamer 2.16.x with support for ffmpeg 4.x
    was not released yet

 package/gstreamer1/gst1-libav/Config.in     |  5 --
 package/gstreamer1/gst1-libav/gst1-libav.mk | 81 ++++++++++++++++++++-
 2 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index 23d78b6ad1..2ff6028231 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_GST1_LIBAV
 	bool "gst1-libav"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  GStreamer plugin (formerly gst-ffmpeg).
@@ -10,7 +8,4 @@ config BR2_PACKAGE_GST1_LIBAV
 	  This package contains GStreamer plugins based on
 	  the libav project.
 
-	  The codecs, muxers, bitstreams and filters to build can be
-	  selected in the ffmpeg package.
-
 	  http://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 7ed90a9416..8450c34a07 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -7,12 +7,89 @@
 GST1_LIBAV_VERSION = 1.14.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
-GST1_LIBAV_CONF_OPTS = --with-system-libav
 GST1_LIBAV_DEPENDENCIES = \
-	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
+	host-pkgconf gstreamer1 gst1-plugins-base \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	$(if $(BR2_PACKAGE_XZ),xz)
 GST1_LIBAV_LICENSE = GPL-2.0+
 GST1_LIBAV_LICENSE_FILES = COPYING
+GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
+
+# fixes arm build: https://bugzilla.gnome.org/show_bug.cgi?id=694416
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
+GST1_LIBAV_CONF_ENV = AS="$(TARGET_CROSS)gcc"
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
+GST1_LIBAV_DEPENDENCIES += zlib
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-bzlib
+GST1_LIBAV_DEPENDENCIES += bzip2
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
+endif
+
+# Generic CPU setup for bundled ffmpeg
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
+else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-yasm
+GST1_LIBAV_DEPENDENCIES += host-yasm
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-yasm
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-mmx
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-sse
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-sse
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-ssse3
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-ssse3
+endif
+
+# Explicitly disable everything that doesn't match for ARM
+# FFMPEG "autodetects" by compiling an extended instruction via AS
+# This works on compilers that aren't built for generic by default
+ifeq ($(BR2_ARM_CPU_ARMV4),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv5te
+endif
+ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-armv6
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
+endif
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-neon
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-neon
+endif
+ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-vfp
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-vfp
+endif
+
+ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-altivec
+else
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
+endif
+
+GST1_LIBAV_CONF_OPTS = \
+	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
-- 
2.20.1
