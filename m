From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Mar 2009 15:38:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [25645] trunk/buildroot/package/avahi
Message-ID: <20090313153804.89D687643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-13 15:38:03 +0000 (Fri, 13 Mar 2009)
New Revision: 25645

Log:
avahi: enable python support if python is enabled

Not particular useful until we add dbus-python (which depends on a fixed up
dbus-glib, which in turn depends on us starting to compile glib/dbus/dbus-glib
for the host as well) - But that's for another day.

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-03-13 15:37:54 UTC (rev 25644)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-03-13 15:38:03 UTC (rev 25645)
@@ -78,7 +78,6 @@
 		--disable-qt4 \
 		--disable-gtk \
 		--disable-gdbm \
-		--disable-python \
 		--disable-python-dbus \
 		--disable-pygtk \
 		--disable-mono \
@@ -113,6 +112,21 @@
 AVAHI_CONF_OPT += --disable-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+AVAHI_CONF_ENV += am_cv_pathless_PYTHON=python \
+		am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
+		am_cv_python_version=$(PYTHON_VERSION) \
+		am_cv_python_platform=linux2 \
+		am_cv_python_pythondir=$(PYTHON_SITE_PACKAGE_DIR) \
+		am_cv_python_pyexecdir=$(PYTHON_SITE_PACKAGE_DIR) \
+		py_cv_mod_socket_=yes
+
+AVAHI_DEPENDENCIES += libpython
+AVAHI_CONF_OPT += --enable-python
+else
+AVAHI_CONF_OPT += --disable-python
+endif
+
 ifeq ($(BR2_PACKAGE_LIBINTL),y)
 AVAHI_DEPENDENCIES += libintl
 AVAHI_MAKE_OPT = LIBS=-lintl
