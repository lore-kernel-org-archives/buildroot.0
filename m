From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:37:06 +0100
Subject: [Buildroot] [git commit] python-m2crypto: convert to the Python
	package infrastructure
Message-ID: <20131215130825.C813C9C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcd90b00ed7c37b1380a2e12a3f9761c75f19a9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-m2crypto/python-m2crypto.mk |   20 ++++++++------------
 1 files changed, 8 insertions(+), 12 deletions(-)

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
