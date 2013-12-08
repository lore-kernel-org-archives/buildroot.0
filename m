From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 21:05:24 +0100
Subject: [Buildroot] [git commit] python-thrift: fix cross building
Message-ID: <20131208203406.6AA909BF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db164caf12ac8a8a0af53e181450762d680c82d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The C code (fastbinary.so) wasn't built using the cross compiler, hence
it was unusable. Fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-thrift/python-thrift.mk |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

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
 
