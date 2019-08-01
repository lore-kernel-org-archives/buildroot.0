From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  1 Aug 2019 23:09:18 +0200
Subject: [Buildroot] [PATCH 3/5] package/python-numpy: use liblapack virtual
 package
In-Reply-To: <20190801210920.31338-1-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
Message-ID: <20190801210920.31338-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre PAYEN <alexandre.payen@smile.fr>

With the virtual packet liblapack, numpy can be build using both providers
(clapack or lapack).

With lapack as provider we needs to select BR2_PACKAGE_LAPACK_COMPLEX.

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-numpy/Config.in       | 1 +
 package/python-numpy/python-numpy.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index c337675ceb..6d0b373413 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index aa8052dca4..602eb3bad9 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -15,8 +15,8 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
 			numpy/core/src/multiarray/dragon4.c
 PYTHON_NUMPY_SETUP_TYPE = setuptools
 
-ifeq ($(BR2_PACKAGE_CLAPACK),y)
-PYTHON_NUMPY_DEPENDENCIES += clapack
+ifeq ($(BR2_PACKAGE_LIBLAPACK),y)
+PYTHON_NUMPY_DEPENDENCIES += liblapack
 PYTHON_NUMPY_SITE_CFG_LIBS += cblas lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
-- 
2.20.1
