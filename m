From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:13:35 +0200
Subject: [Buildroot] [git commit] package/intel-mediadriver: new package
Message-ID: <20190416201301.311D98EC7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d091265ee7cc68156c383d03b252926117360952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
[Thomas:
 - add missing Config.in comments
 - fix minor nit in the _LICENSE variable
 - add patch to drop hardening options, especially -fstack-protector,
   which was causing the build to fail on toolchains without SSP
   support]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Drop-hardening-related-flags.patch        | 63 ++++++++++++++++++++++
 package/intel-mediadriver/Config.in                | 30 +++++++++++
 package/intel-mediadriver/intel-mediadriver.hash   |  3 ++
 package/intel-mediadriver/intel-mediadriver.mk     | 31 +++++++++++
 6 files changed, 129 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4927be926d..4de0c5fcec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1319,6 +1319,7 @@ F:	package/ti-sgx-um/
 
 N:	Louis-Paul Cordier <lpdev@cordier.org>
 F:	package/intel-gmmlib/
+F:	package/intel-mediadriver/
 
 N:	Luca Ceresoli <luca@lucaceresoli.net>
 F:	board/olimex/a20_olinuxino/
diff --git a/package/Config.in b/package/Config.in
index 260114fe72..e28b92aa95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1277,6 +1277,7 @@ menu "Graphics"
 	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
 	source "package/intel-gmmlib/Config.in"
+	source "package/intel-mediadriver/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch b/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
new file mode 100644
index 0000000000..bc29203317
--- /dev/null
+++ b/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
@@ -0,0 +1,63 @@
+From 8916c8480eb3483c2ffb41ad8961cd0c2b0fb1c4 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 15 Apr 2019 22:48:21 +0200
+Subject: [PATCH] Drop hardening-related flags
+
+These will be set by Buildroot depending on toolchain capabilities and
+global Buildroot options.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cmrtlib/linux/CMakeLists.txt                             | 8 ++++----
+ media_driver/cmake/linux/media_compile_flags_linux.cmake | 1 -
+ media_driver/media_top_cmake.cmake                       | 2 +-
+ 3 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
+index 44ce4f08..b462fbea 100644
+--- a/cmrtlib/linux/CMakeLists.txt
++++ b/cmrtlib/linux/CMakeLists.txt
+@@ -26,11 +26,11 @@ set(LIBRARY_OUTPUT_PATH    ${MDF_OPTION__OUTPUT_DIR})
+ 
+ # Set up compile options that will be used for the Linux build
+ if(CMAKE_COMPILER_IS_GNUCC)
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -fstack-protector-all -Werror")
+-    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
++    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing ")
+     set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -fstack-protector-all -Werror")
+-    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
++    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
+     set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+ 
+     set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
+diff --git a/media_driver/cmake/linux/media_compile_flags_linux.cmake b/media_driver/cmake/linux/media_compile_flags_linux.cmake
+index 9e85fdb2..c45ce11b 100755
+--- a/media_driver/cmake/linux/media_compile_flags_linux.cmake
++++ b/media_driver/cmake/linux/media_compile_flags_linux.cmake
+@@ -64,7 +64,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
+     # Other common flags
+     -fmessage-length=0
+     -fvisibility=hidden
+-    -fstack-protector
+     -fdata-sections
+     -ffunction-sections
+     -Wl,--gc-sections
+diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
+index 3491db1e..b30fa04a 100755
+--- a/media_driver/media_top_cmake.cmake
++++ b/media_driver/media_top_cmake.cmake
+@@ -88,7 +88,7 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
+     set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
+ endif()
+ 
+-set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -z relro -z now -fstack-protector -fPIC")
++set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed -Wl,--gc-sections -fPIC")
+ set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
+ set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
+ 
+-- 
+2.20.1
+
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
new file mode 100644
index 0000000000..35117f7712
--- /dev/null
+++ b/package/intel-mediadriver/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_INTEL_MEDIADRIVER
+	bool "intel-mediadriver"
+	depends on BR2_x86_64
+	depends on !BR2_STATIC_LIBS # mesa3d, libva
+	depends on BR2_INSTALL_LIBSTDCPP # mesa3d
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_INTEL_GMMLIB
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  The Intel(R) Media Driver for VAAPI is a new VA-API (Video
+	  Acceleration API) user mode driver supporting hardware
+	  accelerated decoding, encoding, and video post processing for
+	  GEN based graphics hardware.
+
+	  https://github.com/intel/media-driver
+
+comment "intel-mediadriver needs X.org"
+	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
+	depends on !BR2_PACKAGE_XORG7
+
+comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
+	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
new file mode 100644
index 0000000000..095f57603d
--- /dev/null
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 57a5c0d4dc7e34d7940d23346bbdee2b6cdfbfa81d64f5b77506da8b4298df43  intel-media-18.4.0.tar.gz
+sha256 74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
new file mode 100644
index 0000000000..96d40c6cac
--- /dev/null
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# intel-mediadriver
+#
+################################################################################
+
+# based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
+
+INTEL_MEDIADRIVER_VERSION = 18.4.0
+INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
+INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
+INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
+INTEL_MEDIADRIVER_LICENSE_FILES = LICENSE.md
+
+INTEL_MEDIADRIVER_DEPENDENCIES = \
+	intel-gmmlib \
+	libpciaccess \
+	libva \
+	mesa3d \
+	xlib_libX11
+
+INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
+
+INTEL_MEDIADRIVER_CONF_OPTS = \
+	-DMEDIA_VERSION="2.0.0" \
+	-DBUILD_ALONG_WITH_CMRTLIB=1 \
+	-DINSTALL_DRIVERS_SYSCONF=OFF \
+	-DMEDIA_RUN_TEST_SUITE=OFF \
+	-DRUN_TEST_SUITE=OFF
+
+$(eval $(cmake-package))
