From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:26 +0100
Subject: [Buildroot] [git commit] python-thrift: convert to the Python
	package infrastructure
Message-ID: <20131215130826.6FBE79BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a0ea0a19eae540711d858d6e0dcca55390e9676
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-thrift/python-thrift.mk |   26 +++-----------------------
 1 files changed, 3 insertions(+), 23 deletions(-)

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
