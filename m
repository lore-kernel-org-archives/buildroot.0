From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:42 +0100
Subject: [Buildroot] [PATCHv2 07/36] python-m2crypto: convert to the Python
	package infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-m2crypto/python-m2crypto.mk | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 1c0efbd..dd0f77e 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -7,20 +7,16 @@
 PYTHON_M2CRYPTO_VERSION = 0.21.1
 PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-python host-python-setuptools host-swig
+PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
+HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
 
+# We need to override the build commands to be able to use build_ext,
+# which accepts the --openssl option.
 define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
 	(cd $(@D); \
-	$(HOST_CONFIGURE_OPTS) \
-	PYTHONXCPREFIX="$(HOST_DIR)/usr/" \
-	LDFLAGS="-L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib" \
-	$(HOST_DIR)/usr/bin/python setup.py build_ext --openssl=$(HOST_DIR)/usr)
+		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
+		$(HOST_DIR)/usr/bin/python setup.py build_ext \
+			--openssl=$(HOST_DIR)/usr)
 endef
 
-define HOST_PYTHON_M2CRYPTO_INSTALL_CMDS
-	(cd $(@D); \
-	PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
-endef
-
-$(eval $(host-generic-package))
+$(eval $(host-python-package))
-- 
1.8.1.2
