From: Aalx <alexandre.payen@smile.fr>
Date: Mon, 15 Jul 2019 14:22:39 +0200
Subject: [Buildroot] [PATCHv5 3/3] package/python-numpy: fix occasional
 build and run-time failure with lapack
Message-ID: <20190715122239.17147-1-alexandre.payen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre PAYEN <alexandre.payen@smile.fr>

With the virtual packet liblapack, numpy can be build using both providers.
Due to run-time failure when complex option is enable,
the cblas reference must be add when :
BR2_PACKAGE_LAPACK_COMPLEX = y

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
---
 package/python-numpy/python-numpy.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index b90ff7d70f..30db0b3797 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -18,6 +18,9 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
 PYTHON_NUMPY_SITE_CFG_LIBS += cblas clapack
+else ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
+PYTHON_NUMPY_DEPENDENCIES += lapack
+PYTHON_NUMPY_SITE_CFG_LIBS += blas cblas lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
-- 
2.21.0
