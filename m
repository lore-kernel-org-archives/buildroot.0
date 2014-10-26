From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 16:49:40 +0100
Subject: [Buildroot] [git commit] gst-ffmpeg: add option to select GPL vs
	LGPL build
Message-ID: <20141026155119.DF3D0B089B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6e946ebebbaddfd6e38eb783ab1046d23402006
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-ffmpeg/Config.in     |   10 ++++++++++
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk |   12 +++++++++++-
 2 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index d879f5e..9bf5196 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -8,5 +8,15 @@ config BR2_PACKAGE_GST_FFMPEG
 
 	  http://gstreamer.freedesktop.org/
 
+if BR2_PACKAGE_GST_FFMPEG
+
+config BR2_PACKAGE_GST_FFMPEG_GPL
+	bool "Enable GPL code"
+	help
+	  Allow use of GPL code.  The resulting libs and binaries will
+	  be under GPL.
+
+endif
+
 comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 59b9323..44d3ace 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -10,6 +10,16 @@ GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
 GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_GST_FFMPEG_GPL),y)
+GST_FFMPEG_CONF_OPTS += --disable-lgpl
+GST_FFMPEG_LICENSE = GPLv2+ (gst-ffmpeg), GPLv2+/GPLv3+ (libav)
+GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
+else
+GST_FFMPEG_CONF_OPTS += --enable-lgpl
+GST_FFMPEG_LICENSE = LGPLv2+ (gst-ffmpeg), LGPLv2.1+/LGPLv3+ (libav)
+GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-libs/ext/libav/COPYING.LGPLv3
+endif
+
 GST_FFMPEG_CONF_EXTRA_OPTS = \
 		--cross-prefix=$(TARGET_CROSS) \
 		--target-os=linux
@@ -73,6 +83,6 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
 endif
 
-GST_FFMPEG_CONF_OPTS = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
+GST_FFMPEG_CONF_OPTS += --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
