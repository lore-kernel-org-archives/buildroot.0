From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 29 Oct 2020 22:38:22 +0100
Subject: [Buildroot] [PATCH] package/python-pyudev: bump to version 0.22.0
Message-ID: <20201029213822.4423-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 ...ng-libudev-on-systems-without-ldconf.patch | 46 ++++++++++---------
 package/python-pyudev/python-pyudev.hash      |  8 ++--
 package/python-pyudev/python-pyudev.mk        |  4 +-
 3 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index 93b9568593..67c2766496 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -11,37 +11,39 @@ Taken from pyudev issue 117 discussion:
 https://github.com/pyudev/pyudev/pull/117
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+[Marcin: adjust to 0.22.0]
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 ---
- src/pyudev/_libudev.py | 8 ++++----
+ src/pyudev/_ctypeslib/utils.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/src/pyudev/_libudev.py b/src/pyudev/_libudev.py
-index a0de8fb..1348d17 100644
---- a/src/pyudev/_libudev.py
-+++ b/src/pyudev/_libudev.py
-@@ -30,7 +30,7 @@
- from __future__ import (print_function, division, unicode_literals,
-                         absolute_import)
+diff --git a/src/pyudev/_ctypeslib/utils.py b/src/pyudev/_ctypeslib/utils.py
+index 9dffb3c..aa9942f 100644
+--- a/src/pyudev/_ctypeslib/utils.py
++++ b/src/pyudev/_ctypeslib/utils.py
+@@ -28,7 +28,7 @@
+ from __future__ import print_function
+ from __future__ import unicode_literals
  
--from ctypes import (CDLL, Structure, POINTER,
-+from ctypes import (cdll, CDLL, Structure, POINTER,
-                     c_char, c_char_p, c_int, c_uint, c_ulonglong)
+-from ctypes import CDLL
++from ctypes import cdll, CDLL
  from ctypes.util import find_library
  
-@@ -265,10 +265,10 @@ def load_udev_library():
  
-     Raise :exc:`~exceptions.ImportError`, if the udev library was not found.
+@@ -50,10 +50,10 @@ def load_ctypes_library(name, signatures, error_checkers):
+     :rtype: ctypes.CDLL
+     :raises ImportError: if the library is not found
      """
--    udev_library_name = find_library('udev')
--    if not udev_library_name:
+-    library_name = find_library(name)
+-    if not library_name:
 +    try:
-+        libudev = cdll.LoadLibrary('libudev.so')
++        lib = cdll.LoadLibrary(f'lib{name}.so')
 +    except OSError:
-         raise ImportError('No library named udev')
--    libudev = CDLL(udev_library_name, use_errno=True)
-     # context function signature
-     for namespace, members in SIGNATURES.items():
-         for funcname in members:
+         raise ImportError('No library named %s' % name)
+-    lib = CDLL(library_name, use_errno=True)
+     # Add function signatures
+     for funcname, signature in signatures.items():
+         function = getattr(lib, funcname, None)
 -- 
-2.1.4
+2.29.1
 
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index 94c590731b..def10542fa 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=07a60f5f7a6028e83725f759a1b9490a
-md5     07a60f5f7a6028e83725f759a1b9490a  pyudev-0.18.tar.gz
-# Locally computed
-sha256  83b315f74e29c3a4aa6ea38b6cf73b0bb7e37066d7a5d70972ac418a80aed62a  pyudev-0.18.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyudev/json
+md5  377eda61186c91e9440f01d76dbb4206  pyudev-0.22.0.tar.gz
+sha256  69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276  pyudev-0.22.0.tar.gz
+# Locally computed sha256 checksums
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
index db941ea4d9..42d5c7000b 100644
--- a/package/python-pyudev/python-pyudev.mk
+++ b/package/python-pyudev/python-pyudev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUDEV_VERSION = 0.18
+PYTHON_PYUDEV_VERSION = 0.22.0
 PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
-PYTHON_PYUDEV_SITE = https://pypi.python.org/packages/source/p/pyudev
+PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/72/c8/4660d815a79b1d42c409012aaa10ebd6b07a47529b4cb6880f27a24bd646
 PYTHON_PYUDEV_LICENSE = LGPL-2.1+
 PYTHON_PYUDEV_LICENSE_FILES = COPYING
 PYTHON_PYUDEV_SETUP_TYPE = setuptools
-- 
2.29.1
