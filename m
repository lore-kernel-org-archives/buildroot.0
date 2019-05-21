From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 15:39:27 +0200
Subject: [Buildroot] [PATCH v2 07/12] package/gst-ffmpeg: re-enable package
 if BUG_85180 is present
In-Reply-To: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190521133932.81841-8-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling first files.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
This package has been excluded from building if BUG_85180 is present.
Bug shows up building gst-ffmpeg with optimization but not when building
with -O0.

In config.mk if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 by:
- add --disable-optimizations to EXTRA_OPTS
- passing -O0 to CFLAGS in CONF_ENV
Then remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180' and its
comment if not available from Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/gstreamer/gst-ffmpeg/Config.in     | 4 ----
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 1e95d016f6..32bfdd53c6 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GST_FFMPEG
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# triggers https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65151 on sh
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  GStreamer plugin containing one plugin with a set of
@@ -29,6 +28,3 @@ endif
 
 comment "gst-ffmpeg needs a toolchain w/ gcc >= 5"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
-
-comment "gst-ffmpeg needs a toolchain not affected by GCC bug 85180"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 6f41efb0a5..3a29c776c3 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -90,6 +90,11 @@ ifeq ($(BR2_STATIC_LIBS),)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-optimizations
+GST_FFMPEG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 GST_FFMPEG_CONF_OPTS += --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
-- 
2.17.1
