From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 12:39:20 -0300
Subject: [Buildroot] [PATCH 4/4] python-m2crypto: remove
In-Reply-To: <1459352360-12927-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459352360-12927-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459352360-12927-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It only provided the host variant, which was only used by crda (no
longer necessary), and wasn't available as a host selection.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-m2crypto/python-m2crypto.hash |  3 ---
 package/python-m2crypto/python-m2crypto.mk   | 31 ----------------------------
 2 files changed, 34 deletions(-)
 delete mode 100644 package/python-m2crypto/python-m2crypto.hash
 delete mode 100644 package/python-m2crypto/python-m2crypto.mk

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
deleted file mode 100644
index 4ac180f..0000000
--- a/package/python-m2crypto/python-m2crypto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# md5 from https://pypi.python.org/pypi/M2Crypto/, sha256 locally computed
-md5 8e87235942c76d1ba9f999ee33764fdb M2Crypto-0.24.0.tar.gz
-sha256 80a56441a1d2c0cf27e725be7554c92598b938fc8767ee2c71fdbc2fdc055ee8 M2Crypto-0.24.0.tar.gz
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
deleted file mode 100644
index 3d0e54e..0000000
--- a/package/python-m2crypto/python-m2crypto.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# python-m2crypto
-#
-################################################################################
-
-PYTHON_M2CRYPTO_VERSION = 0.24.0
-PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
-PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
-HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
-
-PYTHON_M2CRYPTO_LICENSE = MIT
-PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
-
-# We need to use python2 because m2crypto is not python3 compliant.
-HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
-
-# The --openssl option that allows to specify a custom path to OpenSSL
-# can only be used with the non-default build_ext setup.py command,
-# and calling this command directly fails. To work around this, simply
-# hardcode the path to OpenSSL in setup.py.
-# Bug reported at https://gitlab.com/m2crypto/m2crypto/issues/89
-define HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
-	$(SED) "s%self.openssl = '/usr'%self.openssl = '$(HOST_DIR)/usr'%" \
-		$(@D)/setup.py
-endef
-
-HOST_PYTHON_M2CRYPTO_POST_PATCH_HOOKS += HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
-
-$(eval $(host-python-package))
-- 
2.7.3
