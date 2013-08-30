From: Michael Rommel <rommel@layer-7.net>
Date: Fri, 30 Aug 2013 23:58:44 +0200
Subject: [Buildroot] [PATCH 1/1] pyzmq: new package
Message-ID: <1377899924-1866-1-git-send-email-rommel@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

as promised, here is the separate patch for pyzmq.

  Michael.

PS: I noticed, that I missed in the previous e-mail to change the Config.in and remove the pyzmq line from it. Do I need to re-submit the patch for knock?




The python language bindings for zeromq.

Please note that the reason for the hardcoded version number in the
python-pyzmq package is due to the following dilemma:
- the setup.py script tries to compile a test C program and runs it, to
  retrieve a version string
- if the cross compiler links it together, the result cannot be run on
  the host, due to different architectures
- if the host compiler would compile/link it, it would not link with the
  library version inside buildroot but with the library from the host

Signed-off-by: Michael Rommel <rommel@layer-7.net>
---
 package/Config.in                |    1 +
 package/python-pyzmq/Config.in   |   13 ++++++++++
 package/python-pyzmq/pyzmq.mk    |   50 ++++++++++++++++++++++++++++++++++++++
 package/python-pyzmq/pyzmq.patch |   28 +++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 package/python-pyzmq/Config.in
 create mode 100644 package/python-pyzmq/pyzmq.mk
 create mode 100644 package/python-pyzmq/pyzmq.patch

diff --git a/package/Config.in b/package/Config.in
index 97cd7da..0289fd1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,6 +363,7 @@ source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
new file mode 100644
index 0000000..d9791c1
--- /dev/null
+++ b/package/python-pyzmq/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYZMQ
+	bool "pyzmq"
+	select BR2_PACKAGE_ZEROMQ
+        select BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+	help
+	  This package contains the python language binding for zeromq.
+	  Due to issues with cross-compiling this package is hardcoded
+	  to ZeroMQ version 3.2.3
+
+	  See also: http://zeromq.org/bindings:python
+
diff --git a/package/python-pyzmq/pyzmq.mk b/package/python-pyzmq/pyzmq.mk
new file mode 100644
index 0000000..a7efcad
--- /dev/null
+++ b/package/python-pyzmq/pyzmq.mk
@@ -0,0 +1,50 @@
+##########################################
+#
+# pyzmq
+#
+##########################################
+
+PYZMQ_VERSION = 13.0.2
+PYZMQ_ZMQ_VERSION = 3.2.3
+PYZMQ_SOURCE = pyzmq-$(PYZMQ_VERSION).tar.gz
+PYZMQ_SITE = https://pypi.python.org/packages/source/p/pyzmq/
+PYZMQ_LICENSE = LGPLv3 BSD-3c
+PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
+PYZMQ_INSTALL_TARGET = YES
+
+define PYZMQ_POST_PATCH_FIXUP
+        (cd $(@D); \
+		cat buildutils/detect.py | \
+		sed -e "s/##PYZMQ_ZMQ_VERSION##/$(PYZMQ_ZMQ_VERSION)/" \
+		  >buildutils/detect.py.new; \
+		cp buildutils/detect.py.new buildutils/detect.py)
+endef
+
+PYZMQ_POST_PATCH_HOOKS += PYZMQ_POST_PATCH_FIXUP
+
+define PYZMQ_CONFIGURE_CMDS
+        (cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+                LDSHARED="$(TARGET_CROSS)gcc -shared" \
+                CROSS_COMPILING=yes \
+                _python_sysroot=$(STAGING_DIR) \
+                _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
+                _python_prefix=/usr \
+                _python_exec_prefix=/usr \
+                $(HOST_DIR)/usr/bin/python setup.py configure \
+		--zmq=$(@D)/../../staging/usr)
+endef
+
+define PYZMQ_INSTALL_TARGET_CMDS
+        (cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+                LDSHARED="$(TARGET_CROSS)gcc -shared" \
+                CROSS_COMPILING=yes \
+                _python_sysroot=$(STAGING_DIR) \
+                _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
+                _python_prefix=/usr \
+                _python_exec_prefix=/usr \
+                $(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
+
diff --git a/package/python-pyzmq/pyzmq.patch b/package/python-pyzmq/pyzmq.patch
new file mode 100644
index 0000000..c660457
--- /dev/null
+++ b/package/python-pyzmq/pyzmq.patch
@@ -0,0 +1,28 @@
+--- pyzmq-13.0.2/buildutils/detect.py.orig	2013-08-10 00:49:28.242557978 +0200
++++ pyzmq-13.0.2/buildutils/detect.py	2013-08-10 00:44:35.197572704 +0200
+@@ -118,15 +118,17 @@ def detect_zmq(basedir, compiler=None, *
+             
+     efile = test_compilation(cfile, compiler=compiler, **compiler_attrs)
+     
+-    result = Popen(efile, stdout=PIPE, stderr=PIPE)
+-    so, se = result.communicate()
++    # result = Popen(efile, stdout=PIPE, stderr=PIPE)
++    # so, se = result.communicate()
+     # for py3k:
+-    so = so.decode()
+-    se = se.decode()
+-    if result.returncode:
+-        msg = "Error running version detection script:\n%s\n%s" % (so,se)
+-        logging.error(msg)
+-        raise IOError(msg)
++    #so = so.decode()
++    #se = se.decode()
++    #if result.returncode:
++    #    msg = "Error running version detection script:\n%s\n%s" % (so,se)
++    #    logging.error(msg)
++    #    raise IOError(msg)
++
++    so = "vers: ##PYZMQ_ZMQ_VERSION##"
+ 
+     handlers = {'vers':  lambda val: tuple(int(v) for v in val.split('.'))}
+ 
-- 
1.7.9.5
