From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  7 Feb 2021 11:40:33 +0100
Subject: [Buildroot] [PATCH v2] package/libcamera-apps: new package
Message-ID: <20210207104033.14572-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix Config.in indent (Thomas Petazzoni)
  - fix Config.in select ordering (Thomas Petazzoni)
  - fix Config.in comment regarding OpenGL
  - change download to use github macro (Thomas Petazzoni)
  - update 0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
    (add upstream link)
  - update 0002-cmake-remove-unrecognized-gcc-command-line-option.patch
    (add upstream link)
  - update 0003-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
    (new patch)
  - update 0004-libcamera_vid-fix-getline-call-needs-size_t.patch
    (add upstream link)
  - update 0005-libcamera_still-fix-getline-call-needs-size_t.patch
    (add upstream link)
  - update 0006-libcamera_app-fix-int64_t-constants.patch
    (add upstream link)
  - update 0007-cmake-fix-linking-with-exif-jpeg.patch
    (add upstream link)
  - update 0008-cmake-add-install-target.patch
    (add upstream link, update on upstream request to support older
    cmake versions - add DESTINATION defaults)
  - update 0009-cmake-no-need-to-link-against-ipa_rpi.so.patch
    (add upstream link)
  - update 0010-circular_output-fix-size_t-vs.-unsigned-int-narrowin.patch
    (new patch)
  - update 0011-egl_preview-fix-XVisualInfo-initializer.patch
    (new patch)
  - update 0012-jpeg-fix-long-unsigned-int-vs.-size_t-mismatch.patch
    (new patch)
  - update 0013-jpeg-fix-bool-vs.-boolean-mismatch.patch
    (new patch)
  - update 0014-mjpeg_encoder-fix-long-unsigned-int-vs.-size_t-misma.patch
    (new patch)
  - update 0015-mjpeg_encoder-fix-bool-vs.-boolean-mismatch.patch
    (new patch)

Notes:
  - Tested with test-pkg and the following two test configs

    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
    BR2_PACKAGE_MESA3D_DRIVER=y
    BR2_PACKAGE_MESA3D_GALLIUM_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
    BR2_PACKAGE_MESA3D_GBM=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XLIB_LIBX11=y
    BR2_PACKAGE_LIBEPOXY=y
    BR2_PACKAGE_LIBDRM=y
    BR2_PACKAGE_BOOST=y
    BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
    BR2_PACKAGE_LIBEXIF=y
    BR2_PACKAGE_JPEG=y
    BR2_PACKAGE_TIFF=y
    BR2_PACKAGE_LIBPNG=y
    BR2_PACKAGE_LIBCAMERA=y
    BR2_PACKAGE_LIBCAMERA_V4L2=y

    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
    BR2_PACKAGE_MESA3D_DRIVER=y
    BR2_PACKAGE_MESA3D_GALLIUM_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
    BR2_PACKAGE_MESA3D_GBM=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XLIB_LIBX11=y
    BR2_PACKAGE_LIBEPOXY=y
    BR2_PACKAGE_LIBDRM=y
    BR2_PACKAGE_BOOST=y
    BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
    BR2_PACKAGE_LIBEXIF=y
    BR2_PACKAGE_JPEG=y
    BR2_PACKAGE_TIFF=y
    BR2_PACKAGE_LIBPNG=y
    BR2_PACKAGE_LIBCAMERA=y
    BR2_PACKAGE_LIBCAMERA_V4L2=y

  - runtime tested on RPi4 as described here
    http://lists.busybox.net/pipermail/buildroot/2021-January/302373.html
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 ...afe-host-include-path-for-libdrm-use.patch |  31 +++++
 ...unrecognized-gcc-command-line-option.patch |  33 ++++++
 ...tal-errors-compiler-command-line-opt.patch |  25 ++++
 ...ra_vid-fix-getline-call-needs-size_t.patch |  38 ++++++
 ..._still-fix-getline-call-needs-size_t.patch |  38 ++++++
 ...-libcamera_app-fix-int64_t-constants.patch |  39 +++++++
 ...007-cmake-fix-linking-with-exif-jpeg.patch |  48 ++++++++
 .../0008-cmake-add-install-target.patch       |  25 ++++
 ...e-no-need-to-link-against-ipa_rpi.so.patch |  59 ++++++++++
 ...fix-size_t-vs.-unsigned-int-narrowin.patch |  38 ++++++
 ..._preview-fix-XVisualInfo-initializer.patch |  38 ++++++
 ...ong-unsigned-int-vs.-size_t-mismatch.patch | 109 ++++++++++++++++++
 ...3-jpeg-fix-bool-vs.-boolean-mismatch.patch |  36 ++++++
 ...x-long-unsigned-int-vs.-size_t-misma.patch |  89 ++++++++++++++
 ...ncoder-fix-bool-vs.-boolean-mismatch.patch |  37 ++++++
 package/libcamera-apps/Config.in              |  31 +++++
 package/libcamera-apps/libcamera-apps.hash    |   2 +
 package/libcamera-apps/libcamera-apps.mk      |  23 ++++
 20 files changed, 741 insertions(+)
 create mode 100644 package/libcamera-apps/0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
 create mode 100644 package/libcamera-apps/0002-cmake-remove-unrecognized-gcc-command-line-option.patch
 create mode 100644 package/libcamera-apps/0003-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
 create mode 100644 package/libcamera-apps/0004-libcamera_vid-fix-getline-call-needs-size_t.patch
 create mode 100644 package/libcamera-apps/0005-libcamera_still-fix-getline-call-needs-size_t.patch
 create mode 100644 package/libcamera-apps/0006-libcamera_app-fix-int64_t-constants.patch
 create mode 100644 package/libcamera-apps/0007-cmake-fix-linking-with-exif-jpeg.patch
 create mode 100644 package/libcamera-apps/0008-cmake-add-install-target.patch
 create mode 100644 package/libcamera-apps/0009-cmake-no-need-to-link-against-ipa_rpi.so.patch
 create mode 100644 package/libcamera-apps/0010-circular_output-fix-size_t-vs.-unsigned-int-narrowin.patch
 create mode 100644 package/libcamera-apps/0011-egl_preview-fix-XVisualInfo-initializer.patch
 create mode 100644 package/libcamera-apps/0012-jpeg-fix-long-unsigned-int-vs.-size_t-mismatch.patch
 create mode 100644 package/libcamera-apps/0013-jpeg-fix-bool-vs.-boolean-mismatch.patch
 create mode 100644 package/libcamera-apps/0014-mjpeg_encoder-fix-long-unsigned-int-vs.-size_t-misma.patch
 create mode 100644 package/libcamera-apps/0015-mjpeg_encoder-fix-bool-vs.-boolean-mismatch.patch
 create mode 100644 package/libcamera-apps/Config.in
 create mode 100644 package/libcamera-apps/libcamera-apps.hash
 create mode 100644 package/libcamera-apps/libcamera-apps.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 64d770e9fc..ae0e2f407d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2100,6 +2100,7 @@ F:	package/gstreamer1/gst1-devtools/
 F:	package/gstreamer1/gst1-interpipe/
 F:	package/gstreamer1/gstreamer1-editing-services/
 F:	package/iwd/
+F:	package/libcamera-apps/
 F:	package/libevdev/
 F:	package/libuev/
 F:	package/log4cplus/
diff --git a/package/Config.in b/package/Config.in
index 06dfc32cc6..5637e39568 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1673,6 +1673,7 @@ menu "Multimedia"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libcamera/Config.in"
+	source "package/libcamera-apps/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
diff --git a/package/libcamera-apps/0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch b/package/libcamera-apps/0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
new file mode 100644
index 0000000000..5854a934ac
--- /dev/null
+++ b/package/libcamera-apps/0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
@@ -0,0 +1,31 @@
+From 3a4fb5754aee7b1e0d1555e671d5c1de867b9b3e Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 20:13:17 +0100
+Subject: [PATCH] cmake: remove unsafe host include path for libdrm (use
+ pkgconfig instead)
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 85d2b5d..c02f200 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -25,8 +25,9 @@ project(libcamera-still)
+ 
+ find_package(PkgConfig REQUIRED)
+ pkg_check_modules(CAMERA REQUIRED camera)
++pkg_check_modules(LIBDRM REQUIRED libdrm)
+ 
+-include_directories(. "${CAMERA_INCLUDE_DIRS}" /usr/include/libdrm)
++include_directories(. "${CAMERA_INCLUDE_DIRS}" "${LIBDRM_INCLUDE_DIRS}")
+ 
+ find_package( Boost REQUIRED COMPONENTS program_options )
+ 
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0002-cmake-remove-unrecognized-gcc-command-line-option.patch b/package/libcamera-apps/0002-cmake-remove-unrecognized-gcc-command-line-option.patch
new file mode 100644
index 0000000000..f0349a4248
--- /dev/null
+++ b/package/libcamera-apps/0002-cmake-remove-unrecognized-gcc-command-line-option.patch
@@ -0,0 +1,33 @@
+From d44000554d524bd3aff70362e8dcb568d79b34af Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 22:35:03 +0100
+Subject: [PATCH] cmake: remove unrecognized gcc command-line option
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  aarch64-buildroot-linux-gnu-g++.br_real: error: unrecognized command-line option ?-mfpu=neon-fp-armv8?
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c02f200..ac481e5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,7 +13,6 @@ set (CMAKE CXX_FLAGS "-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-ne
+ add_definitions(-Wfatal-errors)
+ add_definitions(-Wno-psabi)
+ add_definitions(-DBOOST_LOG_DYN_LINK)
+-add_definitions(-mfpu=neon-fp-armv8 -ftree-vectorize)
+ 
+ project(common)
+ add_library(common output.cpp file_output.cpp net_output.cpp circular_output.cpp egl_preview.cpp drm_preview.cpp jpeg.cpp)
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0003-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch b/package/libcamera-apps/0003-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
new file mode 100644
index 0000000000..89a9028322
--- /dev/null
+++ b/package/libcamera-apps/0003-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
@@ -0,0 +1,25 @@
+From eac5e15054b5fb85ed6d28177548fd1461e39b32 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 5 Feb 2021 18:24:08 +0100
+Subject: [PATCH] cmake: remove -Wfatal-errors compiler command line option
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ac481e5..22f4bdf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10,7 +10,6 @@ endif()
+ set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
+ set (CMAKE_CXX_STANDARD 17)
+ set (CMAKE CXX_FLAGS "-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new")
+-add_definitions(-Wfatal-errors)
+ add_definitions(-Wno-psabi)
+ add_definitions(-DBOOST_LOG_DYN_LINK)
+ 
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0004-libcamera_vid-fix-getline-call-needs-size_t.patch b/package/libcamera-apps/0004-libcamera_vid-fix-getline-call-needs-size_t.patch
new file mode 100644
index 0000000000..807ec67179
--- /dev/null
+++ b/package/libcamera-apps/0004-libcamera_vid-fix-getline-call-needs-size_t.patch
@@ -0,0 +1,38 @@
+From 376983f7959ea2d159f16f081dd7ced79e61a323 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 23:06:23 +0100
+Subject: [PATCH] libcamera_vid: fix getline call (needs size_t)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+.../libcamera-apps-custom/libcamera_vid.cpp:39:26: error: cannot convert ?unsigned int*? to ?size_t*? {aka ?long unsigned int*?}
+   39 |    getline(&user_string, &len, stdin);
+      |                          ^~~~
+      |                          |
+      |                          unsigned int*
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ libcamera_vid.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcamera_vid.cpp b/libcamera_vid.cpp
+index 40a5fcb..7b573c0 100644
+--- a/libcamera_vid.cpp
++++ b/libcamera_vid.cpp
+@@ -35,7 +35,7 @@ static int get_key_or_signal(VideoOptions const &options, pollfd p[1])
+ 		if (p[0].revents & POLLIN)
+ 		{
+ 			char *user_string = nullptr;
+-			unsigned int len;
++			size_t len;
+ 			getline(&user_string, &len, stdin);
+ 			key = user_string[0];
+ 		}
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0005-libcamera_still-fix-getline-call-needs-size_t.patch b/package/libcamera-apps/0005-libcamera_still-fix-getline-call-needs-size_t.patch
new file mode 100644
index 0000000000..46eb65efcf
--- /dev/null
+++ b/package/libcamera-apps/0005-libcamera_still-fix-getline-call-needs-size_t.patch
@@ -0,0 +1,38 @@
+From 2115fae3c7a59c2f293ee31a224fba3d1804b5d7 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 23:08:18 +0100
+Subject: [PATCH] libcamera_still: fix getline call (needs size_t)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+.../build/libcamera-apps-custom/libcamera_still.cpp:152:26: error: cannot convert ?unsigned int*? to ?size_t*? {aka ?long unsigned int*?}
+  152 |    getline(&user_string, &len, stdin);
+      |                          ^~~~
+      |                          |
+      |                          unsigned int*
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ libcamera_still.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcamera_still.cpp b/libcamera_still.cpp
+index fb74996..c951669 100644
+--- a/libcamera_still.cpp
++++ b/libcamera_still.cpp
+@@ -148,7 +148,7 @@ static int get_key_or_signal(StillOptions const &options, pollfd p[1])
+ 		if (p[0].revents & POLLIN)
+ 		{
+ 			char *user_string = nullptr;
+-			unsigned int len;
++			size_t len;
+ 			getline(&user_string, &len, stdin);
+ 			key = user_string[0];
+ 		}
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0006-libcamera_app-fix-int64_t-constants.patch b/package/libcamera-apps/0006-libcamera_app-fix-int64_t-constants.patch
new file mode 100644
index 0000000000..a4488edb6e
--- /dev/null
+++ b/package/libcamera-apps/0006-libcamera_app-fix-int64_t-constants.patch
@@ -0,0 +1,39 @@
+From 2b7223d112c504082a87cf9d9dd5fdc264c2238a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 28 Jan 2021 22:40:22 +0100
+Subject: [PATCH] libcamera_app: fix int64_t constants
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+.../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libcamera/libcamera/controls.h: In instantiation of ?void libcamera::ControlList::set(const libcamera::Control<T>&, const std::initializer_list<_Up>&) [with T = libcamera::Span<const long int>; V = long long int]?:
+.../libcamera_app.hpp:331:18:   required from ?void LibcameraApp<OPTIONS>::StartCamera() [with OPTIONS = StillOptions]?
+.../libcamera_jpeg.cpp:35:18:   required from here
+.../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libcamera/libcamera/controls.h:399:14: error: no matching function for call to ?libcamera::ControlValue::set<libcamera::Span<const long int, 18446744073709551615> >(libcamera::Span<const long long int, 18446744073709551615>)?
+  399 |   val->set<T>(Span<const typename std::remove_cv_t<V>>{ value.begin(), value.size() });
+      |   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ libcamera_app.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcamera_app.hpp b/libcamera_app.hpp
+index 7be0f7a..02b71cb 100644
+--- a/libcamera_app.hpp
++++ b/libcamera_app.hpp
+@@ -328,7 +328,7 @@ public:
+ 		if (!controls_.contains(controls::FrameDurations))
+ 		{
+ 			if (still_stream_)
+-				controls_.set(controls::FrameDurations, { 100LL, 1000000000LL });
++				controls_.set(controls::FrameDurations, { INT64_C(100), INT64_C(1000000000) });
+ 			else if (options.framerate > 0)
+ 			{
+ 				int64_t frame_time = 1000000 / options.framerate; // in us
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0007-cmake-fix-linking-with-exif-jpeg.patch b/package/libcamera-apps/0007-cmake-fix-linking-with-exif-jpeg.patch
new file mode 100644
index 0000000000..acb7a1d79f
--- /dev/null
+++ b/package/libcamera-apps/0007-cmake-fix-linking-with-exif-jpeg.patch
@@ -0,0 +1,48 @@
+From 05cb914af765df759460bf62ee44720a27a36996 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 23:24:33 +0100
+Subject: [PATCH] cmake: fix linking with exif, jpeg
+
+Fixes:
+
+  [ 66%] Linking CXX executable libcamera-hello
+  .../aarch64-buildroot-linux-gnu/bin/ld: libcommon.so: undefined reference to `jpeg_std_error'
+  .../aarch64-buildroot-linux-gnu/bin/ld: libcommon.so: undefined reference to `exif_set_slong'
+
+  [ 92%] Linking CXX executable libcamera-vid
+  .../aarch64-buildroot-linux-gnu/bin/ld: libcommon.so: undefined reference to `exif_set_slong'
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 22f4bdf..508b55a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -51,17 +51,17 @@ target_link_libraries(libcamera-still common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_L
+ project(libcamera-vid)
+ 
+ add_executable(libcamera-vid libcamera_vid.cpp)
+-target_link_libraries(libcamera-vid encoders common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" ${Boost_LIBRARIES} pthread jpeg "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-vid encoders common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif ${Boost_LIBRARIES} pthread jpeg "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ project(libcamera-hello)
+ 
+ add_executable(libcamera-hello libcamera_hello.cpp)
+-target_link_libraries(libcamera-hello common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-hello common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif ${Boost_LIBRARIES} jpeg pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ project(libcamera-raw)
+ 
+ add_executable(libcamera-raw libcamera_raw.cpp)
+-target_link_libraries(libcamera-raw encoders common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-raw encoders common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ project(libcamera-jpeg)
+ 
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0008-cmake-add-install-target.patch b/package/libcamera-apps/0008-cmake-add-install-target.patch
new file mode 100644
index 0000000000..92aa2d2bd3
--- /dev/null
+++ b/package/libcamera-apps/0008-cmake-add-install-target.patch
@@ -0,0 +1,25 @@
+From 82a59d2e414e7215a8711e84df719e76c0de576e Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 23:27:53 +0100
+Subject: [PATCH] cmake: add install target
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 508b55a..8796d52 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -67,3 +67,6 @@ project(libcamera-jpeg)
+ 
+ add_executable(libcamera-jpeg libcamera_jpeg.cpp)
+ target_link_libraries(libcamera-jpeg common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++
++install(TARGETS common encoders LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
++install(TARGETS libcamera-still libcamera-vid libcamera-hello libcamera-raw libcamera-jpeg RUNTIME DESTINATION bin)
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0009-cmake-no-need-to-link-against-ipa_rpi.so.patch b/package/libcamera-apps/0009-cmake-no-need-to-link-against-ipa_rpi.so.patch
new file mode 100644
index 0000000000..417d8dc396
--- /dev/null
+++ b/package/libcamera-apps/0009-cmake-no-need-to-link-against-ipa_rpi.so.patch
@@ -0,0 +1,59 @@
+From e99ca42fcc56bc8fec928a208790594b6fa54b3f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 29 Jan 2021 19:50:17 +0100
+Subject: [PATCH] cmake: no need to link against ipa_rpi.so
+
+Fixes:
+	$ libcamera-hello
+	libcamera-hello: error while loading shared libraries: ipa_rpi.so: cannot open shared object file: No such file or directory
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8796d52..b760c2f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -42,31 +42,28 @@ message(STATUS "${EPOXY_LIBRARY}")
+ find_library(DRM_LIBRARY libdrm.so REQUIRED)
+ message(STATUS "${DRM_LIBRARY}")
+ 
+-find_library(IPA_RPI_LIBRARY ipa_rpi.so PATHS "${CAMERA_LIBRARY_DIRS}/libcamera" REQUIRED)
+-message(STATUS "${IPA_RPI_LIBRARY}")
+-
+ add_executable(libcamera-still libcamera_still.cpp yuv.cpp dng.cpp png.cpp bmp.cpp)
+-target_link_libraries(libcamera-still common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif ${Boost_LIBRARIES} jpeg tiff png pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-still common "${LIBCAMERA_LIBRARY}" exif ${Boost_LIBRARIES} jpeg tiff png pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ project(libcamera-vid)
+ 
+ add_executable(libcamera-vid libcamera_vid.cpp)
+-target_link_libraries(libcamera-vid encoders common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif ${Boost_LIBRARIES} pthread jpeg "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-vid encoders common "${LIBCAMERA_LIBRARY}" exif ${Boost_LIBRARIES} pthread jpeg "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ project(libcamera-hello)
+ 
+ add_executable(libcamera-hello libcamera_hello.cpp)
+-target_link_libraries(libcamera-hello common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif ${Boost_LIBRARIES} jpeg pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-hello common "${LIBCAMERA_LIBRARY}" exif ${Boost_LIBRARIES} jpeg pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ project(libcamera-raw)
+ 
+ add_executable(libcamera-raw libcamera_raw.cpp)
+-target_link_libraries(libcamera-raw encoders common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-raw encoders common "${LIBCAMERA_LIBRARY}" exif jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ project(libcamera-jpeg)
+ 
+ add_executable(libcamera-jpeg libcamera_jpeg.cpp)
+-target_link_libraries(libcamera-jpeg common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++target_link_libraries(libcamera-jpeg common "${LIBCAMERA_LIBRARY}" exif jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
+ 
+ install(TARGETS common encoders LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
+ install(TARGETS libcamera-still libcamera-vid libcamera-hello libcamera-raw libcamera-jpeg RUNTIME DESTINATION bin)
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0010-circular_output-fix-size_t-vs.-unsigned-int-narrowin.patch b/package/libcamera-apps/0010-circular_output-fix-size_t-vs.-unsigned-int-narrowin.patch
new file mode 100644
index 0000000000..3a8998f5ff
--- /dev/null
+++ b/package/libcamera-apps/0010-circular_output-fix-size_t-vs.-unsigned-int-narrowin.patch
@@ -0,0 +1,38 @@
+From 0e0d831fe788832a21914800d14c7edc976eb726 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 30 Jan 2021 18:55:23 +0100
+Subject: [PATCH] circular_output: fix size_t vs. unsigned int narrowing
+ conversion
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/circular_output.cpp: In member function ?virtual void CircularOutput::outputBuffer(void*, size_t, int64_t, uint32_t)?:
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/circular_output.cpp:72:62: warning: narrowing conversion of ?size? from ?size_t {aka long unsigned int}? to ?unsigned int? inside { } [-Wnarrowing]
+    Header header = { size, flags & FLAG_KEYFRAME, timestamp_us };
+                                                                ^
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ circular_output.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/circular_output.cpp b/circular_output.cpp
+index e00b6b1..cbbfc3c 100644
+--- a/circular_output.cpp
++++ b/circular_output.cpp
+@@ -69,7 +69,7 @@ void CircularOutput::outputBuffer(void *mem, size_t size, int64_t timestamp_us,
+ 		cb_.Read([&dst](void *src, int n) { memcpy(dst, src, n); dst += n; }, sizeof(header));
+ 		cb_.Skip((header.length + ALIGN - 1) & ~(ALIGN - 1));
+ 	}
+-	Header header = { size, flags & FLAG_KEYFRAME, timestamp_us };
++	Header header = { static_cast<unsigned int>(size), flags & FLAG_KEYFRAME, timestamp_us };
+ 	cb_.Write(&header, sizeof(header));
+ 	cb_.Write(mem, size);
+ 	cb_.Pad(pad);
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0011-egl_preview-fix-XVisualInfo-initializer.patch b/package/libcamera-apps/0011-egl_preview-fix-XVisualInfo-initializer.patch
new file mode 100644
index 0000000000..363cbca9d2
--- /dev/null
+++ b/package/libcamera-apps/0011-egl_preview-fix-XVisualInfo-initializer.patch
@@ -0,0 +1,38 @@
+From 35fddf9c0bb6845e1ab562c125a611b24d2cbedd Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 30 Jan 2021 19:06:59 +0100
+Subject: [PATCH] egl_preview: fix XVisualInfo initializer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/egl_preview.cpp: In member function ?void EglPreview::makeWindow(const char*)?:
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/egl_preview.cpp:219:65: sorry, unimplemented: non-trivial designated initializers not supported
+    XVisualInfo visTemplate = { .visualid = (long unsigned int)vid };
+                                                                   ^
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ egl_preview.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/egl_preview.cpp b/egl_preview.cpp
+index 5b2c64b..9dd3652 100644
+--- a/egl_preview.cpp
++++ b/egl_preview.cpp
+@@ -216,7 +216,8 @@ void EglPreview::makeWindow(char const *name)
+ 	if (!eglGetConfigAttrib(egl_display_, config, EGL_NATIVE_VISUAL_ID, &vid))
+ 		throw std::runtime_error("eglGetConfigAttrib() failed\n");
+ 
+-	XVisualInfo visTemplate = { .visualid = (long unsigned int)vid };
++	XVisualInfo visTemplate = {};
++	visTemplate.visualid = (VisualID)vid;
+ 	int num_visuals;
+ 	XVisualInfo *visinfo = XGetVisualInfo(display_, VisualIDMask,
+                                          &visTemplate, &num_visuals);
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0012-jpeg-fix-long-unsigned-int-vs.-size_t-mismatch.patch b/package/libcamera-apps/0012-jpeg-fix-long-unsigned-int-vs.-size_t-mismatch.patch
new file mode 100644
index 0000000000..d47a2644df
--- /dev/null
+++ b/package/libcamera-apps/0012-jpeg-fix-long-unsigned-int-vs.-size_t-mismatch.patch
@@ -0,0 +1,109 @@
+From 76ec94fb4cda03f7a74bf92d050b558884e0dace Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 3 Feb 2021 23:46:21 +0100
+Subject: [PATCH] jpeg: fix long unsigned int vs. size_t mismatch
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Introduce a custom jpeg_mem_len_t as the jpeg_mem_dest() signature
+changed since jpegsrc.v9d from 'unsigned long * outsize' to
+'size_t * outsize'.
+
+Fixes:
+
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/jpeg.cpp:270:41: error: invalid conversion from ?long unsigned int*? to ?size_t*? {aka ?unsigned int*?} [-fpermissive]
+    270 |     jpeg_mem_dest(&cinfo, &jpeg_buffer, &jpeg_len);
+        |                                         ^~~~~~~~~
+        |                                         |
+        |                                         long unsigned int*
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ jpeg.cpp | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/jpeg.cpp b/jpeg.cpp
+index 436284a..43a6496 100644
+--- a/jpeg.cpp
++++ b/jpeg.cpp
+@@ -23,6 +23,12 @@
+ 
+ #include "still_options.hpp"
+ 
++#if JPEG_LIB_VERSION_MAJOR > 9 || (JPEG_LIB_VERSION_MAJOR == 9 && JPEG_LIB_VERSION_MINOR >= 4)
++typedef size_t jpeg_mem_len_t;
++#else
++typedef unsigned long jpeg_mem_len_t;
++#endif
++
+ using namespace libcamera;
+ 
+ typedef int (*ExifReadFunction)(char const *, unsigned char *);
+@@ -249,7 +255,7 @@ static void YUYV_to_JPEG(const uint8_t *input,
+ 						 const int input_width, const int input_height, const int stride,
+ 						 const int output_width, const int output_height,
+ 						 const int quality, const unsigned int restart,
+-						 uint8_t *&jpeg_buffer, long unsigned int &jpeg_len)
++						 uint8_t *&jpeg_buffer, jpeg_mem_len_t &jpeg_len)
+ {
+     struct jpeg_compress_struct cinfo;
+     struct jpeg_error_mgr jerr;
+@@ -304,7 +310,7 @@ static void YUYV_to_JPEG(const uint8_t *input,
+ static void YUV420_to_JPEG_fast(const uint8_t *input,
+ 								const int width, const int height, const int stride,
+ 								const int quality, const unsigned int restart,
+-								uint8_t *&jpeg_buffer, long unsigned int &jpeg_len)
++								uint8_t *&jpeg_buffer, jpeg_mem_len_t &jpeg_len)
+ {
+     struct jpeg_compress_struct cinfo;
+     struct jpeg_error_mgr jerr;
+@@ -377,7 +383,7 @@ static void YUV420_to_JPEG(const uint8_t *input,
+ 						   const int input_width, const int input_height, const int stride,
+ 						   const int output_width, const int output_height,
+ 						   const int quality, const unsigned int restart,
+-						   uint8_t *&jpeg_buffer, long unsigned int &jpeg_len)
++						   uint8_t *&jpeg_buffer, jpeg_mem_len_t &jpeg_len)
+ {
+ 	if (input_width == output_width && input_height == output_height)
+ 	{
+@@ -446,7 +452,7 @@ static void YUV_to_JPEG(PixelFormat const &pixel_format, const uint8_t *input,
+ 						const int input_width, const int input_height, const int stride,
+ 						const int output_width, const int output_height,
+ 						const int quality, const unsigned int restart,
+-						uint8_t *&jpeg_buffer, long unsigned int &jpeg_len)
++						uint8_t *&jpeg_buffer, jpeg_mem_len_t &jpeg_len)
+ {
+ 	if (pixel_format == libcamera::formats::YUYV)
+ 		YUYV_to_JPEG(input, input_width, input_height, stride,
+@@ -467,7 +473,7 @@ static void create_exif_data(PixelFormat const &pixel_format,
+ 							 ControlList const &metadata,
+ 							 std::string const &cam_name, StillOptions const &options,
+ 							 uint8_t *&exif_buffer, unsigned int &exif_len,
+-							 uint8_t *&thumb_buffer, long unsigned int &thumb_len)
++							 uint8_t *&thumb_buffer, jpeg_mem_len_t &thumb_len)
+ {
+ 	exif_buffer = nullptr;
+ 	ExifData *exif = nullptr;
+@@ -616,7 +622,7 @@ void jpeg_save(std::vector<void *> const &mem, int w, int h, int stride,
+ 
+ 		// Make all the EXIF data, which includes the thumbnail.
+ 
+-		long unsigned int thumb_len;
++		jpeg_mem_len_t thumb_len;
+ 		unsigned int exif_len;
+ 		create_exif_data(pixel_format, mem, w, h, stride, metadata, cam_name, options,
+ 						 exif_buffer, exif_len, thumb_buffer, thumb_len);
+@@ -624,7 +630,7 @@ void jpeg_save(std::vector<void *> const &mem, int w, int h, int stride,
+ 		// Make the full size JPEG (could probably be more efficient if we had
+ 		// YUV422 or YUV420 planar format).
+ 
+-		long unsigned int jpeg_len;
++		jpeg_mem_len_t jpeg_len;
+ 		YUV_to_JPEG(pixel_format, (uint8_t *)(mem[0]), w, h, stride, w, h,
+ 					 options.quality, options.restart, jpeg_buffer, jpeg_len);
+ 		if (options.verbose)
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0013-jpeg-fix-bool-vs.-boolean-mismatch.patch b/package/libcamera-apps/0013-jpeg-fix-bool-vs.-boolean-mismatch.patch
new file mode 100644
index 0000000000..9c076f0684
--- /dev/null
+++ b/package/libcamera-apps/0013-jpeg-fix-bool-vs.-boolean-mismatch.patch
@@ -0,0 +1,36 @@
+From 60ea8ce1d07a88b61e7acbe15b8f020ad9acdca4 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 3 Feb 2021 23:48:12 +0100
+Subject: [PATCH] jpeg: fix bool vs. boolean mismatch
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/mjpeg_encoder.cpp:57:22: error: cannot convert ?bool? to ?boolean? in assignment
+     57 |  cinfo.raw_data_in = true;
+        |                      ^~~~
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ jpeg.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jpeg.cpp b/jpeg.cpp
+index 43a6496..a8fb792 100644
+--- a/jpeg.cpp
++++ b/jpeg.cpp
+@@ -325,7 +325,7 @@ static void YUV420_to_JPEG_fast(const uint8_t *input,
+ 	cinfo.restart_interval = restart;
+ 
+     jpeg_set_defaults(&cinfo);
+-	cinfo.raw_data_in = true;
++	cinfo.raw_data_in = TRUE;
+     jpeg_set_quality(&cinfo, quality, TRUE);
+ 	jpeg_buffer = NULL;
+ 	jpeg_len = 0;
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0014-mjpeg_encoder-fix-long-unsigned-int-vs.-size_t-misma.patch b/package/libcamera-apps/0014-mjpeg_encoder-fix-long-unsigned-int-vs.-size_t-misma.patch
new file mode 100644
index 0000000000..93e8fd273b
--- /dev/null
+++ b/package/libcamera-apps/0014-mjpeg_encoder-fix-long-unsigned-int-vs.-size_t-misma.patch
@@ -0,0 +1,89 @@
+From 16e9da0fd846b6ba8c8edd5107285123c98ae40c Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 3 Feb 2021 23:50:18 +0100
+Subject: [PATCH] mjpeg_encoder: fix long unsigned int vs. size_t mismatch
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Introduce a custom jpeg_mem_len_t as the jpeg_mem_dest() signature
+changed since jpegsrc.v9d from 'unsigned long * outsize' to
+'size_t * outsize'.
+
+Fixes:
+
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/mjpeg_encoder.cpp:61:44: error: invalid conversion from ?long unsigned int*? to ?size_t*? {aka ?unsigned int*?} [-fpermissive]
+     61 |     jpeg_mem_dest(&cinfo, &encoded_buffer, &buffer_len);
+        |                                            ^~~~~~~~~~~
+        |                                            |
+        |                                            long unsigned int*
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ mjpeg_encoder.cpp | 14 +++++++++++---
+ mjpeg_encoder.hpp |  2 +-
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/mjpeg_encoder.cpp b/mjpeg_encoder.cpp
+index 84dcb46..74b177b 100644
+--- a/mjpeg_encoder.cpp
++++ b/mjpeg_encoder.cpp
+@@ -12,6 +12,12 @@
+ 
+ #include "mjpeg_encoder.hpp"
+ 
++#if JPEG_LIB_VERSION_MAJOR > 9 || (JPEG_LIB_VERSION_MAJOR == 9 && JPEG_LIB_VERSION_MINOR >= 4)
++typedef size_t jpeg_mem_len_t;
++#else
++typedef unsigned long jpeg_mem_len_t;
++#endif
++
+ MjpegEncoder::MjpegEncoder(VideoOptions const &options)
+ 	: Encoder(options), abort_(false), index_(0)
+ {
+@@ -44,7 +50,7 @@ int MjpegEncoder::EncodeBuffer(int fd, size_t size,
+ }
+ 
+ void MjpegEncoder::encodeJPEG(struct jpeg_compress_struct &cinfo, EncodeItem &item,
+-							  uint8_t *&encoded_buffer, long unsigned int &buffer_len)
++							  uint8_t *&encoded_buffer, size_t &buffer_len)
+ {
+ 	// Copied from YUV420_to_JPEG_fast in jpeg.cpp.
+     cinfo.image_width = item.width;
+@@ -58,7 +64,9 @@ void MjpegEncoder::encodeJPEG(struct jpeg_compress_struct &cinfo, EncodeItem &it
+     jpeg_set_quality(&cinfo, options_.quality, TRUE);
+ 	encoded_buffer = nullptr;
+ 	buffer_len = 0;
+-    jpeg_mem_dest(&cinfo, &encoded_buffer, &buffer_len);
++    jpeg_mem_len_t jpeg_mem_len;
++    jpeg_mem_dest(&cinfo, &encoded_buffer, &jpeg_mem_len);
++    buffer_len = jpeg_mem_len;
+     jpeg_start_compress(&cinfo, TRUE);
+ 
+ 	int stride2 = item.stride / 2;
+@@ -145,7 +153,7 @@ void MjpegEncoder::encodeThread(int num)
+ 
+ 		// Encode the buffer.
+ 		uint8_t *encoded_buffer = nullptr;
+-		long unsigned int buffer_len = 0;
++		size_t buffer_len = 0;
+ 		auto start_time = std::chrono::high_resolution_clock::now();
+ 		encodeJPEG(cinfo, encode_item, encoded_buffer, buffer_len);
+ 		encode_time += (std::chrono::high_resolution_clock::now() - start_time);
+diff --git a/mjpeg_encoder.hpp b/mjpeg_encoder.hpp
+index d93a48d..82c6d4d 100644
+--- a/mjpeg_encoder.hpp
++++ b/mjpeg_encoder.hpp
+@@ -55,7 +55,7 @@ private:
+ 	std::condition_variable encode_cond_var_;
+ 	std::thread encode_thread_[NUM_ENC_THREADS];
+ 	void encodeJPEG(struct jpeg_compress_struct &cinfo, EncodeItem &item,
+-					uint8_t *&encoded_buffer, long unsigned int &buffer_len);
++					uint8_t *&encoded_buffer, size_t &buffer_len);
+ 
+ 	struct OutputItem
+ 	{
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0015-mjpeg_encoder-fix-bool-vs.-boolean-mismatch.patch b/package/libcamera-apps/0015-mjpeg_encoder-fix-bool-vs.-boolean-mismatch.patch
new file mode 100644
index 0000000000..3eb9ede5c6
--- /dev/null
+++ b/package/libcamera-apps/0015-mjpeg_encoder-fix-bool-vs.-boolean-mismatch.patch
@@ -0,0 +1,37 @@
+From 643c46696a117268224bd5c658de7c2f3cb61f06 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 3 Feb 2021 23:52:40 +0100
+Subject: [PATCH] mjpeg_encoder: fix bool vs. boolean mismatch
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  .../libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2/mjpeg_encoder.cpp:57:22: error: cannot convert ?bool? to ?boolean? in assignment
+     57 |  cinfo.raw_data_in = true;
+        |                      ^~~~
+  compilation terminated due to -Wfatal-errors.
+
+Upstream: https://github.com/raspberrypi/libcamera-apps/pull/1
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ mjpeg_encoder.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mjpeg_encoder.cpp b/mjpeg_encoder.cpp
+index 74b177b..caabd52 100644
+--- a/mjpeg_encoder.cpp
++++ b/mjpeg_encoder.cpp
+@@ -60,7 +60,7 @@ void MjpegEncoder::encodeJPEG(struct jpeg_compress_struct &cinfo, EncodeItem &it
+ 	cinfo.restart_interval = 0;
+ 
+     jpeg_set_defaults(&cinfo);
+-	cinfo.raw_data_in = true;
++	cinfo.raw_data_in = TRUE;
+     jpeg_set_quality(&cinfo, options_.quality, TRUE);
+ 	encoded_buffer = nullptr;
+ 	buffer_len = 0;
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
new file mode 100644
index 0000000000..08667eb830
--- /dev/null
+++ b/package/libcamera-apps/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_LIBCAMERA_APPS
+	bool "libcamera-apps"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
+	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost/libdrm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
+	depends on !BR2_STATIC_LIBS # gnutls/libcamera
+	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCAMERA
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBEXIF
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  This is a small suite of libcamera-based apps that aim to copy
+	  the functionality of the existing "raspicam" apps.
+
+	  https://github.com/raspberrypi/libcamera-apps
+
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7 and needs an OpenGL and/or OpenGL EGL backend"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
new file mode 100644
index 0000000000..869e56885d
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  cef1d76b2efc329a20f207444dbd8f8aa05cf2f94c1cfd0115f8cf4b3ac91afe  libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2.tar.gz
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
new file mode 100644
index 0000000000..b43d217f09
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# libcamera-apps
+#
+################################################################################
+
+LIBCAMERA_APPS_VERSION = b1ca8997530f1f0290b291a956de359f2d4ce3e2
+LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_LICENSE = BSD-2-Clause
+
+LIBCAMERA_APPS_DEPENDENCIES = \
+	host-pkgconf \
+	boost \
+	jpeg \
+	libcamera \
+	libdrm \
+	libexif \
+	libepoxy \
+	libpng \
+	tiff \
+	xlib_libX11
+
+$(eval $(cmake-package))
-- 
2.30.0
