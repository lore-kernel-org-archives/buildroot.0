From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Apr 2013 15:57:48 -0300
Subject: [Buildroot] [PATCH 1/2] python-m2crypto: new package
Message-ID: <1367261869-13078-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-m2crypto/python-m2crypto.mk | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/python-m2crypto/python-m2crypto.mk

diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
new file mode 100644
index 0000000..2429b24
--- /dev/null
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# python-m2crypto
+#
+#############################################################
+
+PYTHON_M2CRYPTO_VERSION = 0.21.1
+PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
+PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
+HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-python host-python-setuptools host-swig
+
+define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
+	(cd $(@D); \
+	$(HOST_CONFIGURE_OPTS) \
+	PYTHONXCPREFIX="$(HOST_DIR)/usr/" \
+	LDFLAGS="-L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib" \
+	$(HOST_DIR)/usr/bin/python setup.py build_ext --openssl=$(HOST_DIR)/usr)
+endef
+
+define HOST_PYTHON_M2CRYPTO_INSTALL_CMDS
+	(cd $(@D); \
+	PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+$(eval $(host-generic-package))
-- 
1.8.1.5
