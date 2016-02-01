From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:38 +0100
Subject: [Buildroot] [PATCH 19/22] package/python-cryptography: new package.
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-20-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                                  |  1 +
 package/python-cryptography/Config.in              | 20 +++++++++++++++++++
 .../python-cryptography/python-cryptography.hash   |  6 ++++++
 package/python-cryptography/python-cryptography.mk | 23 ++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/python-cryptography/Config.in
 create mode 100644 package/python-cryptography/python-cryptography.hash
 create mode 100644 package/python-cryptography/python-cryptography.mk

diff --git a/package/Config.in b/package/Config.in
index 5221cfe..1cdcbb0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -632,6 +632,7 @@ menu "External python modules"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
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
index 0000000..f828fb4
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.hash
@@ -0,0 +1,6 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=15eeba9e31f852bac21155baa3dfbc61, sha256 locally computed
+md5     15eeba9e31f852bac21155baa3dfbc61  cryptography-1.1.2.tar.gz
+sha256  7f51459f84d670444275e615839f4542c93547a12e938a0a4906dafe5f7de153  cryptography-1.1.2.tar.gz
+# Locally computed.
+md5	02798acc5e2d5dbcf6e792a24fc05b95  cryptography-1.2.1.tar.gz
+sha256	a13217a03a47e743d26edff7299e4be7358c2fd12a223ac5d6de3229690b6ee5  cryptography-1.2.1.tar.gz
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
