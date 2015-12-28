From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:52:53 +0100
Subject: [Buildroot] [git commit] package/connman: cleanup backtrace patch
Message-ID: <20151228165315.0C416822F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a5c841eaa37d61ffac1afee22e5637c4a70d954
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Note that there might be other issues with musl; this patch only fixes
the execinfo.h one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-configure-check-for-execinfo.h.patch      | 65 ++++++++++++++++++++++
 package/connman/0001-uclibc-backtrace.patch        | 44 ---------------
 2 files changed, 65 insertions(+), 44 deletions(-)

diff --git a/package/connman/0001-configure-check-for-execinfo.h.patch b/package/connman/0001-configure-check-for-execinfo.h.patch
new file mode 100644
index 0000000..384f41b
--- /dev/null
+++ b/package/connman/0001-configure-check-for-execinfo.h.patch
@@ -0,0 +1,65 @@
+From 30642d5b1a3f479987c4d50a237311d84d5f0581 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Thu, 24 Dec 2015 12:04:57 +0100
+Subject: [PATCH] configure: check for execinfo.h
+
+Not all toolchains have execinfo.h. For example, support for it is
+optional in uClibc, while it is entirely missing from musl.
+
+Add a check in configure to look for it.
+
+Since execinfo.h is /only/ used to dump a backtrace in case of failure,
+just do nothing when execinfo.h is missing.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.ac | 2 ++
+ src/log.c    | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index b51d6b3..28e657b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -182,6 +182,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
+ 		AC_MSG_ERROR(resolver library support is required))
+ ])
+ 
++AC_CHECK_HEADERS([execinfo.h])
++
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+ 			AC_MSG_ERROR(signalfd support is required))
+ 
+diff --git a/src/log.c b/src/log.c
+index a693bd0..76e10e7 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -30,7 +30,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <syslog.h>
++#if defined(HAVE_EXECINFO_H)
+ #include <execinfo.h>
++#endif
+ #include <dlfcn.h>
+ 
+ #include "connman.h"
+@@ -112,6 +114,7 @@ void connman_debug(const char *format, ...)
+ 
+ static void print_backtrace(unsigned int offset)
+ {
++#if defined(HAVE_EXECINFO_H)
+ 	void *frames[99];
+ 	size_t n_ptrs;
+ 	unsigned int i;
+@@ -210,6 +213,7 @@ static void print_backtrace(unsigned int offset)
+ 
+ 	close(outfd[1]);
+ 	close(infd[0]);
++#endif /* HAVE_EXECINFO_H */
+ }
+ 
+ static void signal_handler(int signo)
+-- 
+1.9.1
+
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
