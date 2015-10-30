From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 30 Oct 2015 19:49:45 +0100
Subject: [Buildroot] [PATCH 1/1] ofono: bump to version 1.17
Message-ID: <1446230985-12935-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated patch with uClibc support - merge with upstream support
for musl.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ofono/0001-uclibc-backtrace.patch | 55 +++++++++++++++++--------------
 package/ofono/ofono.hash                  |  2 +-
 package/ofono/ofono.mk                    |  2 +-
 3 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/package/ofono/0001-uclibc-backtrace.patch b/package/ofono/0001-uclibc-backtrace.patch
index 8499bcf..3ce7bf8 100644
--- a/package/ofono/0001-uclibc-backtrace.patch
+++ b/package/ofono/0001-uclibc-backtrace.patch
@@ -4,41 +4,46 @@ Backtrace support is only used for logging on signal errors, which
 isn't really critical, so simply remove backtrace info if not
 available in uClibc.
 
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/log.c |    7 +++++++
- 1 file changed, 7 insertions(+)
+NOTE: based on patch from Peter Korsgaard <jacmet@sunsite.dk>
 
-Index: ofono-1.5/src/log.c
-===================================================================
---- ofono-1.5.orig/src/log.c
-+++ ofono-1.5/src/log.c
-@@ -30,7 +30,12 @@
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+--- ofono-1.7.orig/src/log.c
++++ ofono-1.7/src/log.c
+@@ -30,7 +30,8 @@
  #include <stdlib.h>
  #include <string.h>
  #include <syslog.h>
-+#include <features.h>
-+/* backtrace support is optional on uClibc */
-+#if !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
 +#define HAVE_BACKTRACE
  #include <execinfo.h>
-+#endif
+ #endif
  #include <dlfcn.h>
+@@ -115,7 +116,7 @@
+	va_end(ap);
+ }
  
- #include "ofono.h"
-@@ -115,6 +120,7 @@
- 
+-#ifdef __GLIBC__
++#ifdef HAVE_BACKTRACE
  static void print_backtrace(unsigned int offset)
  {
-+#ifdef HAVE_BACKTRACE
  	void *frames[99];
- 	size_t n_ptrs;
- 	unsigned int i;
-@@ -213,6 +219,7 @@
+@@ -309,7 +310,7 @@
+	if (detach == FALSE)
+		option |= LOG_PERROR;
  
- 	close(outfd[1]);
- 	close(infd[0]);
-+#endif /* HAVE_BACKTRACE */
- }
+-#ifdef __GLIBC__
++#ifdef HAVE_BACKTRACE
+	signal_setup(signal_handler);
+ #endif
+
+@@ -326,7 +327,7 @@
+
+	closelog();
+
+-#ifdef __GLIBC__
++#ifdef HAVE_BACKTRACE
+	signal_setup(SIG_DFL);
+ #endif
  
- static void signal_handler(int signo)
diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index e83ce1a..50c92ed 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256	403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07  ofono-1.16.tar.xz
+sha256	cbf20f07fd15253c682b23c1786d517f505c3688f7c4ea93da777e1523b89635  ofono-1.17.tar.xz
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 7899750..588c9cd 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.16
+OFONO_VERSION = 1.17
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
-- 
1.8.0
