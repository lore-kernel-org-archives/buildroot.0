From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Dec 2015 12:34:27 +0100
Subject: [Buildroot] [PATCH] package/connman: cleanup backtrace patch
Message-ID: <1450956867-15532-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

connman uses execinfo.h to dump a backtrace in case of failure.
execinfo.h is optional in uClibc, so we had a patch that conditonally
disabled backtraces for uClibc when it was missing execinfo.h

However, musl is also entirely lacking execinfo.h.

Add a proper patch that checks for execinfo.h at ./configure time. This
will no longer make any assumption on the C library that is being used.

Fixes:
    http://autobuild.buildroot.org/results/f6e/f6ee8ab3a6300f1f527f9e92b8c2ec81e63afb27/
    http://autobuild.buildroot.org/results/96b/96b78bb644ed4ef3493782521b17e3b2113a405f/
    ...

Note that there might be other issues with musl; this patch only fiexes
the execinfo.h one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/connman/0001-conditional-backtrace.patch | 74 ++++++++++++++++++++++++
 package/connman/0001-uclibc-backtrace.patch      | 44 --------------
 2 files changed, 74 insertions(+), 44 deletions(-)
 create mode 100644 package/connman/0001-conditional-backtrace.patch
 delete mode 100644 package/connman/0001-uclibc-backtrace.patch

diff --git a/package/connman/0001-conditional-backtrace.patch b/package/connman/0001-conditional-backtrace.patch
new file mode 100644
index 0000000..231eda2
--- /dev/null
+++ b/package/connman/0001-conditional-backtrace.patch
@@ -0,0 +1,74 @@
+commit 13cfdf6b01651b0e3d07455ed69f5c328642982e
+Author: Yann E. MORIN <yann.morin.1998@free.fr>
+Date:   Thu Dec 24 12:04:57 2015 +0100
+
+    configure: check for execinfo.h
+    
+    Not all toolchains have execinfo.h. For example, support for it is
+    optional in uClibc, while it is entirely missing from musl.
+    
+    Add a check in configure to look for it.
+    
+    Since execinfo.h is /only/ used to dump a backtrace in case of failure,
+    just do nothing when execinfo.h is missing.
+    
+    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/Makefile.am b/Makefile.am
+index fb7c74e..ef02cf5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -210,7 +210,8 @@ AM_CFLAGS = @DBUS_CFLAGS@ @GLIB_CFLAGS@ @XTABLES_CFLAGS@ \
+ 				-DSCRIPTDIR=\""$(build_scriptdir)"\" \
+ 				-DSTORAGEDIR=\""$(storagedir)\"" \
+ 				-DVPN_STORAGEDIR=\""$(vpn_storagedir)\"" \
+-				-DCONFIGDIR=\""$(configdir)\""
++				-DCONFIGDIR=\""$(configdir)\"" \
++				-DHAVE_BACKTRACE=$(HAVE_BACKTRACE)
+ 
+ if VPN
+ AM_CPPFLAGS = -I$(builddir)/include -I$(srcdir)/gdbus
+diff --git a/configure.ac b/configure.ac
+index b51d6b3..87701d0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -182,6 +182,9 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
+ 		AC_MSG_ERROR(resolver library support is required))
+ ])
+ 
++AC_CHECK_HEADERS([execinfo.h],[HAVE_BACKTRACE=1], HAVE_BACKTRACE=0)
++AC_SUBST([HAVE_BACKTRACE])
++
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+ 			AC_MSG_ERROR(signalfd support is required))
+ 
+diff --git a/src/log.c b/src/log.c
+index a693bd0..69ab50e 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -30,7 +30,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <syslog.h>
++#if defined(HAVE_BACKTRACE) && HAVE_BACKTRACE == 1
+ #include <execinfo.h>
++#endif
+ #include <dlfcn.h>
+ 
+ #include "connman.h"
+@@ -112,6 +114,7 @@ void connman_debug(const char *format, ...)
+ 
+ static void print_backtrace(unsigned int offset)
+ {
++#if defined(HAVE_BACKTRACE) && HAVE_BACKTRACE == 1
+ 	void *frames[99];
+ 	size_t n_ptrs;
+ 	unsigned int i;
+@@ -210,6 +213,7 @@ static void print_backtrace(unsigned int offset)
+ 
+ 	close(outfd[1]);
+ 	close(infd[0]);
++#endif /* HAVE_BACKTRACE */
+ }
+ 
+ static void signal_handler(int signo)
diff --git a/package/connman/0001-uclibc-backtrace.patch b/package/connman/0001-uclibc-backtrace.patch
deleted file mode 100644
index 4b806c6..0000000
--- a/package/connman/0001-uclibc-backtrace.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-[PATCH] fix build on uClibc without UCLIBC_HAS_BACKTRACE
-
-Backtrace support is only used for logging on signal errors, which
-isn't really critical, so simply remove backtrace info if not
-available in uClibc.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/log.c |    7 +++++++
- 1 file changed, 7 insertions(+)
-
-Index: connman-0.78/src/log.c
-===================================================================
---- connman-0.78.orig/src/log.c
-+++ connman-0.78/src/log.c
-@@ -30,7 +30,12 @@
- #include <stdlib.h>
- #include <string.h>
- #include <syslog.h>
-+#include <features.h>
-+/* backtrace support is optional on uClibc */
-+#if !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
-+#define HAVE_BACKTRACE
- #include <execinfo.h>
-+#endif
- #include <dlfcn.h>
- 
- #include "connman.h"
-@@ -112,6 +117,7 @@
- 
- static void print_backtrace(unsigned int offset)
- {
-+#ifdef HAVE_BACKTRACE
- 	void *frames[99];
- 	size_t n_ptrs;
- 	unsigned int i;
-@@ -210,6 +216,7 @@
- 
- 	close(outfd[1]);
- 	close(infd[0]);
-+#endif /* HAVE_BACKTRACE */
- }
- 
- static void signal_handler(int signo)
-- 
1.9.1
