From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 23:12:05 +0100
Subject: [Buildroot] [git commit branch/next] python-cryptography: new
	package
Message-ID: <20160219221301.E0A2881D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbeeb4c8cb4e44c654ca27db9ae05a83202f4104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - fix license information: it is either Apache-2.0 *or* BSD-3c
 - add the LICENSE file to the list of license files, since it is the
   one that explains that the license is either Apache-2.0 or BSD-3c.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/python-cryptography/Config.in              | 23 ++++++++++++++++++++++
 .../python-cryptography/python-cryptography.hash   |  3 +++
 package/python-cryptography/python-cryptography.mk | 15 ++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ce71f3c..c92e925 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -634,6 +634,7 @@ menu "External python modules"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
new file mode 100644
index 0000000..9827cf8
--- /dev/null
+++ b/package/python-cryptography/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	bool "python-cryptography"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_PYASN # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
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
index 0000000..b35f801
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2b25eebd1d3c6bae52b46f0dcec74dfb, sha256 locally computed
+md5     2b25eebd1d3c6bae52b46f0dcec74dfb  cryptography-1.2.2.tar.gz
+sha256  3f219cb9106d9b737ea9c332c4d15d70ac328f91b59fd9d79f78bdea8f826a67  cryptography-1.2.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
new file mode 100644
index 0000000..cefd3cb
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.mk
@@ -0,0 +1,15 @@
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
+PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3c
+PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+
+$(eval $(python-package))
