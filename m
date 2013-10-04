From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 14:37:56 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: bump version
Message-ID: <20131004125504.E41C29B941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8299f30aad654527573e360c68b3596cdd2acff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DTMF plugin moved from bad, udp plugin no longer needs IPv6 and taglib
support was missing.

Patch needed for O_CLOEXEC on uClibc / older Glibc versions.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in     |   19 ++++++--
 ...v4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch |   46 ++++++++++++++++++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |   15 ++++++-
 3 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index ac05d66..2da9bff 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -91,6 +91,11 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE
 	help
 	  Deinterlacer
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DTMF
+	bool "dtmf"
+	help
+	  DTMF plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EFFECTV
 	bool "effectv"
 	help
@@ -211,14 +216,10 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPECTRUM
 	  Run an FFT on the audio signal, output spectrum data
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_UDP
-	depends on BR2_INET_IPV6
 	bool "udp"
 	help
 	  transfer data via UDP
 
-comment "udp requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
-
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOBOX
 	bool "videobox"
 	help
@@ -321,6 +322,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
 	help
 	  Speex plugin library
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB
+	bool "taglib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_TAGLIB
+	help
+	  Taglib tagging plugin library
+
+comment "taglib requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
 	select BR2_PACKAGE_LIBVPX
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-gstv4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-gstv4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch
new file mode 100644
index 0000000..7dd7917
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good-gstv4lbufferpool-O_CLOEXEC-needs-_GNU_SOURCE.patch
@@ -0,0 +1,46 @@
+From 4f305f30c9917f7a6ea7332a798401f2a5abe981 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 4 Oct 2013 13:34:09 +0200
+Subject: [PATCH] gstv4l2bufferpool: O_CLOEXEC needs _GNU_SOURCE
+
+[Submitted upstream: https://bugzilla.gnome.org/show_bug.cgi?id=709423]
+
+On some systems (E.G. uClibc and older Glibc versions), O_CLOEXEC is only
+defined when _GNU_SOURCE is specified, so do so.
+
+_GNU_SOURCE needs to be defined before any system headers are included,
+so move the fcntl.h section up.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ sys/v4l2/gstv4l2bufferpool.c |   10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
+index 00c6086..f5396d9 100644
+--- a/sys/v4l2/gstv4l2bufferpool.c
++++ b/sys/v4l2/gstv4l2bufferpool.c
+@@ -26,13 +26,17 @@
+ #  include <config.h>
+ #endif
+ 
+-#include <sys/mman.h>
+-#include <string.h>
+-#include <unistd.h>
+ #if HAVE_DECL_V4L2_MEMORY_DMABUF
++#ifndef _GNU_SOURCE
++# define _GNU_SOURCE            /* O_CLOEXEC */
++#endif
+ #include <fcntl.h>
+ #endif
+ 
++#include <sys/mman.h>
++#include <string.h>
++#include <unistd.h>
++
+ #include "gst/video/video.h"
+ #include "gst/video/gstvideometa.h"
+ #include "gst/video/gstvideopool.h"
+-- 
+1.7.10.4
+
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 29b8983..de8ad91 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.0.10
+GST1_PLUGINS_GOOD_VERSION = 1.2.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -101,6 +101,12 @@ else
 GST1_PLUGINS_GOOD_CONF_OPT += --disable-deinterlace
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DTMF),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-dtmf
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-dtmf
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
 GST1_PLUGINS_GOOD_CONF_OPT += --enable-effectv
 else
@@ -380,6 +386,13 @@ else
 GST1_PLUGINS_GOOD_CONF_OPT += --disable-speex
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-taglib
+GST1_PLUGINS_GOOD_DEPENDENCIES += taglib
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-taglib
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX),y)
 GST1_PLUGINS_GOOD_CONF_OPT += --enable-vpx
 GST1_PLUGINS_GOOD_DEPENDENCIES += libvpx
