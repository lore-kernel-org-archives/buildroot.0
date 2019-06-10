From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 10 Jun 2019 18:57:55 +0300
Subject: [Buildroot] [PATCH 1/1] package/git: bump to version 2.22.0
Message-ID: <1560182275-11927-1-git-send-email-email@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

Remove patch with NLS fix because it is was added into latest version.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...1-configure.ac-Properly-check-for-libintl.patch | 49 ----------------------
 package/git/git.hash                               |  2 +-
 package/git/git.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/git/0001-configure.ac-Properly-check-for-libintl.patch

diff --git a/package/git/0001-configure.ac-Properly-check-for-libintl.patch b/package/git/0001-configure.ac-Properly-check-for-libintl.patch
deleted file mode 100644
index 2f367f5..0000000
--- a/package/git/0001-configure.ac-Properly-check-for-libintl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 01da08fd60a0bdb2994f85f943dba148d9321d4d Mon Sep 17 00:00:00 2001
-From: Vadim Kochan <vadim4j@gmail.com>
-Date: Wed, 17 Apr 2019 01:25:40 +0300
-Subject: [PATCH 1/1] configure.ac: Properly check for libintl
-
-Some libc implementations like uclibc or musl provides
-gettext stubs via libintl library but this case is not checked
-by AC_CHECK_LIBRARY(c, gettext ...) because gcc has gettext as builtin
-which passess the check.
-
-So check it with included libintl.h where gettext may unfold into
-libintl_gettext which will cause check to fail if libintl_gettext are
-needed to be linked with -lintl.
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- configure.ac | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7f84151..0b8e25f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -762,9 +762,19 @@ AC_CHECK_LIB([c], [basename],
- GIT_CONF_SUBST([NEEDS_LIBGEN])
- test -n "$NEEDS_LIBGEN" && LIBS="$LIBS -lgen"
- 
--AC_CHECK_LIB([c], [gettext],
--[LIBC_CONTAINS_LIBINTL=YesPlease],
--[LIBC_CONTAINS_LIBINTL=])
-+AC_DEFUN([LIBINTL_SRC], [
-+AC_LANG_PROGRAM([[
-+#include <libintl.h>
-+]],[[
-+char *msg = gettext("test");
-+]])])
-+
-+AC_MSG_CHECKING([if libc contains libintl])
-+AC_LINK_IFELSE([LIBINTL_SRC],
-+	[AC_MSG_RESULT([yes])
-+	LIBC_CONTAINS_LIBINTL=YesPlease],
-+	[AC_MSG_RESULT([no])
-+	LIBC_CONTAINS_LIBINTL=])
- GIT_CONF_SUBST([LIBC_CONTAINS_LIBINTL])
- 
- #
--- 
-2.14.1
-
diff --git a/package/git/git.hash b/package/git/git.hash
index 35c8774..e02fd0d 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 dfb71b053cbc38a9c5b08c2fe8b5eae210b4e3b63892426923e10cfd6ba63862  git-2.16.5.tar.xz
+sha256 159e4b599f8af4612e70b666600a3139541f8bacc18124daf2cbe8d1b934f29f  git-2.22.0.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 804a6e2..8d1fcd2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.16.5
+GIT_VERSION = 2.22.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.7.4
