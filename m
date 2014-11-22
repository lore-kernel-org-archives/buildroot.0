From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:14:00 +0100
Subject: [Buildroot] [git commit branch/next] dbus-python: cleanup package
Message-ID: <20141122182258.17D4C7FA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8998ae9c545f2fc262f9925f85835a92a86ee5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The patch is not needed anymore as the proper includes can be specified
using PYTHON_INCLUDES, and version/pythondir/pyexecdir is correctly detected
using host-python.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...us-python-0001-fix-python-configure-check.patch |   27 --------------------
 package/dbus-python/dbus-python.mk                 |   11 +++-----
 2 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/dbus-python/dbus-python-0001-fix-python-configure-check.patch b/package/dbus-python/dbus-python-0001-fix-python-configure-check.patch
deleted file mode 100644
index 2df4da8..0000000
--- a/package/dbus-python/dbus-python-0001-fix-python-configure-check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Python: add am_cv_python_includes to override runtime python-config check
-[Gustavo: update for dbus-python 1.2.0]
-
-diff -Nura dbus-python-1.2.0.orig/configure dbus-python-1.2.0/configure
---- dbus-python-1.2.0.orig/configure	2013-05-08 04:48:42.000000000 -0300
-+++ dbus-python-1.2.0/configure	2014-07-03 16:54:25.922727033 -0300
-@@ -11762,6 +11762,12 @@
- else
-     { $as_echo "$as_me:${as_lineno-$LINENO}: checking for Python headers using $PYTHON-config --includes" >&5
- $as_echo_n "checking for Python headers using $PYTHON-config --includes... " >&6; }
-+if test "${am_cv_python_includes+set}" = set; then
-+  $as_echo_n "(cached) $ECHO_C" >&6
-+  PYTHON_INCLUDES=${am_cv_python_includes}
-+  { $as_echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
-+$as_echo_t "${ECHO_T}$PYTHON_INCLUDES" >&6; }
-+else
-   PYTHON_INCLUDES=`$PYTHON-config --includes`
-   if test $? = 0; then
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PYTHON_INCLUDES" >&5
-@@ -11781,6 +11787,7 @@
- $as_echo "$PYTHON_INCLUDES" >&6; }
-   fi
- fi
-+fi
- 
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether those headers are sufficient" >&5
- $as_echo_n "checking whether those headers are sufficient... " >&6; }
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index d4fdfa1..bc57689 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -10,13 +10,10 @@ DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
 DBUS_PYTHON_LICENSE_FILES = COPYING
 
-DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
-		ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
-		am_cv_python_version=$(PYTHON_VERSION) \
-		am_cv_python_platform=linux2 \
-		am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-		am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-		am_cv_python_includes=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+DBUS_PYTHON_CONF_ENV = \
+	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python2-config --includes)" \
+	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python2-config --ldflags)"
 
 DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 
