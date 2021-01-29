From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 30 Jan 2021 00:04:18 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/libcamera-apps: new package
In-Reply-To: <20210129230418.26359-1-ps.report@gmx.net>
References: <20210129230418.26359-1-ps.report@gmx.net>
Message-ID: <20210129230418.26359-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...afe-host-include-path-for-libdrm-use.patch | 29 ++++++++++
 ...unrecognized-gcc-command-line-option.patch | 32 ++++++++++
 ...ra_vid-fix-getline-call-needs-size_t.patch | 37 ++++++++++++
 ..._still-fix-getline-call-needs-size_t.patch | 35 +++++++++++
 ...-libcamera_app-fix-int64_t-constants.patch | 38 ++++++++++++
 ...006-cmake-fix-linking-with-exif-jpeg.patch | 47 +++++++++++++++
 .../0007-cmake-add-install-target.patch       | 24 ++++++++
 ...e-no-need-to-link-against-ipa_rpi.so.patch | 58 +++++++++++++++++++
 package/libcamera-apps/Config.in              | 33 +++++++++++
 package/libcamera-apps/libcamera-apps.hash    |  2 +
 package/libcamera-apps/libcamera-apps.mk      | 24 ++++++++
 13 files changed, 361 insertions(+)
 create mode 100644 package/libcamera-apps/0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
 create mode 100644 package/libcamera-apps/0002-cmake-remove-unrecognized-gcc-command-line-option.patch
 create mode 100644 package/libcamera-apps/0003-libcamera_vid-fix-getline-call-needs-size_t.patch
 create mode 100644 package/libcamera-apps/0004-libcamera_still-fix-getline-call-needs-size_t.patch
 create mode 100644 package/libcamera-apps/0005-libcamera_app-fix-int64_t-constants.patch
 create mode 100644 package/libcamera-apps/0006-cmake-fix-linking-with-exif-jpeg.patch
 create mode 100644 package/libcamera-apps/0007-cmake-add-install-target.patch
 create mode 100644 package/libcamera-apps/0008-cmake-no-need-to-link-against-ipa_rpi.so.patch
 create mode 100644 package/libcamera-apps/Config.in
 create mode 100644 package/libcamera-apps/libcamera-apps.hash
 create mode 100644 package/libcamera-apps/libcamera-apps.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c750105623..776f4083dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2098,6 +2098,7 @@ F:	package/gstreamer1/gst1-devtools/
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
index 0000000000..a9f534d573
--- /dev/null
+++ b/package/libcamera-apps/0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
@@ -0,0 +1,29 @@
+From 3a4fb5754aee7b1e0d1555e671d5c1de867b9b3e Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 20:13:17 +0100
+Subject: [PATCH] cmake: remove unsafe host include path for libdrm (use
+ pkgconfig instead)
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
index 0000000000..45c1c14f0b
--- /dev/null
+++ b/package/libcamera-apps/0002-cmake-remove-unrecognized-gcc-command-line-option.patch
@@ -0,0 +1,32 @@
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
diff --git a/package/libcamera-apps/0003-libcamera_vid-fix-getline-call-needs-size_t.patch b/package/libcamera-apps/0003-libcamera_vid-fix-getline-call-needs-size_t.patch
new file mode 100644
index 0000000000..5cbf5b8b30
--- /dev/null
+++ b/package/libcamera-apps/0003-libcamera_vid-fix-getline-call-needs-size_t.patch
@@ -0,0 +1,37 @@
+From 6f9970ac5bf0c258498764053a99540b11dffa27 Mon Sep 17 00:00:00 2001
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
diff --git a/package/libcamera-apps/0004-libcamera_still-fix-getline-call-needs-size_t.patch b/package/libcamera-apps/0004-libcamera_still-fix-getline-call-needs-size_t.patch
new file mode 100644
index 0000000000..0ecc880655
--- /dev/null
+++ b/package/libcamera-apps/0004-libcamera_still-fix-getline-call-needs-size_t.patch
@@ -0,0 +1,35 @@
+From 8c87cec99e1cf524f1207f4f855d65dc6b5ae498 Mon Sep 17 00:00:00 2001
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
diff --git a/package/libcamera-apps/0005-libcamera_app-fix-int64_t-constants.patch b/package/libcamera-apps/0005-libcamera_app-fix-int64_t-constants.patch
new file mode 100644
index 0000000000..5409f2d92c
--- /dev/null
+++ b/package/libcamera-apps/0005-libcamera_app-fix-int64_t-constants.patch
@@ -0,0 +1,38 @@
+From 8ce5fb5d7a28fad1e36f28b731b1c828e72e1a26 Mon Sep 17 00:00:00 2001
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
diff --git a/package/libcamera-apps/0006-cmake-fix-linking-with-exif-jpeg.patch b/package/libcamera-apps/0006-cmake-fix-linking-with-exif-jpeg.patch
new file mode 100644
index 0000000000..ffede34300
--- /dev/null
+++ b/package/libcamera-apps/0006-cmake-fix-linking-with-exif-jpeg.patch
@@ -0,0 +1,47 @@
+From 422d8193affdd7ccbe2d4726e1e6cf9e754e659d Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ac481e5..05c5de3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,17 +52,17 @@ target_link_libraries(libcamera-still common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_L
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
diff --git a/package/libcamera-apps/0007-cmake-add-install-target.patch b/package/libcamera-apps/0007-cmake-add-install-target.patch
new file mode 100644
index 0000000000..3c67506710
--- /dev/null
+++ b/package/libcamera-apps/0007-cmake-add-install-target.patch
@@ -0,0 +1,24 @@
+From 25fb6f16770b3eb9e4d34cff9d463ca1a6668ca9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 27 Jan 2021 23:27:53 +0100
+Subject: [PATCH] cmake: add install target
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 05c5de3..8d861bb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -68,3 +68,6 @@ project(libcamera-jpeg)
+ 
+ add_executable(libcamera-jpeg libcamera_jpeg.cpp)
+ target_link_libraries(libcamera-jpeg common "${LIBCAMERA_LIBRARY}" "${IPA_RPI_LIBRARY}" exif jpeg ${Boost_LIBRARIES} pthread "${X11_LIBRARIES}" "${EPOXY_LIBRARY}" "${DRM_LIBRARY}")
++
++install(TARGETS common encoders LIBRARY)
++install(TARGETS libcamera-still libcamera-vid libcamera-hello libcamera-raw libcamera-jpeg RUNTIME)
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/0008-cmake-no-need-to-link-against-ipa_rpi.so.patch b/package/libcamera-apps/0008-cmake-no-need-to-link-against-ipa_rpi.so.patch
new file mode 100644
index 0000000000..47dc96a34a
--- /dev/null
+++ b/package/libcamera-apps/0008-cmake-no-need-to-link-against-ipa_rpi.so.patch
@@ -0,0 +1,58 @@
+From 6c0461870da3621486767d075957547a065f53c8 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 29 Jan 2021 19:50:17 +0100
+Subject: [PATCH] cmake: no need to link against ipa_rpi.so
+
+Fixes:
+	$ libcamera-hello
+	libcamera-hello: error while loading shared libraries: ipa_rpi.so: cannot open shared object file: No such file or directory
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8d861bb..7c8efee 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -43,31 +43,28 @@ message(STATUS "${EPOXY_LIBRARY}")
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
+ install(TARGETS common encoders LIBRARY)
+ install(TARGETS libcamera-still libcamera-vid libcamera-hello libcamera-raw libcamera-jpeg RUNTIME)
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
new file mode 100644
index 0000000000..482e1186a0
--- /dev/null
+++ b/package/libcamera-apps/Config.in
@@ -0,0 +1,33 @@
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
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_BOOST
+        select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_LIBEXIF
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBCAMERA
+	help
+	  This is a small suite of libcamera-based apps that aim to copy
+	  the functionality of the existing "raspicam" apps.
+
+	  https://github.com/raspberrypi/libcamera-apps
+
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+#comment "libcamera-apps needs an OpenGL and/or OpenGL EGL backend"
+#	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
new file mode 100644
index 0000000000..089931e5ce
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  bf8589f560796327088e7172cf36942c668a3380f0bd6220238ea2b932e40faa  libcamera-apps-b1ca8997530f1f0290b291a956de359f2d4ce3e2-br1.tar.gz
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
new file mode 100644
index 0000000000..5ab2bf1bd6
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libcamera-apps
+#
+################################################################################
+
+LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/libcamera-apps.git
+LIBCAMERA_APPS_VERSION = b1ca8997530f1f0290b291a956de359f2d4ce3e2
+LIBCAMERA_APPS_SITE_METHOD = git
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
