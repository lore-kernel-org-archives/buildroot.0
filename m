From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 22:55:24 +0200
Subject: [Buildroot] [git commit] logrotate: fix build with gcc 6
Message-ID: <20160819205534.E6B4482293@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f827fada63ccdcef848eade7c97572536b41677b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With gcc version 6, we get the following error when building logrotate:

  logrotate.c: In function 'postrotateSingleLog':
  logrotate.c:1784:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
       if (!state->doRotate)
       ^~
  logrotate.c:1787:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
    if (!hasErrors && log->flags & LOG_FLAG_TMPFILENAME) {
    ^~

This is fixed by grabbing an upstream commit,
6a36c105587b07ad14fc937f3ee6e2eb402621a2. Once this is fixed, we get:

  config.c: In function 'strndup':
  config.c:87:10: error: nonnull argument 's' compared to NULL [-Werror=nonnull-compare]
          if(!s)
            ^
  cc1: all warnings being treated as errors
  make[2]: *** [config.o] Error 1
  make[2]: *** Waiting for unfinished jobs....
  cc1: all warnings being treated as errors
  make[2]: *** [logrotate.o] Error 1

This is due to logrotate providing its own implementation of
strndup(). We could fix it, but it much better to simply use the one
provided by the C library, by fixing the detection method for strndup
availability. This is done in patch
0002-Use-autoconf-checks-for-strndup-and-asprintf.patch.

Fixes:

  http://autobuild.buildroot.net/results/6dc2eb22104076920d77425b1e608ef9b9e01c94/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: replace fix for the nonnull issue with a different one.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-autoconf-checks-for-strndup-and-asprintf.patch | 61 ++++++++++++++++++++++
 package/logrotate/logrotate.hash                   |  1 +
 package/logrotate/logrotate.mk                     |  1 +
 3 files changed, 63 insertions(+)

diff --git a/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch b/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch
new file mode 100644
index 0000000..ed32098
--- /dev/null
+++ b/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch
@@ -0,0 +1,61 @@
+From 24fd7f81f9966071717f6a0effe8190310f1b393 Mon Sep 17 00:00:00 2001
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
+index dbbf563..2209afd 100644
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
+index e655b85..73b98da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,6 +13,8 @@ AC_STRUCT_ST_BLOCKS
+ AC_CHECK_LIB([popt],[poptParseArgvString],,
+   AC_MSG_ERROR([libpopt required but not found]))
+ 
++AC_CHECK_FUNCS([strndup asprintf])
++
+ AC_ARG_WITH([selinux],
+   [AS_HELP_STRING([--with-selinux],
+     [support handling SELinux contexts (yes,no,check) @<:@default=check@:>@])],
+-- 
+2.7.4
+
diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 77d4dc8..8dee715 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 2de00c65e23fa9d7909cae6594e550b9abe9a7eb1553669ddeaca92d30f97009 logrotate-3.9.2.tar.gz
+sha256 e0d360908ac506e02f08fa1ad70e17d6985045d8640f383fef8f322886d6e1e1 6a36c105587b07ad14fc937f3ee6e2eb402621a2.patch
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index de4d837..38f183c 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -13,6 +13,7 @@ LOGROTATE_DEPENDENCIES = popt host-pkgconf
 LOGROTATE_AUTORECONF = YES
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 LOGROTATE_CONF_OPTS = --without-selinux
+LOGROTATE_PATCH = https://github.com/logrotate/logrotate/commit/6a36c105587b07ad14fc937f3ee6e2eb402621a2.patch
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 LOGROTATE_DEPENDENCIES += acl
