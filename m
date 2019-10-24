From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 24 Oct 2019 17:27:04 +0000
Subject: [Buildroot] [PATCH v3] package/dbus-python: Fix build with python
 3.8
In-Reply-To: <20191023211924.950430-1-grzegorz@blach.pl>
References: <20191023211924.950430-1-grzegorz@blach.pl>
Message-ID: <20191024172704.677-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python 3.8 doesn't allow python modules to be linked with
libpythonX.Y.so, but applications that embed a python interpreter
still need to be linked with libpythonX.Y.so. As a solution
-lpythonX.Y need to be moved from PYTHON_LIBS to PYTHON_EXTRA_LIBS,
but only for python 3.8 or newer.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
Changes v2 -> v3:
 - Patch m4/ax_python_devel.m4 instead of setting PYTHON_EXTRA_LIBS

Changes v1 -> v2:
 - Set PYTHON_EXTRA_LIBS with `python3-config --libs --embed`
   instead of appending --embed to PYTHON_LIBS

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 .../0001-Fix-build-with-python-3.8.patch      | 95 +++++++++++++++++++
 package/dbus-python/dbus-python.mk            |  4 +
 2 files changed, 99 insertions(+)
 create mode 100644 package/dbus-python/0001-Fix-build-with-python-3.8.patch

diff --git a/package/dbus-python/0001-Fix-build-with-python-3.8.patch b/package/dbus-python/0001-Fix-build-with-python-3.8.patch
new file mode 100644
index 0000000000..db4a0d0b10
--- /dev/null
+++ b/package/dbus-python/0001-Fix-build-with-python-3.8.patch
@@ -0,0 +1,95 @@
+From 1d7695681f1db3f6e3b487abbffc9665f1422bf4 Mon Sep 17 00:00:00 2001
+From: Grzegorz Blach <grzegorz@blach.pl>
+Date: Thu, 24 Oct 2019 15:42:55 +0000
+Subject: [PATCH] Fix build with python 3.8
+
+Python 3.8 doesn't allow python modules to be linked with
+libpythonX.Y.so, but applications that embed a python interpreter
+still need to be linked with libpythonX.Y.so. As a solution
+-lpythonX.Y need to be moved from PYTHON_LIBS to PYTHON_EXTRA_LIBS,
+but only for python 3.8 or newer.
+
+Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
+---
+ m4/ax_python_devel.m4 | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
+index 44dbd83..0de0c6e 100644
+--- a/m4/ax_python_devel.m4
++++ b/m4/ax_python_devel.m4
+@@ -40,6 +40,7 @@
+ #   Copyright (c) 2009 Matteo Settenvini <matteo@member.fsf.org>
+ #   Copyright (c) 2009 Horst Knorr <hk_classes@knoda.org>
+ #   Copyright (c) 2013 Daniel Mullner <muellner@math.stanford.edu>
++#   Copyright (c) 2019 Grzegorz Blach <grzegorz@blach.pl>
+ #
+ #   This program is free software: you can redistribute it and/or modify it
+ #   under the terms of the GNU General Public License as published by the
+@@ -67,7 +68,7 @@
+ #   modified version of the Autoconf Macro, you may extend this special
+ #   exception to the GPL to apply to your modified version as well.
+ 
+-#serial 21
++#serial 21 + python 3.8 fixes
+ 
+ AU_ALIAS([AC_PYTHON_DEVEL], [AX_PYTHON_DEVEL])
+ AC_DEFUN([AX_PYTHON_DEVEL],[
+@@ -198,6 +199,11 @@ EOD`
+ 		AC_DEFINE_UNQUOTED([HAVE_PYTHON], ["$ac_python_version"],
+                                    [If available, contains the Python version number currently in use.])
+ 
++		# Check if we should omit -lpython in PYTHON_LIBS
++		ac_omit_python_library=`$PYTHON -c "import sys; \
++			ver = sys.version.split ()[[0]]; \
++			print (ver >= '3.8.0')"`
++
+ 		# First, the library directory:
+ 		ac_python_libdir=`cat<<EOD | $PYTHON -
+ 
+@@ -223,18 +229,22 @@ EOD`
+ 		# credits goes to momjian, I think. I'd like to put the right name
+ 		# in the credits, if someone can point me in the right direction... ?
+ 		#
+-		if test -n "$ac_python_libdir" -a -n "$ac_python_library"
+-		then
+-			# use the official shared library
+-			ac_python_library=`echo "$ac_python_library" | sed "s/^lib//"`
+-			PYTHON_LIBS="-L$ac_python_libdir -l$ac_python_library"
++		if test "$ac_omit_python_library" = "True"; then
++			PYTHON_LIBS="-L$ac_python_libdir"
+ 		else
+-			# old way: use libpython from python_configdir
+-			ac_python_libdir=`$PYTHON -c \
+-			  "from distutils.sysconfig import get_python_lib as f; \
+-			  import os; \
+-			  print (os.path.join(f(plat_specific=1, standard_lib=1), 'config'));"`
+-			PYTHON_LIBS="-L$ac_python_libdir -lpython$ac_python_version"
++			if test -n "$ac_python_libdir" -a -n "$ac_python_library"
++			then
++				# use the official shared library
++				ac_python_library=`echo "$ac_python_library" | sed "s/^lib//"`
++				PYTHON_LIBS="-L$ac_python_libdir -l$ac_python_library"
++			else
++				# old way: use libpython from python_configdir
++				ac_python_libdir=`$PYTHON -c \
++				  "from distutils.sysconfig import get_python_lib as f; \
++				  import os; \
++				  print (os.path.join(f(plat_specific=1, standard_lib=1), 'config'));"`
++				PYTHON_LIBS="-L$ac_python_libdir -lpython$ac_python_version"
++			fi
+ 		fi
+ 
+ 		if test -z "PYTHON_LIBS"; then
+@@ -265,7 +275,7 @@ EOD`
+ 	if test -z "$PYTHON_EXTRA_LIBS"; then
+ 	   PYTHON_EXTRA_LIBS=`$PYTHON -c "import distutils.sysconfig; \
+                 conf = distutils.sysconfig.get_config_var; \
+-                print (conf('LIBS') + ' ' + conf('SYSLIBS'))"`
++                print ('-lpython' + (conf('LDVERSION') or conf('VERSION')) + ' ' + conf('LIBS') + ' ' + conf('SYSLIBS'))"`
+ 	fi
+ 	AC_MSG_RESULT([$PYTHON_EXTRA_LIBS])
+ 	AC_SUBST(PYTHON_EXTRA_LIBS)
+-- 
+2.23.0
+
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index eaf4e5f483..201c7130ec 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -15,6 +15,10 @@ DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus-glib
 HOST_DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 
+# We patch m4/ax_python_devel.m4
+DBUS_PYTHON_AUTORECONF = YES
+HOST_DBUS_PYTHON_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 DBUS_PYTHON_DEPENDENCIES += python host-python
 
-- 
2.23.0
