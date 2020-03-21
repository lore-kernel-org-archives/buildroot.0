From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 22 Mar 2020 00:32:38 +0530
Subject: [Buildroot] [PATCH v7 1/4] package/python-numpy: Bump to version
 1.18.2
In-Reply-To: <20200321190241.3590-1-jagan@amarulasolutions.com>
References: <20200321190241.3590-1-jagan@amarulasolutions.com>
Message-ID: <20200321190241.3590-2-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the python-numpy version to 1.18.2, this version
of python-numpy will support python3 only, not python2.

Drop python2 dependency from opencv3, gnuadio packages
since the python support on these are selecting
python-numpy.

Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Esben Haabendal <esben@geanix.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- bump 1.181.2 numpy
- drop 'BR2_PACKAGE_HOST_PYTHON_CYTHON' selection from numpy
- drop python2 dependency from gnuradio.mk
- drop python2 dependency from opencv3.mk
- update the commit message

 package/gnuradio/Config.in             |  2 +-
 package/gnuradio/gnuradio.mk           |  4 ++--
 package/opencv3/Config.in              |  2 +-
 package/opencv3/opencv3.mk             | 14 --------------
 package/python-numpy/Config.in         |  1 +
 package/python-numpy/python-numpy.hash | 14 +++++++-------
 package/python-numpy/python-numpy.mk   |  4 +++-
 7 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 6d438bcd6f..bf69ed605b 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -63,7 +63,7 @@ config BR2_PACKAGE_GNURADIO_FEC
 
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 41d4619f72..ab5b79e3e5 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -13,7 +13,7 @@ GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	host-python3 \
 	host-python-mako \
 	host-python-six \
 	host-swig \
@@ -108,7 +108,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GNURADIO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
+GNURADIO_DEPENDENCIES += python3
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index d4b17b6acf..18c390c515 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -156,7 +156,7 @@ config BR2_PACKAGE_OPENCV3_LIB_PHOTO
 
 config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	bool "python"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 8a8257b387..fe41f6f382 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -312,19 +312,6 @@ OPENCV3_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_LIB_PYTHON),y)
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-OPENCV3_CONF_OPTS += \
-	-DBUILD_opencv_python2=ON \
-	-DBUILD_opencv_python3=OFF \
-	-DPYTHON2_EXECUTABLE=$(HOST_DIR)/bin/python2 \
-	-DPYTHON2_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
-	-DPYTHON2_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so \
-	-DPYTHON2_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/numpy/core/include \
-	-DPYTHON2_PACKAGES_PATH=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-	-DPYTHON2_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
-OPENCV3_DEPENDENCIES += python
-OPENCV3_KEEP_PY_FILES += usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/cv2/config*.py
-else
 OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=OFF \
 	-DBUILD_opencv_python3=ON \
@@ -336,7 +323,6 @@ OPENCV3_CONF_OPTS += \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV3_DEPENDENCIES += python3
 OPENCV3_KEEP_PY_FILES += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/cv2/config*.py
-endif
 OPENCV3_CONF_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 OPENCV3_DEPENDENCIES += python-numpy
 else
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 5b9ee5803b..507d52c4d8 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	# python-numpy needs fenv.h which is not provided by uclibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index eb4123e3f6..ff9d02643c 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,9 +1,9 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.16.4
-sha256	a3bccb70ad94091a5b9e2469fabd41ac877c140a6828c2022e35560a2ec0346c	numpy-1.16.4.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.18.1
+sha256  da204ce460aa4247e595b7c7189d2fb2ed5f796bc03197055de01dac61d0125e	numpy-1.18.2.tar.gz
 # License files, locally calculated
-sha256	6b5086f61fe0c71564a79304ecbaa60f11fa3f3debf82f73d16a611cab102adc	LICENSE.txt
-sha256	426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
+sha256  ad81d0c21843ba6ce6fe5fa3eaacb61120be70cd798c52f63df3f4c12a843f0c	LICENSE.txt
+sha256  d3045980e80a6b39f98586c24bc7f39a7625b4b9f08ce72e367d12814743d047	numpy/core/src/multiarray/dragon4.c
+sha256  426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
 sha256	154a8706fa0fdeff1073bf6239c4ecf51f562ab107066eef839dade1a45c824c	doc/scipy-sphinx-theme/LICENSE.txt
-sha256	a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
-sha256	badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
-sha256	d37526b4a34c0aa859afe6f9b7e64ca7c306b7430df8113dd5ac6fcb246bd2d4	numpy/core/src/multiarray/dragon4.c
+sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
+sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 3b474efa6e..3f0df7a640 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.16.4
+PYTHON_NUMPY_VERSION = 1.18.2
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
@@ -14,6 +14,8 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
 			tools/npy_tempita/license.txt \
 			numpy/core/src/multiarray/dragon4.c
 PYTHON_NUMPY_SETUP_TYPE = setuptools
+PYTHON_NUMPY_DEPENDENCIES += host-python-cython
+HOST_PYTHON_NUMPY_DEPENDENCIES += host-python-cython
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
-- 
2.17.1
