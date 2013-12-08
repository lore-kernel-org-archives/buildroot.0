From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:53 +0100
Subject: [Buildroot] [PATCH 24/38] python-thrift: convert to the Python
	package infrastructure
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-25-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-thrift/python-thrift.mk | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 91e14e5..8abad48 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -9,27 +9,7 @@ PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
 PYTHON_THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(PYTHON_THRIFT_VERSION)
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = LICENSE
-PYTHON_THRIFT_DEPENDENCIES = python
+PYTHON_THRIFT_SETUP_TYPE = setuptools
+PYTHON_THRIFT_SUBDIR = lib/py
 
-define PYTHON_THRIFT_BUILD_CMDS
-	(cd $(@D)/lib/py; \
-		CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDSHARED="$(TARGET_CROSS)gcc -shared" \
-		CROSS_COMPILING=yes \
-		_python_sysroot=$(STAGING_DIR) \
-		_python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
-		_python_prefix=/usr \
-		_python_exec_prefix=/usr \
-		$(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-# host-distutilscross, if it has been installed before, will check that
-# the installation directory is in python's load path. For host-python,
-# it is not, so add it explicitly while installing to target.
-define PYTHON_THRIFT_INSTALL_TARGET_CMDS
-	(cd $(@D)/lib/py; PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-		$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
