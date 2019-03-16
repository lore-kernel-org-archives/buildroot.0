From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sat, 16 Mar 2019 10:36:56 +0800
Subject: [Buildroot] [PATCH 1/1] package/python-brotlipy: new package
Message-ID: <20190316023656.3485-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Python binding to the Brotli library.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...nk-stdc-when-using-bundled-libbrotli.patch | 28 +++++++++++++++++++
 package/python-brotlipy/Config.in             |  7 +++++
 package/python-brotlipy/python-brotlipy.hash  |  6 ++++
 package/python-brotlipy/python-brotlipy.mk    | 15 ++++++++++
 6 files changed, 58 insertions(+)
 create mode 100644 package/python-brotlipy/0001-Don-t-link-stdc-when-using-bundled-libbrotli.patch
 create mode 100644 package/python-brotlipy/Config.in
 create mode 100644 package/python-brotlipy/python-brotlipy.hash
 create mode 100644 package/python-brotlipy/python-brotlipy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 778dffa5d5..249b073e5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1041,6 +1041,7 @@ F:	package/python-aiohttp-sse/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
 F:	package/python-async-timeout/
+F:	package/python-brotlipy/
 F:	package/python-cchardet/
 F:	package/python-multidict/
 F:	package/python-pycares/
diff --git a/package/Config.in b/package/Config.in
index 30391cfc89..f2891b3620 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -825,6 +825,7 @@ menu "External python modules"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bottle/Config.in"
+	source "package/python-brotlipy/Config.in"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-cbor/Config.in"
diff --git a/package/python-brotlipy/0001-Don-t-link-stdc-when-using-bundled-libbrotli.patch b/package/python-brotlipy/0001-Don-t-link-stdc-when-using-bundled-libbrotli.patch
new file mode 100644
index 0000000000..2f6f0f9847
--- /dev/null
+++ b/package/python-brotlipy/0001-Don-t-link-stdc-when-using-bundled-libbrotli.patch
@@ -0,0 +1,28 @@
+From 2a1273bbb8d5764ad6d9a15e95bf7990c5a29393 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 15 Mar 2019 20:08:05 -0600
+Subject: [PATCH] Don't link stdc++ when using bundled libbrotli
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/python-hyper/brotlipy/pull/151]
+---
+ src/brotli/build.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/brotli/build.py b/src/brotli/build.py
+index 562376e..a200e89 100644
+--- a/src/brotli/build.py
++++ b/src/brotli/build.py
+@@ -5,8 +5,6 @@ from cffi import FFI
+ ffi = FFI()
+ 
+ libraries = ['libbrotli']
+-if 'win32' not in str(sys.platform).lower():
+-    libraries.append('stdc++')
+ 
+ 
+ ffi.set_source(
+-- 
+2.19.1
+
diff --git a/package/python-brotlipy/Config.in b/package/python-brotlipy/Config.in
new file mode 100644
index 0000000000..656994ec5e
--- /dev/null
+++ b/package/python-brotlipy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BROTLIPY
+	bool "python-brotlipy"
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Python binding to the Brotli library.
+
+	  https://github.com/python-hyper/brotlipy/
diff --git a/package/python-brotlipy/python-brotlipy.hash b/package/python-brotlipy/python-brotlipy.hash
new file mode 100644
index 0000000000..a79323eb43
--- /dev/null
+++ b/package/python-brotlipy/python-brotlipy.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/brotlipy/json
+md5	300a63158cec5b74082625dd9a2ae4d2  brotlipy-0.7.0.tar.gz
+sha256	36def0b859beaf21910157b4c33eb3b06d8ce459c942102f16988cca6ea164df  brotlipy-0.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256	f3e9c29e3db36dc305a4be68a8a225f93949852ce2d19b5b0a3c099eee6509c5  LICENSE
+sha256	3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  libbrotli/LICENSE
diff --git a/package/python-brotlipy/python-brotlipy.mk b/package/python-brotlipy/python-brotlipy.mk
new file mode 100644
index 0000000000..f51376fab2
--- /dev/null
+++ b/package/python-brotlipy/python-brotlipy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-brotlipy
+#
+################################################################################
+
+PYTHON_BROTLIPY_VERSION = 0.7.0
+PYTHON_BROTLIPY_SOURCE = brotlipy-$(PYTHON_BROTLIPY_VERSION).tar.gz
+PYTHON_BROTLIPY_SITE = https://files.pythonhosted.org/packages/d9/91/bc79b88590e4f662bd40a55a2b6beb0f15da4726732efec5aa5a3763d856
+PYTHON_BROTLIPY_SETUP_TYPE = setuptools
+PYTHON_BROTLIPY_LICENSE = MIT
+PYTHON_BROTLIPY_LICENSE_FILES = LICENSE libbrotli/LICENSE
+PYTHON_BROTLIPY_DEPENDENCIES = host-python-cffi
+
+$(eval $(python-package))
-- 
2.17.1
