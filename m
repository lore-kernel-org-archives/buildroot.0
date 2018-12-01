From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Dec 2018 22:59:53 +0100
Subject: [Buildroot] [PATCH 1/1] quagga: fix static build with musl
Message-ID: <20181201215953.6966-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zebra library defines optind and opterr which are already defined in
libc
Current code is not included if !defined _LIBC && defined __GLIBC__ &&
 __GLIBC__ >= 2 && _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION

However, this fails on musl even if musl provides getopt as a result
static linking with musl fails

To fix this issue, add an option to allow the user to disable getopt
code and use it in quagga.mk

Fixes:
 - http://autobuild.buildroot.org/results/32f93a73379d073abcaf8936ffbb8b5707583024

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...an-option-to-disable-embedded-getopt.patch | 84 +++++++++++++++++++
 package/quagga/quagga.mk                      |  3 +-
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 package/quagga/0009-add-an-option-to-disable-embedded-getopt.patch

diff --git a/package/quagga/0009-add-an-option-to-disable-embedded-getopt.patch b/package/quagga/0009-add-an-option-to-disable-embedded-getopt.patch
new file mode 100644
index 0000000000..f8b0e7bcfe
--- /dev/null
+++ b/package/quagga/0009-add-an-option-to-disable-embedded-getopt.patch
@@ -0,0 +1,84 @@
+From 4d09fabe5fb3272d04cf86f4197d75f300af15be Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Dec 2018 22:23:30 +0100
+Subject: [PATCH] add an option to disable embedded getopt
+
+zebra library defines optind and opterr which are already defined in
+libc
+Current code is not included if !defined _LIBC && defined __GLIBC__ &&
+ __GLIBC__ >= 2 && _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION
+
+However, this fails on musl even if musl provides getopt as a result
+static linking with musl fails
+
+To fix this issue, add an option to allow the user to disable getopt
+code
+
+Fixes:
+ - http://autobuild.buildroot.org/results/32f93a73379d073abcaf8936ffbb8b5707583024
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac  | 7 +++++++
+ lib/getopt.c  | 4 ++++
+ lib/getopt1.c | 4 ++++
+ 3 files changed, 15 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index ed279f48..ace2ed48 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -360,6 +360,9 @@ AC_ARG_ENABLE([protobuf],
+ AC_ARG_ENABLE([dev_build],
+     AS_HELP_STRING([--enable-dev-build], [build for development]))
+ 
++AC_ARG_ENABLE(embedded-getopt,
++    AS_HELP_STRING([--disable-embedded-getopt], [disable embedded getopt functions]))
++
+ if test x"${enable_gcc_rdynamic}" != x"no" ; then
+   if test x"${enable_gcc_rdynamic}" = x"yes" -o x"$COMPILER" = x"GCC"; then
+     LDFLAGS="${LDFLAGS} -rdynamic"
+@@ -383,6 +386,10 @@ if test "x${enable_dev_build}" = "xyes"; then
+ fi
+ AM_CONDITIONAL([DEV_BUILD], [test "x$enable_dev_build" = "xyes"])
+ 
++if test "${enable_embedded_getopt}" = "yes"; then
++   AC_DEFINE(HAVE_EMBEDDED_GETOPT,,Enable embedded getopt functions)
++fi
++
+ #
+ # Logic for protobuf support.
+ #
+diff --git a/lib/getopt.c b/lib/getopt.c
+index 7a58a8a8..45fe6a7d 100644
+--- a/lib/getopt.c
++++ b/lib/getopt.c
+@@ -58,6 +58,10 @@
+ # endif
+ #endif
+ 
++#if !defined HAVE_EMBEDDED_GETOPT
++# define ELIDE_CODE
++#endif
++
+ #ifndef ELIDE_CODE
+ 
+ 
+diff --git a/lib/getopt1.c b/lib/getopt1.c
+index bd3099e7..b8c87ddc 100644
+--- a/lib/getopt1.c
++++ b/lib/getopt1.c
+@@ -49,6 +49,10 @@
+ #endif
+ #endif
+ 
++#if !defined HAVE_EMBEDDED_GETOPT
++# define ELIDE_CODE
++#endif
++
+ #ifndef ELIDE_CODE
+ 
+ 
+-- 
+2.17.1
+
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 8c2b80631b..cc4cd0a79f 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -16,7 +16,8 @@ QUAGGA_LICENSE_FILES = COPYING
 QUAGGA_CONF_OPTS = \
 	--program-transform-name='' \
 	--sysconfdir=/etc/quagga \
-	--localstatedir=/var/run/quagga
+	--localstatedir=/var/run/quagga \
+	--disable-embedded-getopt
 
 # 0002-configure-fix-static-linking-with-readline.patch
 QUAGGA_AUTORECONF = YES
-- 
2.17.1
