From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 20:57:57 +0000 (UTC)
Subject: [Buildroot] svn commit: [25690] trunk/buildroot/package/dbus
Message-ID: <20090316205757.3516F7649F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 20:57:56 +0000 (Mon, 16 Mar 2009)
New Revision: 25690

Log:
dbus: compile with X support if libX11 is available

Modified:
   trunk/buildroot/package/dbus/dbus.mk


Changeset:
Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-16 20:54:45 UTC (rev 25689)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-16 20:57:56 UTC (rev 25690)
@@ -18,14 +18,6 @@
 
 DBUS_DEPENDENCIES = uclibc pkgconfig
 
-ifeq ($(BR2_DBUS_EXPAT),y)
-DBUS_XML:=expat
-DBUS_DEPENDENCIES += expat
-else
-DBUS_XML:=libxml
-DBUS_DEPENDENCIES += libxml2
-endif
-
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
 DBUS_CONF_OPT = --program-prefix="" \
 		--with-dbus-user=dbus \
@@ -37,11 +29,24 @@
 		--disable-doxygen-docs \
 		--disable-static \
 		--enable-dnotify \
-		--without-x \
-		--with-xml=$(DBUS_XML) \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid
 
+ifeq ($(BR2_DBUS_EXPAT),y)
+DBUS_CONF_OPT += --with-xml=expat
+DBUS_DEPENDENCIES += expat
+else
+DBUS_CONF_OPT += --with-xml=libxml
+DBUS_DEPENDENCIES += libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+DBUS_CONF_OPT += --with-x
+DBUS_DEPENDENCIES += xlib_libX11
+else
+DBUS_CONF_OPT += --without-x
+endif
+
 $(eval $(call AUTOTARGETS,package,dbus))
 
 $(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
