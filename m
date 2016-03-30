From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:39:25 +0200
Subject: [Buildroot] [git commit] gst1-libav: pass --cpu config option to
	bundled ffmpeg
Message-ID: <20160330173927.BBFB0817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04236c4a30f57638ef3e162b54b16ede63045dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like the proper ffmpeg package does, fixes:
http://autobuild.buildroot.net/results/a46/a462dae8df2450bc0f72cbed6125e106454bde0f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 496190e..8f892d0 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -7,9 +7,7 @@
 GST1_LIBAV_VERSION = 1.8.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
-
 GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
-
 GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
@@ -26,6 +24,13 @@ else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
 endif
 
+# Generic CPU setup for bundled ffmpeg
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
+else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
+GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-yasm
 GST1_LIBAV_DEPENDENCIES += host-yasm
