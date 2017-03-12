From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 21:32:21 +0100
Subject: [Buildroot] [git commit] gst1-vaapi: new package
Message-ID: <20170312203334.D806980AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1e4e8545dad4d587c6739d7f9942c5e21e7490d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gstreamer-vaapi consists in a collection of VA-API based plugins for
GStreamer and helper libraries.  These libraries are used for hardware
decoding and encoding of several video formats.

decoding formats:
JPEG, MPEG-2, MPEG-4:2, H.264 AVC, H.264 MVC, VP8, VC-1, WMV3, and HEVC.

encoding formats:
MPEG-2, H.264 AVC, H.264 MVC, JPEG, VP8, HEVC

The package won't compile without at least one renderer enabled, so I
chose to enable DRM by default, as X11, GLX, and wayland are heavy
handed with the dependencies.  As such, I have disabled every option
defaulting to yes except for DRM for the first patch.

Also, these codecs are only for x86 and require a Intel CPU (See Hardware
Requirements on line 82 of the README file.)

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[Thomas:
 - Add entry to DEVELOPERS file.
 - Add BR2_TOOLCHAIN_HAS_THREADS dependency to the main Config.in
   option.
 - Add BR2_PACKAGE_HAS_UDEV dependency to the main Config.in option.
 - Add comments about the BR2_STATIC_LIBS config option.
 - Rewrap Config.in help text and removing trailing tabs/spaces.
 - Remove restriction to i386/x86-64
 - Add patch to fix build with uClibc.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/gstreamer1/Config.in                       |  1 +
 .../0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch | 52 ++++++++++++++++++++++
 package/gstreamer1/gst1-vaapi/Config.in            | 43 ++++++++++++++++++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |  2 +
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        | 28 ++++++++++++
 6 files changed, 127 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 268c2fb..afd8f38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -30,6 +30,7 @@ N:	Abhilash Tuse <abhilash.tuse@imgtec.com>
 F:	package/gstreamer1/gst1-rtsp-server/
 
 N:	Adam Duskett <aduskett@gmail.com>
+F:	package/gstreamer1/gst1-vaapi/
 F:	package/nginx-naxsi/
 F:	package/python-mutagen/
 F:	package/sngrep/
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 23862bd..aef75b5 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -10,5 +10,6 @@ source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
+source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-vaapi/0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch b/package/gstreamer1/gst1-vaapi/0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch
new file mode 100644
index 0000000..d69846c
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/0001-O_CLOEXEC-needs-_GNU_SOURCE-defined.patch
@@ -0,0 +1,52 @@
+From 3e392e097fc0e98e606721748e8baee0e079a1a2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 12 Mar 2017 18:59:42 +0100
+Subject: [PATCH] O_CLOEXEC needs _GNU_SOURCE defined
+
+From man open(2):
+
+    The O_CLOEXEC, O_DIRECTORY, and O_NOFOLLOW flags are not specified
+    in POSIX.1-2001, but are specified in POSIX.1-2008.  Since glibc
+    2.12, one can obtain their definitions by defining either
+    _POSIX_C_SOURCE with a value greater than or equal to 200809L or
+    _XOPEN_SOURCE with a value greater than or equal to 700.  In glibc
+    2.11 and earlier, one obtains the definitions by defining
+    _GNU_SOURCE.
+
+And indeed, with the uClibc C library, O_CLOEXEC is not exposed if
+_GNU_SOURCE is not defined. Therefore, this commit fixes the build of
+gstreamer-vaapi with the uClibc C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gst-libs/gst/vaapi/gstvaapidisplay_drm.c | 1 +
+ tests/test-display.c                     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/vaapi/gstvaapidisplay_drm.c b/gst-libs/gst/vaapi/gstvaapidisplay_drm.c
+index f436036..00ff039 100644
+--- a/gst-libs/gst/vaapi/gstvaapidisplay_drm.c
++++ b/gst-libs/gst/vaapi/gstvaapidisplay_drm.c
+@@ -25,6 +25,7 @@
+  * @short_description: VA/DRM display abstraction
+  */
+ 
++#define _GNU_SOURCE
+ #include "sysdeps.h"
+ #include <string.h>
+ #include <unistd.h>
+diff --git a/tests/test-display.c b/tests/test-display.c
+index be9c24b..9abe754 100644
+--- a/tests/test-display.c
++++ b/tests/test-display.c
+@@ -22,6 +22,7 @@
+  *  Boston, MA 02110-1301 USA
+  */
+ 
++#define _GNU_SOURCE
+ #include "gst/vaapi/sysdeps.h"
+ #include <gst/video/video.h>
+ #if USE_DRM
+-- 
+2.7.4
+
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
new file mode 100644
index 0000000..9a4d66c
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_GST1_VAAPI
+	bool "gst1-vaapi"
+	select BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
+	depends on !BR2_STATIC_LIBS # dlopen(), libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  gstreamer-vaapi consists in a collection of VA-API based
+	  plugins for GStreamer and helper libraries.
+
+	  vaapi<CODEC>dec is used to decode JPEG, MPEG-2, MPEG-4:2,
+	  H.264 AVC, H.264 MVC, VP8, VC-1, WMV3, HEVC videos to VA
+	  surfaces, depending on the actual value of <CODEC> and the
+	  underlying hardware capabilities.  This plugin is also able
+	  to implicitly download the decoded surface to raw YUV
+	  buffers.
+
+	  vaapi<CODEC>enc is used to encode into MPEG-2, H.264 AVC,
+	  H.264 MVC, JPEG, VP8, HEVC videos, depending on the actual
+	  value of <CODEC> (mpeg2, h264, etc.) and the hardware
+	  capabilities. By default, raw format bitstreams are
+	  generated, so the result may be piped to a muxer, e.g. qtmux
+	  for MP4 containers.
+
+	  vaapipostproc is used to filter VA surfaces, for
+	  e.g. scaling, deinterlacing (bob, motion-adaptive,
+	  motion-compensated), noise reduction or sharpening. This
+	  plugin is also used to upload raw YUV pixels into VA
+	  surfaces.
+
+	  vaapisink is used to render VA surfaces to an X11 or Wayland
+	  display. This plugin also features a "headless" mode (DRM)
+	  more suited to remote transcode scenarios, with faster
+	  throughput.
+
+	  https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi
+
+comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
new file mode 100644
index 0000000..f3c6252
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -0,0 +1,2 @@
+# from https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.10.3.tar.xz.sha256sum
+sha256 cea827066a152a6afa1d0c43544dfbda285238156d4c3b77f9d4037bbe79361e  gstreamer-vaapi-1.10.3.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
new file mode 100644
index 0000000..370e281
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# gst1-vaapi
+#
+################################################################################
+
+GST1_VAAPI_VERSION = 1.10.3
+GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
+GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
+GST1_VAAPI_LICENSE = LGPLv2.1+
+GST1_VAAPI_LICENSE_FILES = COPYING.LIB
+
+GST1_VAAPI_DEPENDENCIES += \
+	gstreamer1 \
+	gst1-plugins-base \
+	gst1-plugins-bad \
+	libva \
+	libdrm
+
+GST1_VAAPI_CONF_OPTS += \
+	--disable-encoders \
+	--disable-x11 \
+	--disable-glx \
+	--disable-wayland \
+	--disable-egl \
+	--disable-gtk-doc-html
+
+$(eval $(autotools-package))
