From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  6 Oct 2014 22:19:20 +0200
Subject: [Buildroot] [PATCH v4 3/9] package/opencv: add python/numpy support
In-Reply-To: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
References: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1412626766-24683-4-git-send-email-s.martin49@gmail.com>
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
changes v3 -> v4:
- rebase
- rename _OPT -> _OPTS
- remove python/numpy patch (merged upstream since opencv bump)

changes v2 -> v3:
- rebase
- add fetch uri in the opencv's patch (Yann)
- move pyhton module knob under the multi-line if block about python deps
  (Yann)

changes v1 -> v2:
- rebase
- use patch merged upstream
---
 package/opencv/Config.in |  7 ++++++-
 package/opencv/opencv.mk | 18 ++++++++++++++++--
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 33e2a66..f8c9dc1 100644
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
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index b527e53..eece04f 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -66,7 +66,6 @@ OPENCV_CONF_OPTS += \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
 	-DBUILD_opencv_ocl=OFF                                                  \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
-	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
 	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
@@ -149,7 +148,6 @@ OPENCV_CONF_OPTS += \
 	-DBUILD_PNG=OFF	    \
 	-DBUILD_TIFF=OFF    \
 	-DBUILD_ZLIB=OFF    \
-	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
 	-DINSTALL_C_EXAMPLES=OFF       \
 	-DINSTALL_PYTHON_EXAMPLES=OFF  \
 	-DINSTALL_TO_MANGLED_PATHS=OFF
@@ -236,6 +234,22 @@ else
 OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_PYTHON),y)
+OPENCV_CONF_OPTS += \
+	-DBUILD_opencv_python=ON \
+	-DBUILD_NEW_PYTHON_SUPPORT=ON \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2                               \
+	-DPYTHON_INCLUDE_DIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+	-DPYTHON_LIBRARY=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so   \
+	-DPYTHON_NUMPY_INCLUDE_DIR=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
+OPENCV_DEPENDENCIES += python python-numpy
+else
+OPENCV_CONF_OPTS += \
+	-DBUILD_opencv_python=ON \
+	-DBUILD_NEW_PYTHON_SUPPORT=OFF
+endif
+
 # Installation hooks:
 define OPENCV_CLEAN_INSTALL_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
-- 
2.1.2
