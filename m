From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:10:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gamin
Message-ID: <20080306181026.452861201D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:10:25 -0800 (Thu, 06 Mar 2008)
New Revision: 21194

Log:
added gamin

Added:
   trunk/buildroot/package/gamin/
   trunk/buildroot/package/gamin/Config.in
   trunk/buildroot/package/gamin/gamin-0.1.9-configure.patch
   trunk/buildroot/package/gamin/gamin-0.1.9-debug.patch
   trunk/buildroot/package/gamin/gamin.mk


Changeset:
Added: trunk/buildroot/package/gamin/Config.in
===================================================================
--- trunk/buildroot/package/gamin/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gamin/Config.in	2008-03-06 18:10:25 UTC (rev 21194)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GAMIN
+	bool "gamin"
+	default n
+	help
+	  the File Alteration Monitor
+
+	  http://www.gnome.org/~veillard/gamin/sources

Added: trunk/buildroot/package/gamin/gamin-0.1.9-configure.patch
===================================================================
--- trunk/buildroot/package/gamin/gamin-0.1.9-configure.patch	                        (rev 0)
+++ trunk/buildroot/package/gamin/gamin-0.1.9-configure.patch	2008-03-06 18:10:25 UTC (rev 21194)
@@ -0,0 +1,92 @@
+--- a/configure	2007-07-27 10:27:34.000000000 -0400
++++ b/configure	2008-02-13 15:00:27.000000000 -0500
+@@ -23161,89 +23161,6 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS con
+ ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+-if test "$cross_compiling" = yes; then
+-  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&5
+-echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
+-else
+-  cat >conftest.$ac_ext <<_ACEOF
+-/* confdefs.h.  */
+-_ACEOF
+-cat confdefs.h >>conftest.$ac_ext
+-cat >>conftest.$ac_ext <<_ACEOF
+-/* end confdefs.h.  */
+-
+-#include <sys/types.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <stdio.h>
+-#include <sys/socket.h>
+-#include <sys/un.h>
+-#include <errno.h>
+-
+-int
+-main ()
+-{
+-
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
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-rm -f conftest$ac_exeext
+-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
+-  (eval $ac_link) 2>&5
+-  ac_status=$?
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
+-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+-  (eval $ac_try) 2>&5
+-  ac_status=$?
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); }; }; then
+-  have_abstract_sockets=yes
+-else
+-  echo "$as_me: program exited with status $ac_status" >&5
+-echo "$as_me: failed program was:" >&5
+-sed 's/^/| /' conftest.$ac_ext >&5
+-
+-( exit $ac_status )
+-have_abstract_sockets=no
+-fi
+-rm -f core *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+-fi
+-ac_ext=c
+-ac_cpp='$CPP $CPPFLAGS'
+-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+-ac_compiler_gnu=$ac_cv_c_compiler_gnu
+-
+ echo "$as_me:$LINENO: result: $have_abstract_sockets" >&5
+ echo "${ECHO_T}$have_abstract_sockets" >&6
+ 

Added: trunk/buildroot/package/gamin/gamin-0.1.9-debug.patch
===================================================================
--- trunk/buildroot/package/gamin/gamin-0.1.9-debug.patch	                        (rev 0)
+++ trunk/buildroot/package/gamin/gamin-0.1.9-debug.patch	2008-03-06 18:10:25 UTC (rev 21194)
@@ -0,0 +1,14 @@
+--- a/server/gam_poll_basic.c	2007-07-04 09:46:29.000000000 -0400
++++ b/server/gam_poll_basic.c	2008-02-13 15:04:57.000000000 -0500
+@@ -343,9 +343,9 @@ gam_poll_basic_poll_file(GamNode * node)
+ #ifdef VERBOSE_POLL
+ 		GAM_DEBUG(DEBUG_INFO, "Poll: poll_file %s unchanged\n", path);
+ #ifdef ST_MTIM_NSEC
+-		GAM_DEBUG(DEBUG_INFO, "%d %d : %d %d\n", node->sbuf.st_mtim.tv_sec, node->sbuf.st_mtim.tv_nsec, sbuf.st_mtim.tv_sec, sbuf.st_mtim.tv_nsec);
++//		GAM_DEBUG(DEBUG_INFO, "%d %d : %d %d\n", node->sbuf.st_mtim.tv_sec, node->sbuf.st_mtim.tv_nsec, sbuf.st_mtim.tv_sec, sbuf.st_mtim.tv_nsec);
+ #else
+-		GAM_DEBUG(DEBUG_INFO, "%d : %d\n", node->sbuf.st_mtime, sbuf.st_mtim.tv_nsec);
++//		GAM_DEBUG(DEBUG_INFO, "%d : %d\n", node->sbuf.st_mtime, sbuf.st_mtim.tv_nsec);
+ #endif /* ST_MTIM_NSEC */
+ #endif /* VERBOSE_POLL */
+ 	}

Added: trunk/buildroot/package/gamin/gamin.mk
===================================================================
--- trunk/buildroot/package/gamin/gamin.mk	                        (rev 0)
+++ trunk/buildroot/package/gamin/gamin.mk	2008-03-06 18:10:25 UTC (rev 21194)
@@ -0,0 +1,22 @@
+#############################################################
+#
+# gamin
+#
+#############################################################
+GAMIN_VERSION = 0.1.9
+GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
+GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
+GAMIN_AUTORECONF = NO
+GAMIN_INSTALL_STAGING = YES
+GAMIN_INSTALL_TARGET = YES
+
+GAMIN_CONF_OPT = --program-prefix=""
+
+GAMIN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+GAMIN_CONF_ENV = have_abstract_sockets=no
+
+GAMIN_DEPENDENCIES = uclibc libgtk2
+
+$(eval $(call AUTOTARGETS,package,gamin))
+
