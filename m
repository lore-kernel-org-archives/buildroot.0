From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 22:09:05 +0200
Subject: [Buildroot] [PATCH v3 3/8] opencv: add python/numpy support
In-Reply-To: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
References: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409515750-10289-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opencv_python module needs python-numpy because it uses some numpy
headers in this wrapper.

A patch in the OpenCV's build-system is also needed to prevent it from
trying to run python for numpy detection. This patch has already been
integrated upstream.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3:
- rebase
- add fetch uri in the opencv's patch (Yann)
- move pyhton module knob under the multi-line if block about python deps
  (Yann)

changes v1 -> v2:
- rebase
- use patch merged upstream
---
 package/opencv/Config.in                           |  7 +-
 ...01-fix-cross-compilation-issue-with-Numpy.patch | 74 ++++++++++++++++++++++
 package/opencv/opencv.mk                           | 18 +++++-
 3 files changed, 96 insertions(+), 3 deletions(-)
 create mode 100644 package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 571309f..d725d44 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -84,7 +84,12 @@ config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	help
 	  Include opencv_photo module into the OpenCV build.
 
-comment "opencv_python module requires numpy which is not yet available."
+config BR2_PACKAGE_OPENCV_LIB_PYTHON
+	bool "python"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Include opencv_python module into the OpenCV build.
+	  No python example is installed.
 
 config BR2_PACKAGE_OPENCV_LIB_STITCHING
 	bool "stitching"
diff --git a/package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch b/package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch
new file mode 100644
index 0000000..b661a32
--- /dev/null
+++ b/package/opencv/opencv-0001-fix-cross-compilation-issue-with-Numpy.patch
@@ -0,0 +1,74 @@
+Fetch from:
+  https://github.com/Itseez/opencv/commit/6cb90c0e976ff24af85167e71d88c9d9b2ed06c7
+---
+From 6cb90c0e976ff24af85167e71d88c9d9b2ed06c7 Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@aldebaran-robotics.com>
+Date: Mon, 20 Jan 2014 10:23:46 +0100
+Subject: [PATCH] fix cross-compilation issue with Numpy
+
+---
+ cmake/OpenCVDetectPython.cmake | 37 +++++++++++++++++++++++++++++--------
+ 1 file changed, 29 insertions(+), 8 deletions(-)
+
+diff --git a/cmake/OpenCVDetectPython.cmake b/cmake/OpenCVDetectPython.cmake
+index 3326bcd..8c488e6 100644
+--- a/cmake/OpenCVDetectPython.cmake
++++ b/cmake/OpenCVDetectPython.cmake
+@@ -80,14 +80,29 @@ if(PYTHON_EXECUTABLE)
+     endif()
+     SET(PYTHON_PACKAGES_PATH "${_PYTHON_PACKAGES_PATH}" CACHE PATH "Where to install the python packages.")
+ 
+-    if(NOT PYTHON_NUMPY_INCLUDE_DIR)
+-      # Attempt to discover the NumPy include directory. If this succeeds, then build python API with NumPy
+-      execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
+-                      RESULT_VARIABLE PYTHON_NUMPY_PROCESS
+-                      OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIR
+-                      OUTPUT_STRIP_TRAILING_WHITESPACE)
++    if(NOT CMAKE_CROSSCOMPILING)
++      if(NOT PYTHON_NUMPY_INCLUDE_DIR)
++        # Attempt to discover the NumPy include directory. If this succeeds, then build python API with NumPy
++        execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1'; import numpy.distutils; print numpy.distutils.misc_util.get_numpy_include_dirs()[0]"
++                        RESULT_VARIABLE PYTHON_NUMPY_PROCESS
++                        OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIR
++                        OUTPUT_STRIP_TRAILING_WHITESPACE)
+ 
+-      if(PYTHON_NUMPY_PROCESS EQUAL 0)
++        if(PYTHON_NUMPY_PROCESS EQUAL 0)
++          file(TO_CMAKE_PATH "${PYTHON_NUMPY_INCLUDE_DIR}" _PYTHON_NUMPY_INCLUDE_DIR)
++          set(PYTHON_NUMPY_INCLUDE_DIR ${_PYTHON_NUMPY_INCLUDE_DIR} CACHE PATH "Path to numpy headers")
++        endif()
++      endif()
++    else()
++      if(NOT PYTHON_NUMPY_INCLUDE_DIR)
++        message(STATUS "Cannot probe for Python/Numpy support (because we are cross-compiling OpenCV)")
++        message(STATUS "If you want to enable Python/Numpy support, set the following variables:")
++        message(STATUS "  PYTHON_EXECUTABLE")
++        message(STATUS "  PYTHON_INCLUDE_DIR")
++        message(STATUS "  PYTHON_LIBRARY")
++        message(STATUS "  PYTHON_NUMPY_INCLUDE_DIR")
++        message(STATUS "  PYTHON_NUMPY_VERSION")
++      else()
+         file(TO_CMAKE_PATH "${PYTHON_NUMPY_INCLUDE_DIR}" _PYTHON_NUMPY_INCLUDE_DIR)
+         set(PYTHON_NUMPY_INCLUDE_DIR ${_PYTHON_NUMPY_INCLUDE_DIR} CACHE PATH "Path to numpy headers")
+       endif()
+@@ -95,10 +110,16 @@ if(PYTHON_EXECUTABLE)
+ 
+     if(PYTHON_NUMPY_INCLUDE_DIR)
+       set(PYTHON_USE_NUMPY TRUE)
+-      execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import numpy; print numpy.version.version"
++      if(NOT CMAKE_CROSSCOMPILING)
++        execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import numpy; print numpy.version.version"
+                         RESULT_VARIABLE PYTHON_NUMPY_PROCESS
+                         OUTPUT_VARIABLE PYTHON_NUMPY_VERSION
+                         OUTPUT_STRIP_TRAILING_WHITESPACE)
++      else()
++        if(NOT PYTHON_NUMPY_VERSION)
++          set(PYTHON_NUMPY_VERSION "undefined - cannot be probed because of the cross-compilation")
++        endif()
++      endif()
+     endif()
+   endif(NOT ANDROID AND NOT IOS)
+ 
+-- 
+1.9.0
+
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 00a9e22..807b7d8 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -60,7 +60,6 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
 	-DBUILD_opencv_ocl=OFF                                                  \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
-	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
 	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
@@ -142,7 +141,6 @@ OPENCV_CONF_OPT += \
 	-DBUILD_PNG=OFF	    \
 	-DBUILD_TIFF=OFF    \
 	-DBUILD_ZLIB=OFF    \
-	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
 	-DINSTALL_C_EXAMPLES=OFF       \
 	-DINSTALL_PYTHON_EXAMPLES=OFF  \
 	-DINSTALL_TO_MANGLED_PATHS=OFF
@@ -230,6 +228,22 @@ OPENCV_CONF_OPT += \
 	-DWITH_LIBV4L=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_PYTHON),y)
+OPENCV_CONF_OPT += \
+	-DBUILD_opencv_python=ON \
+	-DBUILD_NEW_PYTHON_SUPPORT=ON \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2                               \
+	-DPYTHON_INCLUDE_DIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+	-DPYTHON_LIBRARY=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so   \
+	-DPYTHON_NUMPY_INCLUDE_DIR=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
+OPENCV_DEPENDENCIES += python python-numpy
+else
+OPENCV_CONF_OPT += \
+	-DBUILD_opencv_python=ON \
+	-DBUILD_NEW_PYTHON_SUPPORT=OFF
+endif
+
 # Installation hooks:
 define OPENCV_CLEAN_INSTALL_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
-- 
2.1.0
