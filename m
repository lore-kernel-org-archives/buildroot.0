From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:48:58 +0100
Subject: [Buildroot] [git commit] package/libpagekite: new package
Message-ID: <20181216114536.3CA818D456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c952178b7b0779758981736fc2878853325d588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpagekite is a C implementation of the backend of the PageKite relay
protocol. It allows external access to embedded devices without public
IP address.

There is a bundled version of libev but we prefer to use the global
libev library.

Although the configure script has a --without-openssl option, it
doesn't actually build without openssl.

Patch 0001-configure.ac-fix-handling-of-with.patch is needed because
we want to explicitly pass --with and --without options, even if they
are the default. The way the AC_ARG_WITH macros were used, --with and
--without both had the effect of enabling the option.

Patch 0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch is
not needed for Buildroot, but it is part of the same upstream PR and
would generate a conflict for the next patch.

Patch 0003-configure.ac-use-pkg-config-for-openssl.patch is needed to
pass -lz (needed by openssl) in static compilation.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
[Thomas:
 - As noticed by Romain Naour, fix the prompt of the package in the
   Config.in
 - Add entry to DEVELOPERS file
 - Drop the dependency on BR2_bfin, since this architecture has been
   dropped from Buildroot.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../0001-configure.ac-fix-handling-of-with.patch   |  76 ++++++++++++
 ...re.ac-use-AS_HELP_STRING-for-with-openssl.patch |  28 +++++
 ...3-configure.ac-use-pkg-config-for-openssl.patch | 137 +++++++++++++++++++++
 package/libpagekite/Config.in                      |  24 ++++
 package/libpagekite/libpagekite.hash               |   7 ++
 package/libpagekite/libpagekite.mk                 |  29 +++++
 8 files changed, 303 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4192681bf8..d6d9565341 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -196,6 +196,7 @@ F:	package/dehydrated/
 F:	package/freescale-imx/firmware-imx/
 F:	package/freescale-imx/imx-lib/
 F:	package/gstreamer/gst-fsl-plugins/
+F:	package/libpagekite/
 F:	package/lua-bit32/
 F:	package/owfs/
 F:	package/python-bottle/
diff --git a/package/Config.in b/package/Config.in
index bdc63f71f1..c3e069134e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1558,6 +1558,7 @@ menu "Networking"
 	source "package/liboauth/Config.in"
 	source "package/liboping/Config.in"
 	source "package/libosip2/Config.in"
+	source "package/libpagekite/Config.in"
 	source "package/libpcap/Config.in"
 	source "package/libpjsip/Config.in"
 	source "package/librsync/Config.in"
diff --git a/package/libpagekite/0001-configure.ac-fix-handling-of-with.patch b/package/libpagekite/0001-configure.ac-fix-handling-of-with.patch
new file mode 100644
index 0000000000..342b7d50a3
--- /dev/null
+++ b/package/libpagekite/0001-configure.ac-fix-handling-of-with.patch
@@ -0,0 +1,76 @@
+From dbb7ea56148949412b18770967022455f3e5cb63 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 16 Feb 2018 11:45:21 +0100
+Subject: [PATCH] configure.ac: fix handling of --with-*
+
+The 'action-if-given' argument of AC_ARG_WITH is executed whenever the
+--with- or --without- option is given. Setting e.g. with_tests=yes in
+that branch causes the argument '--without-tests' to *enable* the tests
+instead of disabling them.
+
+In most cases, the third and fourth argument can simply be skipped
+since they are optional. We only need them in the cases where we use a
+different variable than with_foo, or where we want to default to yes
+instead of defaulting to empty.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+
+Upstream status: pull request sent:
+  https://github.com/pagekite/libpagekite/pull/49
+---
+ configure.ac | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index aa4eb9c..130752a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,18 +34,15 @@ AC_ARG_WITH(openssl,[  --with-openssl=DIR    Use optional openssl libs and inclu
+ 
+ AC_ARG_WITH(tests,
+ 	[AS_HELP_STRING([--with-tests],
+-		[Compile libpagekite unit tests])],
+-		[with_tests=yes], [])
++		[Compile libpagekite unit tests])])
+ 
+ AC_ARG_WITH(debug-traces,
+ 	[AS_HELP_STRING([--with-debug-traces],
+-		[Compile libpagekite debug function traces])],
+-		[with_debug_traces=yes], [])
++		[Compile libpagekite debug function traces])])
+ 
+ AC_ARG_WITH(debug-canaries,
+ 	[AS_HELP_STRING([--with-debug-canaries],
+-		[Compile libpagekite debug memory canaries])],
+-		[with_debug_canaries=yes], [])
++		[Compile libpagekite debug memory canaries])])
+ 
+ AC_ARG_WITH(lua,
+ 	[AS_HELP_STRING([--without-lua],
+@@ -55,7 +52,7 @@ AC_ARG_WITH(lua,
+ AC_ARG_WITH(os-libev,
+ 	[AS_HELP_STRING([--without-os-libev],
+ 		[Use embedded libev, not the OS-provided library])],
+-		[use_libev=no], [])
++		[use_libev="$withval"], [])
+ 
+ AC_ARG_WITH(ipv6,
+ 	[AS_HELP_STRING([--without-ipv6],
+@@ -70,12 +67,12 @@ AC_ARG_WITH(java,
+ AC_ARG_WITH(agpl-relay,
+ 	[AS_HELP_STRING([--with-agpl-relay],
+ 		[Compile libpagekite relay support (AGPLv3 code)])],
+-		[with_relay=yes], [with_relay=no])
++		[with_relay="$withval"], [with_relay=no])
+ 
+ AC_ARG_WITH(ds-logfmt,
+ 	[AS_HELP_STRING([--with-ds-logfmt],
+ 		[Compile libpagekite with DigitalSTROM log format.])],
+-		[with_ds_logfmt=yes], [with_ds_logfmt=no])
++		[with_ds_logfmt="$withval"], [with_ds_logfmt=no])
+ 
+ 
+ # Checks for programs.
+-- 
+2.15.1
+
diff --git a/package/libpagekite/0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch b/package/libpagekite/0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch
new file mode 100644
index 0000000000..f72127b117
--- /dev/null
+++ b/package/libpagekite/0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch
@@ -0,0 +1,28 @@
+From cb20efae0e2ca86dd48c603b61d9c20225ebcd3d Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 16 Feb 2018 12:06:28 +0100
+Subject: [PATCH] configure.ac: use AS_HELP_STRING for --with-openssl
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 130752a..4874c0b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,7 +17,9 @@ use_openssl="yes"
+ use_libev="yes"
+ 
+ specialssldir=""
+-AC_ARG_WITH(openssl,[  --with-openssl=DIR    Use optional openssl libs and includes from [DIR]/lib/ and [DIR]/include/openssl/],
++AC_ARG_WITH(openssl,
++	[AS_HELP_STRING([--with-openssl=DIR],
++		[Use optional openssl libs and includes from [DIR]/lib/ and [DIR]/include/openssl/])],
+ [  case "$with_openssl" in
+   yes)
+   ;;
+-- 
+2.15.1
+
diff --git a/package/libpagekite/0003-configure.ac-use-pkg-config-for-openssl.patch b/package/libpagekite/0003-configure.ac-use-pkg-config-for-openssl.patch
new file mode 100644
index 0000000000..b615d302b4
--- /dev/null
+++ b/package/libpagekite/0003-configure.ac-use-pkg-config-for-openssl.patch
@@ -0,0 +1,137 @@
+From 6a8b5ee14acee6c258bbaeb8b148ee0dd0d62d3d Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 16 Feb 2018 15:36:59 +0100
+Subject: [PATCH] configure.ac: use pkg-config for openssl
+
+It is better to use pkg-config to detect openssl if that is possible.
+pkg-config will add e.g. -lz and -ldl when needed. If pkg-config
+fails, fall back to the old approach of detecting headers and libs.
+Some of the additional openssl support (e.g. adding -ldl) is moved
+inside the non-pkg-config path.
+
+Since AC_CHECK_LIBS adds the library found to LIBS, do the same in
+the pkg-config case. Normally the Makefile.am should instead use
+OPENSSL_LIBS where needed, but this is not done consistently.
+
+When --with-openssl=DIR is given, still perform the test (both with
+pkg-config and by checking headers and libs). I.e., remove
+$specialssldir.
+
+While we're at it, simplify the headers checks by merging them into a
+single AC_CHECK_HEADERS.
+
+Note that it is (still) not an error when openssl is not found,
+although the build will then fail.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac | 67 ++++++++++++++++++++++--------------------------------------
+ 1 file changed, 24 insertions(+), 43 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4874c0b..ccab9f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,7 +16,6 @@ AC_CANONICAL_HOST
+ use_openssl="yes"
+ use_libev="yes"
+ 
+-specialssldir=""
+ AC_ARG_WITH(openssl,
+ 	[AS_HELP_STRING([--with-openssl=DIR],
+ 		[Use optional openssl libs and includes from [DIR]/lib/ and [DIR]/include/openssl/])],
+@@ -27,7 +26,6 @@ AC_ARG_WITH(openssl,
+     use_openssl="no"
+   ;;
+   *)
+-    specialssldir="$with_openssl"
+     LDFLAGS="$LDFLAGS -L$with_openssl/lib"
+     CPPFLAGS="-I$with_openssl/include $CPPFLAGS"
+   ;;
+@@ -139,59 +137,42 @@ AC_FUNC_LSTAT_FOLLOWS_SLASHED_SYMLINK
+ AC_FUNC_REALLOC
+ AC_CHECK_FUNCS([clock_gettime dup2 gethostbyname gettimeofday inet_ntoa malloc memmove memset select socket strcasecmp strchr strdup strerror strncasecmp strrchr uname sched_yield pthread_yield pthread_yield_np])
+ 
+-# OpenSSL requires dlopen on some platforms
+-AC_SEARCH_LIBS(dlopen, dl)
+-
+ # If they didn't specify it, we try to find it
+-if test "$use_openssl" = "yes" -a -z "$specialssldir" ; then
+-	AC_CHECK_HEADER(openssl/ssl.h,,
++if test "$use_openssl" = "yes" ; then
++	# First try pkg-config; fall back to headers/libs check
++	PKG_CHECK_MODULES([OPENSSL], [openssl >= 1.0.0],
++		[LIBS="$OPENSSL_LIBS $LIBS"],
++		[AC_CHECK_HEADERS([openssl/ssl.h openssl/err.h openssl/rand.h],,
+ 			[ use_openssl="no"
+-        AC_MSG_WARN([Failed to find openssl/ssl.h so OpenSSL will not be used. 
+-	If it is installed you can try the --with-openssl=DIR argument]) ])
+-
+-	if test "$use_openssl" = "yes"; then
+-	     AC_CHECK_HEADER(openssl/err.h,,
+-	         [ use_openssl="no"
+-		     AC_MSG_WARN([Failed to find openssl/err.h so OpenSSL will not be used.
+-		      If it is installed you can try the --with-openssl=DIR argument]) ])
+-	fi
+-
+-	if test "$use_openssl" = "yes"; then
+-		   AC_CHECK_HEADER(openssl/rand.h,,
+-		       [ use_openssl="no"
+-		         AC_MSG_WARN([Failed to find openssl/rand.h so OpenSSL will not be used.
+-			  If it is installed you can try the --with-openssl=DIR argument]) ])
+-	fi
+-
+-	if test "$use_openssl" = "yes"; then
+-	 AC_CHECK_LIB(crypto, BIO_int_ctrl,
+-	   [],
+-	   [ use_openssl="no"
+-	   AC_MSG_WARN([Failed to find libcrypto so OpenSSL will not be used.
+-	    If it is installed you can try the --with-openssl=DIR argument]) ])
+-	fi
+-										     
+-	if test "$use_openssl" = "yes"; then
+-	   AC_CHECK_LIB(ssl, SSL_new,
+-	   [],
+-	   [ use_openssl="no"
+-	   AC_MSG_WARN([Failed to find libssl so OpenSSL will not be used. 
++        		  AC_MSG_WARN([Failed to find openssl headers so OpenSSL will not be used. 
+ If it is installed you can try the --with-openssl=DIR argument]) ])
+-	fi
++		 if test "$use_openssl" = "yes"; then
++			AC_CHECK_LIB(crypto, BIO_int_ctrl, [],
++			[ use_openssl="no"
++			  AC_MSG_WARN([Failed to find libcrypto so OpenSSL will not be used.
++If it is installed you can try the --with-openssl=DIR argument]) ])
++		 fi
++		 if test "$use_openssl" = "yes"; then
++			AC_CHECK_LIB(ssl, SSL_new, [],
++			[ use_openssl="no"
++			  AC_MSG_WARN([Failed to find libssl so OpenSSL will not be used.
++If it is installed you can try the --with-openssl=DIR argument]) ])
++		 fi
++		 if test "$use_openssl" = "yes"; then
++			# OpenSSL requires dlopen on some platforms
++			AC_SEARCH_LIBS(dlopen, dl)
++			OPENSSL_LIBS="-lssl -lcrypto"
++		fi])
+ fi
+ 
+-OPENSSL_CFLAGS=""
+-OPENSSL_LIBS=""
+ if test "$use_openssl" = "yes"; then
+   AC_DEFINE([HAVE_OPENSSL], [1], [Define to 1 if you have OpenSSL.])
+-  OPENSSL_LIBS="-lssl -lcrypto"
+   # Define in Makefile also.
+   HAVE_OPENSSL=yes
+-  AC_SUBST(HAVE_OPENSSL)
+ fi
+ AC_SUBST([OPENSSL_CFLAGS])
+ AC_SUBST([OPENSSL_LIBS])
+-
++AC_SUBST([HAVE_OPENSSL])
+ 
+ 
+ LIBEV_CFLAGS=""
+-- 
+2.15.1
+
diff --git a/package/libpagekite/Config.in b/package/libpagekite/Config.in
new file mode 100644
index 0000000000..0ecf4f97e1
--- /dev/null
+++ b/package/libpagekite/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_LIBPAGEKITE
+	bool "libpagekite"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_OPENSSL
+	help
+	  PageKite is a protocol for dynamic, tunneled reverse proxying
+	  of arbitrary TCP byte streams. It is particularly well suited
+	  for making a HTTP server on a device without a public IP
+	  address visible to the wider Internet, but can also be used
+	  for a variety of other things, including SSH access.
+
+	  libpagekite is a tight, fast implementation of the PageKite
+	  protocol in C, suitable for high-performance or embedded
+	  applications.
+
+	  In addition to the libpagekite library, this package installs
+	  the pagekitec, sshkite and httpkite tools.
+
+	  https://pagekite.net
+	  https://github.com/pagekite/libpagekite
+
+comment "libpagekite needs a toolchain with threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpagekite/libpagekite.hash b/package/libpagekite/libpagekite.hash
new file mode 100644
index 0000000000..262adc7aab
--- /dev/null
+++ b/package/libpagekite/libpagekite.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  df95bfe95c04b6908e835e13444c1c1883765926f1265e0d2223c42d3c59a4c2  libpagekite-v0.91.171102.tar.gz
+
+# License files, locally calculated
+sha256  ba443b9c9d4273d06aae3e147e9ad1ec199cc9c23455f486a039536d47f57eed  doc/COPYING.md
+sha256  4a271d0bb6bb6e0bac880efddb46da73e6df3dcf0d9ca08a945a232f8ab882ef  doc/LICENSE-2.0.txt
+sha256  8e0f770cabe772d67d36469f6bf413afd2dcfa6ac37acfc65f770cf3a134106d  doc/AGPLv3.txt
diff --git a/package/libpagekite/libpagekite.mk b/package/libpagekite/libpagekite.mk
new file mode 100644
index 0000000000..2c143ba022
--- /dev/null
+++ b/package/libpagekite/libpagekite.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libpagekite
+#
+################################################################################
+
+LIBPAGEKITE_VERSION = v0.91.171102
+LIBPAGEKITE_SITE = $(call github,pagekite,libpagekite,$(LIBPAGEKITE_VERSION))
+
+# pkrelay is AGPL-3.0+ but is not built
+LIBPAGEKITE_LICENSE = Apache-2.0 or AGPL-3.0+
+LIBPAGEKITE_LICENSE_FILES = doc/COPYING.md doc/LICENSE-2.0.txt doc/AGPLv3.txt
+
+LIBPAGEKITE_DEPENDENCIES = host-pkgconf libev openssl
+LIBPAGEKITE_INSTALL_STAGING = YES
+
+# Sources from git, no configure included
+# 0001-configure.ac-fix-handling-of-with-os-libev.patch touches configure.ac
+LIBPAGEKITE_AUTORECONF = YES
+
+LIBPAGEKITE_CONF_OPTS = \
+	--with-openssl \
+	--without-tests \
+	--with-os-libev \
+	--without-java \
+	--without-agpl-relay \
+	--without-ds-logfmt
+
+$(eval $(autotools-package))
