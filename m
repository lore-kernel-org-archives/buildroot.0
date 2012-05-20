From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 May 2012 00:04:16 +0200
Subject: [Buildroot] [git commit] connmann: fix build on uClibc without
	backtrace support
Message-ID: <20120531113259.6AB0C96E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40de828d3cbf767b4e272eef4eafb0b320bba283
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/connman/connman-uclibc-backtrace.patch |   44 ++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/connman/connman-uclibc-backtrace.patch b/package/connman/connman-uclibc-backtrace.patch
new file mode 100644
index 0000000..4b806c6
--- /dev/null
+++ b/package/connman/connman-uclibc-backtrace.patch
@@ -0,0 +1,44 @@
+[PATCH] fix build on uClibc without UCLIBC_HAS_BACKTRACE
+
+Backtrace support is only used for logging on signal errors, which
+isn't really critical, so simply remove backtrace info if not
+available in uClibc.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/log.c |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+Index: connman-0.78/src/log.c
+===================================================================
+--- connman-0.78.orig/src/log.c
++++ connman-0.78/src/log.c
+@@ -30,7 +30,12 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <syslog.h>
++#include <features.h>
++/* backtrace support is optional on uClibc */
++#if !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
++#define HAVE_BACKTRACE
+ #include <execinfo.h>
++#endif
+ #include <dlfcn.h>
+ 
+ #include "connman.h"
+@@ -112,6 +117,7 @@
+ 
+ static void print_backtrace(unsigned int offset)
+ {
++#ifdef HAVE_BACKTRACE
+ 	void *frames[99];
+ 	size_t n_ptrs;
+ 	unsigned int i;
+@@ -210,6 +216,7 @@
+ 
+ 	close(outfd[1]);
+ 	close(infd[0]);
++#endif /* HAVE_BACKTRACE */
+ }
+ 
+ static void signal_handler(int signo)
