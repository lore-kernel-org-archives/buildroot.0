From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:25:42 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/opencv3: allow to
 use pkg-config while cross-compiling
Message-ID: <20190804201500.3B8FE89098@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e31ae72b62a909702834a17fa5e5a883184c200c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Since version 3.4.1 [1], opencv disable pkg-config while cross-compiling to
avoid host headers/libraries poisoning.

Due to this, opencv fail to detect ffmpeg, gstreamer and gtk dependencies
even if	the corresponding support is requested by
BR2_PACKAGE_OPENCV3_WITH_{FFMPEG,GSTREAMER,GTK2,GTK3}.

Maybe other dependencies are affected by this issue...

While configuring opencv we can notice the following messages:
"-- OpenCV disables pkg-config to avoid using of host libraries. Consider using PKG_CONFIG_LIBDIR to specify target SYSROOT"
"-- Can't find ffmpeg - 'pkg-config' utility is missing"

As the result ffmpeg and gstreamer are not enabled:
--   Video I/O:
--     FFMPEG:                      NO
--       avcodec:                   NO
--       avformat:                  NO
--       avutil:                    NO
--       swscale:                   NO
--       avresample:                NO
--     GStreamer:                   NO
--     libv4l/libv4l2:              NO
--     v4l/v4l2:                    linux/videodev2.h

We can fixes this by adding a new option OPENCV_ENABLE_PKG_CONFIG=ON

--   Video I/O:
--     FFMPEG:                      YES
--       avcodec:                   YES (ver 58.35.100)
--       avformat:                  YES (ver 58.20.100)
--       avutil:                    YES (ver 56.22.100)
--       swscale:                   YES (ver 5.3.100)
--       avresample:                YES (ver 4.0.0)
--     GStreamer:
--       base:                      YES (ver 1.16.0)
--       video:                     YES (ver 1.16.0)
--       app:                       YES (ver 1.16.0)
--       riff:                      YES (ver 1.16.0)
--       pbutils:                   YES (ver 1.16.0)
--     libv4l/libv4l2:              NO
--     v4l/v4l2:                    linux/videodev2.h

Add host-pkgconf in the dependencies.

If there is a path poisoning issue, it will be detected by the toolchain
paranoid wrapper.

[1] https://github.com/opencv/opencv/commit/c4f9ff0285130bd8bcf9d87a9ea6949bdd7e9e5d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 41f5ee957c3773f89e062f072402854ba3f5e673)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 49b29d9f1e..ae9e2c6e23 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -34,7 +34,8 @@ OPENCV3_CONF_OPTS += \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),ON,OFF) \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV3_BUILD_TESTS),ON,OFF) \
 	-DBUILD_WITH_DEBUG_INFO=OFF \
-	-DDOWNLOAD_EXTERNAL_TEST_DATA=OFF
+	-DDOWNLOAD_EXTERNAL_TEST_DATA=OFF \
+	-DOPENCV_ENABLE_PKG_CONFIG=ON
 
 ifeq ($(BR2_PACKAGE_OPENCV3_BUILD_TESTS)$(BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS),)
 OPENCV3_CONF_OPTS += -DINSTALL_TEST=OFF
@@ -225,7 +226,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_WEBP=OFF \
 	-DWITH_XINE=OFF
 
-OPENCV3_DEPENDENCIES += zlib
+OPENCV3_DEPENDENCIES += host-pkgconf zlib
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),y)
 OPENCV3_CONF_OPTS += -DWITH_FFMPEG=ON
