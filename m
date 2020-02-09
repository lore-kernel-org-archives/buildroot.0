From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Feb 2020 23:03:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/gensio: disable tests
Message-ID: <20200209220322.4164865-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a build failure without threads

Fixes:
 - http://autobuild.buildroot.org/results/e94d0e0b46afc1223a74bcc471909f4adef0d6f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-configure.ac-add-with-tests-option.patch | 60 +++++++++++++++++++
 package/gensio/gensio.mk                      |  5 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 package/gensio/0001-configure.ac-add-with-tests-option.patch

diff --git a/package/gensio/0001-configure.ac-add-with-tests-option.patch b/package/gensio/0001-configure.ac-add-with-tests-option.patch
new file mode 100644
index 0000000000..34b9638a4e
--- /dev/null
+++ b/package/gensio/0001-configure.ac-add-with-tests-option.patch
@@ -0,0 +1,60 @@
+From 02eca526fd0d7923ca2c4e143e3c8bf00bd43d9c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 9 Feb 2020 22:51:25 +0100
+Subject: [PATCH] configure.ac: add --with-tests option
+
+Allow the user to disable tests through --without-tests, this is
+especially useful on embedded systems
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/cminyard/gensio/pull/10]
+---
+ Makefile.am  |  4 ++--
+ configure.ac | 16 ++++++++++++++++
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e063b1d..2459223 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,8 +1,8 @@
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = lib include $(SWIG_DIR) tests tools man examples
++SUBDIRS = lib include $(SWIG_DIR) $(TESTS_DIR) tools man examples
+ 
+-DIST_SUBDIRS = lib swig include tests tools man examples
++DIST_SUBDIRS = lib swig include $(TESTS_DIR) tools man examples
+ 
+ EXTRA_DIST = README.rst reconf
+diff --git a/configure.ac b/configure.ac
+index 3519d4a..50a9dee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -145,6 +145,22 @@ AC_ARG_WITH(pythonusepthreads,
+    fi,
+ )
+ 
++TESTS_DIR=
++use_tests=yes
++AC_ARG_WITH(tests,
++[  --with-tests=yes|no      Build tests or not.],
++    if test "x$withval" = "xyes"; then
++      use_tests=yes
++    elif test "x$withval" = "xno"; then
++      use_tests=no
++    fi,
++)
++
++if test "x$use_tests" != "xno"; then
++   TESTS_DIR="tests"
++fi
++AC_SUBST(TESTS_DIR)
++
+ AC_SEARCH_LIBS([clock_gettime], [rt posix4])
+ 
+ # Handle RS485 support
+-- 
+2.24.1
+
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index a975fcb9e6..04167815ac 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -9,10 +9,13 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
+# We're patching configure.ac
+GENSIO_AUTORECONF = YES
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
-	--without-python
+	--without-python \
+	--without-tests
 
 GENSIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
-- 
2.24.1
