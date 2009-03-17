From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 13:48:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [25706] trunk/buildroot/package/dbus-glib
Message-ID: <20090317134848.5F68576419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-17 13:48:47 +0000 (Tue, 17 Mar 2009)
New Revision: 25706

Log:
dbus-glib: bump version and convert to Makefile.autotools.in format

This at the same times fixes the staging dir install, so stuff needing
dbus-glib is able to build.

Added:
   trunk/buildroot/package/dbus-glib/dbus-glib-autoreconf.patch
   trunk/buildroot/package/dbus-glib/dbus-glib-dbus-binding-tool.patch

Removed:
   trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch
   trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch
   trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch

Modified:
   trunk/buildroot/package/dbus-glib/dbus-glib.mk


Changeset:
Deleted: trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch	2009-03-17 13:48:35 UTC (rev 25705)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-0.70-dontgeneratexml.patch	2009-03-17 13:48:47 UTC (rev 25706)
@@ -1,77 +0,0 @@
---- dbus-glib-0.70/tools/dbus-bus-introspect.xml.dontgenerate	2006-07-18 15:14:38.000000000 -0400
-+++ dbus-glib-0.70/tools/dbus-bus-introspect.xml	2006-07-18 15:13:17.000000000 -0400
-@@ -0,0 +1,74 @@
-+   <!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN"
-+"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
-+<node>
-+  <interface name="org.freedesktop.DBus.Introspectable">
-+    <method name="Introspect">
-+      <arg name="data" direction="out" type="s"/>
-+    </method>
-+  </interface>
-+  <interface name="org.freedesktop.DBus">
-+    <method name="RequestName">
-+      <arg direction="in" type="s"/>
-+      <arg direction="in" type="u"/>
-+      <arg direction="out" type="u"/>
-+    </method>
-+    <method name="ReleaseName">
-+      <arg direction="in" type="s"/>
-+      <arg direction="out" type="u"/>
-+    </method>
-+    <method name="StartServiceByName">
-+      <arg direction="in" type="s"/>
-+      <arg direction="in" type="u"/>
-+      <arg direction="out" type="u"/>
-+    </method>
-+    <method name="Hello">
-+      <arg direction="out" type="s"/>
-+    </method>
-+    <method name="NameHasOwner">
-+      <arg direction="in" type="s"/>
-+      <arg direction="out" type="b"/>
-+    </method>
-+    <method name="ListNames">
-+      <arg direction="out" type="as"/>
-+    </method>
-+    <method name="AddMatch">
-+      <arg direction="in" type="s"/>
-+    </method>
-+    <method name="RemoveMatch">
-+      <arg direction="in" type="s"/>
-+    </method>
-+    <method name="GetNameOwner">
-+      <arg direction="in" type="s"/>
-+      <arg direction="out" type="s"/>
-+    </method>
-+    <method name="ListQueuedOwners">
-+      <arg direction="in" type="s"/>
-+      <arg direction="out" type="as"/>
-+    </method>
-+    <method name="GetConnectionUnixUser">
-+      <arg direction="in" type="s"/>
-+      <arg direction="out" type="u"/>
-+    </method>
-+    <method name="GetConnectionUnixProcessID">
-+      <arg direction="in" type="s"/>
-+      <arg direction="out" type="u"/>
-+    </method>
-+    <method name="GetConnectionSELinuxSecurityContext">
-+      <arg direction="in" type="s"/>
-+      <arg direction="out" type="ay"/>
-+    </method>
-+    <method name="ReloadConfig">
-+    </method>
-+    <signal name="NameOwnerChanged">
-+      <arg type="s"/>
-+      <arg type="s"/>
-+      <arg type="s"/>
-+    </signal>
-+    <signal name="NameLost">
-+      <arg type="s"/>
-+    </signal>
-+    <signal name="NameAcquired">
-+      <arg type="s"/>
-+    </signal>
-+  </interface>
-+</node>

Added: trunk/buildroot/package/dbus-glib/dbus-glib-autoreconf.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-autoreconf.patch	                        (rev 0)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-autoreconf.patch	2009-03-17 13:48:47 UTC (rev 25706)
@@ -0,0 +1,215 @@
+dbus-glib: result of autoreconf after the --with-dbus-binding-tool addition
+
+autoreconf on dbus-glib fails with the autoconf version we currently have
+in BR, so do it in patch form instead.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure                              |   14 ++++++++++++++
+ dbus/Makefile.in                       |    1 +
+ dbus/examples/Makefile.in              |    5 +++--
+ dbus/examples/statemachine/Makefile.in |    5 +++--
+ test/core/Makefile.in                  |    7 ++++---
+ test/interfaces/Makefile.in            |   13 +++++++------
+ tools/Makefile.in                      |    3 ++-
+ 7 files changed, 34 insertions(+), 14 deletions(-)
+
+Index: dbus-glib-0.80/configure
+===================================================================
+--- dbus-glib-0.80.orig/configure
++++ dbus-glib-0.80/configure
+@@ -882,6 +882,7 @@
+ SED
+ DBUS_BUILD_TESTS_FALSE
+ DBUS_BUILD_TESTS_TRUE
++DBUS_BINDING_TOOL
+ DBUS_BASH_COMPLETION_FALSE
+ DBUS_BASH_COMPLETION_TRUE
+ EGREP
+@@ -1003,6 +1004,7 @@
+ enable_bash_completion
+ with_test_socket_dir
+ with_introspect_xml
++with_dbus_binding_tool
+ enable_shared
+ enable_static
+ enable_fast_install
+@@ -1696,6 +1698,8 @@
+                           Pass in a pregenerated dbus daemon introspection xml
+                           file (as generated by 'dbus-daemon --introspect') to
+                           use instead of querying the installed dbus daemon
++  --with-dbus-binding-tool=filename
++                          Use external dbus-binding-tool program
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+@@ -5174,6 +5178,16 @@
+ fi
+ 
+ 
++# Check whether --with-dbus-binding-tool was given.
++if test "${with_dbus_binding_tool+set}" = set; then
++  withval=$with_dbus_binding_tool; DBUS_BINDING_TOOL=$withval
++else
++  DBUS_BINDING_TOOL=\$\(top_builddir\)/dbus/dbus-binding-tool
++fi
++
++
++
++
+  if test x$enable_tests = xyes; then
+   DBUS_BUILD_TESTS_TRUE=
+   DBUS_BUILD_TESTS_FALSE='#'
+Index: dbus-glib-0.80/dbus/examples/Makefile.in
+===================================================================
+--- dbus-glib-0.80.orig/dbus/examples/Makefile.in
++++ dbus-glib-0.80/dbus/examples/Makefile.in
+@@ -114,6 +114,7 @@
+ CXXFLAGS = @CXXFLAGS@
+ CYGPATH_W = @CYGPATH_W@
+ DATADIRNAME = @DATADIRNAME@
++DBUS_BINDING_TOOL = @DBUS_BINDING_TOOL@
+ DBUS_BUS_CFLAGS = @DBUS_BUS_CFLAGS@
+ DBUS_BUS_LIBS = @DBUS_BUS_LIBS@
+ DBUS_CFLAGS = @DBUS_CFLAGS@
+@@ -668,10 +669,10 @@
+ 
+ 
+ example-service-glue.h: example-service.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=some_object --mode=glib-server --output=example-service-glue.h $(srcdir)/example-service.xml
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=some_object --mode=glib-server --output=example-service-glue.h $(srcdir)/example-service.xml
+ 
+ example-signal-emitter-glue.h: example-signal-emitter.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=test_object --mode=glib-server --output=example-signal-emitter-glue.h $(srcdir)/example-signal-emitter.xml
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=test_object --mode=glib-server --output=example-signal-emitter-glue.h $(srcdir)/example-signal-emitter.xml
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:
+Index: dbus-glib-0.80/dbus/examples/statemachine/Makefile.in
+===================================================================
+--- dbus-glib-0.80.orig/dbus/examples/statemachine/Makefile.in
++++ dbus-glib-0.80/dbus/examples/statemachine/Makefile.in
+@@ -87,6 +87,7 @@
+ CXXFLAGS = @CXXFLAGS@
+ CYGPATH_W = @CYGPATH_W@
+ DATADIRNAME = @DATADIRNAME@
++DBUS_BINDING_TOOL = @DBUS_BINDING_TOOL@
+ DBUS_BUS_CFLAGS = @DBUS_BUS_CFLAGS@
+ DBUS_BUS_LIBS = @DBUS_BUS_LIBS@
+ DBUS_CFLAGS = @DBUS_CFLAGS@
+@@ -529,10 +530,10 @@
+ 
+ 
+ statemachine-server-glue.h: statemachine-server.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=sm_server --mode=glib-server --output=$@ $<
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=sm_server --mode=glib-server --output=$@ $<
+ 
+ statemachine-glue.h: statemachine.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=sm_object --mode=glib-server --output=$@ $<
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=sm_object --mode=glib-server --output=$@ $<
+ 
+ sm-marshal.c: Makefile sm-marshal.list
+ 	@GLIB_GENMARSHAL@ --prefix=sm_marshal $(srcdir)/sm-marshal.list --header --body > $@.tmp && mv $@.tmp $@
+Index: dbus-glib-0.80/test/core/Makefile.in
+===================================================================
+--- dbus-glib-0.80.orig/test/core/Makefile.in
++++ dbus-glib-0.80/test/core/Makefile.in
+@@ -175,6 +175,7 @@
+ CXXFLAGS = @CXXFLAGS@
+ CYGPATH_W = @CYGPATH_W@
+ DATADIRNAME = @DATADIRNAME@
++DBUS_BINDING_TOOL = @DBUS_BINDING_TOOL@
+ DBUS_BUS_CFLAGS = @DBUS_BUS_CFLAGS@
+ DBUS_BUS_LIBS = @DBUS_BUS_LIBS@
+ DBUS_CFLAGS = @DBUS_CFLAGS@
+@@ -767,13 +768,13 @@
+ 
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-service-glib-glue.h: test-service-glib.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(DEBUG) $(top_builddir)/dbus/dbus-binding-tool --prefix=my_object --mode=glib-server --output=test-service-glib-glue.h $(srcdir)/test-service-glib.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DEBUG) $(DBUS_BINDING_TOOL) --prefix=my_object --mode=glib-server --output=test-service-glib-glue.h $(srcdir)/test-service-glib.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-service-glib-subclass-glue.h: test-service-glib-subclass.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(DEBUG) $(top_builddir)/dbus/dbus-binding-tool --prefix=my_object_subclass --mode=glib-server --output=test-service-glib-subclass-glue.h $(srcdir)/test-service-glib-subclass.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DEBUG) $(DBUS_BINDING_TOOL) --prefix=my_object_subclass --mode=glib-server --output=test-service-glib-subclass-glue.h $(srcdir)/test-service-glib-subclass.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-service-glib-bindings.h: test-service-glib.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(DEBUG) $(top_builddir)/dbus/dbus-binding-tool --prefix=my_object --mode=glib-client --output=test-service-glib-bindings.h $(srcdir)/test-service-glib.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DEBUG) $(DBUS_BINDING_TOOL) --prefix=my_object --mode=glib-client --output=test-service-glib-bindings.h $(srcdir)/test-service-glib.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at my-object-marshal.c: Makefile my-object-marshal.list
+ @DBUS_BUILD_TESTS_TRUE@	@GLIB_GENMARSHAL@ --prefix=my_object_marshal $(srcdir)/my-object-marshal.list --header --body > my-object-marshal.c
+Index: dbus-glib-0.80/test/interfaces/Makefile.in
+===================================================================
+--- dbus-glib-0.80.orig/test/interfaces/Makefile.in
++++ dbus-glib-0.80/test/interfaces/Makefile.in
+@@ -104,6 +104,7 @@
+ CXXFLAGS = @CXXFLAGS@
+ CYGPATH_W = @CYGPATH_W@
+ DATADIRNAME = @DATADIRNAME@
++DBUS_BINDING_TOOL = @DBUS_BINDING_TOOL@
+ DBUS_BUS_CFLAGS = @DBUS_BUS_CFLAGS@
+ DBUS_BUS_LIBS = @DBUS_BUS_LIBS@
+ DBUS_CFLAGS = @DBUS_CFLAGS@
+@@ -637,22 +638,22 @@
+ 
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-song-glue.h: test-song.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_song --mode=glib-server --output=test-song-glue.h $(srcdir)/test-song.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DBUS_BINDING_TOOL) --prefix=test_song --mode=glib-server --output=test-song-glue.h $(srcdir)/test-song.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-song-bindings.h: test-song.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_song --mode=glib-client --output=test-song-bindings.h $(srcdir)/test-song.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DBUS_BINDING_TOOL) --prefix=test_song --mode=glib-client --output=test-song-bindings.h $(srcdir)/test-song.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-hello-glue.h: test-hello.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_hello --mode=glib-server --output=test-hello-glue.h $(srcdir)/test-hello.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DBUS_BINDING_TOOL) --prefix=test_hello --mode=glib-server --output=test-hello-glue.h $(srcdir)/test-hello.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-hello-bindings.h: test-hello.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_hello --mode=glib-client --output=test-hello-bindings.h $(srcdir)/test-hello.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DBUS_BINDING_TOOL) --prefix=test_hello --mode=glib-client --output=test-hello-bindings.h $(srcdir)/test-hello.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-goodbye-glue.h: test-goodbye.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_goodbye --mode=glib-server --output=test-goodbye-glue.h $(srcdir)/test-goodbye.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DBUS_BINDING_TOOL) --prefix=test_goodbye --mode=glib-server --output=test-goodbye-glue.h $(srcdir)/test-goodbye.xml
+ 
+ @DBUS_BUILD_TESTS_TRUE at test-goodbye-bindings.h: test-goodbye.xml $(top_builddir)/dbus/dbus-binding-tool
+- at DBUS_BUILD_TESTS_TRUE@	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_goodbye --mode=glib-client --output=test-goodbye-bindings.h $(srcdir)/test-goodbye.xml
++ at DBUS_BUILD_TESTS_TRUE@	$(DBUS_BINDING_TOOL) --prefix=test_goodbye --mode=glib-client --output=test-goodbye-bindings.h $(srcdir)/test-goodbye.xml
+ 
+ ### not building tests
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+Index: dbus-glib-0.80/tools/Makefile.in
+===================================================================
+--- dbus-glib-0.80.orig/tools/Makefile.in
++++ dbus-glib-0.80/tools/Makefile.in
+@@ -77,6 +77,7 @@
+ CXXFLAGS = @CXXFLAGS@
+ CYGPATH_W = @CYGPATH_W@
+ DATADIRNAME = @DATADIRNAME@
++DBUS_BINDING_TOOL = @DBUS_BINDING_TOOL@
+ DBUS_BUS_CFLAGS = @DBUS_BUS_CFLAGS@
+ DBUS_BUS_LIBS = @DBUS_BUS_LIBS@
+ DBUS_CFLAGS = @DBUS_CFLAGS@
+@@ -481,7 +482,7 @@
+ 
+ 
+ dbus-glib-bindings.h: dbus-bus-introspect.xml $(top_builddir)/dbus/dbus-binding-tool$(EXEEXT)
+-	$(top_builddir)/dbus/dbus-binding-tool --mode=glib-client --prefix=dbus_bus --output=dbus-glib-bindings.h dbus-bus-introspect.xml
++	$(DBUS_BINDING_TOOL) --mode=glib-client --prefix=dbus_bus --output=dbus-glib-bindings.h dbus-bus-introspect.xml
+ 
+ @USE_INTROSPECT_XML_TRUE at dbus-bus-introspect.xml: $(INTROSPECT_XML_PATH)
+ @USE_INTROSPECT_XML_TRUE@	cp $(INTROSPECT_XML_PATH) dbus-bus-introspect.xml
+Index: dbus-glib-0.80/dbus/Makefile.in
+===================================================================
+--- dbus-glib-0.80.orig/dbus/Makefile.in
++++ dbus-glib-0.80/dbus/Makefile.in
+@@ -158,6 +158,7 @@
+ CXXFLAGS = @CXXFLAGS@
+ CYGPATH_W = @CYGPATH_W@
+ DATADIRNAME = @DATADIRNAME@
++DBUS_BINDING_TOOL = @DBUS_BINDING_TOOL@
+ DBUS_BUS_CFLAGS = @DBUS_BUS_CFLAGS@
+ DBUS_BUS_LIBS = @DBUS_BUS_LIBS@
+ DBUS_CFLAGS = @DBUS_CFLAGS@

Deleted: trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch	2009-03-17 13:48:35 UTC (rev 25705)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-cross-compile.patch	2009-03-17 13:48:47 UTC (rev 25706)
@@ -1,129 +0,0 @@
-diff -ur dbus-glib-0.72/configure.ac dbus-glib-0.72-patched/configure.ac
---- dbus-glib-0.72/configure.ac	2006-10-25 15:53:55.000000000 -0500
-+++ dbus-glib-0.72-patched/configure.ac	2006-11-15 14:15:09.000000000 -0600
-@@ -431,42 +431,6 @@
- 
- AC_CHECK_HEADERS(execinfo.h, [AC_CHECK_FUNCS(backtrace)])
- 
--AC_CACHE_CHECK([for posix getpwnam_r],
--		ac_cv_func_posix_getpwnam_r,
--		[AC_TRY_RUN([
--#include <errno.h>
--#include <pwd.h>
--int main () { 
--    char buffer[10000];
--    struct passwd pwd, *pwptr = &pwd;
--    int error;
--    errno = 0;
--    error = getpwnam_r ("", &pwd, buffer, 
--                        sizeof (buffer), &pwptr);
--   return (error < 0 && errno == ENOSYS) 
--	   || error == ENOSYS; 
--}               ],
--	[ac_cv_func_posix_getpwnam_r=yes],
--	[ac_cv_func_posix_getpwnam_r=no])])
--if test "$ac_cv_func_posix_getpwnam_r" = yes; then
--	AC_DEFINE(HAVE_POSIX_GETPWNAM_R,1,
--		[Have POSIX function getpwnam_r])
--else
--	AC_CACHE_CHECK([for nonposix getpwnam_r],
--		ac_cv_func_nonposix_getpwnam_r,
--		[AC_TRY_LINK([#include <pwd.h>],
--                      	[char buffer[10000];
--                       	struct passwd pwd;
--                       	getpwnam_r ("", &pwd, buffer, 
--                               		sizeof (buffer));],
--			[ac_cv_func_nonposix_getpwnam_r=yes],
--			[ac_cv_func_nonposix_getpwnam_r=no])])
--		if test "$ac_cv_func_nonposix_getpwnam_r" = yes; then
--		AC_DEFINE(HAVE_NONPOSIX_GETPWNAM_R,1,
--			[Have non-POSIX function getpwnam_r])
--	fi
--fi
--
- dnl check for socklen_t
- AC_MSG_CHECKING(whether socklen_t is defined)
- AC_TRY_COMPILE([
-@@ -532,49 +496,6 @@
- 
- #### Abstract sockets
- 
--AC_MSG_CHECKING(abstract socket namespace)
--AC_LANG_PUSH(C)
--AC_RUN_IFELSE([AC_LANG_PROGRAM(
--[[
--#include <sys/types.h>
--#include <stdlib.h>
--#include <string.h>
--#include <stdio.h>
--#include <sys/socket.h>
--#include <sys/un.h>
--#include <errno.h>
--]],
--[[
--  int listen_fd;
--  struct sockaddr_un addr;
--  
--  listen_fd = socket (PF_UNIX, SOCK_STREAM, 0);
--  
--  if (listen_fd < 0)
--    {
--      fprintf (stderr, "socket() failed: %s\n", strerror (errno));
--      exit (1);
--    }
--
--  memset (&addr, '\0', sizeof (addr));
--  addr.sun_family = AF_UNIX;
--  strcpy (addr.sun_path, "X/tmp/dbus-fake-socket-path-used-in-configure-test");
--  addr.sun_path[0] = '\0'; /* this is what makes it abstract */
--  
--  if (bind (listen_fd, (struct sockaddr*) &addr, SUN_LEN (&addr)) < 0)
--    {
--       fprintf (stderr, "Abstract socket namespace bind() failed: %s\n", 
--                strerror (errno));
--       exit (1);
--    }
--  else 
--    exit (0);
--]])],
--              [have_abstract_sockets=yes],
--              [have_abstract_sockets=no])
--AC_LANG_POP(C)
--AC_MSG_RESULT($have_abstract_sockets)
--
- if test x$enable_abstract_sockets = xyes; then
-     if test x$have_abstract_sockets = xno; then
- 	AC_MSG_ERROR([Abstract sockets explicitly required, and support not detected.])
-diff -ur dbus-glib-0.72/dbus/Makefile.in dbus-glib-0.72-patched/dbus/Makefile.in
---- dbus-glib-0.72/dbus/Makefile.in	2006-10-25 16:14:31.000000000 -0500
-+++ dbus-glib-0.72-patched/dbus/Makefile.in	2006-11-15 14:15:09.000000000 -0600
-@@ -303,7 +303,7 @@
- target_cpu = @target_cpu@
- target_os = @target_os@
- target_vendor = @target_vendor@
--SUBDIRS = . examples
-+SUBDIRS = .
- INCLUDES = \
- 	-I$(top_srcdir)						\
- 	-I$(top_builddir)					\
-@@ -371,7 +371,7 @@
- 	dbus-glib-tool.h			\
- 	dbus-glib-tool.c
- 
--dbus_binding_tool_LDADD = libdbus-gtool.la libdbus-glib-1.la $(DBUS_LIBS) $(DBUS_GLIB_LIBS) -lexpat
-+dbus_binding_tool_LDADD = libdbus-gtool.la libdbus-glib-1.la $(DBUS_LIBS) $(DBUS_GLIB_LIBS) $(DBUS_BUS_LIBS)
- EXTRA_DIST = dbus-gmarshal.list make-dbus-glib-error-switch.sh make-dbus-glib-error-enum.sh
- @DBUS_BUILD_TESTS_TRUE at TESTS_ENVIRONMENT = DBUS_TEST_DATA=$(top_builddir)/test/data DBUS_TEST_HOMEDIR=$(top_builddir)/dbus
- 
-diff -ur dbus-glib-0.72/Makefile.in dbus-glib-0.72-patched/Makefile.in
---- dbus-glib-0.72/Makefile.in	2006-10-25 16:14:33.000000000 -0500
-+++ dbus-glib-0.72-patched/Makefile.in	2006-11-15 14:15:28.000000000 -0600
-@@ -277,7 +277,7 @@
- target_os = @target_os@
- target_vendor = @target_vendor@
- GLIB_PC = dbus-glib-1.pc
--SUBDIRS = dbus tools test doc
-+SUBDIRS = dbus
- DIST_SUBDIRS = dbus tools test doc m4
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = $(GLIB_PC)

Added: trunk/buildroot/package/dbus-glib/dbus-glib-dbus-binding-tool.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-dbus-binding-tool.patch	                        (rev 0)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-dbus-binding-tool.patch	2009-03-17 13:48:47 UTC (rev 25706)
@@ -0,0 +1,140 @@
+[PATCH]: add --with-dbus-binding-tool option to use an external dbus-binding-tool
+
+Cross compilation fix. dbus-binding-tool needs to run on the host, but gets
+compiled for the target. Add an option to use an external program
+(host version) instead.
+
+Based on similar patch in ptxdist.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure.ac                           |    5 +++++
+ dbus/examples/Makefile.am              |    4 ++--
+ dbus/examples/statemachine/Makefile.am |    4 ++--
+ test/core/Makefile.am                  |    6 +++---
+ test/interfaces/Makefile.am            |   12 ++++++------
+ tools/Makefile.am                      |    2 +-
+ 6 files changed, 19 insertions(+), 14 deletions(-)
+
+Index: dbus-glib-0.80/configure.ac
+===================================================================
+--- dbus-glib-0.80.orig/configure.ac
++++ dbus-glib-0.80/configure.ac
+@@ -70,6 +70,11 @@
+     AC_DEFINE(DBUS_ENABLE_VERBOSE_MODE,1,[Support a verbose mode])
+ fi
+ 
++AC_ARG_WITH(dbus-binding-tool,
++  AS_HELP_STRING([--with-dbus-binding-tool=[filename]],[Use external dbus-binding-tool program]),
++  [DBUS_BINDING_TOOL=$withval],[DBUS_BINDING_TOOL=\$\(top_builddir\)/dbus/dbus-binding-tool])
++AC_SUBST(DBUS_BINDING_TOOL)
++
+ 
+ dnl DBUS_BUILD_TESTS controls unit tests built in to .c files 
+ dnl and also some stuff in the test/ subdir
+Index: dbus-glib-0.80/dbus/examples/Makefile.am
+===================================================================
+--- dbus-glib-0.80.orig/dbus/examples/Makefile.am
++++ dbus-glib-0.80/dbus/examples/Makefile.am
+@@ -21,7 +21,7 @@
+ BUILT_SOURCES = example-service-glue.h
+ 
+ example-service-glue.h: example-service.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=some_object --mode=glib-server --output=example-service-glue.h $(srcdir)/example-service.xml
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=some_object --mode=glib-server --output=example-service-glue.h $(srcdir)/example-service.xml
+ 
+ 
+ ## Makefile.am bits for another client/server pair
+@@ -37,7 +37,7 @@
+ BUILT_SOURCES += example-signal-emitter-glue.h
+ 
+ example-signal-emitter-glue.h: example-signal-emitter.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=test_object --mode=glib-server --output=example-signal-emitter-glue.h $(srcdir)/example-signal-emitter.xml
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=test_object --mode=glib-server --output=example-signal-emitter-glue.h $(srcdir)/example-signal-emitter.xml
+ 
+ CLEANFILES = $(BUILT_SOURCES)
+ 
+Index: dbus-glib-0.80/dbus/examples/statemachine/Makefile.am
+===================================================================
+--- dbus-glib-0.80.orig/dbus/examples/statemachine/Makefile.am
++++ dbus-glib-0.80/dbus/examples/statemachine/Makefile.am
+@@ -26,10 +26,10 @@
+ BUILT_SOURCES = statemachine-server-glue.h statemachine-glue.h
+ 
+ statemachine-server-glue.h: statemachine-server.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=sm_server --mode=glib-server --output=$@ $<
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=sm_server --mode=glib-server --output=$@ $<
+ 
+ statemachine-glue.h: statemachine.xml
+-	$(LIBTOOL) --mode=execute $(top_builddir)/dbus/dbus-binding-tool --prefix=sm_object --mode=glib-server --output=$@ $<
++	$(LIBTOOL) --mode=execute $(DBUS_BINDING_TOOL) --prefix=sm_object --mode=glib-server --output=$@ $<
+ 
+ sm-marshal.c: Makefile sm-marshal.list
+ 	@GLIB_GENMARSHAL@ --prefix=sm_marshal $(srcdir)/sm-marshal.list --header --body > $@.tmp && mv $@.tmp $@
+Index: dbus-glib-0.80/test/core/Makefile.am
+===================================================================
+--- dbus-glib-0.80.orig/test/core/Makefile.am
++++ dbus-glib-0.80/test/core/Makefile.am
+@@ -63,13 +63,13 @@
+ test_service_glib_LDADD= $(top_builddir)/dbus/libdbus-glib-1.la $(DBUS_GLIB_THREADS_LIBS) 
+ 
+ test-service-glib-glue.h: test-service-glib.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(DEBUG) $(top_builddir)/dbus/dbus-binding-tool --prefix=my_object --mode=glib-server --output=test-service-glib-glue.h $(srcdir)/test-service-glib.xml
++	$(DEBUG) $(DBUS_BINDING_TOOL) --prefix=my_object --mode=glib-server --output=test-service-glib-glue.h $(srcdir)/test-service-glib.xml
+ 
+ test-service-glib-subclass-glue.h: test-service-glib-subclass.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(DEBUG) $(top_builddir)/dbus/dbus-binding-tool --prefix=my_object_subclass --mode=glib-server --output=test-service-glib-subclass-glue.h $(srcdir)/test-service-glib-subclass.xml
++	$(DEBUG) $(DBUS_BINDING_TOOL) --prefix=my_object_subclass --mode=glib-server --output=test-service-glib-subclass-glue.h $(srcdir)/test-service-glib-subclass.xml
+ 
+ test-service-glib-bindings.h: test-service-glib.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(DEBUG) $(top_builddir)/dbus/dbus-binding-tool --prefix=my_object --mode=glib-client --output=test-service-glib-bindings.h $(srcdir)/test-service-glib.xml
++	$(DEBUG) $(DBUS_BINDING_TOOL) --prefix=my_object --mode=glib-client --output=test-service-glib-bindings.h $(srcdir)/test-service-glib.xml
+ 
+ my-object-marshal.c: Makefile my-object-marshal.list
+ 	@GLIB_GENMARSHAL@ --prefix=my_object_marshal $(srcdir)/my-object-marshal.list --header --body > my-object-marshal.c
+Index: dbus-glib-0.80/test/interfaces/Makefile.am
+===================================================================
+--- dbus-glib-0.80.orig/test/interfaces/Makefile.am
++++ dbus-glib-0.80/test/interfaces/Makefile.am
+@@ -47,22 +47,22 @@
+ 	test-goodbye-bindings.h
+ 
+ test-song-glue.h: test-song.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_song --mode=glib-server --output=test-song-glue.h $(srcdir)/test-song.xml
++	$(DBUS_BINDING_TOOL) --prefix=test_song --mode=glib-server --output=test-song-glue.h $(srcdir)/test-song.xml
+ 
+ test-song-bindings.h: test-song.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_song --mode=glib-client --output=test-song-bindings.h $(srcdir)/test-song.xml
++	$(DBUS_BINDING_TOOL) --prefix=test_song --mode=glib-client --output=test-song-bindings.h $(srcdir)/test-song.xml
+ 
+ test-hello-glue.h: test-hello.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_hello --mode=glib-server --output=test-hello-glue.h $(srcdir)/test-hello.xml
++	$(DBUS_BINDING_TOOL) --prefix=test_hello --mode=glib-server --output=test-hello-glue.h $(srcdir)/test-hello.xml
+ 
+ test-hello-bindings.h: test-hello.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_hello --mode=glib-client --output=test-hello-bindings.h $(srcdir)/test-hello.xml
++	$(DBUS_BINDING_TOOL) --prefix=test_hello --mode=glib-client --output=test-hello-bindings.h $(srcdir)/test-hello.xml
+ 
+ test-goodbye-glue.h: test-goodbye.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_goodbye --mode=glib-server --output=test-goodbye-glue.h $(srcdir)/test-goodbye.xml
++	$(DBUS_BINDING_TOOL) --prefix=test_goodbye --mode=glib-server --output=test-goodbye-glue.h $(srcdir)/test-goodbye.xml
+ 
+ test-goodbye-bindings.h: test-goodbye.xml $(top_builddir)/dbus/dbus-binding-tool
+-	$(top_builddir)/dbus/dbus-binding-tool --prefix=test_goodbye --mode=glib-client --output=test-goodbye-bindings.h $(srcdir)/test-goodbye.xml
++	$(DBUS_BINDING_TOOL) --prefix=test_goodbye --mode=glib-client --output=test-goodbye-bindings.h $(srcdir)/test-goodbye.xml
+ 
+ 
+ CLEANFILES = \
+Index: dbus-glib-0.80/tools/Makefile.am
+===================================================================
+--- dbus-glib-0.80.orig/tools/Makefile.am
++++ dbus-glib-0.80/tools/Makefile.am
+@@ -4,7 +4,7 @@
+ libdbus_glibdir = $(includedir)/dbus-1.0/dbus
+ 
+ dbus-glib-bindings.h: dbus-bus-introspect.xml $(top_builddir)/dbus/dbus-binding-tool$(EXEEXT)
+-	$(top_builddir)/dbus/dbus-binding-tool --mode=glib-client --prefix=dbus_bus --output=dbus-glib-bindings.h dbus-bus-introspect.xml
++	$(DBUS_BINDING_TOOL) --mode=glib-client --prefix=dbus_bus --output=dbus-glib-bindings.h dbus-bus-introspect.xml
+ 
+ BUILT_SOURCES = dbus-glib-bindings.h dbus-bus-introspect.xml
+ 

Deleted: trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch	2009-03-17 13:48:35 UTC (rev 25705)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch	2009-03-17 13:48:47 UTC (rev 25706)
@@ -1,12 +0,0 @@
-diff -ur dbus-glib-0.72/dbus/Makefile.in dbus-glib-0.72-patched/dbus/Makefile.in
---- dbus-glib-0.72/dbus/Makefile.in	2006-10-25 16:14:31.000000000 -0500
-+++ dbus-glib-0.72-patched/dbus/Makefile.in	2007-01-17 08:37:22.000000000 -0600
-@@ -493,7 +493,7 @@
- 	done
- dbus-binding-tool$(EXEEXT): $(dbus_binding_tool_OBJECTS) $(dbus_binding_tool_DEPENDENCIES) 
- 	@rm -f dbus-binding-tool$(EXEEXT)
--	$(LINK) $(dbus_binding_tool_LDFLAGS) $(dbus_binding_tool_OBJECTS) $(dbus_binding_tool_LDADD) $(LIBS)
-+	$(LINK) $(dbus_binding_tool_LDFLAGS) $(dbus_binding_tool_OBJECTS) $(dbus_binding_tool_LDADD) $(LIBS) $(INTLLIBS)
- dbus-glib-test$(EXEEXT): $(dbus_glib_test_OBJECTS) $(dbus_glib_test_DEPENDENCIES) 
- 	@rm -f dbus-glib-test$(EXEEXT)
- 	$(LINK) $(dbus_glib_test_LDFLAGS) $(dbus_glib_test_OBJECTS) $(dbus_glib_test_LDADD) $(LIBS)

Modified: trunk/buildroot/package/dbus-glib/dbus-glib.mk
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-17 13:48:35 UTC (rev 25705)
+++ trunk/buildroot/package/dbus-glib/dbus-glib.mk	2009-03-17 13:48:47 UTC (rev 25706)
@@ -3,78 +3,71 @@
 # dbus-glib
 #
 #############################################################
-DBUS_GLIB_VERSION:=0.72
-DBUS_GLIB_SOURCE:=dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
-DBUS_GLIB_SITE:=http://dbus.freedesktop.org/releases/dbus-glib/
-DBUS_GLIB_DIR:=$(BUILD_DIR)/dbus-glib-$(DBUS_GLIB_VERSION)
-DBUS_GLIB_CAT:=$(ZCAT)
-DBUS_GLIB_BINARY:=dbus/.libs/dbus-binding-tool
-DBUS_GLIB_TARGET_BINARY:=usr/bin/dbus-binding-tool
+DBUS_GLIB_VERSION = 0.80
+DBUS_GLIB_SOURCE = dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
+DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib/
+DBUS_GLIB_INSTALL_STAGING = YES
+DBUS_GLIB_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(DBUS_GLIB_SOURCE):
-	$(call DOWNLOAD,$(DBUS_GLIB_SITE),$(DBUS_GLIB_SOURCE))
+DBUS_GLIB_CONF_ENV = ac_cv_have_abstract_sockets=yes \
+		ac_cv_func_posix_getpwnam_r=yes \
+		have_abstract_sockets=yes
 
-dbus-glib-source: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
+DBUS_GLIB_CONF_OPT = --localstatedir=/var \
+		--program-prefix="" \
+		--disable-tests \
+		--disable-xml-docs \
+		--with-introspect-xml=$(DBUS_HOST_INTROSPECT) \
+		--with-dbus-binding-tool=$(DBUS_GLIB_HOST_BINARY) \
+		--disable-bash-completion \
+		--disable-doxygen-docs \
+		--enable-asserts=yes
 
-$(DBUS_GLIB_DIR)/.unpacked: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
-	$(DBUS_GLIB_CAT) $(DL_DIR)/$(DBUS_GLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DBUS_GLIB_DIR) package/dbus-glib/ \*.patch
-	touch $(DBUS_GLIB_DIR)/.unpacked
+DBUS_GLIB_DEPENDENCIES = uclibc pkgconfig dbus host-dbus host-dbus-glib libglib2
 
-$(DBUS_GLIB_DIR)/.configured: $(DBUS_GLIB_DIR)/.unpacked
-	(cd $(DBUS_GLIB_DIR); rm -rf config.cache; autoconf; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_have_abstract_sockets=yes \
-		ac_cv_func_posix_getpwnam_r=yes \
-		have_abstract_sockets=yes \
-		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
-		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
-		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
-		DBUS_GLIB_LIBS="$(STAGING_DIR)/usr/lib/libglib-2.0.so $(STAGING_DIR)/usr/lib/libgobject-2.0.so $(STAGING_DIR)/usr/lib/libgmodule-2.0.so $(STAGING_DIR)/usr/lib/libgthread-2.0.so" \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--localstatedir=/var \
-		--program-prefix="" \
+$(eval $(call AUTOTARGETS,package,dbus-glib))
+
+# dbus-glib for the host
+DBUS_GLIB_HOST_DIR:=$(BUILD_DIR)/dbus-glib-$(DBUS_GLIB_VERSION)-host
+DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
+
+$(DBUS_GLIB_HOST_DIR)/.unpacked: $(DL_DIR)/$(DBUS_GLIB_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(DBUS_GLIB_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(DBUS_GLIB_HOST_DIR)/.configured: $(DBUS_GLIB_HOST_DIR)/.unpacked $(EXPAT_HOST_BINARY)
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
 		--disable-tests \
 		--disable-xml-docs \
+		--disable-bash-completion \
 		--disable-doxygen-docs \
 		--enable-asserts=yes \
 	)
-	touch $(DBUS_GLIB_DIR)/.configured
+	touch $@
 
-$(DBUS_GLIB_DIR)/$(DBUS_GLIB_BINARY): $(DBUS_GLIB_DIR)/.configured
-	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so" -C $(DBUS_GLIB_DIR) all
+$(DBUS_GLIB_HOST_DIR)/.compiled: $(DBUS_GLIB_HOST_DIR)/.configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	touch $@
 
-$(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0: $(DBUS_GLIB_DIR)/$(DBUS_GLIB_BINARY)
-	cp -a $(DBUS_GLIB_DIR)/dbus-glib-1.pc $(STAGING_DIR)/usr/lib/pkgconfig
-	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so* $(STAGING_DIR)/usr/lib
-	-touch -c $(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
+$(DBUS_GLIB_HOST_BINARY): $(DBUS_GLIB_HOST_DIR)/.compiled
+	$(MAKE) -C $(<D) install
 
-$(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
-	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/libdbus-glib-1.so.2* $(TARGET_DIR)/usr/lib
-	cp -a $(DBUS_GLIB_DIR)/dbus/.libs/dbus-binding-tool $(TARGET_DIR)/usr/bin
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2.0.0
+host-dbus-glib: $(DBUS_GLIB_HOST_BINARY)
 
-dbus-glib: uclibc pkgconfig dbus expat libglib2 $(TARGET_DIR)/$(DBUS_GLIB_TARGET_BINARY)
+host-dbus-glib-source: dbus-glib-source
 
-dbus-glib-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libdbus-glib-1.so.2*
-	rm -f $(TARGET_DIR)/usr/bin/dbus-binding-tool
-	rm -f $(STAGING_DIR)/usr/lib/libdbus-glib-1.so*
-	-$(MAKE) -C $(DBUS_GLIB_DIR) clean
+host-dbus-glib-clean:
+	rm -f $(addprefix $(DBUS_GLIB_HOST_DIR)/,.unpacked .configured .compiled)
+	$(MAKE) -C $(DBUS_GLIB_HOST_DIR) uninstall
+	$(MAKE) -C $(DBUS_GLIB_HOST_DIR) clean
 
-dbus-glib-dirclean:
-	rm -rf $(DBUS_GLIB_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DBUS_GLIB),y)
-TARGETS+=dbus-glib
-endif
+host-dbus-glib-dirclean:
+	rm -rf $(DBUS_GLIB_HOST_DIR)
