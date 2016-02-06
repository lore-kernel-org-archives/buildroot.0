From: Mauro Condarelli <mc5686@mclink.it>
Date: Sat,  6 Feb 2016 23:59:58 +0100
Subject: [Buildroot] [PATCH v4 12/17] python-cryptography: new package
In-Reply-To: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454799603-5474-13-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 .gitignore                                         |  1 +
 package/python-cryptography/Config.in              | 20 +++++++++++++++++++
 .../python-cryptography/python-cryptography.hash   |  3 +++
 package/python-cryptography/python-cryptography.mk | 23 ++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/python-cryptography/Config.in
 create mode 100644 package/python-cryptography/python-cryptography.hash
 create mode 100644 package/python-cryptography/python-cryptography.mk

diff --git a/.gitignore b/.gitignore
index bb02d9f..faf357f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,4 @@
 *.rej
 *~
 *.pyc
+outgoing
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
new file mode 100644
index 0000000..c6d183f
--- /dev/null
+++ b/package/python-cryptography/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	bool "python-cryptography"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON_CFFI
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_IDNA
+	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON
+	help
+	  cryptography is a package designed to expose cryptographic
+	  primitives and recipes to Python developers.
+
+	  https://cryptography.io
+
+comment "python-cryptography needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
new file mode 100644
index 0000000..0358624
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=15eeba9e31f852bac21155baa3dfbc61, sha256 locally computed
+md5     15eeba9e31f852bac21155baa3dfbc61  cryptography-1.1.2.tar.gz
+sha256  7f51459f84d670444275e615839f4542c93547a12e938a0a4906dafe5f7de153  cryptography-1.1.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
new file mode 100644
index 0000000..fbd0caf
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-cryptography
+#
+################################################################################
+
+PYTHON_CRYPTOGRAPHY_VERSION = 1.1.2
+PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/source/c/cryptography
+PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
+PYTHON_CRYPTOGRAPHY_LICENSE = Apache
+PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = python-six \
+				   python-idna \
+				   python-pyasn \
+				   host-python-cffi \
+				   openssl
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES += python-enum34
+endif
+
+$(eval $(python-package))
-- 
2.1.4
