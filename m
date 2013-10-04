From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 20:12:06 -0500
Subject: [Buildroot] [PATCH 2/5] python-pycrypto: new package
In-Reply-To: <1380849129-18517-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380849129-18517-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1380849129-18517-3-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

---

v1 -> v2
 * Fixed issue with not actually cross compiling the C shared libraries
   for the traget.
 * Some not so pretty things was were done to accomplish the cross
   compiling but I'd rather do this than having to patch the package
   to fix the cross compiling issues.
 * Added dependancy on GMP since it is needed for all the crypto
   libraries to work and the pacakge to compile correctly.
 * Added PYTHONPATH definition to the install target command
 * Added host so install of PySNMP-apps would work
---
 package/Config.in                          |    1 +
 package/python-pycrypto/Config.in          |    9 +++
 package/python-pycrypto/python-pycrypto.mk |   79 ++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pycrypto/Config.in
 create mode 100644 package/python-pycrypto/python-pycrypto.mk

diff --git a/package/Config.in b/package/Config.in
index 3592cb7..a1f7901 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,7 @@ source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pyasn/Config.in"
+source "package/python-pycrypto/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
new file mode 100644
index 0000000..0f076da
--- /dev/null
+++ b/package/python-pycrypto/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYCRYPTO
+	bool "python-pycrypto"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_GMP
+	help
+	  PyCrypto is a collection of cryptographic algorithms and 
+	  protocols, implemented for use from Python.
+
+	  http://www.pycrypto.org/
diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
new file mode 100644
index 0000000..f68a487
--- /dev/null
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# python-pycrypto
+#
+################################################################################
+
+PYTHON_PYCRYPTO_VERSION = 2.6
+PYTHON_PYCRYPTO_SOURCE  = pycrypto-$(PYTHON_PYCRYPTO_VERSION).tar.gz
+PYTHON_PYCRYPTO_SITE    = http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
+PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
+
+PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
+		LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
+
+PYTHON_PYCRYPTO_DEPENDENCIES = python gmp
+HOST_PYTHON_PYCRYPTO_DEPENDENCIES = host-python host-gmp
+
+#############
+# Target
+#############
+
+# The configure step needs to be run outside of the setup.py since it isn't
+# run correctly for cross-compiling
+define PYTHON_PYCRYPTO_CONFIGURE_CMDS
+	(cd $(@D) && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--sysconfdir=/etc \
+		--program-prefix="" \
+	)
+endef
+
+# The additional -I and -L are needed to ensure that the $(STAGING_DIR)
+# header and library files are pulled. Otherwise the distutils package before
+# the ones that the distutils package will find the headers/libraries that are
+# located at $(HOST_DIR)/usr.
+define PYTHON_PYCRYPTO_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+	$(HOST_DIR)/usr/bin/python setup.py build_ext \
+	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+	)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+# PYTHONPATH definition is need for install since an error could
+# be thrown about installing to location that isn't in PYTHONPATH
+define PYTHON_PYCRYPTO_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+#############
+# Host
+#############
+define HOST_PYTHON_PYCRYPTO_BUILD_CMDS
+	(cd $(@D); \
+	$(HOST_DIR)/usr/bin/python setup.py build_ext \
+	)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define HOST_PYTHON_PYCRYPTO_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
