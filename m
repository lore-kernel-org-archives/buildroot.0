From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Aug 2015 18:14:55 +0200
Subject: [Buildroot] [PATCH 2/4 v2] package/opencv: re-introduce opencv for
	opencv-2.4
In-Reply-To: <cover.1439136753.git.yann.morin.1998@free.fr>
References: <cover.1439136753.git.yann.morin.1998@free.fr>
Message-ID: <6273fa55f04f24b87c3b1fe2b309471955fbd3b6.1439136753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

As Jonathan noticed in [1], users' applications may depend on opencv-2.4
APIs removed in opencv-3.0.

So, re-introduce opencv package as it was right before the bump to
opencv-3.0 (i.e.: commit bf00b5a9ea1ab4189fe5c7dea05f40d0bbbf2082).

Also, add the dependency on !BR2_PACKAGE_OPENCV3 since they are mutually
exclusive.

[1] http://lists.busybox.net/pipermail/buildroot/2015-August/135270.html

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: remove legacy symbols, now; make opencv3
depends on !opencv, not the other way around]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Jonathan: feel free to apply any patch on this package to bump opencv to
the latest release on the 2.4 branch.
---
 Config.in.legacy                                   |  32 ---
 package/Config.in                                  |   1 +
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 ++++
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 ++++
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 +++++++++++++
 package/opencv/Config.in                           | 223 ++++++++++++++++++
 package/opencv/opencv.mk                           | 250 +++++++++++++++++++++
 package/opencv3/Config.in                          |   1 +
 8 files changed, 720 insertions(+), 32 deletions(-)
 create mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 create mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 create mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
 create mode 100644 package/opencv/Config.in
 create mode 100644 package/opencv/opencv.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 3b77b34..3330566 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -194,38 +194,6 @@ config BR2_TARGET_UBOOT_NETWORK
 	help
 	  U-Boot's custom network settings options have been removed.
 
-config BR2_PACKAGE_OPENCV_LIB_CONTRIB
-	bool "opencv contrib module no longer exists"
-	select BR2_LEGACY
-	help
-	  OpenCV >=3.0 does not come with in-tree contrib modules.
-
-	  They have been moved out of the OpenCV base tree, into the opencv_contrib
-	  repository:
-	    https://github.com/Itseez/opencv_contrib
-
-config BR2_PACKAGE_OPENCV_LIB_GPU
-	bool "opencv gpu module no longer exists"
-	select BR2_LEGACY
-	help
-	  opencv_gpu module no longer exists as is in OpenCV >=3.0.
-
-	  It has been split into several modules prefixed with "cuda" that require
-	  Cuda programming toolkit, which is not available in Buildroot. So cuda
-	  modules are forcibly disabled in Buildroot.
-
-config BR2_PACKAGE_OPENCV_LIB_LEGACY
-	bool "opencv legacy module no longer exists"
-	select BR2_LEGACY
-	help
-	  opencv_legacy module no longer exists in OpenCV >=3.0.
-
-config BR2_PACKAGE_OPENCV_LIB_NONFREE
-	bool "opencv nonfree module no longer exists"
-	select BR2_LEGACY
-	help
-	  opencv_nonfree module no longer exists in OpenCV >=3.0.
-
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
diff --git a/package/Config.in b/package/Config.in
index 9986eb5..b356c89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -825,6 +825,7 @@ menu "Graphics"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvips/Config.in"
 	source "package/menu-cache/Config.in"
+	source "package/opencv/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opengl/Config.in"
 	source "package/openjpeg/Config.in"
diff --git a/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch b/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
new file mode 100644
index 0000000..9e8c2e9
--- /dev/null
+++ b/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
@@ -0,0 +1,49 @@
+From ea50be0529c248961e1b66293f8a9e4b807294a6 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 12 Oct 2014 10:17:23 +0200
+Subject: [PATCH] core: fix x86 PIC code compilation
+
+This bug was triggered by Buildroot autobuilders [1,2], causing this
+kind of failures [3,4]:
+
+  [ 14%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o
+  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp: In function '(static initializers for /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp)':
+  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp:280:10: error: inconsistent operand constraints in an 'asm'
+  make[3]: *** [modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o] Error 1
+
+[1] http://buildroot.org/
+[2] http://autobuild.buildroot.org/
+[3] http://autobuild.buildroot.org/?reason=opencv-2.4.10
+[4] http://autobuild.buildroot.org/results/483/4838285b25d6293a5cf0bb9eadd5040a7c75d766/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ modules/core/src/system.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
+index 5a970d5..e9ffdc7 100644
+--- a/modules/core/src/system.cpp
++++ b/modules/core/src/system.cpp
+@@ -267,14 +267,17 @@ struct HWFeatures
+          : "cc"
+         );
+         #else
++        // We need to preserve ebx since we are compiling PIC code.
++        // This means we cannot use "=b" for the 2nd output register.
+         asm volatile
+         (
+          "pushl %%ebx\n\t"
+          "movl $7,%%eax\n\t"
+          "movl $0,%%ecx\n\t"
+          "cpuid\n\t"
++         "movl %%ebx,%1\n\t"
+          "popl %%ebx\n\t"
+-         : "=a"(cpuid_data[0]), "=b"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
++         : "=a"(cpuid_data[0]), "=r"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
+          :
+          : "cc"
+         );
+-- 
+2.1.2
+
diff --git a/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch b/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
new file mode 100644
index 0000000..d71235d
--- /dev/null
+++ b/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
@@ -0,0 +1,40 @@
+superres: Fix return value VideoFrameSource_GPU
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 2e393ab83362743ba1825ad4b31d4a2925c606b4 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 27 Oct 2014 13:39:35 +0000
+Subject: [PATCH] superres: Fix return value VideoFrameSource_GPU
+
+superres module fails to compile with the following error messages:
+
+[100%] Building CXX object modules/superres/CMakeFiles/opencv_superres.dir/src/super_resolution.cpp.o
+/opencv-2.4.10/modules/superres/src/frame_source.cpp: In function 'cv::Ptr<cv::superres::FrameSource> cv::superres::createFrameSource_Video_GPU(const string&)':
+/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: expected type-specifier before 'VideoFrameSource'
+/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: could not convert '(int*)operator new(4ul)' from 'int*' to 'cv::Ptr<cv::superres::FrameSource>'
+/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: expected ';' before 'VideoFrameSource'
+/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:41: error: 'VideoFrameSource' was not declared in this scope
+/opencv-2.4.10/modules/superres/src/frame_source.cpp:264:1: error: control reaches end of non-void function [-Werror=return-type]
+cc1plus: some warnings being treated as errors
+make[3]: *** [modules/superres/CMakeFiles/opencv_superres.dir/src/frame_source.cpp.o] Error 1
+make[3]: *** Waiting for unfinished jobs....
+
+This is caused because the return value of the createFrameSource_Video_GPU function should be a VideoFrameSource_GPU object.
+---
+ modules/superres/src/frame_source.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/superres/src/frame_source.cpp b/modules/superres/src/frame_source.cpp
+index 5f59a98..c5b2e76 100644
+--- a/modules/superres/src/frame_source.cpp
++++ b/modules/superres/src/frame_source.cpp
+@@ -260,7 +260,7 @@ namespace
+ 
+ Ptr<FrameSource> cv::superres::createFrameSource_Video_GPU(const string& fileName)
+ {
+-    return new VideoFrameSource(fileName);
++    return new VideoFrameSource_GPU(fileName);
+ }
+ 
+ #endif // HAVE_OPENCV_GPU
diff --git a/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch b/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
new file mode 100644
index 0000000..768f08d
--- /dev/null
+++ b/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
@@ -0,0 +1,156 @@
+From eceada586bbf18fc267e437522ec4f1f23ddc656 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 3 Oct 2014 00:32:40 +0200
+Subject: [PATCH] cmake/OpenCVGenPkgconfig.cmake: rework opencv.pc generation
+
+Using absolute path to locate the components in the "Libs:" field of the
+*.pc can badly break cross-compilation, especially when building
+statically linked objects.
+
+Indeed, pkg-config automatically replaces the '-I...' and '-L...' paths
+when the PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_LIBDIR environment
+variables are set [1]. This feature is very helpful and common in
+cross-compilation framework like Buildroot [2,3].
+
+When there are absolute paths in the *.pc files, pkg-config won't be
+able to do the path substitions for these paths when the afromentioned
+environment variables are set.
+In such case, since the prefix is the target one, not the sysroot one,
+these libraries' abolute paths will point to:
+- in the best case: a non-existing file (i.e. these files do not exists
+  on the host system;
+- at worst: the host system's libraries. This will make the linking
+  failed because these host system's libraries will most likely not be
+  build for the target architecture [4].
+
+So, this patch replace the components' absolute paths by the form:
+  -L<libdir> -l<libname>
+
+This way, the linker will be able to resolve each dependency path,
+whatever the kind of objects/build (shared object or static build) it
+is dealing with.
+
+Note that for static link, the library order does matter [5]. The order
+of the opencv components has been carefully chosen to comply with this
+requirement.
+
+Fixes #3931
+
+[1] http://linux.die.net/man/1/pkg-config
+[2] http://buildroot.org/
+[3] http://git.buildroot.net/buildroot/tree/package/pkgconf/pkg-config.in
+[4] http://autobuild.buildroot.net/results/e8a/e8a859276db34aff87ef181b0cce98916b0afc90/build-end.log
+[5] http://stackoverflow.com/questions/45135/linker-order-gcc
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+Note: this patch properly applies on top of the master branch, though it
+      has been written on top of the 2.4 branch.
+---
+ cmake/OpenCVGenPkgconfig.cmake | 64 +++++++++++++++++++++++++++---------------
+ 1 file changed, 42 insertions(+), 22 deletions(-)
+
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index fa57db9..183c56d 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -8,10 +8,6 @@
+ #
+ # ${BIN_DIR}/unix-install/opencv.pc -> For use *with* "make install"
+ # -------------------------------------------------------------------------------------------
+-set(prefix      "${CMAKE_INSTALL_PREFIX}")
+-set(exec_prefix "\${prefix}")
+-set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONENTS
+-set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
+ 
+ if(CMAKE_BUILD_TYPE MATCHES "Release")
+   set(ocv_optkind OPT)
+@@ -35,42 +31,66 @@ ocv_list_reverse(OpenCV_LIB_COMPONENTS)
+ ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
+ 
+ #build the list of components
+-set(OpenCV_LIB_COMPONENTS_ "")
+-foreach(CVLib ${OpenCV_LIB_COMPONENTS})
+-  get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
+-  get_filename_component(libname "${libpath}" NAME)
+ 
+-  if(INSTALL_TO_MANGLED_PATHS)
+-    set(libname "${libname}.${OPENCV_VERSION}")
+-  endif()
++# Note:
++#   when linking against static libraries, if libfoo depends on libbar, then
++#   libfoo must come first in the linker flags.
++
++# world is a special target whose library should come first, especially for
++# static link.
++if(OpenCV_LIB_COMPONENTS MATCHES "opencv_world")
++  list(REMOVE_ITEM OpenCV_LIB_COMPONENTS "opencv_world")
++  list(INSERT OpenCV_LIB_COMPONENTS 0 "opencv_world")
++endif()
++
++set(OpenCV_LIB_COMPONENTS_)
++foreach(CVLib ${OpenCV_LIB_COMPONENTS})
+ 
+-  #need better solution....
+-  if(libpath MATCHES "3rdparty")
+-    set(installDir "share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
++  get_target_property(libloc ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
++  if(libloc MATCHES "3rdparty")
++    set(libpath "\${exec_prefix}/share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
+   else()
+-    set(installDir "${OPENCV_LIB_INSTALL_PATH}")
++    set(libpath "\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}")
+   endif()
++  list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libpath}")
++
++  get_filename_component(libname ${CVLib} NAME_WE)
++  string(REGEX REPLACE "^lib" "" libname "${libname}")
++  list(APPEND OpenCV_LIB_COMPONENTS_ "-l${libname}")
+ 
+-  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix}/${installDir}/${libname}")
+ endforeach()
+ 
+ # add extra dependencies required for OpenCV
+-set(OpenCV_LIB_COMPONENTS ${OpenCV_LIB_COMPONENTS_})
+ if(OpenCV_EXTRA_COMPONENTS)
+   foreach(extra_component ${OpenCV_EXTRA_COMPONENTS})
+ 
+-    if(extra_component MATCHES "^-[lL]" OR extra_component MATCHES "[\\/]")
+-      set(maybe_l_prefix "")
++    if(extra_component MATCHES "^-[lL]")
++      set(libprefix "")
++      set(libname "${extra_component}")
++    elseif(extra_component MATCHES "[\\/]")
++      get_filename_component(libdir "${extra_component}" PATH)
++      list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libdir}")
++      get_filename_component(libname "${extra_component}" NAME_WE)
++      string(REGEX REPLACE "^lib" "" libname "${libname}")
++      set(libprefix "-l")
+     else()
+-      set(maybe_l_prefix "-l")
++      set(libprefix "-l")
++      set(libname "${extra_component}")
+     endif()
+-
+-    set(OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS} ${maybe_l_prefix}${extra_component}")
++    list(APPEND OpenCV_LIB_COMPONENTS_ "${libprefix}${libname}")
+ 
+   endforeach()
+ endif()
+ 
++list(REMOVE_DUPLICATES OpenCV_LIB_COMPONENTS_)
++string(REPLACE ";" " " OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS_}")
++
+ #generate the .pc file
++set(prefix      "${CMAKE_INSTALL_PREFIX}")
++set(exec_prefix "\${prefix}")
++set(libdir      "\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}")
++set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
++
+ if(INSTALL_TO_MANGLED_PATHS)
+   set(OPENCV_PC_FILE_NAME "opencv-${OPENCV_VERSION}.pc")
+ else()
+-- 
+2.4.1
+
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
new file mode 100644
index 0000000..aca5174
--- /dev/null
+++ b/package/opencv/Config.in
@@ -0,0 +1,223 @@
+menuconfig BR2_PACKAGE_OPENCV
+	bool "opencv-2.4"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  OpenCV (Open Source Computer Vision) is a library of programming
+	  functions for real time computer vision.
+
+	  http://opencv.org/
+
+if BR2_PACKAGE_OPENCV
+
+comment "OpenCV modules"
+
+config BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	bool "calib3d"
+	default y
+	help
+	  Include opencv_calib3d module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_CONTRIB
+	bool "contrib"
+	default y
+	help
+	  Include opencv_contrib module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	bool "features2d"
+	default y
+	help
+	  Include opencv_features2d module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_FLANN
+	bool "flann"
+	default y
+	help
+	  Include opencv_flann module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_GPU
+	bool "gpu"
+	help
+	  Include opencv_gpu module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	bool "highgui"
+	default y
+	help
+	  Include opencv_highgui module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	bool "imgproc"
+	default y
+	help
+	  Include opencv_imgproc module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_LEGACY
+	bool "legacy"
+	default y
+	help
+	  Include opencv_legacy module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_ML
+	bool "ml (machine learning)"
+	default y
+	help
+	  Include opencv_ml module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_NONFREE
+	bool "nonfree"
+	help
+	  Include opencv_nonfree module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	bool "objdetect"
+	default y
+	help
+	  Include opencv_objdetect module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_PHOTO
+	bool "photo"
+	default y
+	help
+	  Include opencv_photo module into the OpenCV build.
+
+comment "opencv_python module requires numpy which is not yet available."
+
+config BR2_PACKAGE_OPENCV_LIB_STITCHING
+	bool "stitching"
+	default y
+	help
+	  Include opencv_stitching module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_SUPERRES
+	bool "superres"
+	default y
+	help
+	  Include opencv_superres "super resolution" - module into the OpenCV
+	  build.
+
+config BR2_PACKAGE_OPENCV_LIB_TS
+	bool "ts (touchscreen)"
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	default y
+	help
+	  Include opencv_ts module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_VIDEO
+	bool "video"
+	default y
+	help
+	  Include opencv_video module into the OpenCV build.
+
+config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
+	bool "videostab"
+	default y
+	help
+	  Include opencv_videostab module into the OpenCV build.
+
+comment "Test sets"
+config BR2_PACKAGE_OPENCV_BUILD_TESTS
+	bool "build tests"
+
+config BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS
+	bool "build performance tests"
+
+comment "3rd party support"
+
+config BR2_PACKAGE_OPENCV_WITH_FFMPEG
+	bool "ffmpeg support"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	help
+	  Use ffmpeg from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
+	bool "gstreamer support"
+	depends on BR2_USE_MMU # gstreamer -> libglib2
+	depends on BR2_USE_WCHAR # gstreamer -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
+
+comment "gstreamer support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENCV_WITH_GTK
+	bool "gtk support"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_LIBGTK2
+
+config BR2_PACKAGE_OPENCV_WITH_JASPER
+	bool "jpeg2000 support"
+	select BR2_PACKAGE_JASPER
+	help
+	  Enable jpeg2000 support.
+
+	  Note: this does not use the libjasper bundled with opencv,
+	  but uses the libjasper package installed system-wide by
+	  Buildroot.
+
+config BR2_PACKAGE_OPENCV_WITH_JPEG
+	bool "jpeg support"
+	select BR2_PACKAGE_JPEG
+	help
+	  Use shared libjpeg from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_PNG
+	bool "png support"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Use shared libpng from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_QT
+	bool "qt backend support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # qt
+	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_STL
+	select BR2_PACKAGE_QT_GUI_MODULE
+	select BR2_PACKAGE_QT_TEST
+	help
+	  Use Qt with QtTest module and STL support
+
+config BR2_PACKAGE_OPENCV_WITH_TIFF
+	bool "tiff support"
+	select BR2_PACKAGE_TIFF
+	help
+	  Use shared libtiff from the target system.
+
+config BR2_PACKAGE_OPENCV_WITH_V4L
+	bool "v4l support"
+	help
+	  Enable Video 4 Linux support.
+
+	  If the package libv4l is enabled, its support is automatically enabled.
+
+comment "Install options"
+
+config BR2_PACKAGE_OPENCV_INSTALL_DATA
+	bool "install extra data"
+	help
+	  Install various data that is used by cv libraries and/or demo
+	  applications, specifically for haarcascades and lbpcascades
+	  features.
+
+	  For further information: see OpenCV documentation.
+
+endif # BR2_PACKAGE_OPENCV
+
+comment "opencv needs a toolchain w/ C++, NPTL, wchar"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
new file mode 100644
index 0000000..ee11220
--- /dev/null
+++ b/package/opencv/opencv.mk
@@ -0,0 +1,250 @@
+################################################################################
+#
+# opencv
+#
+################################################################################
+
+OPENCV_VERSION = 2.4.10
+OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
+OPENCV_INSTALL_STAGING = YES
+OPENCV_LICENSE = BSD-3c
+OPENCV_LICENSE_FILES = LICENSE
+
+# OpenCV component options
+OPENCV_CONF_OPTS += \
+	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
+	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
+	-DBUILD_WITH_DEBUG_INFO=OFF
+
+# OpenCV build options
+OPENCV_CONF_OPTS += \
+	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_FAST_MATH=ON \
+	-DENABLE_NOISY_WARNINGS=OFF \
+	-DENABLE_OMIT_FRAME_POINTER=ON \
+	-DENABLE_PRECOMPILED_HEADERS=OFF \
+	-DENABLE_PROFILING=OFF \
+	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+
+# OpenCV link options
+OPENCV_CONF_OPTS += \
+	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
+	-DCMAKE_SKIP_RPATH=OFF \
+	-DCMAKE_USE_RELATIVE_PATHS=OFF
+
+# OpenCV packaging options:
+OPENCV_CONF_OPTS += \
+	-DBUILD_PACKAGE=OFF \
+	-DENABLE_SOLUTION_FOLDERS=OFF \
+	-DINSTALL_CREATE_DISTRIB=OFF
+
+# OpenCV module selection
+OPENCV_CONF_OPTS += \
+	-DBUILD_opencv_androidcamera=OFF \
+	-DBUILD_opencv_apps=OFF \
+	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
+	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
+	-DBUILD_opencv_core=ON \
+	-DBUILD_opencv_dynamicuda=OFF \
+	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
+	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
+	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
+	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
+	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
+	-DBUILD_opencv_java=OFF \
+	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
+	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
+	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
+	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_ocl=OFF \
+	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
+	-DBUILD_opencv_python=OFF \
+	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
+	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
+	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
+	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
+	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_world=OFF
+
+# Hardware support options.
+#
+# * PowerPC support is turned off since its only effect is altering CFLAGS,
+#   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
+OPENCV_CONF_OPTS += \
+	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
+	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
+	-DENABLE_POWERPC=OFF \
+	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
+	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
+	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
+	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
+	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
+	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+
+# Cuda stuff
+OPENCV_CONF_OPTS += \
+	-DWITH_CUBLAS=OFF \
+	-DWITH_CUDA=OFF \
+	-DWITH_CUFFT=OFF
+
+# NVidia stuff
+OPENCV_CONF_OPTS += -DWITH_NVCUVID=OFF
+
+# AMD stuff
+OPENCV_CONF_OPTS += \
+	-DWITH_OPENCLAMDBLAS=OFF \
+	-DWITH_OPENCLAMDFFT=OFF
+
+# Intel stuff
+OPENCV_CONF_OPTS += \
+	-DWITH_INTELPERC=OFF \
+	-DWITH_IPP=OFF \
+	-DWITH_TBB=OFF
+
+# Smartek stuff
+OPENCV_CONF_OPTS += -DWITH_GIGEAPI=OFF
+
+# Prosilica stuff
+OPENCV_CONF_OPTS += -DWITH_PVAPI=OFF
+
+# Ximea stuff
+OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
+
+# Non-Linux support (Android options) must remain OFF:
+OPENCV_CONF_OPTS += \
+	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
+	-DBUILD_ANDROID_EXAMPLES=OFF \
+	-DBUILD_FAT_JAVA_LIB=OFF \
+	-DBUILD_JAVA_SUPPORT=OFF \
+	-DINSTALL_ANDROID_EXAMPLES=OFF \
+	-DWITH_ANDROID_CAMERA=OFF
+
+# Non-Linux support (Mac OSX options) must remain OFF:
+OPENCV_CONF_OPTS += \
+	-DWITH_AVFOUNDATION=OFF \
+	-DWITH_CARBON=OFF \
+	-DWITH_QUICKTIME=OFF
+
+# Non-Linux support (Windows options) must remain OFF:
+OPENCV_CONF_OPTS += \
+	-DWITH_CSTRIPES=OFF \
+	-DWITH_DSHOW=OFF \
+	-DWITH_MSMF=OFF \
+	-DWITH_VFW=OFF \
+	-DWITH_VIDEOINPUT=OFF \
+	-DWITH_WIN32UI=OFF
+
+# Software/3rd-party support options.
+OPENCV_CONF_OPTS += \
+	-DBUILD_JASPER=OFF \
+	-DBUILD_JPEG=OFF \
+	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
+	-DBUILD_OPENEXR=OFF \
+	-DBUILD_PNG=OFF \
+	-DBUILD_TIFF=OFF \
+	-DBUILD_ZLIB=OFF \
+	-DINSTALL_C_EXAMPLES=OFF \
+	-DINSTALL_PYTHON_EXAMPLES=OFF \
+	-DINSTALL_TO_MANGLED_PATHS=OFF
+
+# Disabled features (mostly because they are not available in Buildroot), but
+# - eigen: OpenCV does not use it, not take any benefit from it.
+OPENCV_CONF_OPTS += \
+	-DWITH_1394=OFF \
+	-DWITH_EIGEN=OFF \
+	-DWITH_IMAGEIO=OFF \
+	-DWITH_OPENCL=OFF \
+	-DWITH_OPENEXR=OFF \
+	-DWITH_OPENGL=OFF \
+	-DWITH_OPENMP=OFF \
+	-DWITH_OPENNI=OFF \
+	-DWITH_UNICAP=OFF \
+	-DWITH_XINE=OFF
+
+OPENCV_DEPENDENCIES += zlib
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
+OPENCV_CONF_OPTS += -DWITH_FFMPEG=ON
+OPENCV_DEPENDENCIES += ffmpeg bzip2
+else
+OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
+else
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
+OPENCV_CONF_OPTS += -DWITH_GTK=ON
+OPENCV_DEPENDENCIES += libgtk2
+else
+OPENCV_CONF_OPTS += -DWITH_GTK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
+OPENCV_CONF_OPTS += -DWITH_JASPER=ON
+OPENCV_DEPENDENCIES += jasper
+else
+OPENCV_CONF_OPTS += -DWITH_JASPER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
+OPENCV_CONF_OPTS += -DWITH_JPEG=ON
+OPENCV_DEPENDENCIES += jpeg
+else
+OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
+OPENCV_CONF_OPTS += -DWITH_PNG=ON
+OPENCV_DEPENDENCIES += libpng
+else
+OPENCV_CONF_OPTS += -DWITH_PNG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
+OPENCV_CONF_OPTS += -DWITH_QT=4
+OPENCV_DEPENDENCIES += qt
+else
+OPENCV_CONF_OPTS += -DWITH_QT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
+OPENCV_CONF_OPTS += -DWITH_TIFF=ON
+OPENCV_DEPENDENCIES += tiff
+else
+OPENCV_CONF_OPTS += -DWITH_TIFF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
+OPENCV_CONF_OPTS += \
+	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
+	-DWITH_V4L=ON
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
+else
+OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
+endif
+
+# Installation hooks:
+define OPENCV_CLEAN_INSTALL_DOC
+	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
+endef
+OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DOC
+
+define OPENCV_CLEAN_INSTALL_CMAKE
+	$(RM) -f $(TARGET_DIR)/usr/share/OpenCV/OpenCVConfig*.cmake
+endef
+OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_CMAKE
+
+ifneq ($(BR2_PACKAGE_OPENCV_INSTALL_DATA),y)
+define OPENCV_CLEAN_INSTALL_DATA
+	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/haarcascades \
+		$(TARGET_DIR)/usr/share/OpenCV/lbpcascades
+endef
+OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
+endif
+
+$(eval $(cmake-package))
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index c63b474..83737d8 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_OPENCV3
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
 	# Causes some toolchain failures on Xtensa
 	depends on !BR2_xtensa
+	depends on !BR2_PACKAGE_OPENCV
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
-- 
1.9.1
