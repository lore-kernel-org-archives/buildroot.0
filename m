From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:30:25 +0100
Subject: [Buildroot] [git commit] logrotate: bump to version 3.11.0
Message-ID: <20170207164038.EBD5182159@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10366edf000756cf1eda9563691d6cf747df6ebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also removed both patches as they have been added to this release.
Aslo removed reference to github patch in makefile as it has been
added to this release as well.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/0001-make-autoreconfable.patch   | 20 -------
 ...-autoconf-checks-for-strndup-and-asprintf.patch | 61 ----------------------
 package/logrotate/logrotate.hash                   |  3 +-
 package/logrotate/logrotate.mk                     |  3 +-
 4 files changed, 2 insertions(+), 85 deletions(-)

diff --git a/package/logrotate/0001-make-autoreconfable.patch b/package/logrotate/0001-make-autoreconfable.patch
deleted file mode 100644
index 89759d0..0000000
--- a/package/logrotate/0001-make-autoreconfable.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Make the package autoreconfigurable
-
-Adjust a minor detail in configure.ac in order to make the package
-compatible with the autoconf/automake versions we are using in
-Buildroot.
-
-Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,6 +1,6 @@
- AC_INIT([logrotate],[3.8.9])
- 
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- AC_DEFINE(_GNU_SOURCE)
- 
- AM_EXTRA_RECURSIVE_TARGETS([test])
diff --git a/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch b/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch
deleted file mode 100644
index 14efc1d..0000000
--- a/package/logrotate/0002-Use-autoconf-checks-for-strndup-and-asprintf.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From e626f4ca5169036a0042e55e58aca2bb5cc19ad7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 19 Aug 2016 22:39:17 +0200
-Subject: [PATCH] Use autoconf checks for strndup and asprintf
-
-The current code in config.c can provide its own implementation of
-asprintf() and strndup() if not provided by the system. However, in
-order to decide if they should be provided, the check done is:
-
- #if !defined(name_of_function)
-
-which only works if the function is actually defined as a macro, which
-is not necessarily the case.
-
-Therefore, we replace this logic by a proper AC_CHECK_FUNCS() check in
-the configure script.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- config.c     | 4 ++--
- configure.ac | 2 ++
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/config.c b/config.c
-index 8731348..8741e48 100644
---- a/config.c
-+++ b/config.c
-@@ -45,7 +45,7 @@
- #include "asprintf.c"
- #endif
- 
--#if !defined(asprintf) && !defined(_FORTIFY_SOURCE)
-+#if !defined(HAVE_ASPRINTF) && !defined(_FORTIFY_SOURCE)
- #include <stdarg.h>
- 
- int asprintf(char **string_ptr, const char *format, ...)
-@@ -78,7 +78,7 @@ int asprintf(char **string_ptr, const char *format, ...)
- 
- #endif
- 
--#if !defined(strndup)
-+#if !defined(HAVE_STRNDUP)
- char *strndup(const char *s, size_t n)
- {
-        size_t nAvail;
-diff --git a/configure.ac b/configure.ac
-index 5c83d20..51da52a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,6 +18,8 @@ AC_SYS_LARGEFILE
- AC_CHECK_LIB([popt],[poptParseArgvString],,
-   AC_MSG_ERROR([libpopt required but not found]))
- 
-+AC_CHECK_FUNCS([strndup asprintf])
-+
- dnl Needed for out-of-source builds
- mkdir -p test
- 
--- 
-2.7.4
-
diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 3003d42..4985a17 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 db63b5932190cba941357c029b595a7fddf43539943aa1e0ca53a96136e4c5d9 logrotate-3.10.0.tar.gz
-sha256 e0d360908ac506e02f08fa1ad70e17d6985045d8640f383fef8f322886d6e1e1 6a36c105587b07ad14fc937f3ee6e2eb402621a2.patch
+sha256 62aa0229cfd34c7b6ea6a6736d569983bf4a3dd1f3c9e9c2efe2ffe2a0a55cf2 logrotate-3.11.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 14d0693..7828870 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.10.0
+LOGROTATE_VERSION = 3.11.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
@@ -13,7 +13,6 @@ LOGROTATE_DEPENDENCIES = popt host-pkgconf
 LOGROTATE_AUTORECONF = YES
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 LOGROTATE_CONF_OPTS = --without-selinux
-LOGROTATE_PATCH = https://github.com/logrotate/logrotate/commit/6a36c105587b07ad14fc937f3ee6e2eb402621a2.patch
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 LOGROTATE_DEPENDENCIES += acl
