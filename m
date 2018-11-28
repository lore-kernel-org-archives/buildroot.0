From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 28 Nov 2018 17:51:02 +0100
Subject: [Buildroot] [PATCH 1/1] python-numpy: fix build with lapack
Message-ID: <20181128165102.4875-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_PACKAGE_LAPACK is enabled (without BR2_PACKAGE_CLAPACK), build of
python-numpy will fail if lapack is built before python-numpy because
lapack does not provide blas library

So disable BLAS and LAPACK through PYTHON_NUMPTY_ENV if
BR2_PACKAGE_CLAPACK is not set

Fixes:
 - http://autobuild.buildroot.org/results/41671976c7be7883f31ee5f51ca0eb90b81262fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-numpy/python-numpy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index c454888288..26a10c377b 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -14,6 +14,8 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
 PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
+else
+PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
 
 PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None
-- 
2.14.1
