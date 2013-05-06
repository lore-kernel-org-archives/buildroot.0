From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 13:44:35 +0200
Subject: [Buildroot] [git commit] python-m2crypto: new package
Message-ID: <20130506115310.B3DEA99C41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b099bb199e5819c1b15b9a623a4e5d9d6423ada4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-m2crypto/python-m2crypto.mk |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

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
