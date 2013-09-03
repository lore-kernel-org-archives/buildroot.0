From: Michael Rommel <rommel@layer-7.net>
Date: Tue,  3 Sep 2013 20:05:40 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyzmq: new package
Message-ID: <1378231540-31099-1-git-send-email-rommel@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python language bindings for ZeroMQ.

Signed-off-by: Michael Rommel <rommel@layer-7.net>
---
 package/Config.in                                  |    1 +
 package/python-pyzmq/Config.in                     |   28 +++++++++++++
 ...e-buildroot-zmq-version-instead-of-detect.patch |   43 +++++++++++++++++++
 package/python-pyzmq/python-pyzmq.mk               |   44 ++++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 package/python-pyzmq/Config.in
 create mode 100644 package/python-pyzmq/python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch
 create mode 100644 package/python-pyzmq/python-pyzmq.mk

diff --git a/package/Config.in b/package/Config.in
index ed7a509..d5e3b52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -371,6 +371,7 @@ source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
new file mode 100644
index 0000000..255505e
--- /dev/null
+++ b/package/python-pyzmq/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_PYTHON_PYZMQ
+	bool "python-pyzmq"
+	depends on BR2_LARGEFILE # zeromq
+	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_USE_WCHAR # zeromq
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_ZEROMQ
+	select BR2_PACKAGE_PYTHON_HASHLIB
+	help
+	  This package contains the python language binding for zeromq.
+	  Due to issues with cross-compiling this package is hardcoded
+	  to the ZeroMQ version of this buildroot.
+
+	  http://zeromq.org/bindings:python
+
+comment "python-pyzmq requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
+comment "python-pyzmq requires a toolchain with IPv6 and WCHAR support"
+	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR)
+
+comment "python-pyzmq requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "python-pyzmq requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyzmq/python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch
new file mode 100644
index 0000000..5606069
--- /dev/null
+++ b/package/python-pyzmq/python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch
@@ -0,0 +1,43 @@
+detect.py: fix the ZMQ version check to the ZMQ version of the buildroot
+
+The setup.py script tries to compile a test C program and runs it, to
+retrieve a version string for the installed ZMQ library, but if the cross
+compiler links it together, the result cannot be run on the host, due to
+different architectures and libraries.
+
+And if the host compiler would compile/link it, it would not link with the
+library version inside buildroot but with the library from the host, possibly returning a wrong version number.
+
+Instead of trying to run the compiled test program to get the version
+dynamically, return the version of the buildroot environment.
+
+Signed-off-by: Michael Rommel <rommel@layer-7.net>
+
+--- pyzmq-13.0.2/buildutils/detect.py.orig	2013-08-10 00:49:28.242557978 +0200
++++ pyzmq-13.0.2/buildutils/detect.py	2013-08-10 00:44:35.197572704 +0200
+@@ -119,15 +119,17 @@ def detect_zmq(basedir, compiler=None, *
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
++    so = "vers: ##ZEROMQ_VERSION##"
+ 
+     handlers = {'vers':  lambda val: tuple(int(v) for v in val.split('.'))}
+ 
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
new file mode 100644
index 0000000..970fe68
--- /dev/null
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# python-pyzmq
+#
+################################################################################
+
+PYTHON_PYZMQ_VERSION = 13.1.0
+PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
+PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/source/p/pyzmq/
+PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache License Version 2.0 
+# Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
+PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
+PYTHON_PYZMQ_DEPENDENCIES = zeromq python host-python
+
+define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
+	$(SED) 's/##ZEROMQ_VERSION##/$(ZEROMQ_VERSION)/' \
+		$(@D)/buildutils/detect.py
+endef
+
+PYTHON_PYZMQ_POST_PATCH_HOOKS += PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
+
+#_python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) 
+PYTHON_PYZMQ_PARAMS = CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDSHARED="$(TARGET_CC) -shared" \
+		CROSS_COMPILING=yes \
+		_python_sysroot=$(STAGING_DIR) \
+		_python_srcdir=$(PYTHON_DIR) \
+		_python_prefix=/usr \
+		_python_exec_prefix=/usr
+
+define PYTHON_PYZMQ_CONFIGURE_CMDS
+	(cd $(@D); $(PYTHON_PYZMQ_PARAMS) \
+		$(HOST_DIR)/usr/bin/python setup.py configure \
+		--zmq=$(STAGING_DIR)/usr)
+endef
+
+define PYTHON_PYZMQ_INSTALL_TARGET_CMDS
+	(cd $(@D); $(PYTHON_PYZMQ_PARAMS) \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
