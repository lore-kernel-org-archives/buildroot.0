From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri,  7 Feb 2020 14:17:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: enable python3 support
Message-ID: <20200207131739.29389-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(host-)gdb python support now uses Python3 if (host-)python3
is selected, otherwise uses python(2) as before.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
RFC: This commit shamelessly duplicates the Python faking script for Python3,
     maybe there is a better DRY solution for that ?
---
 package/gdb/Config.in                         |  3 +-
 .../{gdb-python-config => gdb-python2-config} |  0
 package/gdb/gdb-python3-config                | 36 +++++++++++++++++++
 package/gdb/gdb.mk                            | 12 ++++++-
 4 files changed, 48 insertions(+), 3 deletions(-)
 rename package/gdb/{gdb-python-config => gdb-python2-config} (100%)
 create mode 100755 package/gdb/gdb-python3-config

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 4c787d49a1..f9dcf13f36 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -85,8 +85,7 @@ config BR2_PACKAGE_GDB_TUI
 
 config BR2_PACKAGE_GDB_PYTHON
 	bool "Python support"
-	# Only Python 2.x is supported by gdb for now
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  This option enables Python support in the target gdb.
 
diff --git a/package/gdb/gdb-python-config b/package/gdb/gdb-python2-config
similarity index 100%
rename from package/gdb/gdb-python-config
rename to package/gdb/gdb-python2-config
diff --git a/package/gdb/gdb-python3-config b/package/gdb/gdb-python3-config
new file mode 100755
index 0000000000..e5421e5587
--- /dev/null
+++ b/package/gdb/gdb-python3-config
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+# This shell script is used to fake Python. Gdb wants to be passed a
+# Python interpreter, to run its own python-config.py program, which
+# uses sysconfig. However, when cross-compiling, this doesn't work
+# well since we would have to use the host Python, whose sysconfig
+# module would return host values.
+#
+# As recommended at
+# https://sourceware.org/gdb/wiki/CrossCompilingWithPythonSupport,
+# this wrapper shell script can be used as a replacement. It ignores
+# the python-config.py script passed as first arguments, and
+# "emulates" its behavior.
+
+if [ $# -ne 2 ] ; then
+    echo "Bad # args." >&2
+    exit 1
+fi
+
+# The first argument is the path to python-config.py, ignore it.
+
+case "$2" in
+    --includes)
+    echo "-I${STAGING_DIR}/usr/include/python3.8"
+    ;;
+    --ldflags)
+    echo "-lpthread -ldl -lutil -lm -lpython3.8"
+    ;;
+    --exec-prefix)
+    echo "/usr"
+    ;;
+    *)
+    echo "Bad arg $2." >&2
+    exit 1
+    ;;
+esac
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 46d745a897..fabe1eb116 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -157,8 +157,13 @@ GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),y)
-GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python3-config
+GDB_DEPENDENCIES += python3
+else
+GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python2-config
 GDB_DEPENDENCIES += python
+endif
 else
 GDB_CONF_OPTS += --without-python
 endif
@@ -234,8 +239,13 @@ HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
+HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python3
+HOST_GDB_DEPENDENCIES += host-python3
+else
 HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
 HOST_GDB_DEPENDENCIES += host-python
+endif
 else
 HOST_GDB_CONF_OPTS += --without-python
 endif
-- 
2.24.1
