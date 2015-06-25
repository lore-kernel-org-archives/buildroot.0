From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 21:59:49 +0200
Subject: [Buildroot] [PATCH v6 08/16] package/opencv: add python support
In-Reply-To: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1435262397-888-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opencv_python module needs python-numpy because it uses some numpy
headers in this wrapper.

From its 2.4 release, OpenCV offers python bindings, but they required
most of the OpenCV modules to be enabled.

Since OpenCV-3.0.0, python bindings have been reworked:
- it now supports both python2 and python3
- only built modules supporting wrapped in python will be included in
  the bindings.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v5->v6:
- rebase

changes v4->v5:
- rebase
- update a/r/t tags
- update commit log
- fix python-numpy selection
- add python3 support

changes v3->v4:
- rebase
- rename _OPT -> _OPTS
- remove python/numpy patch (merged upstream since opencv bump)

changes v2->v3:
- rebase
- add fetch uri in the opencv's patch (Yann)
- move pyhton module knob under the multi-line if block about python deps
  (Yann)

changes v1->v2:
- rebase
- use patch merged upstream
---
 package/opencv/Config.in | 12 +++++++++++-
 package/opencv/opencv.mk | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 3c00525..8ed505e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -89,7 +89,17 @@ config BR2_PACKAGE_OPENCV_LIB_PHOTO
 	  Include opencv_photo (computational photography) module into the OpenCV
 	  build.
 
-comment "opencv_python module requires numpy which is not yet available."
+config BR2_PACKAGE_OPENCV_LIB_PYTHON
+	bool "python"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
+		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
+		|| BR2_sh || BR2_x86_64 # python-numpy
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64 # python-numpy
+	select BR2_PACKAGE_PYTHON_NUMPY
+	help
+	  Include opencv_python module into the OpenCV build.
+	  No python example is installed.
 
 config BR2_PACKAGE_OPENCV_LIB_SHAPE
 	bool "shape"
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 7211c18..a43de0c 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -78,8 +78,6 @@ OPENCV_CONF_OPTS += \
 	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
-	-DBUILD_opencv_python2=OFF \
-	-DBUILD_opencv_python3=OFF \
 	-DBUILD_opencv_shape=$(if $(BR2_PACKAGE_OPENCV_LIB_SHAPE),ON,OFF) \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
 	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
@@ -282,6 +280,37 @@ else
 OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+OPENCV_CONF_OPTS += \
+	-DBUILD_opencv_python2=ON \
+	-DBUILD_opencv_python3=OFF \
+	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/usr/bin/python2 \
+	-DPYTHON2_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+	-DPYTHON2_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so \
+	-DPYTHON2_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON2_PACKAGES_PATH=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	-DPYTHON2_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
+OPENCV_DEPENDENCIES += python
+else
+OPENCV_CONF_OPTS += \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=ON \
+	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/usr/bin/python3 \
+	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m \
+	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)m.so \
+	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
+OPENCV_DEPENDENCIES += python3
+endif
+OPENCV_DEPENDENCIES += python-numpy
+else
+OPENCV_CONF_OPTS += \
+	-DBUILD_opencv_python2=OFF \
+	-DBUILD_opencv_python3=OFF
+endif
+
 # Installation hooks:
 define OPENCV_CLEAN_INSTALL_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/OpenCV/doc
-- 
2.4.4
