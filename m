From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 21:07:54 +0100
Subject: [Buildroot] [git commit] python-thrift: bump to version 0.9.1 and
	switch to apache
Message-ID: <20131208203406.8E60D9BF6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cad53d816bdb4e54d9f58b5283544a2b77cd4968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch away from the PyPI subset version since it has a great filename
clash with the full upstream apache version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-thrift/python-thrift.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 65733d4..91e14e5 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.9.0
+PYTHON_THRIFT_VERSION = 0.9.1
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = http://pypi.python.org/packages/source/t/thrift
+PYTHON_THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(PYTHON_THRIFT_VERSION)
 PYTHON_THRIFT_LICENSE = Apache-2.0
-PYTHON_THRIFT_LICENSE_FILES = README
+PYTHON_THRIFT_LICENSE_FILES = LICENSE
 PYTHON_THRIFT_DEPENDENCIES = python
 
 define PYTHON_THRIFT_BUILD_CMDS
-	(cd $(@D); \
+	(cd $(@D)/lib/py; \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDSHARED="$(TARGET_CROSS)gcc -shared" \
@@ -28,7 +28,7 @@ endef
 # the installation directory is in python's load path. For host-python,
 # it is not, so add it explicitly while installing to target.
 define PYTHON_THRIFT_INSTALL_TARGET_CMDS
-	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	(cd $(@D)/lib/py; PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 		$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
