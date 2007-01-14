From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 19:45:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  dbus dbus-glib
Message-ID: <20070114034506.AAF18485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 19:45:06 -0800 (Sat, 13 Jan 2007)
New Revision: 17285

Log:
Add packages for D-Bus and G-Lib interface library too.


Added:
   trunk/buildroot/package/dbus-glib/
   trunk/buildroot/package/dbus-glib/Config.in
   trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch
   trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch
   trunk/buildroot/package/dbus-glib/dbus-glib.mk
   trunk/buildroot/package/dbus/
   trunk/buildroot/package/dbus/Config.in
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/dbus/init-dbus


Changeset:
Added: trunk/buildroot/package/dbus/Config.in
===================================================================
--- trunk/buildroot/package/dbus/Config.in	                        (rev 0)
+++ trunk/buildroot/package/dbus/Config.in	2007-01-14 03:45:06 UTC (rev 17285)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DBUS
+	bool "dbus"
+	default n
+	select BR2_PACKAGE_EXPAT
+	help
+	  The D-Bus message bus system.
+
+	  http://www.freedesktop.org/wiki/Software/dbus

Added: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	                        (rev 0)
+++ trunk/buildroot/package/dbus/dbus.mk	2007-01-14 03:45:06 UTC (rev 17285)
@@ -0,0 +1,100 @@
+#############################################################
+#
+# dbus
+#
+#############################################################
+DBUS_VER:=1.0.0
+DBUS_SOURCE:=dbus-$(DBUS_VER).tar.gz
+DBUS_SITE:=http://dbus.freedesktop.org/releases/dbus/
+DBUS_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VER)
+DBUS_CAT:=$(ZCAT)
+DBUS_BINARY:=bus/dbus-daemon
+DBUS_TARGET_BINARY:=usr/bin/dbus-daemon
+
+$(DL_DIR)/$(DBUS_SOURCE):
+	$(WGET) -P $(DL_DIR) $(DBUS_SITE)/$(DBUS_SOURCE)
+
+dbus-source: $(DL_DIR)/$(DBUS_SOURCE)
+
+$(DBUS_DIR)/.unpacked: $(DL_DIR)/$(DBUS_SOURCE)
+	$(DBUS_CAT) $(DL_DIR)/$(DBUS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(DBUS_DIR)/.unpacked
+
+$(DBUS_DIR)/.configured: $(DBUS_DIR)/.unpacked
+	(cd $(DBUS_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		ac_cv_have_abstract_sockets=yes \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--localstatedir=/var \
+		--program-prefix="" \
+		--sysconfdir=/etc \
+		--with-dbus-user=dbus \
+		--disable-tests \
+		--disable-asserts \
+		--enable-abstract-sockets \
+		--disable-selinux \
+		--disable-xml-docs \
+		--disable-doxygen-docs \
+		--disable-static \
+		--enable-dnotify \
+		--without-x \
+		--without-xml \
+		--with-system-socket=/var/run/dbus/system_bus_socket \
+		--with-system-pid-file=/var/run/messagebus.pid \
+	);
+	touch  $(DBUS_DIR)/.configured
+
+$(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
+	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/lib/libexpat.so" -C $(DBUS_DIR) all
+
+$(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
+
+$(TARGET_DIR)/$(DBUS_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-1.so
+	mkdir $(TARGET_DIR)/var/run/dbus
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(DBUS_DIR)/dbus install
+	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/dbus-1.0
+	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.la
+	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.so
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libdbus-1.so.3.2.0
+	$(MAKE) DESTDIR=$(TARGET_DIR) initddir=/etc/init.d -C $(DBUS_DIR)/bus install
+	$(INSTALL) -m 0755 -D package/dbus/init-dbus $(TARGET_DIR)/etc/init.d/S97messagebus
+	rm -f $(TARGET_DIR)/etc/init.d/messagebus
+	rm -rf $(TARGET_DIR)/usr/man
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	rm -rf $(TARGET_DIR)/etc/rc.d
+
+dbus: uclibc expat $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+
+dbus-clean:
+	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf
+	rm -f $(TARGET_DIR)/etc/dbus-1/system.conf
+	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/dbus-1/system.d
+	rm -f $(TARGET_DIR)/etc/init.d/S97messagebus
+	rm -f $(TARGET_DIR)/usr/lib/libdbus-1.so*
+	rm -f $(TARGET_DIR)/usr/bin/dbus-daemon
+	rm -rf $(TARGET_DIR)/tmp/dbus
+	rm -f $(STAGING_DIR)/usr/lib/libdbus-1.*
+	rm -rf $(STAGING_DIR)/usr/lib/dbus-1.0
+	rm -rf $(STAGING_DIR)/usr/include/dbus-1.0
+	rmdir --ignore-fail-on-non-empty $(STAGING_DIR)/usr/include
+	-$(MAKE) -C $(DBUS_DIR) clean
+
+dbus-dirclean:
+	rm -rf $(DBUS_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+TARGETS+=dbus
+endif

Added: trunk/buildroot/package/dbus/init-dbus
===================================================================
--- trunk/buildroot/package/dbus/init-dbus	                        (rev 0)
+++ trunk/buildroot/package/dbus/init-dbus	2007-01-14 03:45:06 UTC (rev 17285)
@@ -0,0 +1,76 @@
+#!/bin/sh
+#
+# messagebus:   The D-BUS systemwide message bus
+#
+# chkconfig: 345 97 03
+# description:  This is a daemon which broadcasts notifications of system events \
+#               and other messages. See http://www.freedesktop.org/software/dbus/
+#
+# processname: dbus-daemon
+# pidfile: /var/run/messagebus.pid
+#
+
+# Sanity checks.
+[ -x /usr/bin/dbus-daemon ] || exit 0
+
+# Create needed directories.
+[ -d /var/run/dbus ] || mkdir -p /var/run/dbus
+[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
+
+RETVAL=0
+
+start() {
+    echo -n "Starting system message bus: "
+
+    dbus-daemon --system
+    RETVAL=$?
+    echo "done"
+    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/dbus-daemon
+}
+
+stop() {
+    echo -n "Stopping system message bus: "
+
+    ## we don't want to kill all the per-user $processname, we want
+    ## to use the pid file *only*; because we use the fake nonexistent 
+    ## program name "$servicename" that should be safe-ish
+    killall dbus-daemon
+    RETVAL=$?
+    echo "done"
+    if [ $RETVAL -eq 0 ]; then
+        rm -f /var/lock/subsys/dbus-daemon
+        rm -f /var/run/messagebus.pid
+    fi
+}
+
+# See how we were called.
+case "$1" in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    status)
+        status $processname
+        RETVAL=$?
+        ;;
+    restart)
+        stop
+        start
+        ;;
+    condrestart)
+        if [ -f /var/lock/subsys/$servicename ]; then
+            stop
+            start
+        fi
+        ;;
+    reload)
+        echo "Message bus can't reload its configuration, you have to restart it"
+        RETVAL=$?
+        ;;
+    *)
+        echo $"Usage: $0 {start|stop|status|restart|condrestart|reload}"
+        ;;
+esac
+exit $RETVAL


Property changes on: trunk/buildroot/package/dbus/init-dbus
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/dbus-glib/Config.in
===================================================================
--- trunk/buildroot/package/dbus-glib/Config.in	                        (rev 0)
+++ trunk/buildroot/package/dbus-glib/Config.in	2007-01-14 03:45:06 UTC (rev 17285)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DBUS_GLIB
+	bool "dbus-glib"
+	default n
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  GLib bindings for D-Bus.
+
+	  http://www.freedesktop.org/software/dbus

Added: trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch	                        (rev 0)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch	2007-01-14 03:45:06 UTC (rev 17285)
@@ -0,0 +1,77 @@
+--- dbus-glib-0.70/tools/dbus-bus-introspect.xml.dontgenerate	2006-07-18 15:14:38.000000000 -0400
++++ dbus-glib-0.70/tools/dbus-bus-introspect.xml	2006-07-18 15:13:17.000000000 -0400
+@@ -0,0 +1,74 @@
++   <!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN"
++"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
++<node>
++  <interface name="org.freedesktop.DBus.Introspectable">
++    <method name="Introspect">
++      <arg name="data" direction="out" type="s"/>
++    </method>
++  </interface>
++  <interface name="org.freedesktop.DBus">
++    <method name="RequestName">
++      <arg direction="in" type="s"/>
++      <arg direction="in" type="u"/>
++      <arg direction="out" type="u"/>
++    </method>
++    <method name="ReleaseName">
++      <arg direction="in" type="s"/>
++      <arg direction="out" type="u"/>
++    </method>
++    <method name="StartServiceByName">
++      <arg direction="in" type="s"/>
++      <arg direction="in" type="u"/>
++      <arg direction="out" type="u"/>
++    </method>
++    <method name="Hello">
++      <arg direction="out" type="s"/>
++    </method>
++    <method name="NameHasOwner">
++      <arg direction="in" type="s"/>
++      <arg direction="out" type="b"/>
++    </method>
++    <method name="ListNames">
++      <arg direction="out" type="as"/>
++    </method>
++    <method name="AddMatch">
++      <arg direction="in" type="s"/>
++    </method>
++    <method name="RemoveMatch">
++      <arg direction="in" type="s"/>
++    </method>
++    <method name="GetNameOwner">
++      <arg direction="in" type="s"/>
++      <arg direction="out" type="s"/>
++    </method>
++    <method name="ListQueuedOwners">
++      <arg direction="in" type="s"/>
++      <arg direction="out" type="as"/>
++    </method>
++    <method name="GetConnectionUnixUser">
++      <arg direction="in" type="s"/>
++      <arg direction="out" type="u"/>
++    </method>
++    <method name="GetConnectionUnixProcessID">
++      <arg direction="in" type="s"/>
++      <arg direction="out" type="u"/>
++    </method>
++    <method name="GetConnectionSELinuxSecurityContext">
++      <arg direction="in" type="s"/>
++      <arg direction="out" type="ay"/>
++    </method>
++    <method name="ReloadConfig">
++    </method>
++    <signal name="NameOwnerChanged">
++      <arg type="s"/>
++      <arg type="s"/>
++      <arg type="s"/>
++    </signal>
++    <signal name="NameLost">
++      <arg type="s"/>
++    </signal>
++    <signal name="NameAcquired">
++      <arg type="s"/>
++    </signal>
++  </interface>
++</node>

Added: trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch	                        (rev 0)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch	2007-01-14 03:45:06 UTC (rev 17285)
@@ -0,0 +1,129 @@
+diff -ur dbus-glib-0.72/configure.ac dbus-glib-0.72-patched/configure.ac
+--- dbus-glib-0.72/configure.ac	2006-10-25 15:53:55.000000000 -0500
++++ dbus-glib-0.72-patched/configure.ac	2006-11-15 14:15:09.000000000 -0600
+@@ -431,42 +431,6 @@
+ 
+ AC_CHECK_HEADERS(execinfo.h, [AC_CHECK_FUNCS(backtrace)])
+ 
+-AC_CACHE_CHECK([for posix getpwnam_r],
+-		ac_cv_func_posix_getpwnam_r,
+-		[AC_TRY_RUN([
+-#include <errno.h>
+-#include <pwd.h>
+-int main () { 
+-    char buffer[10000];
+-    struct passwd pwd, *pwptr = &pwd;
+-    int error;
+-    errno = 0;
+-    error = getpwnam_r ("", &pwd, buffer, 
+-                        sizeof (buffer), &pwptr);
+-   return (error < 0 && errno == ENOSYS) 
+-	   || error == ENOSYS; 
+-}               ],
+-	[ac_cv_func_posix_getpwnam_r=yes],
+-	[ac_cv_func_posix_getpwnam_r=no])])
+-if test "$ac_cv_func_posix_getpwnam_r" = yes; then
+-	AC_DEFINE(HAVE_POSIX_GETPWNAM_R,1,
+-		[Have POSIX function getpwnam_r])
+-else
+-	AC_CACHE_CHECK([for nonposix getpwnam_r],
+-		ac_cv_func_nonposix_getpwnam_r,
+-		[AC_TRY_LINK([#include <pwd.h>],
+-                      	[char buffer[10000];
+-                       	struct passwd pwd;
+-                       	getpwnam_r ("", &pwd, buffer, 
+-                               		sizeof (buffer));],
+-			[ac_cv_func_nonposix_getpwnam_r=yes],
+-			[ac_cv_func_nonposix_getpwnam_r=no])])
+-		if test "$ac_cv_func_nonposix_getpwnam_r" = yes; then
+-		AC_DEFINE(HAVE_NONPOSIX_GETPWNAM_R,1,
+-			[Have non-POSIX function getpwnam_r])
+-	fi
+-fi
+-
+ dnl check for socklen_t
+ AC_MSG_CHECKING(whether socklen_t is defined)
+ AC_TRY_COMPILE([
+@@ -532,49 +496,6 @@
+ 
+ #### Abstract sockets
+ 
+-AC_MSG_CHECKING(abstract socket namespace)
+-AC_LANG_PUSH(C)
+-AC_RUN_IFELSE([AC_LANG_PROGRAM(
+-[[
+-#include <sys/types.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <stdio.h>
+-#include <sys/socket.h>
+-#include <sys/un.h>
+-#include <errno.h>
+-]],
+-[[
+-  int listen_fd;
+-  struct sockaddr_un addr;
+-  
+-  listen_fd = socket (PF_UNIX, SOCK_STREAM, 0);
+-  
+-  if (listen_fd < 0)
+-    {
+-      fprintf (stderr, "socket() failed: %s\n", strerror (errno));
+-      exit (1);
+-    }
+-
+-  memset (&addr, '\0', sizeof (addr));
+-  addr.sun_family = AF_UNIX;
+-  strcpy (addr.sun_path, "X/tmp/dbus-fake-socket-path-used-in-configure-test");
+-  addr.sun_path[0] = '\0'; /* this is what makes it abstract */
+-  
+-  if (bind (listen_fd, (struct sockaddr*) &addr, SUN_LEN (&addr)) < 0)
+-    {
+-       fprintf (stderr, "Abstract socket namespace bind() failed: %s\n", 
+-                strerror (errno));
+-       exit (1);
+-    }
+-  else 
+-    exit (0);
+-]])],
+-              [have_abstract_sockets=yes],
+-              [have_abstract_sockets=no])
+-AC_LANG_POP(C)
+-AC_MSG_RESULT($have_abstract_sockets)
+-
+ if test x$enable_abstract_sockets = xyes; then
+     if test x$have_abstract_sockets = xno; then
+ 	AC_MSG_ERROR([Abstract sockets explicitly required, and support not detected.])
+diff -ur dbus-glib-0.72/dbus/Makefile.in dbus-glib-0.72-patched/dbus/Makefile.in
+--- dbus-glib-0.72/dbus/Makefile.in	2006-10-25 16:14:31.000000000 -0500
++++ dbus-glib-0.72-patched/dbus/Makefile.in	2006-11-15 14:15:09.000000000 -0600
+@@ -303,7 +303,7 @@
+ target_cpu = @target_cpu@
+ target_os = @target_os@
+ target_vendor = @target_vendor@
+-SUBDIRS = . examples
++SUBDIRS = .
+ INCLUDES = \
+ 	-I$(top_srcdir)						\
+ 	-I$(top_builddir)					\
+@@ -371,7 +371,7 @@
+ 	dbus-glib-tool.h			\
+ 	dbus-glib-tool.c
+ 
+-dbus_binding_tool_LDADD = libdbus-gtool.la libdbus-glib-1.la $(DBUS_LIBS) $(DBUS_GLIB_LIBS) -lexpat
++dbus_binding_tool_LDADD = libdbus-gtool.la libdbus-glib-1.la $(DBUS_LIBS) $(DBUS_GLIB_LIBS) $(DBUS_BUS_LIBS)
+ EXTRA_DIST = dbus-gmarshal.list make-dbus-glib-error-switch.sh make-dbus-glib-error-enum.sh
+ @DBUS_BUILD_TESTS_TRUE@TESTS_ENVIRONMENT = DBUS_TEST_DATA=$(top_builddir)/test/data DBUS_TEST_HOMEDIR=$(top_builddir)/dbus
+ 
+diff -ur dbus-glib-0.72/Makefile.in dbus-glib-0.72-patched/Makefile.in
+--- dbus-glib-0.72/Makefile.in	2006-10-25 16:14:33.000000000 -0500
++++ dbus-glib-0.72-patched/Makefile.in	2006-11-15 14:15:28.000000000 -0600
+@@ -277,7 +277,7 @@
+ target_os = @target_os@
+ target_vendor = @target_vendor@
+ GLIB_PC = dbus-glib-1.pc
+-SUBDIRS = dbus tools test doc
++SUBDIRS = dbus
+ DIST_SUBDIRS = dbus tools test doc m4
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = $(GLIB_PC)

Added: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	                        (rev 0)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2007-01-14 03:45:06 UTC (rev 17285)
@@ -0,0 +1,82 @@
+#############################################################
+#
+# dbus-glib
+#
+#############################################################
+DBUS_GLIB_VER:=0.72
+DBUS_GLIB_SOURCE:=dbus-glib-$(DBUS_GLIB_VER).tar.gz
+DBUS_GLIB_SITE:=http://dbus.freedesktop.org/releases/dbus-glib/
+DBUS_GLIB_DIR:=$(BUILD_DIR)/dbus-glib-$(DBUS_GLIB_VER)
+DBUS_GLIB_CAT:=$(ZCAT)
+DBUS_GLIB_BINARY:=dbus/.libs/dbus-binding-tool
+DBUS_GLIB_TARGET_BINARY:=usr/bin/dbus-binding-tool
+
+$(DL_DIR)/$(DBUS_GLIB_SOURCE):
+	$(WGET) -P $(DL_DIR) $(DBUS_GLIB_SITE)/$(DBUS_GLIB_SOURCE)
+
+dbus-glib-source: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
+
+$(DBUS_GLIB_DIR)/.unpacked: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
+	$(DBUS_GLIB_CAT) $(DL_DIR)/$(DBUS_GLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(DBUS_GLIB_DIR) package/dbus-glib/ \*.patch
+	touch $(DBUS_GLIB_DIR)/.unpacked
+
+$(DBUS_GLIB_DIR)/.configured: $(DBUS_GLIB_DIR)/.unpacked /usr/bin/pkg-config
+	(cd $(DBUS_GLIB_DIR); rm -rf config.cache; autoconf ; \
+		$(TARGET_CONFIGURE_OPTS) \
+		ac_cv_have_abstract_sockets=yes \
+		ac_cv_func_posix_getpwnam_r=yes \
+		have_abstract_sockets=yes \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
+		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
+		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/include/glib-2.0 -I$(STAGING_DIR)/lib/glib-2.0/include" \
+		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
+		PKG_CONFIG=/usr/bin/pkg-config \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--localstatedir=/var \
+		--program-prefix="" \
+		--disable-tests \
+		--disable-xml-docs \
+		--disable-doxygen-docs \
+		--enable-asserts=yes \
+	);
+	touch  $(DBUS_GLIB_DIR)/.configured
+
+$(DBUS_GLIB_DIR)/$(DBUS_GLIB_BINARY): $(DBUS_GLIB_DIR)/.configured
+	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/lib/libexpat.so" -C $(DBUS_GLIB_DIR) all
+
+$(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0: $(DBUS_GLIB_DIR)/$(DBUS_GLIB_BINARY)
+	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so* $(STAGING_DIR)/usr/lib
+	-touch -c $(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
+
+$(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
+	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so.2* $(TARGET_DIR)/usr/lib
+	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/dbus-binding-tool $(TARGET_DIR)/usr/bin
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
+
+dbus-glib: uclibc dbus libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
+
+dbus-glib-clean:
+	rm -f $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2*
+	rm -f $(TARGET_DIR)/usr/bin/dbus-binding-tool
+	rm -f $(STAGING_DIR)/usr/lib/libdbus-glib-1.so*
+	-$(MAKE) -C $(DBUS_GLIB_DIR) clean
+
+dbus-glib-dirclean:
+	rm -rf $(DBUS_GLIB_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DBUS_GLIB)),y)
+TARGETS+=dbus-glib
+endif
