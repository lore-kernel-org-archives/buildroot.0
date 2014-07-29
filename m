From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 21:31:32 +0200
Subject: [Buildroot] [git commit] python: new module cffi
Message-ID: <20140729193207.299669D333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5bf154592691b104e2ee0f97f9fcaf8cce54a52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Foreign Function Interface for Python calling C code.

[Thomas: add dependency on host-pkgconf and libffi, enable on Python 3
since the module builds fine and loads fine with Python 3 as well.]

Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/python-cffi/Config.in      |   10 ++++++++++
 package/python-cffi/python-cffi.mk |   15 +++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 11087da..29b8e6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -469,6 +469,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 	source "package/python-bottle/Config.in"
+	source "package/python-cffi/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-daemon/Config.in"
diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
new file mode 100644
index 0000000..f18ed96
--- /dev/null
+++ b/package/python-cffi/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_CFFI
+	bool "python-cffi"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_LIBFFI
+	help
+	  This is the Foreign Function Interface for Python calling C
+	  code.  The aim of this project is to provide a convenient
+	  and reliable way of calling C code from Python.
+
+	  https://pypi.python.org/pypi/cffi
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
new file mode 100644
index 0000000..8499a7b
--- /dev/null
+++ b/package/python-cffi/python-cffi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-cffi
+#
+################################################################################
+
+PYTHON_CFFI_VERSION = 0.8.2
+PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
+PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi/
+PYTHON_CFFI_SETUP_TYPE = setuptools
+PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
+PYTHON_CFFI_LICENSE = MIT
+PYTHON_CFFI_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
