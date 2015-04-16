From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:08:02 +0200
Subject: [Buildroot] [git commit] json-c: bump version to
	json-c-0.12-20140410
Message-ID: <20150416061238.8D2338184F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=568a0ce49af90d30838073977f09b41aa9e36782
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also;
  -removed upstream patch
  -added patch to remove -Werror from make flags

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-don-t-threat-warnings-as-errors.patch     |   21 +++++++++
 package/json-c/0001-no-reentrant.patch             |   44 --------------------
 package/json-c/json-c.mk                           |    4 +-
 3 files changed, 24 insertions(+), 45 deletions(-)

diff --git a/package/json-c/0001-don-t-threat-warnings-as-errors.patch b/package/json-c/0001-don-t-threat-warnings-as-errors.patch
new file mode 100644
index 0000000..f18bf92
--- /dev/null
+++ b/package/json-c/0001-don-t-threat-warnings-as-errors.patch
@@ -0,0 +1,21 @@
+From e81a30a35107643323950ef6803eddebecb33344 Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@proximus.be>
+Date: Wed, 15 Apr 2015 00:40:46 +0200
+Subject: [PATCH 1/1] don't threat warnings as errors
+
+Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
+---
+ Makefile.am.inc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am.inc b/Makefile.am.inc
+index fec591b..61db1d2 100644
+--- a/Makefile.am.inc
++++ b/Makefile.am.inc
+@@ -1,2 +1,2 @@
+-AM_CFLAGS = -Wall -Werror -Wno-error=deprecated-declarations -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
++AM_CFLAGS = -Wall -Wno-error=deprecated-declarations -Wextra -Wwrite-strings -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
+ 
+-- 
+2.3.3
+
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
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index b8212ca..35243f1 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-JSON_C_VERSION = json-c-0.11-20130402
+JSON_C_VERSION = json-c-0.12-20140410
 JSON_C_SITE = $(call github,json-c,json-c,$(JSON_C_VERSION))
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPTS = --disable-oldname-compat
+# AUTORECONF is needed because of Makefile.am.inc patch.
+JSON_C_AUTORECONF = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
