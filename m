From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Oct 2013 21:28:34 -0300
Subject: [Buildroot] [PATCHv2 3/5] python-thrift: fix cross building
In-Reply-To: <1383092916-4293-1-git-send-email-gustavo@zacarias.com.ar>
References: <1383092916-4293-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1383092916-4293-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The C code (fastbinary.so) wasn't built using the cross compiler, hence
it was unusable. Fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-thrift/python-thrift.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 4cd35e5..65733d4 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -9,13 +9,18 @@ PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
 PYTHON_THRIFT_SITE = http://pypi.python.org/packages/source/t/thrift
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README
-
 PYTHON_THRIFT_DEPENDENCIES = python
 
 define PYTHON_THRIFT_BUILD_CMDS
 	(cd $(@D); \
-		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
-		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDSHARED="$(TARGET_CROSS)gcc -shared" \
+		CROSS_COMPILING=yes \
+		_python_sysroot=$(STAGING_DIR) \
+		_python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
+		_python_prefix=/usr \
+		_python_exec_prefix=/usr \
 		$(HOST_DIR)/usr/bin/python setup.py build)
 endef
 
-- 
1.8.1.5
