From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  7 Jul 2020 15:32:52 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 20.6.2
Message-ID: <20200707213252.627579-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Strip xbr contracts which are used only for the xbr feature which is
entirely unsupported by buildroot.

Enable the optimized nvx cffi extension module.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/Config.in            |  1 +
 package/python-autobahn/python-autobahn.hash |  4 ++--
 package/python-autobahn/python-autobahn.mk   | 12 ++++++++++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 78b16897bc..d2dc10f354 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
 	help
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index a5aa2a5a7d..8197ab3182 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  dcae3cf26203aa4bbd9912137e5c9512  autobahn-20.4.3.tar.gz
-sha256  c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f  autobahn-20.4.3.tar.gz
+md5  bcafb42ea58232308777a265d41c1c98  autobahn-20.6.2.tar.gz
+sha256  6ac6b6653b8d20d632b034adccf6a566154d4efbeaa23abf7c3995fd601e9a01  autobahn-20.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 37b3d33534..3041a18783 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,11 +4,19 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 20.4.3
+PYTHON_AUTOBAHN_VERSION = 20.6.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/cb/16/38d27874ef827974f44acb6dd64a92a9248b624734c0e84b91083c2d9350
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/43/ba/926d323decdce0341f6f60dce45ea5553b08113dddb9ca482554d3db11eb
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
+PYTHON_AUTOBAHN_DEPENDENCIES = host-python-cffi
+PYTHON_AUTOBAHN_ENV = AUTOBAHN_USE_NVX=1 AUTOBAHN_STRIP_XBR=1
+
+define PYTHON_AUTOBAHN_STRIP_XBR_CONTRACTS
+	rm -rf $(@D)/autobahn/xbr/contracts
+endef
+
+PYTHON_AUTOBAHN_POST_EXTRACT_HOOKS = PYTHON_AUTOBAHN_STRIP_XBR_CONTRACTS
 
 $(eval $(python-package))
-- 
2.25.1
