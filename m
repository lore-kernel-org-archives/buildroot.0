From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2020 10:53:11 +0100
Subject: [Buildroot] [PATCH 2/3] package/gdb: do not hard-code python
 version in gdb-python-config
In-Reply-To: <cover.1609408378.git.yann.morin.1998@free.fr>
References: <cover.1609408378.git.yann.morin.1998@free.fr>
Message-ID: <33ef853d818c742c76d492c84d7746309fbe8fd9.1609408378.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gdb-python-config simulates a python-2.7, with a hard-coded 2.7
version.

gdb also supports running with python3 nowadays, so prepare the wrapper
to return appropriate values.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/gdb-python-config | 9 +++++++--
 package/gdb/gdb.mk            | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/gdb/gdb-python-config b/package/gdb/gdb-python-config
index 222f1cf6ba..640c358305 100755
--- a/package/gdb/gdb-python-config
+++ b/package/gdb/gdb-python-config
@@ -17,14 +17,19 @@ if [ $# -ne 2 ] ; then
     exit 1
 fi
 
+if [ -z "${BR_PYTHON_VERSION}" ]; then
+    echo "Environment variable BR_PYTHON_VERSION not set." >&2
+    exit 1
+fi
+
 # The first argument is the path to python-config.py, ignore it.
 
 case "$2" in
     --includes)
-        echo "-I${STAGING_DIR}/usr/include/python2.7"
+        echo "-I${STAGING_DIR}/usr/include/python${BR_PYTHON_VERSION}"
         ;;
     --ldflags)
-        echo "-lpthread -ldl -lutil -lm -lpython2.7"
+        echo "-lpthread -ldl -lutil -lm -lpython${BR_PYTHON_VERSION}"
         ;;
     --exec-prefix)
         echo "/usr"
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index c74279a43e..e35ece0153 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -194,6 +194,9 @@ GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),y)
+# CONF_ENV: for top-level configure; MAKE_ENV: for sub-projects' configure.
+GDB_CONF_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
+GDB_MAKE_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
 GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
 GDB_DEPENDENCIES += python
 else
-- 
2.25.1
