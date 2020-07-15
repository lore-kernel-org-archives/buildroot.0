From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Wed, 15 Jul 2020 16:35:14 -0600
Subject: [Buildroot] [PATCH v2] package/libest: new package
Message-ID: <20200715223514.15744-1-aleksandr.o.makarov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libest is a C implementation of RFC 7030 (Enrollment over
Secure Transport).

It can be used to provision public key certificates from
a certificate authority (CA) or registration authority (RA)
to end-user devices and network infrastructure devices.

https://github.com/cisco/libest

Notes on patches included in this package:

- libest bundles a stubbed version of libsafec, and has no provision
  to build against a system-installed full (non-stubbed) libsafec.
  We add a patch to make that possible.

- Added a configuration option --{enable,disable}-examples to toggle
  examples build by a separate patch.

- There's a configuration option `--enable-jni` which allows to build
  a JNI library for binding libest to Java programs. And that library
  would be using an outdated version of OpenSSL 1.0.
  We fix that by adding support for OpenSSL 1.1 API for that library.

- Fixed a bug when specifying either `--enable-FEATURE` or `--disable-FEATURE`
  has always been enabling the feature.

---
Changes:
v1 -> v2:
  Fixes suggested by Yann E. MORIN:

  - Add notice in the commit message of the patches that we add.
  - Swap libeXosip2 <-> libest in package/Config.in
  - Remove series of AC_CHECK_HEADER for system libsafec headers.
  - Use --disable-examples flag rather that removing examples from
    the Makefile lists.
  - Remove per-feature config suboptions. Automatically enable
    features whose dependencies have been met.
  - Use a Makefile `github()` function to acquire package sources.

  New features:

  - Add Config.in options to track bugged libest configurations:

      - BR2_PACKAGE_LIBEST_WITH_LIBCOAP_BUGGED

        Selecting libcoap package from the menuconfig list would
        try to enable `--with-libcoap-dir` option of libest, which
        would break libest compilation.

      - BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY_WITH_OPENJDK_BUGGED

        Selecting openjdk package and "client-only mode" suboption
        of libest would try to enable both libest `--enable-client-only`
        and `--enable-jni` configuration options.
        That would break libest compilation as well.

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 ...client.c-add-support-for-OpenSSL-1.1.patch | 110 ++++++++++++
 ...le-examples-flag-to-toggle-examples-.patch |  88 ++++++++++
 ...libsafec-flag-to-link-against-system.patch | 107 ++++++++++++
 ...Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch | 162 ++++++++++++++++++
 package/libest/Config.in                      |  41 +++++
 package/libest/libest.hash                    |   3 +
 package/libest/libest.mk                      | 109 ++++++++++++
 package/libest/libest.pc                      |  10 ++
 10 files changed, 634 insertions(+)
 create mode 100644 package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch
 create mode 100644 package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch
 create mode 100644 package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch
 create mode 100644 package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch
 create mode 100644 package/libest/Config.in
 create mode 100644 package/libest/libest.hash
 create mode 100644 package/libest/libest.mk
 create mode 100644 package/libest/libest.pc

diff --git a/DEVELOPERS b/DEVELOPERS
index efbb676b48..1551743ef6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -142,6 +142,9 @@ F:	package/minimodem/
 N:	Alexander Lukichev <alexander.lukichev@gmail.com>
 F:	package/openpgm/
 
+N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+F:	package/libest/
+
 N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
 F:	package/tinyproxy/
 
diff --git a/package/Config.in b/package/Config.in
index aafaa312a1..44b2cbec0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1684,6 +1684,7 @@ menu "Networking"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
+	source "package/libest/Config.in"
 	source "package/libfcgi/Config.in"
 	source "package/libgsasl/Config.in"
 	source "package/libhtp/Config.in"
diff --git a/package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch b/package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch
new file mode 100644
index 0000000000..b7e9bcdfa0
--- /dev/null
+++ b/package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch
@@ -0,0 +1,110 @@
+From 8f152a6e47484056968973a71a16e4f2142213a9 Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Mon, 13 Jul 2020 23:05:26 +0000
+Subject: [PATCH] java/jni/client.c: add support for OpenSSL 1.1
+
+This shall allow the java/jni to build with and link against OpenSSL 1.1.
+
+Additionally, the configuration program will not attempt to process the
+java/jni/ subdirectory if no --enable-jni has been specified.
+
+PR to upstream: https://github.com/cisco/libest/pull/81/commits/8f152a6e47484056968973a71a16e4f2142213a9
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ Makefile.am       |  8 ++++++--
+ configure.ac      | 10 ++++++----
+ java/jni/client.c | 21 ++++++++++++++++-----
+ 3 files changed, 28 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 10e38fd..9601de6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,9 +1,13 @@
+ ACLOCAL_AMFLAGS = -I m4
+ 
++if ENABLE_JNI
++libest_jni = java/jni
++endif
++
+ if ENABLE_CLIENT_ONLY 
+-SUBDIRS = safe_c_stub src java/jni example/client example/client-simple example/client-brski
++SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/client-brski
+ else 
+-SUBDIRS = safe_c_stub src java/jni example/client example/client-simple example/server example/proxy example/client-brski
++SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/server example/proxy example/client-brski
+ endif
+ 
+ EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
+diff --git a/configure.ac b/configure.ac
+index e02a54d..d648030 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,9 +35,9 @@ AM_COND_IF([FREEBSD], AC_MSG_RESULT([Skipping libdl check]),
+ AC_ARG_ENABLE([jni], 
+ 	       [AS_HELP_STRING([--enable-jni],
+ 			       [Enable support for JNI library])],
+-		[jni_on=1],
+-		[jni_on=0])
+-AM_CONDITIONAL([ENABLE_JNI], [test x$jni_on = x1])
++		[],
++		[enable_jni="no"])
++AM_CONDITIONAL([ENABLE_JNI], [test "$enable_jni" = "yes"])
+ AM_COND_IF([ENABLE_JNI], 
+ 	   AC_MSG_RESULT([JNI support enabled])
+ 	   AC_DEFINE([ENABLE_JNI]),
+@@ -198,5 +198,7 @@ AC_PREFIX_DEFAULT([/usr/local/est])
+ 
+ cp confdefs.h est_config.h
+ 
+-AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile java/jni/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
++AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
++AM_COND_IF([ENABLE_JNI],
++           [AC_CONFIG_FILES([java/jni/Makefile])])
+ AC_OUTPUT
+diff --git a/java/jni/client.c b/java/jni/client.c
+index 9a8a34e..f7aeefc 100644
+--- a/java/jni/client.c
++++ b/java/jni/client.c
+@@ -130,11 +130,18 @@ static int jni_est_client_X509_REQ_sign (X509_REQ *x, EVP_PKEY *pkey, const EVP_
+ {
+     int rv;
+     EVP_PKEY_CTX *pkctx = NULL;
+-    EVP_MD_CTX mctx;
++    EVP_MD_CTX *mctx;
+ 
+-    EVP_MD_CTX_init(&mctx);
++#ifdef HAVE_OLD_OPENSSL
++    EVP_MD_CTX md_ctx;
++    mctx = &md_ctx;
+ 
+-    if (!EVP_DigestSignInit(&mctx, &pkctx, md, NULL, pkey)) {
++    EVP_MD_CTX_init(mctx);
++#else
++    mctx = EVP_MD_CTX_new();
++#endif
++
++    if (!EVP_DigestSignInit(mctx, &pkctx, md, NULL, pkey)) {
+         return 0;
+     }
+ 
+@@ -150,9 +157,13 @@ static int jni_est_client_X509_REQ_sign (X509_REQ *x, EVP_PKEY *pkey, const EVP_
+     x->req_info->enc.modified = 1;
+ #endif
+ 
+-    rv = X509_REQ_sign_ctx(x, &mctx);
++    rv = X509_REQ_sign_ctx(x, mctx);
+ 
+-    EVP_MD_CTX_cleanup(&mctx);
++#ifdef HAVE_OLD_OPENSSL
++    EVP_MD_CTX_cleanup(mctx);
++#else
++    EVP_MD_CTX_free(mctx);
++#endif
+ 
+     return (rv);
+ }
+-- 
+2.17.1
+
diff --git a/package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch b/package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch
new file mode 100644
index 0000000000..27102036ad
--- /dev/null
+++ b/package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch
@@ -0,0 +1,88 @@
+From 4bd41ea12924161baca48add39ba5ecfab2cae30 Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Mon, 13 Jul 2020 23:42:42 +0000
+Subject: [PATCH] Add --{enable,disable}-examples flag to toggle examples
+ compilation
+
+PR to upstream: https://github.com/cisco/libest/pull/81/commits/4bd41ea12924161baca48add39ba5ecfab2cae30
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ Makefile.am  | 11 +++++++----
+ configure.ac | 24 ++++++++++++++++++------
+ 2 files changed, 25 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9601de6..e2561e7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4,10 +4,13 @@ if ENABLE_JNI
+ libest_jni = java/jni
+ endif
+ 
+-if ENABLE_CLIENT_ONLY 
+-SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/client-brski
+-else 
+-SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/server example/proxy example/client-brski
++if ENABLE_EXAMPLES
++if ENABLE_CLIENT_ONLY
++examples = example/client example/client-simple example/client-brski
++else
++examples = example/client example/client-simple example/client-brski example/server example/proxy
++endif
+ endif
+ 
++SUBDIRS = safe_c_stub src $(libest_jni) $(examples)
+ EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
+diff --git a/configure.ac b/configure.ac
+index d648030..95b3223 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2,11 +2,6 @@ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT([libest],[3.2.0p],[libest-dev])
+ AC_CONFIG_AUX_DIR(config)
+ AC_CONFIG_SRCDIR(src/est/est.c)
+-AC_CONFIG_SRCDIR(example/client/estclient.c)
+-AC_CONFIG_SRCDIR(example/client-simple/estclient-simple.c)
+-AC_CONFIG_SRCDIR(example/client-brski/estclient-brski.c)
+-AC_CONFIG_SRCDIR(example/server/estserver.c)
+-AC_CONFIG_SRCDIR(example/proxy/estproxy.c)
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+ AM_INIT_AUTOMAKE
+@@ -80,6 +75,15 @@ AM_COND_IF([DISABLE_PTHREAD], [],
+ 	    [AC_CHECK_LIB([pthread], [pthread_create], [],
+              [AC_MSG_FAILURE([can't find pthread lib])])])
+ 
++AC_ARG_ENABLE([examples],
++	       [AS_HELP_STRING([--disable-examples],
++			       [Disable examples compilation])],
++		[],
++		[enable_examples="yes"])
++AC_MSG_CHECKING(whether to build examples)
++AM_CONDITIONAL([ENABLE_EXAMPLES], [test "$enable_examples" = "yes"])
++AM_COND_IF([ENABLE_EXAMPLES], AC_MSG_RESULT([yes]), AC_MSG_RESULT([no]))
++
+ AC_ARG_WITH([ssl-dir],
+ 	    [AS_HELP_STRING([--with-ssl-dir],
+ 		[location of OpenSSL install folder, defaults to /usr/local/ssl])],
+@@ -198,7 +202,15 @@ AC_PREFIX_DEFAULT([/usr/local/est])
+ 
+ cp confdefs.h est_config.h
+ 
+-AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
++AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile])
+ AM_COND_IF([ENABLE_JNI],
+            [AC_CONFIG_FILES([java/jni/Makefile])])
++AM_COND_IF([ENABLE_EXAMPLES],
++[
++            AC_CONFIG_FILES([example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile])
++            AM_COND_IF([ENABLE_CLIENT_ONLY],
++                       [],
++                       [AC_CONFIG_FILES([example/server/Makefile example/proxy/Makefile])])
++])
++
+ AC_OUTPUT
+-- 
+2.17.1
+
diff --git a/package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch b/package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch
new file mode 100644
index 0000000000..ace647c3f9
--- /dev/null
+++ b/package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch
@@ -0,0 +1,107 @@
+From 017155b98ff3722816a52953b1079c9c8704d2ff Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Tue, 14 Jul 2020 10:03:14 +0000
+Subject: [PATCH] Add --with-system-libsafec flag to link against system
+ libsafec
+
+Specifying the --with-system-libsafec flag shall allow the configuration
+program to search for and, if found, to link against the libsafec library
+that is installed in the system.
+
+PR to upstream: https://github.com/cisco/libest/pull/81/commits/017155b98ff3722816a52953b1079c9c8704d2ff
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ Makefile.am  |  6 +++++-
+ configure.ac | 41 +++++++++++++++++++++++++++++++----------
+ 2 files changed, 36 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e2561e7..d53b0d5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -12,5 +12,9 @@ examples = example/client example/client-simple example/client-brski example/ser
+ endif
+ endif
+ 
+-SUBDIRS = safe_c_stub src $(libest_jni) $(examples)
++if ! WITH_SYSTEM_LIBSAFEC
++builtin_libsafec = safe_c_stub
++endif
++
++SUBDIRS = $(builtin_libsafec) src $(libest_jni) $(examples)
+ EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
+diff --git a/configure.ac b/configure.ac
+index 95b3223..048aa3c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -10,6 +10,7 @@ AM_INIT_AUTOMAKE([subdir-objects])
+ 
+ AC_PROG_CC
+ AM_PROG_CC_C_O
++PKG_PROG_PKG_CONFIG
+ LT_INIT
+ AC_CANONICAL_HOST
+ case $host in
+@@ -187,22 +188,39 @@ AC_ARG_WITH([libcoap-dir],
+         ]
+        )
+ 
+-SAFEC_STUB_DIR='$(abs_top_builddir)/safe_c_stub'
+-AC_SUBST(SAFEC_STUB_DIR)
+-safecdir="$SAFEC_STUB_DIR" 
+-AC_SUBST([SAFEC_DIR], "$safecdir")
+-AC_SUBST([SAFEC_CFLAGS], "$safecdir/include")
+-AC_SUBST([SAFEC_LDFLAGS], "$safecdir/lib")
++AC_ARG_WITH(system-libsafec,
++            AS_HELP_STRING([--with-system-libsafec],
++                           [select to use libsafec installed in the system]),
++            [],
++            [with_system_libsafec="no"])
+ 
+-CFLAGS="$CFLAGS -Wall -I$safecdir/include"
+-LDFLAGS="$LDFLAGS -L$safecdir/lib"
+-LIBS="$LIBS -lsafe_lib"
++AC_MSG_CHECKING(which libsafec to use)
++AM_CONDITIONAL([WITH_SYSTEM_LIBSAFEC], [test "$with_system_libsafec" = "yes"])
++AM_COND_IF([WITH_SYSTEM_LIBSAFEC], AC_MSG_RESULT([system]), AC_MSG_RESULT([built-in]))
++AM_COND_IF([WITH_SYSTEM_LIBSAFEC],
++[
++           PKG_CHECK_MODULES([libsafec], [libsafec])
++           LIBS="$LIBS $libsafec_LIBS"
++           CFLAGS="$CFLAGS $libsafec_CFLAGS"
++           CPPFLAGS="$CPPFLAGS $libsafec_CFLAGS"
++],[
++           SAFEC_STUB_DIR='$(abs_top_builddir)/safe_c_stub'
++           AC_SUBST(SAFEC_STUB_DIR)
++           safecdir="$SAFEC_STUB_DIR"
++           AC_SUBST([SAFEC_DIR], "$safecdir")
++           AC_SUBST([SAFEC_CFLAGS], "$safecdir/include")
++           AC_SUBST([SAFEC_LDFLAGS], "$safecdir/lib")
++
++           CFLAGS="$CFLAGS -Wall -I$safecdir/include"
++           LDFLAGS="$LDFLAGS -L$safecdir/lib"
++           LIBS="$LIBS -lsafe_lib"
++])
+ 
+ AC_PREFIX_DEFAULT([/usr/local/est])
+ 
+ cp confdefs.h est_config.h
+ 
+-AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile])
++AC_CONFIG_FILES([Makefile version src/Makefile src/est/Makefile])
+ AM_COND_IF([ENABLE_JNI],
+            [AC_CONFIG_FILES([java/jni/Makefile])])
+ AM_COND_IF([ENABLE_EXAMPLES],
+@@ -212,5 +230,8 @@ AM_COND_IF([ENABLE_EXAMPLES],
+                        [],
+                        [AC_CONFIG_FILES([example/server/Makefile example/proxy/Makefile])])
+ ])
++AM_COND_IF([WITH_SYSTEM_LIBSAFEC],
++           [],
++           [AC_CONFIG_FILES([safe_c_stub/Makefile safe_c_stub/lib/Makefile])])
+ 
+ AC_OUTPUT
+-- 
+2.17.1
+
diff --git a/package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch b/package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch
new file mode 100644
index 0000000000..eea9366f48
--- /dev/null
+++ b/package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch
@@ -0,0 +1,162 @@
+From 9a76187aa4d779de39afa12024d5a73a14175371 Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Wed, 15 Jul 2020 11:25:05 +0000
+Subject: [PATCH] configure.ac: Fix AC_ARG_ENABLE/AC_ARG_WITH macros
+
+Multiple tests in configure.ac are flawed:
+
+[--snip--]
+    AC_ARG_ENABLE([pthreads],
+            [AS_HELP_STRING([--disable-pthreads],
+                            [Disable support for pthreads])],
+            [pthreads_on=1],
+            [pthreads_on=0])
+[--snip--]
+
+The third argument is "action-if-given" and the fourth argument
+is "action-if-not-given" [0]. Which means that, whether you pass
+--enable-pthreads or --disable-pthreads, the third argument will be
+executed, that is "pthreads_on=1". And if you pass neither, the fourth
+argument will be executed, i.e. "pthreads_on=0".
+
+We want `--enable-pthreads` and `--disable-pthreads` flags to do their job.
+The right way to do that will be to eliminate "action-if-given" and replace
+the user-defined `FEATURE_on=0|1` shell variables with the `enable_FEATURE`
+and `with_PACKAGE` shell variables provided by Autotools.
+
+[0] https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/autoconf.html#Package-Options
+
+PR to upstream: https://github.com/cisco/libest/pull/81/commits/9a76187aa4d779de39afa12024d5a73a14175371
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ configure.ac | 60 ++++++++++++++++++++++++++--------------------------
+ 1 file changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 048aa3c..0b930bf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,9 +43,9 @@ AM_CONDITIONAL([JAVA_HOME_SET], [test ! -z "$JAVA_HOME"])
+ AC_ARG_ENABLE([client-only], 
+ 	       [AS_HELP_STRING([--enable-client-only],
+ 			       [Enable the building of only the client mode of libEST])],
+-		[clientonly_on=1],
+-		[clientonly_on=0])
+-AM_CONDITIONAL([ENABLE_CLIENT_ONLY], [test x$clientonly_on = x1])
++		[],
++		[enable_client_only="no"])
++AM_CONDITIONAL([ENABLE_CLIENT_ONLY], [test "$enable_client_only" = "yes"])
+ AM_COND_IF([ENABLE_CLIENT_ONLY], 
+ 	   AC_MSG_RESULT([Client only build enabled])
+ 	   AC_DEFINE([ENABLE_CLIENT_ONLY]),
+@@ -54,9 +54,9 @@ AM_COND_IF([ENABLE_CLIENT_ONLY],
+ AC_ARG_ENABLE([brski], 
+ 	       [AS_HELP_STRING([--enable-brski],
+ 			       [Enable support for brski bootstrap functionality])],
+-		[brski_on=1],
+-		[brski_on=0])
+-AM_CONDITIONAL([ENABLE_BRSKI], [test x$brski_on = x1])
++		[],
++		[enable_brski="no"])
++AM_CONDITIONAL([ENABLE_BRSKI], [test "$enable_brski" = "yes"])
+ AM_COND_IF([ENABLE_BRSKI], 
+ 	   AC_MSG_RESULT([BRSKI support enabled])
+ 	   AC_DEFINE([ENABLE_BRSKI]),
+@@ -65,9 +65,9 @@ AM_COND_IF([ENABLE_BRSKI],
+ AC_ARG_ENABLE([pthreads], 
+ 	       [AS_HELP_STRING([--disable-pthreads],
+ 			       [Disable support for pthreads])],
+-		[pthreads_on=1],
+-		[pthreads_on=0])
+-AM_CONDITIONAL([DISABLE_PTHREAD], [test x$pthreads_on = x1])
++		[],
++		[enable_pthreads="yes"])
++AM_CONDITIONAL([DISABLE_PTHREAD], [test "$enable_pthreads" = "no"])
+ AM_COND_IF([DISABLE_PTHREAD], 
+ 	   AC_MSG_RESULT([pthread support disabled])
+ 	   AC_DEFINE([DISABLE_PTHREADS]), 
+@@ -88,13 +88,13 @@ AM_COND_IF([ENABLE_EXAMPLES], AC_MSG_RESULT([yes]), AC_MSG_RESULT([no]))
+ AC_ARG_WITH([ssl-dir],
+ 	    [AS_HELP_STRING([--with-ssl-dir],
+ 		[location of OpenSSL install folder, defaults to /usr/local/ssl])],
+-	    [ssldir="$withval"],
+-	    [ssldir="/usr/local/ssl"])
+-AC_SUBST([SSL_CFLAGS], "$ssldir/include")
+-AC_SUBST([SSL_LDFLAGS], "$ssldir/lib")
++	    [],
++	    [with_ssl_dir="/usr/local/ssl"])
++AC_SUBST([SSL_CFLAGS], "$with_ssl_dir/include")
++AC_SUBST([SSL_LDFLAGS], "$with_ssl_dir/lib")
+ 
+-CFLAGS="$CFLAGS -Wall -I$ssldir/include"
+-LDFLAGS="$LDFLAGS -L$ssldir/lib"
++CFLAGS="$CFLAGS -Wall -I$with_ssl_dir/include"
++LDFLAGS="$LDFLAGS -L$with_ssl_dir/lib"
+ if test "$is_freebsd" = "1" ; then
+ AC_CHECK_LIB([crypto], [EVP_EncryptInit], [],
+              [AC_MSG_FAILURE([can't find openssl crypto lib])]
+@@ -120,13 +120,13 @@ AC_CHECK_LIB([crypto], [EVP_CIPHER_CTX_reset], [],
+ AC_ARG_WITH([libcurl-dir],
+  [AS_HELP_STRING([--with-libcurl-dir],
+ 				 [enable support for client proxy using libcurl])],
+- [libcurldir="$withval"],
+- [with_libcurldir=no])
++ [],
++ [with_libcurl_dir=no])
+ 
+   AS_IF(
+-        [test "x$with_libcurldir" != xno],
+-        [[CFLAGS="$CFLAGS -I$libcurldir/include"]
+-         [LDFLAGS="$LDFLAGS -L$libcurldir/lib -lcurl"]
++        [test "$with_libcurl_dir" != "no"],
++        [[CFLAGS="$CFLAGS -I$with_libcurl_dir/include"]
++         [LDFLAGS="$LDFLAGS -L$with_libcurl_dir/lib -lcurl"]
+          AC_CHECK_LIB(
+               [curl],
+               [curl_easy_init],
+@@ -143,17 +143,17 @@ AC_ARG_WITH([libcurl-dir],
+ AC_ARG_WITH([uriparser-dir],
+  [AS_HELP_STRING([--with-uriparser-dir],
+ 				 [enable support for path segments using uriparser])],
+- [uriparserdir="$withval"],
+- [with_uriparserdir=no])
++ [],
++ [with_uriparser_dir=no])
+           
+  dnl CFLAGS="$CFLAGS -Wall -I$uriparserdir/include"
+  dnl CPPFLAGS="$CPPFLAGS -I$uriparser/include"
+  dnl LDFLAGS="$LDFLAGS -L$uriparserdir/lib -luriparser"
+ 
+   AS_IF(
+-        [test "x$with_uriparserdir" != xno],
+-        [[CFLAGS="$CFLAGS -I$uriparserdir/include"]
+-         [LDFLAGS="$LDFLAGS -L$uriparserdir/lib -luriparser"]
++        [test "$with_uriparser_dir" != "no"],
++        [[CFLAGS="$CFLAGS -I$with_uriparser_dir/include"]
++         [LDFLAGS="$LDFLAGS -L$with_uriparser_dir/lib -luriparser"]
+          AC_CHECK_LIB(
+               [uriparser], 
+               [uriParseUriA],
+@@ -170,13 +170,13 @@ AC_ARG_WITH([uriparser-dir],
+ AC_ARG_WITH([libcoap-dir],
+  [AS_HELP_STRING([--with-libcoap-dir],
+ 				 [enable support for ESToCoAP using libcoap library])],
+- [libcoapdir="$withval"],
+- [with_libcoapdir=no])          
++ [],
++ [with_libcoap_dir=no])
+ 
+   AS_IF(
+-        [test "x$with_libcoapdir" != xno],
+-        [[CFLAGS="$CFLAGS -I$libcoapdir/include"]
+-         [LDFLAGS="$LDFLAGS -L$libcoapdir/lib -lcoap-2-openssl"]
++        [test "$with_libcoap_dir" != "no"],
++        [[CFLAGS="$CFLAGS -I$with_libcoap_dir/include"]
++         [LDFLAGS="$LDFLAGS -L$with_libcoap_dir/lib -lcoap-2-openssl"]
+          AC_CHECK_LIB(
+               [coap-2-openssl], 
+               [coap_startup],
+-- 
+2.17.1
+
diff --git a/package/libest/Config.in b/package/libest/Config.in
new file mode 100644
index 0000000000..2fc7fba421
--- /dev/null
+++ b/package/libest/Config.in
@@ -0,0 +1,41 @@
+comment "libest needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_LIBEST
+	bool "libest"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENSSL
+	help
+	  libest is a C implementation of RFC 7030 (Enrollment over
+	  Secure Transport).
+
+	  It can be used to provision public key certificates from
+	  a certificate authority (CA) or registration authority (RA)
+	  to end-user devices and network infrastructure devices.
+
+	  https://github.com/cisco/libest
+
+if BR2_PACKAGE_LIBEST
+
+config BR2_PACKAGE_LIBEST_BRSKI
+	bool "BRSKI support"
+
+config BR2_PACKAGE_LIBEST_WITH_LIBCOAP_BUGGED
+	bool
+	default y if BR2_PACKAGE_LIBCOAP
+
+comment "libest support for libcoap is bugged"
+	depends on BR2_PACKAGE_LIBEST_WITH_LIBCOAP_BUGGED
+
+config BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY_WITH_OPENJDK_BUGGED
+	bool
+	default y if BR2_PACKAGE_OPENJDK
+
+comment "libest support for client-only mode w/ openjdk is bugged"
+	depends on BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY_WITH_OPENJDK_BUGGED
+
+config BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY
+	bool "client-only mode"
+	depends on !BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY_WITH_OPENJDK_BUGGED
+
+endif # BR2_PACKAGE_LIBEST
diff --git a/package/libest/libest.hash b/package/libest/libest.hash
new file mode 100644
index 0000000000..c902a9568f
--- /dev/null
+++ b/package/libest/libest.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256  324b3a2b16cd14ea4234d75fa90f08b29509bac9cd3795c44268e22f906ee0ad  libest-3.2.0.tar.gz
+sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
new file mode 100644
index 0000000000..3b7f384f77
--- /dev/null
+++ b/package/libest/libest.mk
@@ -0,0 +1,109 @@
+################################################################################
+#
+# libest
+#
+################################################################################
+
+LIBEST_VERSION = 3.2.0
+LIBEST_SITE = $(call github,cisco,libest,r$(LIBEST_VERSION))
+LIBEST_LICENSE = MIT
+LIBEST_LICENSE_FILES = LICENSE
+LIBEST_INSTALL_STAGING = YES
+LIBEST_AUTORECONF = YES
+LIBEST_DEPENDENCIES = openssl
+LIBEST_CONF_OPTS = \
+	--with-ssl-dir=$(STAGING_DIR)/usr \
+	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
+	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
+	--disable-examples
+
+#	--enable-examples \
+#	--enable-silent-rules \
+
+# Specifying both `--enable-client-only` and `--enable-jni` configuration options
+# will cause compilation error:
+#
+# $ make
+# [--snip--]
+# Making all in src
+# Making all in est
+#   CC       est.lo
+#   CC       est_ossl_util.lo
+#   CC       est_client_proxy.lo
+#   CC       est_client.lo
+#   CC       est_client_http.lo
+#   CC       multipart_parser.lo
+#   CC       jsmn.lo
+#   CCLD     libest_client.la
+# make[4]: Nothing to be done for 'all-am'.
+# Making all in java/jni
+# make[3]: *** No rule to make target '../../src/est/libest.la', needed by 'libjest.la'.  Stop.
+
+ifeq ($(BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY_WITH_OPENJDK_BUGGED),y)
+LIBEST_CONF_OPTS += --disable-client-only
+else
+ifeq ($(BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY),y)
+LIBEST_CONF_OPTS += --enable-client-only
+else
+LIBEST_CONF_OPTS += --disable-client-only
+endif # BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY
+endif # BR2_PACKAGE_LIBEST_MODE_CLIENT_ONLY_WITH_OPENJDK_BUGGED
+
+ifeq ($(BR2_PACKAGE_OPENJDK),y)
+LIBEST_MAKE_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
+LIBEST_CONF_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
+LIBEST_CONF_OPTS += --enable-jni
+LIBEST_DEPENDENCIES += openjdk
+else
+LIBEST_CONF_OPTS += --disable-jni
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBEST_CONF_OPTS += --with-libcurl-dir=$(STAGING_DIR)/usr
+LIBEST_DEPENDENCIES += libcurl
+else
+LIBEST_CONF_OPTS += --without-libcurl-dir
+endif
+
+ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
+LIBEST_CONF_OPTS += --with-uriparser-dir=$(STAGING_DIR)/usr
+LIBEST_DEPENDENCIES += liburiparser
+else
+LIBEST_CONF_OPTS += --without-uriparser-dir
+endif
+
+ifeq ($(BR2_PACKAGE_SAFECLIB),y)
+LIBEST_CONF_OPTS += --with-system-libsafec
+LIBEST_DEPENDENCIES += safeclib
+else
+LIBEST_CONF_OPTS += --without-system-libsafec
+endif
+
+# File est/est_server_coap.c fails to compile when the configuration
+# option `--with-libcoap-dir` is set:
+#
+# $ make
+# [--snip--]
+# est_server_coap.c:2658:25: error: 'COAP_PKI_KEY_OSSL' undeclared (first
+# use in this function); did you mean 'COAP_PKI_KEY_ASN1'?
+#  2658 |     dtls_key.key_type = COAP_PKI_KEY_OSSL;
+
+ifeq ($(BR2_PACKAGE_LIBEST_WITH_LIBCOAP_BUGGED),y)
+LIBEST_CONF_OPTS += --without-libcoap-dir
+else
+ifeq ($(BR2_PACKAGE_LIBCOAP),y)
+LIBEST_CONF_OPTS += --with-libcoap-dir=$(STAGING_DIR)/usr
+LIBEST_DEPENDENCIES += libcoap
+else
+LIBEST_CONF_OPTS += --without-libcoap-dir
+endif # BR2_PACKAGE_LIBCOAP
+endif # BR2_PACKAGE_LIBEST_WITH_LIBCOAP_BUGGED
+
+define LIBEST_INSTALL_PC
+	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
+			$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
+endef
+
+LIBEST_POST_INSTALL_STAGING_HOOKS += LIBEST_INSTALL_PC
+
+$(eval $(autotools-package))
diff --git a/package/libest/libest.pc b/package/libest/libest.pc
new file mode 100644
index 0000000000..166240f9d1
--- /dev/null
+++ b/package/libest/libest.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: libest
+Description: implementation of RFC 7030 (Enrollment over Secure Transport) 
+Version: 2.1.0
+Libs: -lest
+Cflags: -I${includedir}/est
-- 
2.27.0
