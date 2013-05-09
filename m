From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 19:14:24 +0200
Subject: [Buildroot] [PATCH 1/2] json-c: bump to version 0.11
In-Reply-To: <1368119665-917-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368119665-917-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368119665-917-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping this package is needed, because json-c 0.10 has a major
defect: it installs a library named libjson.so, which conflicts with
the library installed by the libjson package.

This has been changed in the upstream json-c 0.11 version, which now
installs libjson-c and json-c.pc.

It allows to solve the Pulseaudio link problem, which wants to link
against json-c but happens to link against libjson when libjson has
been compiled and installed after json-c.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...n-c-add-missing-file-to-installed-headers.patch |   43 --------------------
 package/json-c/json-c-no-reentrant.patch           |   25 +++++++++---
 package/json-c/json-c.mk                           |    6 ++-
 3 files changed, 23 insertions(+), 51 deletions(-)
 delete mode 100644 package/json-c/json-c-add-missing-file-to-installed-headers.patch

diff --git a/package/json-c/json-c-add-missing-file-to-installed-headers.patch b/package/json-c/json-c-add-missing-file-to-installed-headers.patch
deleted file mode 100644
index 12ef855..0000000
--- a/package/json-c/json-c-add-missing-file-to-installed-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2ab6524ca0cfaab7feb42f7c328db8fca7b111fc Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Tue, 5 Mar 2013 21:59:11 -0800
-Subject: [PATCH] Add json_object_iterator.h to installed headers
-
-Backported from: 4154c55edae6f6b34d6ef4fcc331055fdf8e1a23
-
-In addition to original patch, applied the same change to Makefile.in
-to avoid having the package to be autoreconfigured.
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- Makefile.am |    1 +
- Makefile.in |    1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index d4a7bbb..8f09ca8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -17,6 +17,7 @@ libjsoninclude_HEADERS = \
- 	json_config.h \
- 	json_inttypes.h \
- 	json_object.h \
-+	json_object_iterator.h \
- 	json_object_private.h \
- 	json_tokener.h \
- 	json_util.h \
-diff --git a/Makefile.in b/Makefile.in
-index c06db3e..9d924cd 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -278,6 +278,7 @@ libjsoninclude_HEADERS = \
- 	json_config.h \
- 	json_inttypes.h \
- 	json_object.h \
-+	json_object_iterator.h \
- 	json_object_private.h \
- 	json_tokener.h \
- 	json_util.h \
--- 
-1.7.10.4
-
diff --git a/package/json-c/json-c-no-reentrant.patch b/package/json-c/json-c-no-reentrant.patch
index 31343c0..b8ae6bb 100644
--- a/package/json-c/json-c-no-reentrant.patch
+++ b/package/json-c/json-c-no-reentrant.patch
@@ -13,19 +13,32 @@ Index: b/Makefile.am.inc
 --- a/Makefile.am.inc
 +++ b/Makefile.am.inc
 @@ -1,2 +1,2 @@
--AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
-+AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE
+-AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
++AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE
  
 Index: b/Makefile.in
 ===================================================================
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -263,7 +263,7 @@
+@@ -274,7 +274,7 @@
  top_build_prefix = @top_build_prefix@
  top_builddir = @top_builddir@
  top_srcdir = @top_srcdir@
--AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
-+AM_CFLAGS = -Wall -Wwrite-strings -Werror -std=gnu99 -D_GNU_SOURCE
+-AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
++AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE
  EXTRA_DIST = README.html README-WIN32.html config.h.win32 doc json-c.vcproj
  SUBDIRS = . tests
- lib_LTLIBRARIES = libjson.la
+ lib_LTLIBRARIES = libjson-c.la $(am__append_1)
+Index: b/tests/Makefile.in
+===================================================================
+--- a/tests/Makefile.in
++++ b/tests/Makefile.in
+@@ -228,7 +228,7 @@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
++AM_CFLAGS = -Wall -Werror -Wextra -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE
+ LIBJSON_LA = $(top_builddir)/libjson-c.la
+ test1_LDADD = $(LIBJSON_LA)
+ test1Formatted_LDADD = $(LIBJSON_LA)
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index a0b5cae..031b541 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.10
-JSON_C_SITE = https://github.com/downloads/json-c/json-c
+JSON_C_VERSION = 0.11
+JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases/
 JSON_C_INSTALL_STAGING = YES
+JSON_C_MAKE = $(MAKE1)
+JSON_C_CONF_OPT = --disable-oldname-compat
 
 $(eval $(autotools-package))
-- 
1.7.9.5
