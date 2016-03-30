From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 22:40:28 +0200
Subject: [Buildroot] [git commit] gst1-libav: switch to unbundled
Message-ID: <20160330204127.B8D7C819EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dcb8aa0ba46e16b929c7c7fc9cea2d6c26201f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It avoids the crazy in handling all of the ffmpeg options here as well,
and potentially avoids target code duplication, hence resulting in a
size reduction.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: extend help text as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-libav/Config.in     |  5 ++
 package/gstreamer1/gst1-libav/gst1-libav.mk | 79 ++---------------------------
 2 files changed, 10 insertions(+), 74 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index 4f9c2b8..b4b7aa7 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GST1_LIBAV
 	bool "gst1-libav"
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  GStreamer plugin (formerly gst-ffmpeg).
@@ -7,4 +9,7 @@ config BR2_PACKAGE_GST1_LIBAV
 	  This package contains GStreamer plugins based on
 	  the libav project.
 
+	  The codecs, muxers, bitstreams and filters to build can be
+	  selected in the ffmpeg package.
+
 	  http://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 8f892d0..02ac394 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -7,79 +7,10 @@
 GST1_LIBAV_VERSION = 1.8.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
-GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
-GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
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
-# Generic CPU setup for bundled ffmpeg
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
-GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
-else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
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
-ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-altivec
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
-endif
-
-GST1_LIBAV_CONF_OPTS = \
-	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
+GST1_LIBAV_CONF_OPTS = --with-system-libav
+GST1_LIBAV_DEPENDENCIES = \
+	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
+	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
+	$(if $(BR2_PACKAGE_XZ),xz)
 
 $(eval $(autotools-package))
