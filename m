From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:02:48 +0200
Subject: [Buildroot] [git commit branch/next] logrotate: bump version to
	3.10.0
Message-ID: <20160819210424.7391681D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec9825e38ed0f56b66f9c11f432cab7487a0f5cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: add 0002-Use-autoconf-checks-for-strndup-and-asprintf.patch,
needed for gcc 6.x build.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-autoconf-checks-for-strndup-and-asprintf.patch | 61 ++++++++++++++++++++++
 package/logrotate/logrotate.hash                   |  2 +-
 package/logrotate/logrotate.mk                     |  2 +-
 3 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch b/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch
new file mode 100644
index 0000000..14efc1d
--- /dev/null
+++ b/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch
@@ -0,0 +1,61 @@
+From e626f4ca5169036a0042e55e58aca2bb5cc19ad7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 19 Aug 2016 22:39:17 +0200
+Subject: [PATCH] Use autoconf checks for strndup and asprintf
+
+The current code in config.c can provide its own implementation of
+asprintf() and strndup() if not provided by the system. However, in
+order to decide if they should be provided, the check done is:
+
+ #if !defined(name_of_function)
+
+which only works if the function is actually defined as a macro, which
+is not necessarily the case.
+
+Therefore, we replace this logic by a proper AC_CHECK_FUNCS() check in
+the configure script.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ config.c     | 4 ++--
+ configure.ac | 2 ++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/config.c b/config.c
+index 8731348..8741e48 100644
+--- a/config.c
++++ b/config.c
+@@ -45,7 +45,7 @@
+ #include "asprintf.c"
+ #endif
+ 
+-#if !defined(asprintf) && !defined(_FORTIFY_SOURCE)
++#if !defined(HAVE_ASPRINTF) && !defined(_FORTIFY_SOURCE)
+ #include <stdarg.h>
+ 
+ int asprintf(char **string_ptr, const char *format, ...)
+@@ -78,7 +78,7 @@ int asprintf(char **string_ptr, const char *format, ...)
+ 
+ #endif
+ 
+-#if !defined(strndup)
++#if !defined(HAVE_STRNDUP)
+ char *strndup(const char *s, size_t n)
+ {
+        size_t nAvail;
+diff --git a/configure.ac b/configure.ac
+index 5c83d20..51da52a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -18,6 +18,8 @@ AC_SYS_LARGEFILE
+ AC_CHECK_LIB([popt],[poptParseArgvString],,
+   AC_MSG_ERROR([libpopt required but not found]))
+ 
++AC_CHECK_FUNCS([strndup asprintf])
++
+ dnl Needed for out-of-source builds
+ mkdir -p test
+ 
+-- 
+2.7.4
+
diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 77d4dc8..ee31f8e 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2de00c65e23fa9d7909cae6594e550b9abe9a7eb1553669ddeaca92d30f97009 logrotate-3.9.2.tar.gz
+sha256 db63b5932190cba941357c029b595a7fddf43539943aa1e0ca53a96136e4c5d9 logrotate-3.10.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index de4d837..96012c0 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.9.2
+LOGROTATE_VERSION = 3.10.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
