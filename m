From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sun,  5 Aug 2012 15:10:10 +0200
Subject: [Buildroot] [PATCH 1/2] Added packages libmsgpack (v. 0.5.7)
	without C++ support (as in small embedded systems buildroot
	is often compiled without C++ support) and msgpack-python
	version 0.1.10 (which does not rely yet on python-setuptools.
	I had to add those packages to buildroot-2011.11 which didn't
	support the setuptools yet).
In-Reply-To: <1344172212-2929-1-git-send-email-wzab01@gmail.com>
References: <1344172212-2929-1-git-send-email-wzab01@gmail.com>
Message-ID: <1344172212-2929-2-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Wojciech M. Zabolotny" <wzab01@gmail.com>

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in                             |    2 ++
 package/libmsgpack/Config.in                  |    8 ++++++++
 package/libmsgpack/README                     |    1 +
 package/libmsgpack/libmsgpack-0.5.7-001.patch |   25 +++++++++++++++++++++++
 package/libmsgpack/libmsgpack.mk              |   13 ++++++++++++
 package/msgpack-python/Config.in              |    8 ++++++++
 package/msgpack-python/msgpack-python.mk      |   27 +++++++++++++++++++++++++
 7 files changed, 84 insertions(+)
 create mode 100644 package/libmsgpack/Config.in
 create mode 100644 package/libmsgpack/README
 create mode 100644 package/libmsgpack/libmsgpack-0.5.7-001.patch
 create mode 100644 package/libmsgpack/libmsgpack.mk
 create mode 100644 package/msgpack-python/Config.in
 create mode 100644 package/msgpack-python/msgpack-python.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..42d0718 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -275,6 +275,7 @@ source "package/python-nfc/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
+source "package/msgpack-python/Config.in"
 endmenu
 endif
 source "package/ruby/Config.in"
@@ -461,6 +462,7 @@ source "package/libsigc/Config.in"
 source "package/libtpl/Config.in"
 source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
+source "package/libmsgpack/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
diff --git a/package/libmsgpack/Config.in b/package/libmsgpack/Config.in
new file mode 100644
index 0000000..d8edd4d
--- /dev/null
+++ b/package/libmsgpack/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBMSGPACK
+	bool "libmsgpack"
+	help
+	  LibMsgPack is a library for packing and unpacking data
+	  structures in C
+
+	  http://msgpack.org
+	  
diff --git a/package/libmsgpack/README b/package/libmsgpack/README
new file mode 100644
index 0000000..b2e25f7
--- /dev/null
+++ b/package/libmsgpack/README
@@ -0,0 +1 @@
+Created by WZab
diff --git a/package/libmsgpack/libmsgpack-0.5.7-001.patch b/package/libmsgpack/libmsgpack-0.5.7-001.patch
new file mode 100644
index 0000000..6b3ad60
--- /dev/null
+++ b/package/libmsgpack/libmsgpack-0.5.7-001.patch
@@ -0,0 +1,25 @@
+diff -u -r msgpack-0.5.7.orig/configure.in msgpack-0.5.7/configure.in
+--- msgpack-0.5.7.orig/configure.in	2011-08-08 15:51:19.000000000 +0100
++++ msgpack-0.5.7/configure.in	2012-07-06 22:02:38.000000000 +0100
+@@ -1,6 +1,6 @@
+-AC_INIT(src/object.cpp)
++AC_INIT(msgpack, 0.5.7)
+ AC_CONFIG_AUX_DIR(ac)
+-AM_INIT_AUTOMAKE(msgpack, 0.5.7)
++AM_INIT_AUTOMAKE(no-dependencies)
+ AC_CONFIG_HEADER(config.h)
+ 
+ AC_SUBST(CFLAGS)
+diff -u -r msgpack-0.5.7.orig/src/Makefile.am msgpack-0.5.7/src/Makefile.am
+--- msgpack-0.5.7.orig/src/Makefile.am	2011-06-12 07:07:29.000000000 +0100
++++ msgpack-0.5.7/src/Makefile.am	2012-07-06 22:27:09.000000000 +0100
+@@ -1,5 +1,7 @@
+-
+-lib_LTLIBRARIES = libmsgpack.la
++lib_LTLIBRARIES =
++if ENABLE_CXX
++lib_LTLIBRARIES += libmsgpack.la
++endif
+ 
+ libmsgpack_la_SOURCES = \
+ 		unpack.c \
diff --git a/package/libmsgpack/libmsgpack.mk b/package/libmsgpack/libmsgpack.mk
new file mode 100644
index 0000000..eeaea52
--- /dev/null
+++ b/package/libmsgpack/libmsgpack.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libmsgpack
+#
+#############################################################
+LIBMSGPACK_VERSION:=0.5.7
+LIBMSGPACK_SOURCE:=msgpack-$(LIBMSGPACK_VERSION).tar.gz
+LIBMSGPACK_SITE:=http://msgpack.org/releases/cpp
+LIBMSGPACK_INSTALL_STAGING=YES
+LIBMSGPACK_INSTALL_TARGET=YES
+LIBMSGPACK_AUTORECONF=YES
+LIBMSGPACK_CONF_OPT = --disable-cxx --disable-dependency-tracking
+$(eval $(call AUTOTARGETS))
diff --git a/package/msgpack-python/Config.in b/package/msgpack-python/Config.in
new file mode 100644
index 0000000..25c3cd6
--- /dev/null
+++ b/package/msgpack-python/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MSGPACK_PYTHON
+	bool "msgpack-python"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  msgpack-python is a Python library to serialize/deserialize Python data
+
+	  http://pypi.python.org/pypi/msgpack-python/
+
diff --git a/package/msgpack-python/msgpack-python.mk b/package/msgpack-python/msgpack-python.mk
new file mode 100644
index 0000000..d70e9de
--- /dev/null
+++ b/package/msgpack-python/msgpack-python.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# msgpack-python
+#
+#############################################################
+
+MSGPACK_PYTHON_VERSION = 0.1.10
+MSGPACK_PYTHON_SOURCE  = msgpack-python-$(MSGPACK_PYTHON_VERSION).tar.gz
+MSGPACK_PYTHON_SITE    = http://pypi.python.org/packages/source/m/msgpack-python
+MSGPACK_PYTHON_DEPENDENCIES = python
+
+define MSGPACK_PYTHON_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)"		\
+		CFLAGS="$(TARGET_CFLAGS)" 	\
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS)" 	\
+	$(HOST_DIR)/usr/bin/python setup.py build_ext \
+	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define MSGPACK_PYTHON_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.10.4
