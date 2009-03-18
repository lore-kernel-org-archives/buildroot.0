From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 11:27:49 +0000 (UTC)
Subject: [Buildroot] svn commit: [25715] trunk/buildroot/package: dbus-python
Message-ID: <20090318112749.D7B1F76459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 11:27:49 +0000 (Wed, 18 Mar 2009)
New Revision: 25715

Log:
package: add dbus-python

Added:
   trunk/buildroot/package/dbus-python/
   trunk/buildroot/package/dbus-python/Config.in
   trunk/buildroot/package/dbus-python/dbus-python-fix-python-configure-check.patch
   trunk/buildroot/package/dbus-python/dbus-python.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-03-18 11:27:37 UTC (rev 25714)
+++ trunk/buildroot/package/Config.in	2009-03-18 11:27:49 UTC (rev 25715)
@@ -226,6 +226,7 @@
 source "package/acpid/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
+source "package/dbus-python/Config.in"
 source "package/devmem2/Config.in"
 source "package/dm/Config.in"
 source "package/dmraid/Config.in"

Added: trunk/buildroot/package/dbus-python/Config.in
===================================================================
--- trunk/buildroot/package/dbus-python/Config.in	                        (rev 0)
+++ trunk/buildroot/package/dbus-python/Config.in	2009-03-18 11:27:49 UTC (rev 25715)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DBUS_PYTHON
+	bool "dbus-python"
+	depends on BR2_PACKAGE_DBUS
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_DBUS_GLIB
+	help
+	  Python bindings for D-Bus
+
+	  http://dbus.freedesktop.org/doc/dbus-python/

Added: trunk/buildroot/package/dbus-python/dbus-python-fix-python-configure-check.patch
===================================================================
--- trunk/buildroot/package/dbus-python/dbus-python-fix-python-configure-check.patch	                        (rev 0)
+++ trunk/buildroot/package/dbus-python/dbus-python-fix-python-configure-check.patch	2009-03-18 11:27:49 UTC (rev 25715)
@@ -0,0 +1,30 @@
+Python: add am_cv_python_includes to override runtime python-config check
+---
+ configure |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+Index: dbus-python-0.83.0/configure
+===================================================================
+--- dbus-python-0.83.0.orig/configure
++++ dbus-python-0.83.0/configure
+@@ -10176,6 +10176,12 @@
+ 
+ { echo "$as_me:$LINENO: checking for Python headers using $PYTHON-config --includes" >&5
+ echo $ECHO_N "checking for Python headers using $PYTHON-config --includes... $ECHO_C" >&6; }
++if test "${am_cv_python_includes+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++  PYTHON_INCLUDES=${am_cv_python_includes}
++  { echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
++echo "${ECHO_T}$PYTHON_INCLUDES" >&6; }
++else
+ PYTHON_INCLUDES=`$PYTHON-config --includes`
+ if test $? = 0; then
+   { echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
+@@ -10194,6 +10200,7 @@
+   { echo "$as_me:$LINENO: result: $PYTHON_INCLUDES" >&5
+ echo "${ECHO_T}$PYTHON_INCLUDES" >&6; }
+ fi
++fi
+ 
+ { echo "$as_me:$LINENO: checking whether those headers are sufficient" >&5
+ echo $ECHO_N "checking whether those headers are sufficient... $ECHO_C" >&6; }

Added: trunk/buildroot/package/dbus-python/dbus-python.mk
===================================================================
--- trunk/buildroot/package/dbus-python/dbus-python.mk	                        (rev 0)
+++ trunk/buildroot/package/dbus-python/dbus-python.mk	2009-03-18 11:27:49 UTC (rev 25715)
@@ -0,0 +1,24 @@
+#############################################################
+#
+# dbus-python
+#
+#############################################################
+DBUS_PYTHON_VERSION = 0.83.0
+DBUS_PYTHON_SOURCE = dbus-python-$(DBUS_PYTHON_VERSION).tar.gz
+DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
+DBUS_PYTHON_INSTALL_STAGING = YES
+DBUS_PYTHON_INSTALL_TARGET = YES
+
+DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
+		ac_cv_path_PYTHON=$(PYTHON_DIR)/hostpython \
+		am_cv_python_version=$(PYTHON_VERSION) \
+		am_cv_python_platform=linux2 \
+		am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		am_cv_python_includes=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+
+DBUS_PYTHON_CONF_OPT = --disable-html-docs --disable-api-docs
+
+DBUS_PYTHON_DEPENDENCIES = uclibc dbus-glib libpython
+
+$(eval $(call AUTOTARGETS,package,dbus-python))
