From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Tue, 14 Apr 2015 11:10:18 +0200
Subject: [Buildroot] [PATCH 1/1] json-c: bump version to json-c-0.12-20140410
Message-ID: <1429002618-22546-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

also:
- dropped upstream patch
- added hash file
- add patch to remove unused assignment yielding error.

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 package/json-c/0001-no-reentrant.patch             | 44 ----------------------
 package/json-c/0001-remove-unused-assignment.patch | 30 +++++++++++++++
 package/json-c/json-c.hash                         |  2 +
 package/json-c/json-c.mk                           |  2 +-
 4 files changed, 33 insertions(+), 45 deletions(-)
 delete mode 100644 package/json-c/0001-no-reentrant.patch
 create mode 100644 package/json-c/0001-remove-unused-assignment.patch
 create mode 100644 package/json-c/json-c.hash

diff --git a/package/json-c/0001-no-reentrant.patch b/package/json-c/0001-no-reentrant.patch
deleted file mode 100644
index b8ae6bb..0000000
--- a/package/json-c/0001-no-reentrant.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Do not pass -D_REENTRANT
-
-This flag is not needed to build this library, and prevents to build
-it with toolchains that don't have thread support.
-
-Since the Makefile.in change is a one-liner, we also do it in the
-patch to avoid having to autoreconfigure the package.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile.am.inc
-===================================================================
---- a/Makefile.am.inc
-+++ b/Makefile.am.inc
-@@ -1,2 +1,2 @@
--AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
-+AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE
- 
-Index: b/Makefile.in
-===================================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -274,7 +274,7 @@
- top_build_prefix = @top_build_prefix@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
-+AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE
- EXTRA_DIST = README.html README-WIN32.html config.h.win32 doc json-c.vcproj
- SUBDIRS = . tests
- lib_LTLIBRARIES = libjson-c.la $(am__append_1)
-Index: b/tests/Makefile.in
-===================================================================
---- a/tests/Makefile.in
-+++ b/tests/Makefile.in
-@@ -228,7 +228,7 @@
- top_build_prefix = @top_build_prefix@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
-+AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE
- LIBJSON_LA = $(top_builddir)/libjson-c.la
- test1_LDADD = $(LIBJSON_LA)
- test1Formatted_LDADD = $(LIBJSON_LA)
diff --git a/package/json-c/0001-remove-unused-assignment.patch b/package/json-c/0001-remove-unused-assignment.patch
new file mode 100644
index 0000000..369e89f
--- /dev/null
+++ b/package/json-c/0001-remove-unused-assignment.patch
@@ -0,0 +1,30 @@
+From 35087bf7775481fbb880d38cde03ea654474dfa1 Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@proximus.be>
+Date: Tue, 14 Apr 2015 10:43:05 +0200
+Subject: [PATCH 1/1] remove unused asignment
+
+Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
+---
+ json_tokener.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/json_tokener.c b/json_tokener.c
+index 19de8ef..9a76293 100644
+--- a/json_tokener.c
++++ b/json_tokener.c
+@@ -352,12 +352,10 @@ struct json_object* json_tokener_parse_ex(struct json_tokener *tok,
+ 
+     case json_tokener_state_inf: /* aka starts with 'i' */
+       {
+-	int size;
+ 	int size_inf;
+ 	int is_negative = 0;
+ 
+ 	printbuf_memappend_fast(tok->pb, &c, 1);
+-	size = json_min(tok->st_pos+1, json_null_str_len);
+ 	size_inf = json_min(tok->st_pos+1, json_inf_str_len);
+ 	char *infbuf = tok->pb->buf;
+ 	if (*infbuf == '-')
+-- 
+2.3.3
+
diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
new file mode 100644
index 0000000..a6f9a1f
--- /dev/null
+++ b/package/json-c/json-c.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	99304a4a633f1ee281d6a521155a182824dd995139d5ed6ee5c93093c281092b  json-c-json-c-0.12-20140410.tar.gz
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index b8212ca..780bf41 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_C_VERSION = json-c-0.11-20130402
+JSON_C_VERSION = json-c-0.12-20140410
 JSON_C_SITE = $(call github,json-c,json-c,$(JSON_C_VERSION))
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
-- 
2.3.3
