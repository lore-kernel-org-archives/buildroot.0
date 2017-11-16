From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Thu, 16 Nov 2017 20:05:53 +0100
Subject: [Buildroot] [PATCH v3 1/2] libkrb5: New package
Message-ID: <1510859154-26878-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libkrb5/0001-cross-compile.patch | 39 ++++++++++++++++++++++++++++++++
 package/libkrb5/Config.in                | 11 +++++++++
 package/libkrb5/libkrb5.hash             |  2 ++
 package/libkrb5/libkrb5.mk               | 16 +++++++++++++
 6 files changed, 70 insertions(+)
 create mode 100644 package/libkrb5/0001-cross-compile.patch
 create mode 100644 package/libkrb5/Config.in
 create mode 100644 package/libkrb5/libkrb5.hash
 create mode 100644 package/libkrb5/libkrb5.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 37b7dfe..571ef83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -101,6 +101,7 @@ F:	package/ktap/
 
 N:	Andr? Hentschel <nerv@dawncrow.de>
 F:	package/azure-iot-sdk-c/
+F:	package/libkrb5/
 F:	package/openal/
 F:	package/p7zip/
 F:	package/wine/
diff --git a/package/Config.in b/package/Config.in
index 23526b4..0a2d81b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1346,6 +1346,7 @@ menu "Networking"
 	source "package/libhttpparser/Config.in"
 	source "package/libidn/Config.in"
 	source "package/libiscsi/Config.in"
+	source "package/libkrb5/Config.in"
 	source "package/libldns/Config.in"
 	source "package/libmaxminddb/Config.in"
 	source "package/libmbus/Config.in"
diff --git a/package/libkrb5/0001-cross-compile.patch b/package/libkrb5/0001-cross-compile.patch
new file mode 100644
index 0000000..13a29bb
--- /dev/null
+++ b/package/libkrb5/0001-cross-compile.patch
@@ -0,0 +1,39 @@
+Add sane assumptions about cross-compiling
+
+Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
+
+diff --git a/src/aclocal.m4 b/src/aclocal.m4
+index 9c46da4..eb1a8a6 100644
+--- a/src/aclocal.m4
++++ b/src/aclocal.m4
+@@ -729,7 +729,7 @@ AC_TRY_RUN([
+ #include <regex.h>
+ regex_t x; regmatch_t m;
+ int main() { return regcomp(&x,"pat.*",0) || regexec(&x,"pattern",1,&m,0); }
+-], ac_cv_func_regcomp=yes, ac_cv_func_regcomp=no, AC_MSG_ERROR([Cannot test regcomp when cross compiling]))])
++], ac_cv_func_regcomp=yes, ac_cv_func_regcomp=no, AC_MSG_WARN([Cannot test regcomp when cross compiling]); ac_cv_func_regcomp=yes)])
+ AC_MSG_RESULT($ac_cv_func_regcomp)
+ test $ac_cv_func_regcomp = yes && AC_DEFINE(HAVE_REGCOMP,1,[Define if regcomp exists and functions])
+ dnl
+@@ -1593,7 +1593,7 @@ void foo2() __attribute__((destructor));
+ void foo2() { unlink("conftest.2"); }
+ int main () { return 0; }],
+ [test -r conftest.1 || a=yes
+-test -r conftest.2 || b=yes], , AC_MSG_ERROR(Cannot test for constructor/destructor support when cross compiling))
++test -r conftest.2 || b=yes], , AC_MSG_WARN(Cannot test for constructor/destructor support when cross compiling); a=yes; b=yes)
+ case $krb5_cv_host in
+ *-*-aix4.*)
+ 	# Under AIX 4.3.3, at least, shared library destructor functions
+diff --git a/src/configure.in b/src/configure.in
+index 037c9f3..e6990c0 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -892,7 +892,7 @@ int main () {
+ }],
+   ac_cv_printf_positional=yes,
+   ac_cv_printf_positional=no,
+-  AC_MSG_ERROR([Cannot test for printf positional argument support when cross compiling]))])
++  AC_MSG_WARN([Cannot test for printf positional argument support when cross compiling]); ac_cv_printf_positional=yes)])
+ # Nothing for autoconf.h for now.
+ AC_MSG_RESULT($ac_cv_printf_positional)
+ 
diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
new file mode 100644
index 0000000..b2cb873
--- /dev/null
+++ b/package/libkrb5/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBKRB5
+	bool "libkrb5"
+	help
+	  Kerberos is a system for authenticating users and services
+	  on a network. Kerberos is a trusted third-party service.
+	  That means that there is a third party (the Kerberos server)
+	  that is trusted by all the entities on the network
+	  (users and services, usually called "principals").
+	  This is the MIT reference implementation of Kerberos V5.
+
+	  https://web.mit.edu/kerberos/
diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
new file mode 100644
index 0000000..4ba59fa
--- /dev/null
+++ b/package/libkrb5/libkrb5.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1639e392edf25e3b6cfec2ae68f97eb53e07c2dbe74bfeede0108465d5d1c87e	krb5-1.15.2.tar.gz
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
new file mode 100644
index 0000000..84ded3c
--- /dev/null
+++ b/package/libkrb5/libkrb5.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libkrb5
+#
+################################################################################
+
+LIBKRB5_VERSION = 1.15.2
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/1.15
+LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
+LIBKRB5_SUBDIR = src
+LIBKRB5_LICENSE = MIT
+LIBKRB5_LICENSE_FILES = NOTICE
+LIBKRB5_INSTALL_STAGING = YES
+LIBKRB5_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
