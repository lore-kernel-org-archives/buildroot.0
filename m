From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 17 Apr 2019 01:51:54 +0300
Subject: [Buildroot] [PATCH 1/1] package/git: Fix build with NLS enabled
Message-ID: <20190416225154.4760-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

git fails to build with NLS enabled because of weak check
for gettext in configure.ac. The AC_CHECK_LIB(c, gettext ...)
is used to set LIBC_CONTAINS_LIBINTL variable. If the variable
is set then '-libs' is not passed to the linker, but this variable
is set to 'Yes' even libc implementation does not provide libintl
support, the AC_CHECK passes because gcc has gettext builtin.

So use instead AC_LINK_IFELSE with included libintl.h because it
makes gettext to unfold as libintl_gettext which causes AC_CHECK
to fail for cases when gettext is not provided by libc.

Tested by ./utils/test-pkg with NLS disabled/enabled.

Fixes:
	http://autobuild.buildroot.net/results/091b790ca6f5b46d5d29211dc1cb3ff05b62a965
	http://autobuild.buildroot.net/results/a69b58b35b270fdd2df9b076e7030bb594520197
	http://autobuild.buildroot.net/results/f104c4e6ff41b1dd175f2d27f3b4ea7c9b61f7c5
	http://autobuild.buildroot.net/results/ee12bdba398a139995de5f6f6718be6a493541d9
	http://autobuild.buildroot.net/results/74fa6b2bfbb1301e35c9dd1bbc04856c1cbf25f2

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...1-configure.ac-Properly-check-for-libintl.patch | 49 ++++++++++++++++++++++
 package/git/git.mk                                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 package/git/0001-configure.ac-Properly-check-for-libintl.patch

diff --git a/package/git/0001-configure.ac-Properly-check-for-libintl.patch b/package/git/0001-configure.ac-Properly-check-for-libintl.patch
new file mode 100644
index 0000000000..2f367f547a
--- /dev/null
+++ b/package/git/0001-configure.ac-Properly-check-for-libintl.patch
@@ -0,0 +1,49 @@
+From 01da08fd60a0bdb2994f85f943dba148d9321d4d Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Wed, 17 Apr 2019 01:25:40 +0300
+Subject: [PATCH 1/1] configure.ac: Properly check for libintl
+
+Some libc implementations like uclibc or musl provides
+gettext stubs via libintl library but this case is not checked
+by AC_CHECK_LIBRARY(c, gettext ...) because gcc has gettext as builtin
+which passess the check.
+
+So check it with included libintl.h where gettext may unfold into
+libintl_gettext which will cause check to fail if libintl_gettext are
+needed to be linked with -lintl.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ configure.ac | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7f84151..0b8e25f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -762,9 +762,19 @@ AC_CHECK_LIB([c], [basename],
+ GIT_CONF_SUBST([NEEDS_LIBGEN])
+ test -n "$NEEDS_LIBGEN" && LIBS="$LIBS -lgen"
+ 
+-AC_CHECK_LIB([c], [gettext],
+-[LIBC_CONTAINS_LIBINTL=YesPlease],
+-[LIBC_CONTAINS_LIBINTL=])
++AC_DEFUN([LIBINTL_SRC], [
++AC_LANG_PROGRAM([[
++#include <libintl.h>
++]],[[
++char *msg = gettext("test");
++]])])
++
++AC_MSG_CHECKING([if libc contains libintl])
++AC_LINK_IFELSE([LIBINTL_SRC],
++	[AC_MSG_RESULT([yes])
++	LIBC_CONTAINS_LIBINTL=YesPlease],
++	[AC_MSG_RESULT([no])
++	LIBC_CONTAINS_LIBINTL=])
+ GIT_CONF_SUBST([LIBC_CONTAINS_LIBINTL])
+ 
+ #
+-- 
+2.14.1
+
diff --git a/package/git/git.mk b/package/git/git.mk
index aec30e3eb3..804a6e2325 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,6 +10,7 @@ GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
+GIT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += host-pkgconf openssl
-- 
2.14.1
