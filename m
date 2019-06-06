From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:52:35 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/gstreamer/gst-ffmpeg: re-enable package when gcc bug 85180 is
 present
Message-ID: <20190606154047.539817FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2088081d2e6cf7f3f85bd0c4b1eb69af1ce0621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs to gcc bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This package has
been excluded from building if the toolchain is affected by gcc bug
85180. To be consistent with how we deal with this issue in other
packages, we re-enable the package and instead work around the issue
by building with -O0, since gcc bug 85180 manifests itself only when
optimization is enabled.

To achieve this:

- add --disable-optimizations to EXTRA_OPTS, which gets passed down to
  the built-in libav library
- pass -O0 to CFLAGS in CONF_ENV

Then we remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180' and its
comment if not available from Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit a2e55071b4e4223754225b1d38be67a8d1e1f03d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-ffmpeg/Config.in     | 4 ----
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

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
index 6f41efb0a5..0d584a15b1 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -90,6 +90,14 @@ ifeq ($(BR2_STATIC_LIBS),)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
 endif
 
+GST_FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-optimizations
+GST_FFMPEG_CFLAGS += -O0
+endif
+
+GST_FFMPEG_CONF_ENV += CFLAGS="$(GST_FFMPEG_CFLAGS)"
 GST_FFMPEG_CONF_OPTS += --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
