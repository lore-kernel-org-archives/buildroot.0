From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 09:15:22 -0300
Subject: [Buildroot] [PATCH 4/5] python-thrift: bump to version 0.9.1 and
	switch to apache
In-Reply-To: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1382703323-31038-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch away from the PyPI subset version since it has a great filename
clash with the full upstream apache version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-thrift/python-thrift.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
 
-- 
1.8.1.5
