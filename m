From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Feb 2014 12:05:50 +0100
Subject: [Buildroot] [git commit] gst1-libav: new package
Message-ID: <20140201124728.6D5269C6A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a05049e91edeade6029339e412db29581b83d665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: file header, structure like gst-ffmpeg, drop unneeded libav args]
Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/Config.in                |    1 +
 package/gstreamer1/gst1-libav/Config.in     |   10 +++
 package/gstreamer1/gst1-libav/gst1-libav.mk |   86 +++++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index f7b98c7..fe0ad48 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -6,5 +6,6 @@ source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
+source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
new file mode 100644
index 0000000..4f9c2b8
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GST1_LIBAV
+	bool "gst1-libav"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  GStreamer plugin (formerly gst-ffmpeg).
+
+	  This package contains GStreamer plugins based on
+	  the libav project.
+
+	  http://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
new file mode 100644
index 0000000..1c45acc
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -0,0 +1,86 @@
+################################################################################
+#
+# gst1-libav
+#
+################################################################################
+
+GST1_LIBAV_VERSION = 1.2.2
+GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
+GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
+
+GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
+
+GST1_LIBAV_CONF_EXTRA_OPT = \
+	--cross-prefix=$(TARGET_CROSS) \
+	--target-os=linux \
+	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-zlib
+GST1_LIBAV_DEPENDENCIES += zlib
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-bzlib
+GST1_LIBAV_DEPENDENCIES += bzip2
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-bzlib
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-yasm
+GST1_LIBAV_DEPENDENCIES += host-yasm
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-yasm
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-mmx
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-sse
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-sse
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-ssse3
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-ssse3
+endif
+
+# Explicitly disable everything that doesn't match for ARM
+# FFMPEG "autodetects" by compiling an extended instruction via AS
+# This works on compilers that aren't built for generic by default
+ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-armv5te
+endif
+ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-armv6
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-armv6 --disable-armv6t2
+endif
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-neon
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-neon
+endif
+ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-vfp
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-vfp
+endif
+
+# Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+GST1_LIBAV_CONF_EXTRA_OPT += --enable-altivec
+else
+GST1_LIBAV_CONF_EXTRA_OPT += --disable-altivec
+endif
+endif
+
+GST1_LIBAV_CONF_OPT = \
+	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
+
+$(eval $(autotools-package))
