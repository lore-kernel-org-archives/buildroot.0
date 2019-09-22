From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:29 +0200
Subject: [Buildroot] [PATCH 13/30] package/audit: re-enable on musl
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-14-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport an upstream patch (which will be part of the next 3.0
release) that provides replacement functions for functions not
implemented in musl. This allows to re-enable audit on musl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tue-functions-for-strndupa-rawmemchr.patch | 133 ++++++++++++++++++
 package/audit/Config.in                       |   6 +-
 package/audit/audit.mk                        |   2 +
 3 files changed, 137 insertions(+), 4 deletions(-)
 create mode 100644 package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch

diff --git a/package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch b/package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
new file mode 100644
index 0000000000..ac292c57d1
--- /dev/null
+++ b/package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
@@ -0,0 +1,133 @@
+From c39a071e7c021f6ff3554aca2758e97b47a9777c Mon Sep 17 00:00:00 2001
+From: Steve Grubb <sgrubb@redhat.com>
+Date: Tue, 26 Feb 2019 18:33:33 -0500
+Subject: [PATCH] Add substitue functions for strndupa & rawmemchr
+
+(cherry picked from commit d579a08bb1cde71f939c13ac6b2261052ae9f77e)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ auparse/auparse.c   | 12 +++++++++++-
+ auparse/interpret.c |  9 ++++++++-
+ configure.ac        | 14 +++++++++++++-
+ src/ausearch-lol.c  | 12 +++++++++++-
+ 4 files changed, 43 insertions(+), 4 deletions(-)
+
+diff --git a/auparse/auparse.c b/auparse/auparse.c
+index 650db02..2e1c737 100644
+--- a/auparse/auparse.c
++++ b/auparse/auparse.c
+@@ -1,5 +1,5 @@
+ /* auparse.c --
+- * Copyright 2006-08,2012-17 Red Hat Inc., Durham, North Carolina.
++ * Copyright 2006-08,2012-19 Red Hat Inc., Durham, North Carolina.
+  * All Rights Reserved.
+  *
+  * This library is free software; you can redistribute it and/or
+@@ -1118,6 +1118,16 @@ static int str2event(char *s, au_event_t *e)
+ 	return 0;
+ }
+ 
++#ifndef HAVE_STRNDUPA
++static inline char *strndupa(const char *old, size_t n)
++{
++	size_t len = strnlen(old, n);
++	char *tmp = alloca(len + 1);
++	tmp[len] = 0;
++	return memcpy(tmp, old, len);
++}
++#endif
++
+ /* Returns 0 on success and 1 on error */
+ static int extract_timestamp(const char *b, au_event_t *e)
+ {
+diff --git a/auparse/interpret.c b/auparse/interpret.c
+index 51c4a5e..67b7b77 100644
+--- a/auparse/interpret.c
++++ b/auparse/interpret.c
+@@ -853,6 +853,13 @@ err_out:
+ 		return print_escaped(id->val);
+ }
+ 
++// rawmemchr is faster. Let's use it if we have it.
++#ifdef HAVE_RAWMEMCHR
++#define STRCHR rawmemchr
++#else
++#define STRCHR strchr
++#endif
++
+ static const char *print_proctitle(const char *val)
+ {
+ 	char *out = (char *)print_escaped(val);
+@@ -863,7 +870,7 @@ static const char *print_proctitle(const char *val)
+ 		// Proctitle has arguments separated by NUL bytes
+ 		// We need to write over the NUL bytes with a space
+ 		// so that we can see the arguments
+-		while ((ptr  = rawmemchr(ptr, '\0'))) {
++		while ((ptr  = STRCHR(ptr, '\0'))) {
+ 			if (ptr >= end)
+ 				break;
+ 			*ptr = ' ';
+diff --git a/configure.ac b/configure.ac
+index 6e345f1..6f3007e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,7 +1,7 @@
+ dnl
+ define([AC_INIT_NOTICE],
+ [### Generated automatically using autoconf version] AC_ACVERSION [
+-### Copyright 2005-18 Steve Grubb <sgrubb@redhat.com>
++### Copyright 2005-19 Steve Grubb <sgrubb@redhat.com>
+ ###
+ ### Permission is hereby granted, free of charge, to any person obtaining a
+ ### copy of this software and associated documentation files (the "Software"),
+@@ -72,6 +72,18 @@ dnl; posix_fallocate is used in audisp-remote
+ AC_CHECK_FUNCS([posix_fallocate])
+ dnl; signalfd is needed for libev
+ AC_CHECK_FUNC([signalfd], [], [ AC_MSG_ERROR([The signalfd system call is necessary for auditd]) ])
++dnl; check if rawmemchr is available
++AC_CHECK_FUNCS([rawmemchr])
++dnl; check if strndupa is available
++AC_LINK_IFELSE(
++  [AC_LANG_SOURCE(
++    [[
++      #define _GNU_SOURCE
++      #include <string.h>
++      int main() { (void) strndupa("test", 10); return 0; }]])],
++ [AC_DEFINE(HAVE_STRNDUPA, 1, [Let us know if we have it or not])],
++ []
++)
+ 
+ ALLWARNS=""
+ ALLDEBUG="-g"
+diff --git a/src/ausearch-lol.c b/src/ausearch-lol.c
+index 5d17a72..758c33e 100644
+--- a/src/ausearch-lol.c
++++ b/src/ausearch-lol.c
+@@ -1,6 +1,6 @@
+ /*
+ * ausearch-lol.c - linked list of linked lists library
+-* Copyright (c) 2008,2010,2014,2016 Red Hat Inc., Durham, North Carolina.
++* Copyright (c) 2008,2010,2014,2016,2019 Red Hat Inc., Durham, North Carolina.
+ * All Rights Reserved. 
+ *
+ * This software may be freely redistributed and/or modified under the
+@@ -152,6 +152,16 @@ static int compare_event_time(event *e1, event *e2)
+ 	return 0;
+ }
+ 
++#ifndef HAVE_STRNDUPA
++static inline char *strndupa(const char *old, size_t n)
++{
++	size_t len = strnlen(old, n);
++	char *tmp = alloca(len + 1);
++	tmp[len] = 0;
++	return memcpy(tmp, old, len);
++}
++#endif
++
+ /*
+  * This function will look at the line and pick out pieces of it.
+  */
+-- 
+2.21.0
+
diff --git a/package/audit/Config.in b/package/audit/Config.in
index 023ac79d30..6e5761533f 100644
--- a/package/audit/Config.in
+++ b/package/audit/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_AUDIT
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # strndupa()
 	help
 	  The audit package contains the user space utilities for
 	  storing and searching the audit records generated by
@@ -20,7 +19,6 @@ config BR2_PACKAGE_AUDIT
 
 	  http://people.redhat.com/sgrubb/audit/
 
-comment "audit needs a uClibc or glibc toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+comment "audit needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 31053fed99..1e05688f45 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -8,6 +8,8 @@ AUDIT_VERSION = 2.8.5
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
+# 0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
+AUDIT_AUTORECONF = YES
 
 AUDIT_INSTALL_STAGING = YES
 
-- 
2.21.0
