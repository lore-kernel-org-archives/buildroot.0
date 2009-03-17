From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 14:44:21 +0000 (UTC)
Subject: [Buildroot] svn commit: [25709] trunk/buildroot/package/avahi
Message-ID: <20090317144421.50F1D76419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-17 14:44:20 +0000 (Tue, 17 Mar 2009)
New Revision: 25709

Log:
avahi: enable glib / gtk support if available

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-03-17 13:49:12 UTC (rev 25708)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-03-17 14:44:20 UTC (rev 25709)
@@ -72,11 +72,8 @@
 		avahi_cv_sys_cxx_works=yes
 
 AVAHI_CONF_OPT = --localstatedir=/var \
-		--disable-glib \
-		--disable-gobject \
 		--disable-qt3 \
 		--disable-qt4 \
-		--disable-gtk \
 		--disable-gdbm \
 		--disable-python-dbus \
 		--disable-pygtk \
@@ -112,6 +109,18 @@
 AVAHI_CONF_OPT += --disable-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+AVAHI_DEPENDENCIES += libglib2
+else
+AVAHI_CONF_OPT += --disable-glib --disable-gobject
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+AVAHI_DEPENDENCIES += libgtk2
+else
+AVAHI_CONF_OPT += --disable-gtk
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 AVAHI_CONF_ENV += am_cv_pathless_PYTHON=python \
 		am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
