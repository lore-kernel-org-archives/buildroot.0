From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 10 Dec 2015 09:40:40 +0100
Subject: [Buildroot] [PATCH v2] python-pyudev: new package
Message-ID: <1449736840-19224-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add a patch, that fixes find_library() issue on the systems
without library cache.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: bump version and add workaround for find_library() issue

 package/Config.in                                  |  1 +
 ...finding-libudev-on-systems-without-ldconf.patch | 47 ++++++++++++++++++++++
 package/python-pyudev/Config.in                    | 14 +++++++
 package/python-pyudev/python-pyudev.hash           |  3 ++
 package/python-pyudev/python-pyudev.mk             | 14 +++++++
 5 files changed, 79 insertions(+)
 create mode 100644 package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
 create mode 100644 package/python-pyudev/Config.in
 create mode 100644 package/python-pyudev/python-pyudev.hash
 create mode 100644 package/python-pyudev/python-pyudev.mk

diff --git a/package/Config.in b/package/Config.in
index 95f4cda..ee02def 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -661,6 +661,7 @@ menu "External python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyxml/Config.in"
diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
new file mode 100644
index 0000000..93b9568
--- /dev/null
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -0,0 +1,47 @@
+From e86a1c199d45c9751da67f947af202927dee07f8 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 10 Dec 2015 08:44:55 +0100
+Subject: [PATCH] Workaround finding libudev on systems without ldconf
+
+This patch tries to load libudev.so directly without relying on
+Python's find_library(). find_library() fails on systems
+without library cache mechanism.
+
+Taken from pyudev issue 117 discussion:
+https://github.com/pyudev/pyudev/pull/117
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/pyudev/_libudev.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/pyudev/_libudev.py b/src/pyudev/_libudev.py
+index a0de8fb..1348d17 100644
+--- a/src/pyudev/_libudev.py
++++ b/src/pyudev/_libudev.py
+@@ -30,7 +30,7 @@
+ from __future__ import (print_function, division, unicode_literals,
+                         absolute_import)
+ 
+-from ctypes import (CDLL, Structure, POINTER,
++from ctypes import (cdll, CDLL, Structure, POINTER,
+                     c_char, c_char_p, c_int, c_uint, c_ulonglong)
+ from ctypes.util import find_library
+ 
+@@ -265,10 +265,10 @@ def load_udev_library():
+ 
+     Raise :exc:`~exceptions.ImportError`, if the udev library was not found.
+     """
+-    udev_library_name = find_library('udev')
+-    if not udev_library_name:
++    try:
++        libudev = cdll.LoadLibrary('libudev.so')
++    except OSError:
+         raise ImportError('No library named udev')
+-    libudev = CDLL(udev_library_name, use_errno=True)
+     # context function signature
+     for namespace, members in SIGNATURES.items():
+         for funcname in members:
+-- 
+2.1.4
+
diff --git a/package/python-pyudev/Config.in b/package/python-pyudev/Config.in
new file mode 100644
index 0000000..137a983
--- /dev/null
+++ b/package/python-pyudev/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_PYUDEV
+	bool "python-pyudev"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  pyudev is a LGPL licenced, pure Python 2/3 binding to libudev,
+	  the device and hardware management and information library of Linux.
+
+	  https://github.com/pyudev/pyudev
+
+comment "python-pyudev needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
new file mode 100644
index 0000000..adda9a4
--- /dev/null
+++ b/package/python-pyudev/python-pyudev.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=07a60f5f7a6028e83725f759a1b9490a, sha256 locally computed
+md5     07a60f5f7a6028e83725f759a1b9490a  pyudev-0.18.tar.gz
+sha256  83b315f74e29c3a4aa6ea38b6cf73b0bb7e37066d7a5d70972ac418a80aed62a  pyudev-0.18.tar.gz
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
new file mode 100644
index 0000000..70c4faf
--- /dev/null
+++ b/package/python-pyudev/python-pyudev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyudev
+#
+################################################################################
+
+PYTHON_PYUDEV_VERSION = 0.18
+PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
+PYTHON_PYUDEV_SITE = https://pypi.python.org/packages/source/p/pyudev
+PYTHON_PYUDEV_LICENSE = LGPLv2.1+
+PYTHON_PYUDEV_LICENSE_FILES = COPYING
+PYTHON_PYUDEV_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4
