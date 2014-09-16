From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 22:52:37 +0200
Subject: [Buildroot] [git commit] gdb: add support for Python in target gdb
Message-ID: <20140916210716.147A49D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84d584ea0dcdec8e9d2ca1ecd6c4df2e4bd7642f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new option BR2_PACKAGE_GDB_PYTHON to enable Python
support in the target gdb. Since we can assume that the user will be
aware that Python is needed to get Python support in gdb, we chose to
use a "depends on" dependency instead of a "select" dependency.

The other weird thing is the need for a wrapper shell script to
replace gdb's provided python-config.py script. See the shell script
comment itself for all the details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in         |    7 +++++++
 package/gdb/gdb-python-config |   36 ++++++++++++++++++++++++++++++++++++
 package/gdb/gdb.mk            |    7 +++++++
 3 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 9622948..a96df1e 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -60,6 +60,13 @@ config BR2_PACKAGE_GDB_TUI
 
 	  https://sourceware.org/gdb/current/onlinedocs/gdb/TUI.html
 
+config BR2_PACKAGE_GDB_PYTHON
+	bool "Python support"
+	# Only Python 2.x is supported by gdb for now
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This option enables Python support in the target gdb.
+
 endif
 
 endif
diff --git a/package/gdb/gdb-python-config b/package/gdb/gdb-python-config
new file mode 100755
index 0000000..0f00228
--- /dev/null
+++ b/package/gdb/gdb-python-config
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
+	echo "-I${STAGING_DIR}/usr/include/python2.7"
+	;;
+    --ldflags)
+	echo "-lpthread -ldl -lutil -lm -lpython2.7"
+	;;
+    --exec-prefix)
+	echo "/usr"
+	;;
+    *)
+	echo "Bad arg $2." >&2
+	exit 1
+	;;
+esac
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index e12b12b..e01431b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -91,6 +91,13 @@ else
 	GDB_CONF_OPT += --disable-tui
 endif
 
+ifeq ($(BR2_PACKAGE_GDB_PYTHON),y)
+	GDB_CONF_OPT += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
+	GDB_DEPENDENCIES += python
+else
+	GDB_CONF_OPT += --without-python
+endif
+
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
 define GDB_REMOVE_UNNEEDED_FILES
