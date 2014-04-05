From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 16:41:15 +0200
Subject: [Buildroot] [git commit] python-m2crypto: requires host-python2
Message-ID: <20140405153937.C5E689BCF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09e8b6cd533ed9b42f7e0bc947bae5422646e4c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Acording to its homepage [1], m2crypto does not support python3 yet.

So, this patch forces building the host m2crypto module for pyhton2.

[1] https://pypi.python.org/pypi/M2Crypto

[Thomas: take into account the rename of the new variable to
<pkg>_NEEDS_HOST_PYTHON.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-m2crypto/python-m2crypto.mk |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index dd0f77e..7e46f1d 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -10,12 +10,16 @@ PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
 
-# We need to override the build commands to be able to use build_ext,
-# which accepts the --openssl option.
+# We need to use python2 because m2crypto is not python3 compliant.
+HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
+
+# * We need to override the build commands to be able to use build_ext,
+#   which accepts the --openssl option.
+# * Use python2 interpreter to avoid trying building some python3 objects.
 define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
 	(cd $(@D); \
 		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
-		$(HOST_DIR)/usr/bin/python setup.py build_ext \
+		$(HOST_DIR)/usr/bin/python2 setup.py build_ext \
 			--openssl=$(HOST_DIR)/usr)
 endef
 
