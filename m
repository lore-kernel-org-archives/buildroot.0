From: Aalx <alexandre.payen@smile.fr>
Date: Fri,  2 Aug 2019 16:45:03 +0200
Subject: [Buildroot] [PATCH v3] package/python-imutils: new package
Message-ID: <20190802144503.23601-1-alexandre.payen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre PAYEN <alexandre.payen@smile.fr>

python-imutils is a series of convenience functions to make basic image
processing functions. It wrap openCV functions into easiers one.
So it depends on opencv and more precisly on opencv ImgCodec

No license file can be found in the downloaded tarball but the license
is MIT[1].

[1]: https://github.com/jrosebr1/imutils/blob/master/LICENSE.txt

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2 : Set MIT license in python-imutils.mk.
No file can be found but, int imutils repository on github, there is
this a LICENSE.txt file which describe a MIT license.

v3 : Resolve a recursive dependency with opencv3.
From now, imutils depends on opencv3.
---
 package/Config.in                          |  1 +
 package/python-imutils/Config.in           | 33 ++++++++++++++++++++++
 package/python-imutils/python-imutils.hash |  3 ++
 package/python-imutils/python-imutils.mk   | 13 +++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/python-imutils/Config.in
 create mode 100644 package/python-imutils/python-imutils.hash
 create mode 100644 package/python-imutils/python-imutils.mk

diff --git a/package/Config.in b/package/Config.in
index 68905849dc..12eadbd483 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,6 +909,7 @@ menu "External python modules"
 	source "package/python-ibmiotf/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
+	source "package/python-imutils/Config.in"
 	source "package/python-incremental/Config.in"
 	source "package/python-inflection/Config.in"
 	source "package/python-influxdb/Config.in"
diff --git a/package/python-imutils/Config.in b/package/python-imutils/Config.in
new file mode 100644
index 0000000000..0c8ffbda56
--- /dev/null
+++ b/package/python-imutils/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_PYTHON_IMUTILS
+	bool "python-imutils"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-scipy
+	depends on BR2_PACKAGE_PYTHON3 # python-scipy
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN # python-scipy
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # opencv3
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # opencv3
+	depends on BR2_INSTALL_LIBSTDCPP # opencv3
+	depends on BR2_USE_WCHAR # opencv3
+	depends on !BR2_STATIC_LIBS  # opencv3
+	depends on !BR2_PACKAGE_OPENCV # opencv3
+	depends on BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_PYTHON_SCIPY
+	select BR2_PACKAGE_OPENCV3_LIB_PYTHON
+	select BR2_PACKAGE_OPENCV3_LIB_IMGCODECS
+	help
+	  A series of convenience functions to make basic image
+	  processing functions such as translation, rotation,
+	  resizing, skeletonization, displaying Matplotlib images,
+	  sorting contours, detecting edges, and much more easier
+	  with OpenCV and both Python 2.7 and Python 3.
+
+	  https://github.com/jrosebr1/imutils
+
+comment "python-imutils needs a toolchain w/ C++, NPTL, wchar, dynamic library, gFortran"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_OPENCV
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_FORTRAN
+
+comment "python-imutils needs Opencv3"
+	depends on !BR2_PACKAGE_OPENCV3
diff --git a/package/python-imutils/python-imutils.hash b/package/python-imutils/python-imutils.hash
new file mode 100644
index 0000000000..f8326de660
--- /dev/null
+++ b/package/python-imutils/python-imutils.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/imutils/json
+md5	bfb5a2cd095cebd3e4a27e8653d1322c  imutils-0.5.2.tar.gz
+sha256	1d2bdf373e3e6cfbdc113d4e91547d3add3774d8722c8d4f225fa39586fb8076  imutils-0.5.2.tar.gz
diff --git a/package/python-imutils/python-imutils.mk b/package/python-imutils/python-imutils.mk
new file mode 100644
index 0000000000..c5168e2be0
--- /dev/null
+++ b/package/python-imutils/python-imutils.mk
@@ -0,1 +1,13 @@
+################################################################################
+#
+# python-imutils
+#
+################################################################################
+
+PYTHON_IMUTILS_VERSION = 0.5.2
+PYTHON_IMUTILS_SOURCE = imutils-$(PYTHON_IMUTILS_VERSION).tar.gz
+PYTHON_IMUTILS_SITE = https://files.pythonhosted.org/packages/5e/0c/659c2bdae8e8ca5ef810b9da02db28feaa29ea448ff36b65a1664ff28142
+PYTHON_IMUTILS_SETUP_TYPE = distutils
+PYTHON_IMUTILS_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.21.0
