From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 May 2012 09:52:55 +0200
Subject: [Buildroot] [git commit branch/next] ofono: fix build on uClibc
	without backtrace support
Message-ID: <20120529075858.CC52396E05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=749c5b40cdcac1cd5a8d74985d0bf9fdec8447f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Identical to connman patch as this code seems to be cut'n'pasted.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ofono/ofono-uclibc-backtrace.patch |   44 ++++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/ofono/ofono-uclibc-backtrace.patch b/package/ofono/ofono-uclibc-backtrace.patch
new file mode 100644
index 0000000..8499bcf
--- /dev/null
+++ b/package/ofono/ofono-uclibc-backtrace.patch
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
+Index: ofono-1.5/src/log.c
+===================================================================
+--- ofono-1.5.orig/src/log.c
++++ ofono-1.5/src/log.c
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
+ #include "ofono.h"
+@@ -115,6 +120,7 @@
+ 
+ static void print_backtrace(unsigned int offset)
+ {
++#ifdef HAVE_BACKTRACE
+ 	void *frames[99];
+ 	size_t n_ptrs;
+ 	unsigned int i;
+@@ -213,6 +219,7 @@
+ 
+ 	close(outfd[1]);
+ 	close(infd[0]);
++#endif /* HAVE_BACKTRACE */
+ }
+ 
+ static void signal_handler(int signo)
