From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 May 2011 14:07:16 +0200
Subject: [Buildroot] [git commit] gamin: autoreconf rather than patching
	configure
Message-ID: <20110503124040.D93E482BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8fa1a0ea7595935d3f02c9528c46f63f159961a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from openembedded.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gamin/gamin-0.1.10-configure.patch         |  103 --------------------
 .../gamin/gamin-0.1.10-no-abstract-sockets.patch   |   61 ++++++++++++
 package/gamin/gamin.mk                             |    3 +-
 3 files changed, 62 insertions(+), 105 deletions(-)
 delete mode 100644 package/gamin/gamin-0.1.10-configure.patch
 create mode 100644 package/gamin/gamin-0.1.10-no-abstract-sockets.patch

diff --git a/package/gamin/gamin-0.1.10-configure.patch b/package/gamin/gamin-0.1.10-configure.patch
deleted file mode 100644
index b4e4503..0000000
--- a/package/gamin/gamin-0.1.10-configure.patch
+++ /dev/null
@@ -1,103 +0,0 @@
---- a/configure.fixed	2009-08-02 18:00:54.000000000 +0200
-+++ b/configure	2008-11-24 16:23:27.000000000 +0100
-@@ -23581,100 +23581,6 @@
- ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
- ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
--if test "$cross_compiling" = yes; then
--  { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&5
--echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }
--else
--  cat >conftest.$ac_ext <<_ACEOF
--/* confdefs.h.  */
--_ACEOF
--cat confdefs.h >>conftest.$ac_ext
--cat >>conftest.$ac_ext <<_ACEOF
--/* end confdefs.h.  */
--
--#include <sys/types.h>
--#include <stdlib.h>
--#include <string.h>
--#include <stdio.h>
--#include <sys/socket.h>
--#include <sys/un.h>
--#include <errno.h>
--
--int
--main ()
--{
--
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
--
--  ;
--  return 0;
--}
--_ACEOF
--rm -f conftest$ac_exeext
--if { (ac_try="$ac_link"
--case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
--  (eval "$ac_link") 2>&5
--  ac_status=$?
--  echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
--  { (case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
--  (eval "$ac_try") 2>&5
--  ac_status=$?
--  echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); }; }; then
--  have_abstract_sockets=yes
--else
--  echo "$as_me: program exited with status $ac_status" >&5
--echo "$as_me: failed program was:" >&5
--sed 's/^/| /' conftest.$ac_ext >&5
--
--( exit $ac_status )
--have_abstract_sockets=no
--fi
--rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
--fi
--
--
--ac_ext=c
--ac_cpp='$CPP $CPPFLAGS'
--ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
--ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
--ac_compiler_gnu=$ac_cv_c_compiler_gnu
--
- { echo "$as_me:$LINENO: result: $have_abstract_sockets" >&5
- echo "${ECHO_T}$have_abstract_sockets" >&6; }
- 
diff --git a/package/gamin/gamin-0.1.10-no-abstract-sockets.patch b/package/gamin/gamin-0.1.10-no-abstract-sockets.patch
new file mode 100644
index 0000000..3d65901
--- /dev/null
+++ b/package/gamin/gamin-0.1.10-no-abstract-sockets.patch
@@ -0,0 +1,61 @@
+[PATCH]: Remove abstract socket namespace check breaking cross compilation
+
+Taken from openembedded:
+
+http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/gamin/files/no-abstract-sockets.patch
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+--- /tmp/configure.in	2007-04-30 13:08:49.000000000 +0200
++++ gamin-0.1.8/configure.in	2007-04-30 13:10:53.285251000 +0200
+@@ -354,51 +354,6 @@
+     AC_DEFINE(HAVE_CMSGCRED,1,[Have cmsgcred structure])
+ fi
+ 
+-#### Abstract sockets
+-
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
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index f0600b2..d691f60 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -6,9 +6,8 @@
 GAMIN_VERSION = 0.1.10
 GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
 GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
-GAMIN_AUTORECONF = NO
+GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
-GAMIN_INSTALL_TARGET = YES
 
 GAMIN_CONF_OPT = --program-prefix="" --disable-debug
 
-- 
1.7.3.4
