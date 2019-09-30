From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 16:11:05 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libgcrypt:
 disable tests
Message-ID: <20190930151759.411AA8381D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e1eb9ac1b652cc15b10eb50c5ee9e726e0b3cc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Add a patch to disable tests as t-lock needs threads

Fixes:
 - http://autobuild.buildroot.org/results/50a8ba572e3fafd3c6a39bd54bcfcaf78b5ad325

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ef79770dcd4337e52725c43922b2fb2dbeda43b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfigure.ac-add-an-option-to-disable-tests.patch | 66 ++++++++++++++++++++++
 package/libgcrypt/libgcrypt.mk                     |  3 +-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/package/libgcrypt/0004-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0004-configure.ac-add-an-option-to-disable-tests.patch
new file mode 100644
index 0000000000..21ff20a473
--- /dev/null
+++ b/package/libgcrypt/0004-configure.ac-add-an-option-to-disable-tests.patch
@@ -0,0 +1,66 @@
+From 7fe1b8a53cc8c865c2a10dcd8f6cb4e51ccc6300 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 29 Jul 2019 12:19:10 +0200
+Subject: [PATCH] configure.ac: add an option to disable tests
+
+Add an option to allow the user to disable tests, this can be useful for
+example when the toolchain does not provide thread. Indeed, in this
+case, libgcrypt fails to build t-lock:
+
+t-lock.c: In function 'run_test':
+t-lock.c:359:3: error: unknown type name 'pthread_t'
+   pthread_t rthread;
+
+Fixes:
+ - http://autobuild.buildroot.org/results/50a8ba572e3fafd3c6a39bd54bcfcaf78b5ad325
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  |  7 ++++++-
+ configure.ac | 10 ++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7fa4fa4d..f0bd90e4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,9 +39,14 @@ else
+ doc =
+ endif
+ 
++if BUILD_TESTS
++tests = tests
++else
++tests =
++endif
+ 
+ DIST_SUBDIRS = m4 compat mpi cipher random src doc tests
+-SUBDIRS =         compat mpi cipher random src $(doc) tests
++SUBDIRS =         compat mpi cipher random src $(doc) $(tests)
+ 
+ EXTRA_DIST = autogen.sh autogen.rc README.GIT LICENSES      	           \
+              ChangeLog-2011 build-aux/ChangeLog-2011 doc/ChangeLog-2011    \
+diff --git a/configure.ac b/configure.ac
+index e8c8cd39..1a6b61e5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2710,6 +2710,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+ AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
+ 
+ 
++#
++# Option to disable building of tests
++#
++build_tests=yes
++AC_ARG_ENABLE([tests], AC_HELP_STRING([--disable-tests],
++                                      [do not build tests]),
++                       build_tests=$enableval, build_tests=yes)
++AM_CONDITIONAL([BUILD_TESTS], [test "x$build_tests" != xno])
++
++
+ #
+ # Provide information about the build.
+ #
+-- 
+2.20.1
+
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 2799a6fba2..8414e6b96e 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -14,9 +14,10 @@ LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 
 # Patching acinclude.m4 in 0001
-# Patching configure.ac and Makefile.am in 0002
+# Patching configure.ac and Makefile.am in 0002 / 0004
 LIBGCRYPT_AUTORECONF = YES
 LIBGCRYPT_CONF_OPTS = \
+	--disable-tests \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 # Libgcrypt doesn't support assembly for coldfire
