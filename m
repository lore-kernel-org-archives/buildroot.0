From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  6 Oct 2014 22:19:24 +0200
Subject: [Buildroot] [PATCH v4 7/9] package/opencv: fix opencv.pc file
	generation
In-Reply-To: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
References: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1412626766-24683-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reworks the opencv.pc file generation to make it properly
work with pkg-config, especially when PKG_CONFIG_SYSROOT_DIR and or
PKG_CONFIG_LIBDIR environment variables are set.

This patch is consecutive to some previous works/discussions [1].

This patch has been sent upstream [2].

Fixes:
  http://autobuild.buildroot.net/results/e8a/e8a859276db34aff87ef181b0cce98916b0afc90/

[1] http://lists.busybox.net/pipermail/buildroot/2014-October/107670.html
[2] https://github.com/Itseez/opencv/pull/3305

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3 -> v4:
- new patch
---
 ...VGenPkgconfig.cmake-rework-opencv.pc-gene.patch | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 package/opencv/opencv-0001-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch

diff --git a/package/opencv/opencv-0001-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch b/package/opencv/opencv-0001-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
new file mode 100644
index 0000000..89f377b
--- /dev/null
+++ b/package/opencv/opencv-0001-cmake-OpenCVGenPkgconfig.cmake-rework-opencv.pc-gene.patch
@@ -0,0 +1,156 @@
+From e9be21e48eb91d908b1f710c0cf4d3926a351277 Mon Sep 17 00:00:00 2001
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
+ cmake/OpenCVGenPkgconfig.cmake | 60 ++++++++++++++++++++++++++++++------------
+ 1 file changed, 43 insertions(+), 17 deletions(-)
+
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index fa57db9..1f40308 100644
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
+@@ -34,43 +30,73 @@ ocv_list_unique(OpenCV_EXTRA_COMPONENTS)
+ ocv_list_reverse(OpenCV_LIB_COMPONENTS)
+ ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
+ 
++
++#set the components' libdir
++set(OpenCV_libdir "lib")
++
++list(LENGTH OpenCV_LIB_COMPONENTS _tmp)
++
++if(_tmp GREATER 0)
++  list(GET OpenCV_LIB_COMPONENTS 0 _tmp)
++  get_target_property(libpath ${_tmp} LOCATION_${CMAKE_BUILD_TYPE})
++  #need better solution....
++  if(libpath MATCHES "3rdparty")
++    set(OpenCV_libdir "share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
++  else()
++    set(OpenCV_libdir "${OPENCV_LIB_INSTALL_PATH}")
++  endif()
++endif()
++
++
+ #build the list of components
+ set(OpenCV_LIB_COMPONENTS_ "")
+ foreach(CVLib ${OpenCV_LIB_COMPONENTS})
+-  get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
+-  get_filename_component(libname "${libpath}" NAME)
+ 
+-  if(INSTALL_TO_MANGLED_PATHS)
+-    set(libname "${libname}.${OPENCV_VERSION}")
+-  endif()
++  get_target_property(_libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
++  get_filename_component(_libname "${_libpath}" NAME_WE)
++  string(REGEX REPLACE "^lib" "" _libname "${_libname}")
+ 
+-  #need better solution....
+-  if(libpath MATCHES "3rdparty")
+-    set(installDir "share/OpenCV/3rdparty/${OPENCV_LIB_INSTALL_PATH}")
++  # wolrd is a special target whose its library should come first, especially for
++  # static link.
++  if("${CVLib}" MATCHES "world")
++    set(OpenCV_LIB_COMPONENTS_ "-l${_libname} ${OpenCV_LIB_COMPONENTS_}")
+   else()
+-    set(installDir "${OPENCV_LIB_INSTALL_PATH}")
++    set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} -l${_libname}")
+   endif()
+ 
+-  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix}/${installDir}/${libname}")
+ endforeach()
+ 
++set(OpenCV_LIB_COMPONENTS "-L\${libdir} ${OpenCV_LIB_COMPONENTS_}")
++
++
+ # add extra dependencies required for OpenCV
+-set(OpenCV_LIB_COMPONENTS ${OpenCV_LIB_COMPONENTS_})
+ if(OpenCV_EXTRA_COMPONENTS)
+   foreach(extra_component ${OpenCV_EXTRA_COMPONENTS})
+ 
+-    if(extra_component MATCHES "^-[lL]" OR extra_component MATCHES "[\\/]")
++    if(extra_component MATCHES "^-[lL]")
+       set(maybe_l_prefix "")
++      set(libname "${extra_component}")
++    elseif(extra_component MATCHES "[\\/]")
++      get_filename_component(libname "${extra_component}" NAME_WE)
++      get_filename_component(libdir "${extra_component}" DIRECTORY)
++      string(REGEX REPLACE "^lib" "" libname "${libname}")
++      set(maybe_l_prefix "-L${libdir} -l")
+     else()
+       set(maybe_l_prefix "-l")
++      set(libname "${extra_component}")
+     endif()
+ 
+-    set(OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS} ${maybe_l_prefix}${extra_component}")
++    set(OpenCV_LIB_COMPONENTS "${OpenCV_LIB_COMPONENTS} ${maybe_l_prefix}${libname}")
+ 
+   endforeach()
+ endif()
+ 
+ #generate the .pc file
++set(prefix      "${CMAKE_INSTALL_PREFIX}")
++set(exec_prefix "\${prefix}")
++set(libdir      "\${exec_prefix}/${OpenCV_libdir}")
++set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
++
+ if(INSTALL_TO_MANGLED_PATHS)
+   set(OPENCV_PC_FILE_NAME "opencv-${OPENCV_VERSION}.pc")
+ else()
+-- 
+2.1.2
+
-- 
2.1.2
