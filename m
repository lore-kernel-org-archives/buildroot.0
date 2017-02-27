From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Mon, 27 Feb 2017 14:26:01 +0100
Subject: [Buildroot] [PATCH 1/1] libftdi: new package
In-Reply-To: <1488201961-15539-1-git-send-email-christian.kellermann@solectrix.de>
References: <1488201961-15539-1-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <1488201961-15539-2-git-send-email-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
---
 package/Config.in                                         |  1 +
 .../python-pylibftdi/0001-do-not-use-find-library.patch   | 14 ++++++++++++++
 package/python-pylibftdi/Config.in                        | 13 +++++++++++++
 package/python-pylibftdi/python-libftdi.hash              |  3 +++
 package/python-pylibftdi/python-libftdi.mk                | 15 +++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/python-pylibftdi/0001-do-not-use-find-library.patch
 create mode 100644 package/python-pylibftdi/Config.in
 create mode 100644 package/python-pylibftdi/python-libftdi.hash
 create mode 100644 package/python-pylibftdi/python-libftdi.mk

diff --git a/package/Config.in b/package/Config.in
index deff0fe..452ff0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ menu "External python modules"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
+        source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
 	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
diff --git a/package/python-pylibftdi/0001-do-not-use-find-library.patch b/package/python-pylibftdi/0001-do-not-use-find-library.patch
new file mode 100644
index 0000000..2f17dc6
--- /dev/null
+++ b/package/python-pylibftdi/0001-do-not-use-find-library.patch
@@ -0,0 +1,14 @@
+diff -purN pylibftdi-0.15.0.orig/pylibftdi/driver.py pylibftdi-0.15.0/pylibftdi/driver.py
+--- pylibftdi-0.15.0.orig/pylibftdi/driver.py	2015-04-26 22:41:39.000000000 +0200
++++ pylibftdi-0.15.0/pylibftdi/driver.py	2017-02-27 13:08:56.502958000 +0100
+@@ -121,8 +121,8 @@ class Driver(object):
+                     lib = getattr(cdll, lib_path)
+                     break
+         if lib is None:
+-            raise LibraryMissingError('{} library not found (search: {})'.format(
+-                name, search_list))
++		return cdll.LoadLibrary(name + '.so')
++
+         return lib
+ 
+     @property
diff --git a/package/python-pylibftdi/Config.in b/package/python-pylibftdi/Config.in
new file mode 100644
index 0000000..36e3fac
--- /dev/null
+++ b/package/python-pylibftdi/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PYLIBFTDI
+	bool "python-pylibftdi"
+	select BR2_PACKAGE_LIBFTDI
+        depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+
+	help
+	  This package contains the python language binding libftdi.
+
+	  https://pypi.python.org/pypi/pylibftdi
+
+comment "python-pylibftdi needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pylibftdi/python-libftdi.hash b/package/python-pylibftdi/python-libftdi.hash
new file mode 100644
index 0000000..54b33a1
--- /dev/null
+++ b/package/python-pylibftdi/python-libftdi.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pylibftdi/json, sha256 locally computed
+md5  eaee7fb3a67f33a35a164a9628daaafe pylibftdi-0.15.0.tar.gz
+sha256  51ef08ebcc4ec3eaec2366e9648d3f8fa1b737ea507a7f3a374ac58abf148e77 pylibftdi-0.15.0.tar.gz
diff --git a/package/python-pylibftdi/python-libftdi.mk b/package/python-pylibftdi/python-libftdi.mk
new file mode 100644
index 0000000..b934c03
--- /dev/null
+++ b/package/python-pylibftdi/python-libftdi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-libftdi
+#
+################################################################################
+
+PYTHON_PYLIBFTDI_VERSION = 0.15.0
+PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
+PYTHON_PYLIBFTDI_SITE = https://pypi.python.org/packages/e5/bb/d7a86dbd7685e3866ea75d21c6c726d01706fdc0aa5dc9051ce18ae65693
+PYTHON_PYLIBFTDI_LICENSE = MIT
+PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
+PYTHON_PYLIBFTDI_DEPENDENCIES =libftdi
+PYTHON_PYLIBFTDI_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.1.4
