From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 11 Jun 2019 21:36:38 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: optionnaly depends on
 lapack not clapack
Message-ID: <20190611193638.32741-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-numpy needs cblas which is only provided by lapack, otherwise
there is an exeption while importing numpy due to a missing symbol
cblas_sgemm.

python code:
    import numpy as np
    list = [1,2,3,4]
    arr = np.array(list)
    print (arr)

python Error:
ImportError: /usr/lib/python3.7/site-packages/numpy/core/_multiarray_umath.cpython-37m-arm-linux-gnueabi.so: undefined symbol: cblas_sgemm

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-numpy/python-numpy.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 5d2fbfc7ad..5086d783db 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -15,9 +15,9 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
 			numpy/core/src/multiarray/dragon4.c
 PYTHON_NUMPY_SETUP_TYPE = setuptools
 
-ifeq ($(BR2_PACKAGE_CLAPACK),y)
-PYTHON_NUMPY_DEPENDENCIES += clapack
-PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+PYTHON_NUMPY_DEPENDENCIES += lapack
+PYTHON_NUMPY_SITE_CFG_LIBS += blas cblas lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
-- 
2.20.1
