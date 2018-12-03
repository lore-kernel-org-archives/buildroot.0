From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:18:53 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] python-numpy: fix build
 with lapack
Message-ID: <20181203221533.548568A58A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e36185ef3617fcb477ad3c3578598e789cfbe62b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

If BR2_PACKAGE_LAPACK is enabled (without BR2_PACKAGE_CLAPACK), build of
python-numpy will fail if lapack is built before python-numpy because
lapack does not provide blas library

So disable BLAS and LAPACK through PYTHON_NUMPTY_ENV if
BR2_PACKAGE_CLAPACK is not set

Fixes:
 - http://autobuild.buildroot.org/results/41671976c7be7883f31ee5f51ca0eb90b81262fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 76815cd1e556816f885d817576d83df67f579612)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-numpy/python-numpy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index d0d38371a3..14671ae2da 100644
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
