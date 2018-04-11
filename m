From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:36:18 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] opencv3: fix Python
 module build for Python 3.x
Message-ID: <20180411154835.C346788454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aab75096094dcd1245be9df41e830d2dc98df7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

When the OpenCV3 Python support is enabled with Python 3.x, it builds
properly, and the resulting .so file is built for the target
architecture, but its name is wrong:

  output/target/usr/lib/python3.6/site-packages/cv2.cpython-36m-x86_64-linux-gnu.so

This prevents Python 3.x from importing the module:

>>> import cv2
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ModuleNotFoundError: No module named 'cv2'

In order to fix this, we simply need to pass PKG_PYTHON_DISTUTILS_ENV
in the environment. The Python module then gets named:

  output/target/usr/lib/python3.6/site-packages/cv2.cpython-36m-arm-linux-gnueabi.so

And can be imported properly:

>>> import cv2
>>>

This solution was suggested by Arnout Vandecappelle in
https://stackoverflow.com/questions/49059035/buildroot-opencv3-python-package-builds-for-the-wrong-target.

With Python 2.x, the module is named just cv2.so so this problem isn't
visible. However, for consistency, we also pass
PKG_PYTHON_DISTUTILS_ENV when building against Python 2.x, by putting
the OPENCV3_CONF_ENV assignment inside the
BR2_PACKAGE_OPENCV3_LIB_PYTHON condition, but outside the
BR2_PACKAGE_PYTHON3/BR2_PACKAGE_PYTHON condition.

Signed-off-by: Sasha Shyrokov <alexander-shyrokov@idexx.com>
[Thomas: extend the commit log, apply the solution to Python 2.x.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8ba80282c3bb580c6a45ea114e70acac98fe1690)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 10660a90fb..8f1a64b921 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -340,6 +340,7 @@ OPENCV3_CONF_OPTS += \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV3_DEPENDENCIES += python3
 endif
+OPENCV3_CONF_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 OPENCV3_DEPENDENCIES += python-numpy
 else
 OPENCV3_CONF_OPTS += \
