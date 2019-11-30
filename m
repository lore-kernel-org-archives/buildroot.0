From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2019 09:47:47 +0100
Subject: [Buildroot] [git commit] package/opencv3: ensure the python module
 works when BR2_PACKAGE_PYTHON{, 3}_PYC_ONLY=y
Message-ID: <20191130095727.18E6882819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d07c315f0c24903e03169c939b050618a9c3ba8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenCV Python module does a fairly strange thing to read a few
configuration details: it uses Python's execfile() to execute two .py
files and access a few variables. However, execfile() only works with
.py files and not .pyc files.

When BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y, the .py files are all removed,
causing the OpenCV Python module to not work:

  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 89, in <module>
  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 58, in bootstrap
  File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 56, in load_first_config
ImportError: OpenCV loader: missing configuration file: ['config.py']. Check OpenCV installation.

To fix this problem, this commit uses the newly introduced
<pkg>_KEEP_PY_FILES mechanism, to ensure the important config*.py
files are kept.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12171

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 83094ed78b..d38107f6e7 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -328,6 +328,7 @@ OPENCV3_CONF_OPTS += \
 	-DPYTHON2_PACKAGES_PATH=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 	-DPYTHON2_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV3_DEPENDENCIES += python
+OPENCV3_KEEP_PY_FILES += usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/cv2/config*.py
 else
 OPENCV3_CONF_OPTS += \
 	-DBUILD_opencv_python2=OFF \
@@ -339,6 +340,7 @@ OPENCV3_CONF_OPTS += \
 	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV3_DEPENDENCIES += python3
+OPENCV3_KEEP_PY_FILES += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/cv2/config*.py
 endif
 OPENCV3_CONF_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 OPENCV3_DEPENDENCIES += python-numpy
