From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat,  6 Feb 2016 20:59:09 +0100
Subject: [Buildroot] [PATCH v3 1/2] python-cryptography: new package
Message-ID: <1454788750-9206-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes
	v3: select PYTHON_SSL option
	v2: add # runtime tags

 package/Config.in                                  |  1 +
 package/python-cryptography/Config.in              | 23 ++++++++++++++++++++++
 .../python-cryptography/python-cryptography.hash   |  3 +++
 package/python-cryptography/python-cryptography.mk | 23 ++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/python-cryptography/Config.in
 create mode 100644 package/python-cryptography/python-cryptography.hash
 create mode 100644 package/python-cryptography/python-cryptography.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..4eeaeb4 100644
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
index 0000000..9fdabd5
--- /dev/null
+++ b/package/python-cryptography/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	bool "python-cryptography"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON_CFFI
+	select BR2_PACKAGE_PYTHON_IDNA
+	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
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
index 0000000..a411c2f
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2b25eebd1d3c6bae52b46f0dcec74dfb, sha256 locally computed
+md5     2b25eebd1d3c6bae52b46f0dcec74dfb  cryptography-1.2.2.tar.gz
+#sha256  7f51459f84d670444275e615839f4542c93547a12e938a0a4906dafe5f7de153  cryptography-1.1.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
new file mode 100644
index 0000000..b370351
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-cryptography
+#
+################################################################################
+
+PYTHON_CRYPTOGRAPHY_VERSION = 1.2.2
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
2.5.0
