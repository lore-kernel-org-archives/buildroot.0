From: Aalx <alexandre.payen@smile.fr>
Date: Fri, 12 Jul 2019 15:42:27 +0200
Subject: [Buildroot] [PATCH] [PATCH] package/python-numpy: fix occasional
 build and run-time failure with lapack
Message-ID: <20190712134227.22781-1-alexandre.payen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre PAYEN <alexandre.payen@smile.fr>

python-numpy build fails if lapack is built before python-numpy itself, and
this does not always happen because lapack dependency is missing in
BR2_PYTHON_NUMPY_DEPENDENCIES.
Also python-numpy fail at run-time because `cblas` reference is missing in
BR2_PYTHON_NUMPY_SITE_CFG_LIBS however the choosen lapack implementation.

So :
- add lapack to BR2_PYTHON_NUMPY_DEPENDENCIES when
  BR2_PACKAGE_LAPACK = y
- add cblas reference in BR2_PYTHON_NUMPY_SITE_CFG_LIBS when
  BR2_PACKAGE_LAPACK = y
- add cblas and clapack reference in BR2_PYTHON_NUMPY_SITE_CFG_LIBS when
  BR2_PACKAGE_CLAPACK = y

Fixes:
http://autobuild.buildroot.net/results/50f/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d/
http://lists.busybox.net/pipermail/buildroot/2019-June/252380.html

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
---
 package/python-numpy/python-numpy.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 5d2fbfc7ad..e539a649f7 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -17,7 +17,12 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
-PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
+PYTHON_NUMPY_SITE_CFG_LIBS += cblas clapack
+PYTHON_NUMPY_ENV += BLAS=clapack LAPACK=clapack
+else ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
+PYTHON_NUMPY_DEPENDENCIES += lapack
+PYTHON_NUMPY_SITE_CFG_LIBS += blas cblas lapack
+PYTHON_NUMPY_ENV += BLAS=lapack LAPACK=lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
-- 
2.21.0
