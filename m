From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  1 Aug 2019 23:09:16 +0200
Subject: [Buildroot] [PATCH 1/5] package/python-numpy: fix occasional build
 and run-time failure with lapack
Message-ID: <20190801210920.31338-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre PAYEN <alexandre.payen@smile.fr>

python-numpy fail at run-time because `cblas` reference is missing in
BR2_PYTHON_NUMPY_SITE_CFG_LIBS.
clapack is the C implementation of lapack so when using clapack python numpy
depends on clapack.
cblas is a blas layer which allow to call blas routine from C code. So python
numpy need cblas instead of blas to work correclty

So :
- add cblas reference in BR2_PYTHON_NUMPY_SITE_CFG_LIBS when
  BR2_PACKAGE_CLAPACK = y

Fixes:
http://autobuild.buildroot.net/results/50f/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d/
http://lists.busybox.net/pipermail/buildroot/2019-June/252380.html

Initial patch from Giulio Benetti :
[v1] http://patchwork.ozlabs.org/patch/1100100/
[v2] http://patchwork.ozlabs.org/patch/1100208/

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-numpy/python-numpy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 5d2fbfc7ad..aa8052dca4 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -17,7 +17,7 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
-PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
+PYTHON_NUMPY_SITE_CFG_LIBS += cblas lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
-- 
2.20.1
