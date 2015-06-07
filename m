From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:29 +0200
Subject: [Buildroot] [PATCH v5 03/13] package/opencv: bump to version 3.0
In-Reply-To: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1433672799-21387-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This major version bump is in fact a bump from 2.4.10 to 2.4.11, then to
3.0.

OpenCV-2.4.11 improves a lot the Buildroot integration, including a
couple of patches that no longer need to be carried in Buildroot tree:
- x86 PIC code compilation fix in core module [1];
- return type fix in superes module [2];
- opencv.pc generation [3].

It also improves the gstreamer-0.10/1.x detection [4], that will needed
in a follow-up patch.

The OpenCV-3.0 does some major changes, for which a transition guide
has been published [5].

Among these changes coming with OpenCV-3.0, some new modules have been
introduced and others got removed; leading to a bunch of configure
option updates (to keep as much as possible an iso-functional-perimeter)
and the legacy menu has been updated too.
The worth noticing removal being:
- the opencv_legacy and opencv_nonfree modules no longer exist;
- the opencv_contrib module has moved out of the opencv base tree and
  now has its own repository [6].
  There is currently no plan to support it.

Some 3rd-party supports have been improved or added; their integrations
in Buildroot will be addressed in follow-up patches.

[1] https://github.com/Itseez/opencv/commit/ea50be0529c248961e1b66293f8a9e4b807294a6
[2] https://github.com/Itseez/opencv/commit/2e393ab83362743ba1825ad4b31d4a2925c606b4
[3] https://github.com/Itseez/opencv/commit/eceada586bbf18fc267e437522ec4f1f23ddc656
[4] https://github.com/Itseez/opencv/commit/38bb0db9dbec08666c8a64b3e4ead8fadf15c980
[5] http://docs.opencv.org/master/db/dfa/tutorial_transition_guide.html
[6] https://github.com/itseez/opencv_contrib

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v4->v5:
- new patch
---
 Config.in.legacy                                   |  16 +++
 .../0001-core-fix-x86-PIC-code-compilation.patch   |  49 -------
 ...ix-return-type-value-VideoFrameSource_GPU.patch |  40 ------
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 ---------------------
 package/opencv/Config.in                           |  44 +++---
 package/opencv/opencv.mk                           |  70 +++++++--
 6 files changed, 96 insertions(+), 279 deletions(-)
 delete mode 100644 package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
 delete mode 100644 package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
 delete mode 100644 package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 9b9fff0..e4a963b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -113,6 +113,22 @@ config BR2_TARGET_UBOOT_NETWORK
 	help
 	  U-Boot's custom network settings options have been removed.
 
+config BR2_PACKAGE_OPENCV_LIB_CONTRIB
+	bool "opencv contrib module"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_OPENCV_LIB_GPU
+	bool "opencv gpu module (splited in several 'cudaXXX' modules)"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_OPENCV_LIB_LEGACY
+	bool "opencv legacy module"
+	select BR2_LEGACY
+
+config BR2_PACKAGE_OPENCV_LIB_NONFREE
+	bool "opencv nonfree module"
+	select BR2_LEGACY
+
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
diff --git a/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch b/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
deleted file mode 100644
index 9e8c2e9..0000000
--- a/package/opencv/0001-core-fix-x86-PIC-code-compilation.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ea50be0529c248961e1b66293f8a9e4b807294a6 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 12 Oct 2014 10:17:23 +0200
-Subject: [PATCH] core: fix x86 PIC code compilation
-
-This bug was triggered by Buildroot autobuilders [1,2], causing this
-kind of failures [3,4]:
-
-  [ 14%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o
-  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp: In function '(static initializers for /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp)':
-  /home/test/autobuild/instance-0/output/build/opencv-2.4.10/modules/core/src/system.cpp:280:10: error: inconsistent operand constraints in an 'asm'
-  make[3]: *** [modules/core/CMakeFiles/opencv_core.dir/src/system.cpp.o] Error 1
-
-[1] http://buildroot.org/
-[2] http://autobuild.buildroot.org/
-[3] http://autobuild.buildroot.org/?reason=opencv-2.4.10
-[4] http://autobuild.buildroot.org/results/483/4838285b25d6293a5cf0bb9eadd5040a7c75d766/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- modules/core/src/system.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/modules/core/src/system.cpp b/modules/core/src/system.cpp
-index 5a970d5..e9ffdc7 100644
---- a/modules/core/src/system.cpp
-+++ b/modules/core/src/system.cpp
-@@ -267,14 +267,17 @@ struct HWFeatures
-          : "cc"
-         );
-         #else
-+        // We need to preserve ebx since we are compiling PIC code.
-+        // This means we cannot use "=b" for the 2nd output register.
-         asm volatile
-         (
-          "pushl %%ebx\n\t"
-          "movl $7,%%eax\n\t"
-          "movl $0,%%ecx\n\t"
-          "cpuid\n\t"
-+         "movl %%ebx,%1\n\t"
-          "popl %%ebx\n\t"
--         : "=a"(cpuid_data[0]), "=b"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
-+         : "=a"(cpuid_data[0]), "=r"(cpuid_data[1]), "=c"(cpuid_data[2]), "=d"(cpuid_data[3])
-          :
-          : "cc"
-         );
--- 
-2.1.2
-
diff --git a/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch b/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
deleted file mode 100644
index d71235d..0000000
--- a/package/opencv/0002-superres-Fix-return-type-value-VideoFrameSource_GPU.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-superres: Fix return value VideoFrameSource_GPU
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 2e393ab83362743ba1825ad4b31d4a2925c606b4 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Mon, 27 Oct 2014 13:39:35 +0000
-Subject: [PATCH] superres: Fix return value VideoFrameSource_GPU
-
-superres module fails to compile with the following error messages:
-
-[100%] Building CXX object modules/superres/CMakeFiles/opencv_superres.dir/src/super_resolution.cpp.o
-/opencv-2.4.10/modules/superres/src/frame_source.cpp: In function 'cv::Ptr<cv::superres::FrameSource> cv::superres::createFrameSource_Video_GPU(const string&)':
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: expected type-specifier before 'VideoFrameSource'
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: could not convert '(int*)operator new(4ul)' from 'int*' to 'cv::Ptr<cv::superres::FrameSource>'
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error: expected ';' before 'VideoFrameSource'
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:263:41: error: 'VideoFrameSource' was not declared in this scope
-/opencv-2.4.10/modules/superres/src/frame_source.cpp:264:1: error: control reaches end of non-void function [-Werror=return-type]
-cc1plus: some warnings being treated as errors
-make[3]: *** [modules/superres/CMakeFiles/opencv_superres.dir/src/frame_source.cpp.o] Error 1
-make[3]: *** Waiting for unfinished jobs....
-
-This is caused because the return value of the createFrameSource_Video_GPU function should be a VideoFrameSource_GPU object.
----
- modules/superres/src/frame_source.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/superres/src/frame_source.cpp b/modules/superres/src/frame_source.cpp
-index 5f59a98..c5b2e76 100644
---- a/modules/superres/src/frame_source.cpp
-+++ b/modules/superres/src/frame_source.cpp
-@@ -260,7 +260,7 @@ namespace
- 
- Ptr<FrameSource> cv::superres::createFrameSource_Video_GPU(const string& fileName)
- {
--    return new VideoFrameSource(fileName);
-+    return new VideoFrameSource_GPU(fileName);
- }
- 
- #endif // HAVE_OPENCV_GPU
diff --git a/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch b/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
deleted file mode 100644
index 768f08d..0000000
--- a/package/opencv/0003-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From eceada586bbf18fc267e437522ec4f1f23ddc656 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 3 Oct 2014 00:32:40 +0200
-Subject: [PATCH] cmake/OpenCVGenPkgconfig.cmake: rework opencv.pc generation
-
-Using absolute path to locate the components in the "Libs:" field of the
-*.pc can badly break cross-compilation, especially when building
-statically linked objects.
-
-Indeed, pkg-config automatically replaces the '-I...' and '-L...' paths
-when the PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_LIBDIR environment
-variables are set [1]. This feature is very helpful and common in
-cross-compilation framework like Buildroot [2,3].
-
-When there are absolute paths in the *.pc files, pkg-config won't be
-able to do the path substitions for these paths when the afromentioned
-environment variables are set.
-In such case, since the prefix is the target one, not the sysroot one,
-these libraries' abolute paths will point to:
-- in the best case: a non-existing file (i.e. these files do not exists
-  on the host system;
-- at worst: the host system's libraries. This will make the linking
-  failed because these host system's libraries will most likely not be
-  build for the target architecture [4].
-
-So, this patch replace the components' absolute paths by the form:
-  -L<libdir> -l<libname>
-
-This way, the linker will be able to resolve each dependency path,
-whatever the kind of objects/build (shared object or static build) it
-is dealing with.
-
-Note that for static link, the library order does matter [5]. The order
-of the opencv components has been carefully chosen to comply with this
-requirement.
-
-Fixes #3931
-
-[1] http://linux.die.net/man/1/pkg-config
-[2] http://buildroot.org/
-[3] http://git.buildroot.net/buildroot/tree/package/pkgconf/pkg-config.in
-[4] http://autobuild.buildroot.net/results/e8a/e8a859276db34aff87ef181b0cce98916b0afc90/build-end.log
-[5] http://stackoverflow.com/questions/45135/linker-order-gcc
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-
----
-Note: this patch properly applies on top of the master branch, though it
-      has been written on top of the 2.4 branch.
----
- cmake/OpenCVGenPkgconfig.cmake | 64 +++++++++++++++++++++++++++---------------
- 1 file changed, 42 insertions(+), 22 deletions(-)
-
-diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
-index fa57db9..183c56d 100644
---- a/cmake/OpenCVGenPkgconfig.cmake
-+++ b/cmake/OpenCVGenPkgconfig.cmake
-@@ -8,10 +8,6 @@
- #
- # ${BIN_DIR}/unix-install/opencv.pc -> For use *with* "make install"
- # -------------------------------------------------------------------------------------------
--set(prefix      "${CMAKE_INSTALL_PREFIX}")
--set(exec_prefix "\${prefix}")
--set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONENTS
--set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
- 
- if(CMAKE_BUILD_TYPE MATCHES "Release")
-   set(ocv_optkind OPT)
-@@ -35,42 +31,66 @@ ocv_list_reverse(OpenCV_LIB_COMPONENTS)
- ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
- 
- #build the list of components
--set(OpenCV_LIB_COMPONENTS_ "")
--foreach(CVLib ${OpenCV_LIB_COMPONENTS})
--  get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
--  get_filename_component(libname "${libpath}" NAME)
- 
--  if(INSTALL_TO_MANGLED_PATHS)
--    set(libname "${libname}.${OPENCV_VERSION}")
--  endif()
-+# Note:
-+#   when linking against static libraries, if libfoo depends on libbar, then
-+#   libfoo must come first in the linker flags.
-+
-+# world is a special target whose library should come first, especially for
-+# static link.
-+if(OpenCV_LIB_COMPONENTS MATCHES "opencv_world")
-+  list(REMOVE_ITEM OpenCV_LIB_COMPONENTS "opencv_world")
-+  list(INSERT OpenCV_LIB_COMPONENTS 0 "opencv_world")
-+endif()
-+
-+set(OpenCV_LIB_COMPONENTS_)
-+foreach(CVLib ${OpenCV_LIB_COMPONENTS})
- 
--  #need better solution....
--  if(libpath MATCHES "3rdparty")
--    set(installDir "share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
-+  get_target_property(libloc ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
-+  if(libloc MATCHES "3rdparty")
-+    set(libpath "\${exec_prefix}/share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
-   else()
--    set(installDir "${OPENCV_LIB_INSTALL_PATH}")
-+    set(libpath "\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}")
-   endif()
-+  list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libpath}")
-+
-+  get_filename_component(libname ${CVLib} NAME_WE)
-+  string(REGEX REPLACE "^lib" "" libname "${libname}")
-+  list(APPEND OpenCV_LIB_COMPONENTS_ "-l${libname}")
- 
--  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix}/${installDir}/${libname}")
- endforeach()
- 
- # add extra dependencies required for OpenCV
--set(OpenCV_LIB_COMPONENTS ${OpenCV_LIB_COMPONENTS_})
- if(OpenCV_EXTRA_COMPONENTS)
-   foreach(extra_component ${OpenCV_EXTRA_COMPONENTS})
- 
--    if(extra_component MATCHES "^-[lL]" OR extra_component MATCHES "[\\/]")
--      set(maybe_l_prefix "")
-+    if(extra_component MATCHES "^-[lL]")
-+      set(libprefix "")
-+      set(libname "${extra_component}")
-+    elseif(extra_component MATCHES "[\\/]")
-+      get_filename_component(libdir "${extra_component}" PATH)
-+      list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libdir}")
-+      get_filename_component(libname "${extra_component}" NAME_WE)
-+      string(REGEX REPLACE "^lib" "" libname "${libname}")
-+      set(libprefix "-l")
-     else()
--      set(maybe_l_prefix "-l")
-+      set(libprefix "-l")
-+      set(libname "${extra_component}")
-     endif()
--
--    set(OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS} ${maybe_l_prefix}${extra_component}")
-+    list(APPEND OpenCV_LIB_COMPONENTS_ "${libprefix}${libname}")
- 
-   endforeach()
- endif()
- 
-+list(REMOVE_DUPLICATES OpenCV_LIB_COMPONENTS_)
-+string(REPLACE ";" " " OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS_}")
-+
- #generate the .pc file
-+set(prefix      "${CMAKE_INSTALL_PREFIX}")
-+set(exec_prefix "\${prefix}")
-+set(libdir      "\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}")
-+set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
-+
- if(INSTALL_TO_MANGLED_PATHS)
-   set(OPENCV_PC_FILE_NAME "opencv-${OPENCV_VERSION}.pc")
- else()
--- 
-2.4.1
-
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index e40437f..a3f1f5e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -8,6 +8,9 @@ menuconfig BR2_PACKAGE_OPENCV
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
 
+	  Note that the opencv_core module and the opencv_hal library are
+	  automatically enabled.
+
 	  http://opencv.org/
 
 if BR2_PACKAGE_OPENCV
@@ -20,11 +23,7 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	help
 	  Include opencv_calib3d module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_CONTRIB
-	bool "contrib"
-	default y
-	help
-	  Include opencv_contrib module into the OpenCV build.
+# opencv_core module is automatically enabled when OpenCV package is selected
 
 config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
 	bool "features2d"
@@ -38,10 +37,8 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 	help
 	  Include opencv_flann module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_GPU
-	bool "gpu"
-	help
-	  Include opencv_gpu module into the OpenCV build.
+# opencv_hal (hardware acceleration layer (hal) module is required by
+# opencv_core, so it is automatically enabled
 
 config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	bool "highgui"
@@ -49,17 +46,17 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	help
 	  Include opencv_highgui module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	bool "imgproc"
+config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
+	bool "imgcodecs (image codecs)"
 	default y
 	help
-	  Include opencv_imgproc module into the OpenCV build.
+	  Include opencv_imgcodecs module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_LEGACY
-	bool "legacy"
+config BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	bool "imgproc (image processing)"
 	default y
 	help
-	  Include opencv_legacy module into the OpenCV build.
+	  Include opencv_imgproc module into the OpenCV build.
 
 config BR2_PACKAGE_OPENCV_LIB_ML
 	bool "ml (machine learning)"
@@ -67,11 +64,6 @@ config BR2_PACKAGE_OPENCV_LIB_ML
 	help
 	  Include opencv_ml module into the OpenCV build.
 
-config BR2_PACKAGE_OPENCV_LIB_NONFREE
-	bool "nonfree"
-	help
-	  Include opencv_nonfree module into the OpenCV build.
-
 config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	bool "objdetect"
 	default y
@@ -86,6 +78,12 @@ config BR2_PACKAGE_OPENCV_LIB_PHOTO
 
 comment "opencv_python module requires numpy which is not yet available."
 
+config BR2_PACKAGE_OPENCV_LIB_SHAPE
+	bool "shape (shape descriptors and matchers)"
+	default y
+	help
+	  Include opencv_shape module into the OpenCV build.
+
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	bool "stitching"
 	default y
@@ -106,6 +104,12 @@ config BR2_PACKAGE_OPENCV_LIB_TS
 	help
 	  Include opencv_ts module into the OpenCV build.
 
+config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
+	bool "videoio (media i/o)"
+	default y
+	help
+	  Include opencv_videoio module into the OpenCV build.
+
 config BR2_PACKAGE_OPENCV_LIB_VIDEO
 	bool "video"
 	default y
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 4d08481..0a1b94c 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.10
+OPENCV_VERSION = 3.0.0
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3c
@@ -12,19 +12,28 @@ OPENCV_LICENSE_FILES = LICENSE
 
 # OpenCV component options
 OPENCV_CONF_OPTS += \
+	-DBUILD_DOCS=OFF \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
 	-DBUILD_WITH_DEBUG_INFO=OFF
 
+ifneq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS)$(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),)
+OPENCV_CONF_OPTS += -DINSTALL_TEST=ON
+else
+OPENCV_CONF_OPTS += -DINSTALL_TEST=OFF
+endif
+
 # OpenCV build options
 OPENCV_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_COVERAGE=OFF \
 	-DENABLE_FAST_MATH=ON \
+	-DENABLE_IMPL_COLLECTION=OFF \
 	-DENABLE_NOISY_WARNINGS=OFF \
 	-DENABLE_OMIT_FRAME_POINTER=ON \
 	-DENABLE_PRECOMPILED_HEADERS=OFF \
 	-DENABLE_PROFILING=OFF \
-	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
+	-DOPENCV_WARNINGS_ARE_ERRORS=OFF
 
 # OpenCV link options
 OPENCV_CONF_OPTS += \
@@ -39,40 +48,49 @@ OPENCV_CONF_OPTS += \
 	-DINSTALL_CREATE_DISTRIB=OFF
 
 # OpenCV module selection
+# - contrib modules are disabled.
 OPENCV_CONF_OPTS += \
 	-DBUILD_opencv_androidcamera=OFF \
 	-DBUILD_opencv_apps=OFF \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
-	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
 	-DBUILD_opencv_core=ON \
-	-DBUILD_opencv_dynamicuda=OFF \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
 	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
-	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
+	-DBUILD_opencv_hal=ON \
 	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
+	-DBUILD_opencv_imgcodecs=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGCODECS),ON,OFF) \
 	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
 	-DBUILD_opencv_java=OFF \
-	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
 	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
-	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
-	-DBUILD_opencv_ocl=OFF \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
-	-DBUILD_opencv_python=OFF \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=OFF \
+	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV_LIB_SHAPE),ON,OFF) \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
 	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
 	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
+	-DBUILD_opencv_videoio=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOIO),ON,OFF) \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_viz=OFF \
 	-DBUILD_opencv_world=OFF
 
 # Hardware support options.
 #
 # * PowerPC support is turned off since its only effect is altering CFLAGS,
 #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
+# * fma3 and popcnt support is disabled because according to gcc manual [1], it
+#   is only available on x86_64 haswell, broadwell and knl architecture.
+#
+# [1] https://gcc.gnu.org/onlinedocs/gcc-5.1.0/gcc/x86-Options.html#x86-Options
 OPENCV_CONF_OPTS += \
 	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
+	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
+	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
 	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
+	-DENABLE_FMA3=OFF \
+	-DENABLE_POPCNT=OFF \
 	-DENABLE_POWERPC=OFF \
 	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
 	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
@@ -83,6 +101,19 @@ OPENCV_CONF_OPTS += \
 
 # Cuda stuff
 OPENCV_CONF_OPTS += \
+	-DBUILD_CUDA_STUBS=OFF \
+	-DBUILD_opencv_cudaarithm=OFF \
+	-DBUILD_opencv_cudabgsegm=OFF \
+	-DBUILD_opencv_cudacodec=OFF \
+	-DBUILD_opencv_cudafeatures2d=OFF \
+	-DBUILD_opencv_cudafilters=OFF \
+	-DBUILD_opencv_cudaimgproc=OFF \
+	-DBUILD_opencv_cudalegacy=OFF \
+	-DBUILD_opencv_cudaobjdetect=OFF \
+	-DBUILD_opencv_cudaoptflow=OFF \
+	-DBUILD_opencv_cudastereo=OFF \
+	-DBUILD_opencv_cudawarping=OFF \
+	-DBUILD_opencv_cudev=OFF \
 	-DWITH_CUBLAS=OFF \
 	-DWITH_CUDA=OFF \
 	-DWITH_CUFFT=OFF
@@ -97,8 +128,10 @@ OPENCV_CONF_OPTS += \
 
 # Intel stuff
 OPENCV_CONF_OPTS += \
+	-DBUILD_WITH_DYNAMIC_IPP=OFF \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF \
+	-DWITH_IPP_A=OFF \
 	-DWITH_TBB=OFF
 
 # Smartek stuff
@@ -112,10 +145,11 @@ OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
 
 # Non-Linux support (Android options) must remain OFF:
 OPENCV_CONF_OPTS += \
+	-DANDROID=OFF \
 	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
 	-DBUILD_ANDROID_EXAMPLES=OFF \
+	-DBUILD_ANDROID_SERVICE=OFF \
 	-DBUILD_FAT_JAVA_LIB=OFF \
-	-DBUILD_JAVA_SUPPORT=OFF \
 	-DINSTALL_ANDROID_EXAMPLES=OFF \
 	-DWITH_ANDROID_CAMERA=OFF
 
@@ -130,15 +164,17 @@ OPENCV_CONF_OPTS += \
 	-DWITH_CSTRIPES=OFF \
 	-DWITH_DSHOW=OFF \
 	-DWITH_MSMF=OFF \
+	-DWITH_PTHREADS_PF=OFF \
 	-DWITH_VFW=OFF \
 	-DWITH_VIDEOINPUT=OFF \
 	-DWITH_WIN32UI=OFF
 
-# Software/3rd-party support options.
+# Software/3rd-party support options:
+# - disable all examples
 OPENCV_CONF_OPTS += \
+	-DBUILD_EXAMPLES=OFF \
 	-DBUILD_JASPER=OFF \
 	-DBUILD_JPEG=OFF \
-	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
 	-DBUILD_OPENEXR=OFF \
 	-DBUILD_PNG=OFF \
 	-DBUILD_TIFF=OFF \
@@ -151,14 +187,20 @@ OPENCV_CONF_OPTS += \
 # - eigen: OpenCV does not use it, not take any benefit from it.
 OPENCV_CONF_OPTS += \
 	-DWITH_1394=OFF \
+	-DWITH_CLP=OFF \
 	-DWITH_EIGEN=OFF \
-	-DWITH_IMAGEIO=OFF \
+	-DWITH_GDAL=OFF \
+	-DWITH_GPHOTO2=OFF \
 	-DWITH_OPENCL=OFF \
+	-DWITH_OPENCL_SVM=OFF \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENGL=OFF \
 	-DWITH_OPENMP=OFF \
+	-DWITH_OPENNI2=OFF \
 	-DWITH_OPENNI=OFF \
 	-DWITH_UNICAP=OFF \
+	-DWITH_VTK=OFF \
+	-DWITH_WEBP=OFF \
 	-DWITH_XINE=OFF
 
 OPENCV_DEPENDENCIES += zlib
@@ -178,7 +220,7 @@ OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
-OPENCV_CONF_OPTS += -DWITH_GTK=ON
+OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
 OPENCV_DEPENDENCIES += libgtk2
 else
 OPENCV_CONF_OPTS += -DWITH_GTK=OFF
-- 
2.4.2
