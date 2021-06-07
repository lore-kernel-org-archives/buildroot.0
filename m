From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:18:31 -0000
Subject: [Buildroot] [git commit] package/audit: bump to version 3.0.1
Message-ID: <20210607144656.BE6F3814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaca5fa97198fa1836a477f2fb2e3ba5872a0be2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop all upstream patches as they no longer are applicable.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Matthew Weber <matthew.weber@collins.com>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Fix-audispd-path-in-auditd.conf.patch     |  32 -----
 ...ubstitue-functions-for-strndupa-rawmemchr.patch | 133 ---------------------
 ...nitions-need-to-be-external-when-building.patch |  28 -----
 package/audit/audit.hash                           |   6 +-
 package/audit/audit.mk                             |   2 +-
 5 files changed, 4 insertions(+), 197 deletions(-)

diff --git a/package/audit/0001-Fix-audispd-path-in-auditd.conf.patch b/package/audit/0001-Fix-audispd-path-in-auditd.conf.patch
deleted file mode 100644
index ccf45db911..0000000000
--- a/package/audit/0001-Fix-audispd-path-in-auditd.conf.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6e1fd09f7bc131c8f16d9cc43e2455ba4650c651 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.com.br>
-Date: Sat, 3 Nov 2018 08:25:58 -0300
-Subject: [PATCH] Fix audispd path in auditd.conf
-
-audispd is installed at /usr/sbin but the configuration file pointed
-to /sbin, causing auditd to fail on startup.
-
-This patch cannot be sent upstream because audispd does not exist
-anymore on the master branch (it was merged to auditd).
-
-Signed-off-by: Carlos Santos <casantos@datacom.com.br>
----
- init.d/auditd.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/init.d/auditd.conf b/init.d/auditd.conf
-index 4dcda83..998904f 100644
---- a/init.d/auditd.conf
-+++ b/init.d/auditd.conf
-@@ -13,7 +13,7 @@ max_log_file = 8
- num_logs = 5
- priority_boost = 4
- disp_qos = lossy
--dispatcher = /sbin/audispd
-+dispatcher = /usr/sbin/audispd
- name_format = NONE
- ##name = mydomain
- max_log_file_action = ROTATE
--- 
-2.17.1
-
diff --git a/package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch b/package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
deleted file mode 100644
index ac292c57d1..0000000000
--- a/package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From c39a071e7c021f6ff3554aca2758e97b47a9777c Mon Sep 17 00:00:00 2001
-From: Steve Grubb <sgrubb@redhat.com>
-Date: Tue, 26 Feb 2019 18:33:33 -0500
-Subject: [PATCH] Add substitue functions for strndupa & rawmemchr
-
-(cherry picked from commit d579a08bb1cde71f939c13ac6b2261052ae9f77e)
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- auparse/auparse.c   | 12 +++++++++++-
- auparse/interpret.c |  9 ++++++++-
- configure.ac        | 14 +++++++++++++-
- src/ausearch-lol.c  | 12 +++++++++++-
- 4 files changed, 43 insertions(+), 4 deletions(-)
-
-diff --git a/auparse/auparse.c b/auparse/auparse.c
-index 650db02..2e1c737 100644
---- a/auparse/auparse.c
-+++ b/auparse/auparse.c
-@@ -1,5 +1,5 @@
- /* auparse.c --
-- * Copyright 2006-08,2012-17 Red Hat Inc., Durham, North Carolina.
-+ * Copyright 2006-08,2012-19 Red Hat Inc., Durham, North Carolina.
-  * All Rights Reserved.
-  *
-  * This library is free software; you can redistribute it and/or
-@@ -1118,6 +1118,16 @@ static int str2event(char *s, au_event_t *e)
- 	return 0;
- }
- 
-+#ifndef HAVE_STRNDUPA
-+static inline char *strndupa(const char *old, size_t n)
-+{
-+	size_t len = strnlen(old, n);
-+	char *tmp = alloca(len + 1);
-+	tmp[len] = 0;
-+	return memcpy(tmp, old, len);
-+}
-+#endif
-+
- /* Returns 0 on success and 1 on error */
- static int extract_timestamp(const char *b, au_event_t *e)
- {
-diff --git a/auparse/interpret.c b/auparse/interpret.c
-index 51c4a5e..67b7b77 100644
---- a/auparse/interpret.c
-+++ b/auparse/interpret.c
-@@ -853,6 +853,13 @@ err_out:
- 		return print_escaped(id->val);
- }
- 
-+// rawmemchr is faster. Let's use it if we have it.
-+#ifdef HAVE_RAWMEMCHR
-+#define STRCHR rawmemchr
-+#else
-+#define STRCHR strchr
-+#endif
-+
- static const char *print_proctitle(const char *val)
- {
- 	char *out = (char *)print_escaped(val);
-@@ -863,7 +870,7 @@ static const char *print_proctitle(const char *val)
- 		// Proctitle has arguments separated by NUL bytes
- 		// We need to write over the NUL bytes with a space
- 		// so that we can see the arguments
--		while ((ptr  = rawmemchr(ptr, '\0'))) {
-+		while ((ptr  = STRCHR(ptr, '\0'))) {
- 			if (ptr >= end)
- 				break;
- 			*ptr = ' ';
-diff --git a/configure.ac b/configure.ac
-index 6e345f1..6f3007e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,7 +1,7 @@
- dnl
- define([AC_INIT_NOTICE],
- [### Generated automatically using autoconf version] AC_ACVERSION [
--### Copyright 2005-18 Steve Grubb <sgrubb@redhat.com>
-+### Copyright 2005-19 Steve Grubb <sgrubb@redhat.com>
- ###
- ### Permission is hereby granted, free of charge, to any person obtaining a
- ### copy of this software and associated documentation files (the "Software"),
-@@ -72,6 +72,18 @@ dnl; posix_fallocate is used in audisp-remote
- AC_CHECK_FUNCS([posix_fallocate])
- dnl; signalfd is needed for libev
- AC_CHECK_FUNC([signalfd], [], [ AC_MSG_ERROR([The signalfd system call is necessary for auditd]) ])
-+dnl; check if rawmemchr is available
-+AC_CHECK_FUNCS([rawmemchr])
-+dnl; check if strndupa is available
-+AC_LINK_IFELSE(
-+  [AC_LANG_SOURCE(
-+    [[
-+      #define _GNU_SOURCE
-+      #include <string.h>
-+      int main() { (void) strndupa("test", 10); return 0; }]])],
-+ [AC_DEFINE(HAVE_STRNDUPA, 1, [Let us know if we have it or not])],
-+ []
-+)
- 
- ALLWARNS=""
- ALLDEBUG="-g"
-diff --git a/src/ausearch-lol.c b/src/ausearch-lol.c
-index 5d17a72..758c33e 100644
---- a/src/ausearch-lol.c
-+++ b/src/ausearch-lol.c
-@@ -1,6 +1,6 @@
- /*
- * ausearch-lol.c - linked list of linked lists library
--* Copyright (c) 2008,2010,2014,2016 Red Hat Inc., Durham, North Carolina.
-+* Copyright (c) 2008,2010,2014,2016,2019 Red Hat Inc., Durham, North Carolina.
- * All Rights Reserved. 
- *
- * This software may be freely redistributed and/or modified under the
-@@ -152,6 +152,16 @@ static int compare_event_time(event *e1, event *e2)
- 	return 0;
- }
- 
-+#ifndef HAVE_STRNDUPA
-+static inline char *strndupa(const char *old, size_t n)
-+{
-+	size_t len = strnlen(old, n);
-+	char *tmp = alloca(len + 1);
-+	tmp[len] = 0;
-+	return memcpy(tmp, old, len);
-+}
-+#endif
-+
- /*
-  * This function will look at the line and pick out pieces of it.
-  */
--- 
-2.21.0
-
diff --git a/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
deleted file mode 100644
index 9a546261df..0000000000
--- a/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 017e6c6ab95df55f34e339d2139def83e5dada1f Mon Sep 17 00:00:00 2001
-From: Steve Grubb <sgrubb@redhat.com>
-Date: Fri, 10 Jan 2020 21:13:50 -0500
-Subject: [PATCH] Header definitions need to be external when building with
- -fno-common (which is default in GCC 10) - Tony Jones
-
-Patch taken from upstream: https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/ausearch-common.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ausearch-common.h b/src/ausearch-common.h
-index 6669203..3040547 100644
---- a/src/ausearch-common.h
-+++ b/src/ausearch-common.h
-@@ -50,7 +50,7 @@ extern pid_t event_pid;
- extern int event_exact_match;
- extern uid_t event_uid, event_euid, event_loginuid;
- extern const char *event_tuid, *event_teuid, *event_tauid;
--slist *event_node_list;
-+extern slist *event_node_list;
- extern const char *event_comm;
- extern const char *event_filename;
- extern const char *event_hostname;
--- 
-2.20.1
-
diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 71e7df7dbc..4ef9a42b0d 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256 0e5d4103646e00f8d1981e1cd2faea7a2ae28e854c31a803e907a383c5e2ecb7 audit-2.8.5.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
-sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
+sha256  994c4250d8fd43f3087a3c2ce73461832e30f1e9b278bf5bb03c3e07091155a5  audit-3.0.1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 05a16e6e31..df6650593d 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.8.5
+AUDIT_VERSION = 3.0.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
