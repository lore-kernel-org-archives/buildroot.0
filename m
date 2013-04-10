From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Apr 2013 17:29:26 -0300
Subject: [Buildroot] [PATCHv2 3/3] python-m2crypto: new package
In-Reply-To: <1365625766-11256-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365625766-11256-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365625766-11256-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                          |  1 +
 package/python-m2crypto/Config.in          | 10 ++++++++
 package/python-m2crypto/python-m2crypto.mk | 40 ++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/python-m2crypto/Config.in
 create mode 100644 package/python-m2crypto/python-m2crypto.mk

diff --git a/package/Config.in b/package/Config.in
index 2e7dc67..0537ffa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ menu "external python modules"
 source "package/python-bottle/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
+source "package/python-m2crypto/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
diff --git a/package/python-m2crypto/Config.in b/package/python-m2crypto/Config.in
new file mode 100644
index 0000000..2ee4ab1
--- /dev/null
+++ b/package/python-m2crypto/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_M2CRYPTO
+	bool "python-m2crypto"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  M2Crypto is the most complete Python wrapper for OpenSSL.
+
+	  http://chandlerproject.org/Projects/MeTooCrypto
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
new file mode 100644
index 0000000..8a8de84
--- /dev/null
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# python-m2crypto
+#
+#############################################################
+
+PYTHON_M2CRYPTO_VERSION = 0.21.1
+PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
+PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
+PYTHON_M2CRYPTO_DEPENDENCIES = openssl python host-python-setuptools host-python-distutilscross host-swig
+HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-python host-python-setuptools host-swig
+
+define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
+	(cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		PYTHONXCPREFIX="$(HOST_DIR)/usr/" \
+		LDFLAGS="-L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib" \
+	$(HOST_DIR)/usr/bin/python setup.py build_ext --openssl=$(HOST_DIR)/usr)
+endef
+
+define PYTHON_M2CRYPTO_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
+		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+	$(HOST_DIR)/usr/bin/python setup.py build -x bdist_egg --exclude-source-files)
+endef
+
+define HOST_PYTHON_M2CRYPTO_INSTALL_CMDS
+	(cd $(@D); PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+define PYTHON_M2CRYPTO_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.1.5
