From: Gustavo Heinz <gustavo@gsthnz.com>
Date: Fri, 18 Sep 2020 12:18:51 -0300
Subject: [Buildroot] [PATCH] package/python-m2crypto: add package
Message-ID: <20200918151852.1148219-1-gustavo@gsthnz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Heinz <gustavo@gsthnz.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/python-m2crypto/Config.in            | 11 +++++++++++
 package/python-m2crypto/python-m2crypto.hash |  5 +++++
 package/python-m2crypto/python-m2crypto.mk   | 16 ++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/python-m2crypto/Config.in
 create mode 100644 package/python-m2crypto/python-m2crypto.hash
 create mode 100644 package/python-m2crypto/python-m2crypto.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c5124f97ef..a461dde010 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1100,6 +1100,9 @@ F:	board/qemu/csky
 F:	configs/csky_*
 F:	configs/qemu_csky*
 
+N:	Gustavo Heinz <gustavo@gsthnz.com>
+F:	package/python-m2crypto/
+
 N:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
 F:	configs/arm_juno_defconfig
 F:	board/arm/juno/
diff --git a/package/Config.in b/package/Config.in
index 7783c26dc6..1a9d981f76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1027,6 +1027,7 @@ menu "External python modules"
 	source "package/python-logbook/Config.in"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
+	source "package/python-m2crypto/Config.in"
 	source "package/python-m2r/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
diff --git a/package/python-m2crypto/Config.in b/package/python-m2crypto/Config.in
new file mode 100644
index 0000000000..385a16cac6
--- /dev/null
+++ b/package/python-m2crypto/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_M2CRYPTO
+	bool "python-m2crypto"
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+    select BR2_PACKAGE_PYTHON_TYPING if BR2_PACKAGE_PYTHON # runtime
+	help
+	  M2Crypto: A Python crypto and SSL toolkit.
+
+	  https://gitlab.com/m2crypto/m2crypto
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
new file mode 100644
index 0000000000..148cdd8317
--- /dev/null
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/m2crypto/json
+md5  b8b34c5b83892096a8676b6f2e8f4e7e  M2Crypto-0.36.0.tar.gz
+sha256  1542c18e3ee5c01db5031d0b594677536963e3f54ecdf5315aeecb3a595b4dc1  M2Crypto-0.36.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
new file mode 100644
index 0000000000..ac00fc2841
--- /dev/null
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-m2crypto
+#
+################################################################################
+
+PYTHON_M2CRYPTO_VERSION = 0.36.0
+PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/df/84609ed874b5e6fcd3061a517bf4b6e4d0301f553baf9fa37bef2b509797
+PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
+PYTHON_M2CRYPTO_LICENSE = MIT
+PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
+PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
+PYTHON_M2CRYPTO_BUILD_OPTS = "--openssl=$(TARGET_DIR)/usr"
+
+$(eval $(python-package))
-- 
2.28.0
