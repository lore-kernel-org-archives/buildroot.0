From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 15 May 2019 16:41:21 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: fix occasional build
 failure with lapack
Message-ID: <20190515144121.81041-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-numpy build fails only if lapack is built before python-numpy
itself, and this doesn't always happen because lapack dependency is
missing in BR2_PYTHON_NUMPY_DEPENDENCIES.
Then build failure is due to missing BR2_PACKAGE_LAPACK_COMPLEX that
provides some functions in lapack libraries needed by python-numpy.

So:
- add lapack to BR2_PYTHON_NUMPY_DEPENDENCIES when
  BR2_PACKAGE_LAPACK = y
- substitute ifeq check "$(BR2_PACKAGE_LAPACK),y" with
  "$(BR2_PACKAGE_LAPACK_COMPLEX),y" because python-numpy needs COMPLEX
  functions and BR2_PACKAGE_LAPACK_COMPLEX inherits BR2_PACKAGE_LAPACK

Fixes:
http://autobuild.buildroot.net/results/50f/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/python-numpy/python-numpy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 28dccf8be5..a61246615a 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -15,8 +15,8 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
 			numpy/core/src/multiarray/dragon4.c
 PYTHON_NUMPY_SETUP_TYPE = setuptools
 
-ifeq ($(BR2_PACKAGE_CLAPACK),y)
-PYTHON_NUMPY_DEPENDENCIES += clapack
+ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
+PYTHON_NUMPY_DEPENDENCIES += clapack lapack
 PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
-- 
2.17.1
