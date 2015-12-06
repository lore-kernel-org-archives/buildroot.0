From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Dec 2015 17:35:29 +0100
Subject: [Buildroot] [PATCH] package/mpython-m2crypto: bump version
Message-ID: <1449419729-4351-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
This fixes a lot of autobuild failures since -next was merged back into
master. But since autobuild.buildroot.org is unreachable from here, no
autobuild ref was added to the commit log.
YEM.

---
 package/python-m2crypto/python-m2crypto.hash | 4 ++--
 package/python-m2crypto/python-m2crypto.mk   | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index a5231ec..a2603b9 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,2 +1,2 @@
-# From https://pypi.python.org/pypi/M2Crypto/0.21.1
-md5 f93d8462ff7646397a9f77a2fe602d17 M2Crypto-0.21.1.tar.gz
+# From https://pypi.python.org/pypi/M2Crypto/0.22.5
+md5 f84eb07aa1687f39bc26ee7b1ba5a105 M2Crypto-0.22.5.tar.gz
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 7e46f1d..1f038e3 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.21.1
+PYTHON_M2CRYPTO_VERSION = 0.22.5
 PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
@@ -13,10 +13,16 @@ HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
 # We need to use python2 because m2crypto is not python3 compliant.
 HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
 
+HOST_PYTHON_M2CRYPTO_BUILD_DIR = $(@D)/build/lib.linux-$(HOSTARCH)-$(PYTHON_VERSION_MAJOR)
+
 # * We need to override the build commands to be able to use build_ext,
 #   which accepts the --openssl option.
 # * Use python2 interpreter to avoid trying building some python3 objects.
+# * because build_ext is flawed, is forgets to copy the files prior to
+#   the build, so we do it manually.
 define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
+	mkdir -p $(HOST_PYTHON_M2CRYPTO_BUILD_DIR)
+	cp -av $(@D)/M2Crypto $(HOST_PYTHON_M2CRYPTO_BUILD_DIR)/M2Crypto
 	(cd $(@D); \
 		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
 		$(HOST_DIR)/usr/bin/python2 setup.py build_ext \
-- 
1.9.1
