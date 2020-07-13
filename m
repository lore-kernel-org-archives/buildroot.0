From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Mon, 13 Jul 2020 06:23:13 -0600
Subject: [Buildroot] [PATCH 1/1] package/libest: add package
Message-ID: <20200713122313.40333-1-aleksandr.o.makarov@gmail.com>
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
Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 ...Link-to-system-libsafec-if-available.patch | 107 ++++++++++++++++++
 ...i-only-if-configured-with-enable-jni.patch |  47 ++++++++
 .../0003-Ditch-examples-compilation.patch     |  47 ++++++++
 package/libest/Config.in                      |  32 ++++++
 package/libest/libest.hash                    |   3 +
 package/libest/libest.mk                      |  40 +++++++
 package/libest/libest.pc                      |  10 ++
 9 files changed, 290 insertions(+)
 create mode 100644 package/libest/0001-Link-to-system-libsafec-if-available.patch
 create mode 100644 package/libest/0002-Compile-java-jni-only-if-configured-with-enable-jni.patch
 create mode 100644 package/libest/0003-Ditch-examples-compilation.patch
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
index aafaa312a1..df71e1b677 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1683,6 +1683,7 @@ menu "Networking"
 	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
+	source "package/libest/Config.in"
 	source "package/libeXosip2/Config.in"
 	source "package/libfcgi/Config.in"
 	source "package/libgsasl/Config.in"
diff --git a/package/libest/0001-Link-to-system-libsafec-if-available.patch b/package/libest/0001-Link-to-system-libsafec-if-available.patch
new file mode 100644
index 0000000000..9e6023b838
--- /dev/null
+++ b/package/libest/0001-Link-to-system-libsafec-if-available.patch
@@ -0,0 +1,107 @@
+From 05d55149488ca1055475d7a8de1bbd523fe93d6c Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Sun, 12 Jul 2020 19:43:43 +0000
+Subject: [PATCH] Link to system libsafec if available
+
+Run `./configure --with-system-libsafec` and the configuration
+program will search for and, if found, link against the libsafec
+library installed in the system.
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ Makefile.am  | 12 ++++++++----
+ configure.ac | 46 ++++++++++++++++++++++++++++++++++------------
+ 2 files changed, 42 insertions(+), 16 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 10e38fd..82354d6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,9 +1,13 @@
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-if ENABLE_CLIENT_ONLY 
+-SUBDIRS = safe_c_stub src java/jni example/client example/client-simple example/client-brski
+-else 
+-SUBDIRS = safe_c_stub src java/jni example/client example/client-simple example/server example/proxy example/client-brski
++if ! WITH_SYSTEM_LIBSAFEC
++builtin_libsafec = safe_c_stub
+ endif
+ 
++if ! ENABLE_CLIENT_ONLY
++examples_extra = example/server example/proxy
++endif
++
++SUBDIRS = $(builtin_libsafec) src java/jni example/client example/client-simple example/client-brski $(examples_extra)
++
+ EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
+diff --git a/configure.ac b/configure.ac
+index e02a54d..aebe3b3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,6 +15,7 @@ AM_INIT_AUTOMAKE([subdir-objects])
+ 
+ AC_PROG_CC
+ AM_PROG_CC_C_O
++PKG_PROG_PKG_CONFIG
+ LT_INIT
+ AC_CANONICAL_HOST
+ case $host in
+@@ -182,21 +183,42 @@ AC_ARG_WITH([libcoap-dir],
+              )
+         ]
+        )
+-
+-SAFEC_STUB_DIR='$(abs_top_builddir)/safe_c_stub'
+-AC_SUBST(SAFEC_STUB_DIR)
+-safecdir="$SAFEC_STUB_DIR" 
+-AC_SUBST([SAFEC_DIR], "$safecdir")
+-AC_SUBST([SAFEC_CFLAGS], "$safecdir/include")
+-AC_SUBST([SAFEC_LDFLAGS], "$safecdir/lib")
+-
+-CFLAGS="$CFLAGS -Wall -I$safecdir/include"
+-LDFLAGS="$LDFLAGS -L$safecdir/lib"
+-LIBS="$LIBS -lsafe_lib"
++AC_ARG_WITH(system-libsafec,
++            AS_HELP_STRING([--with-system-libsafec], [select to use libsafec installed in the system]),
++            [],
++            [with_system_libsafec="no"])
++
++AC_MSG_CHECKING(which libsafec to use)
++AM_CONDITIONAL([WITH_SYSTEM_LIBSAFEC], [test "$with_system_libsafec" = "yes"])
++AM_COND_IF([WITH_SYSTEM_LIBSAFEC], AC_MSG_RESULT([system]), AC_MSG_RESULT([built-in]))
++AM_COND_IF([WITH_SYSTEM_LIBSAFEC], [
++            PKG_CHECK_MODULES([libsafec], [libsafec])
++            LIBS="$LIBS $libsafec_LIBS"
++            CFLAGS="$CFLAGS $libsafec_CFLAGS"
++            CPPFLAGS="$CPPFLAGS $libsafec_CFLAGS"
++            AC_CHECK_HEADER(safe_lib.h,,AC_MSG_WARN(missing header: safe_lib.h))
++            AC_CHECK_HEADER(safe_lib_errno.h,,AC_MSG_WARN(missing header: safe_lib_errno.h))
++            AC_CHECK_HEADER(safe_mem_lib.h,,AC_MSG_WARN(missing header: safe_mem_lib.h))
++            AC_CHECK_HEADER(safe_str_lib.h,,AC_MSG_WARN(missing header: safe_str_lib.h))
++],[
++            SAFEC_STUB_DIR='$(abs_top_builddir)/safe_c_stub'
++            AC_SUBST(SAFEC_STUB_DIR)
++            safecdir="$SAFEC_STUB_DIR"
++            AC_SUBST([SAFEC_DIR], "$safecdir")
++            AC_SUBST([SAFEC_CFLAGS], "$safecdir/include")
++            AC_SUBST([SAFEC_LDFLAGS], "$safecdir/lib")
++            CFLAGS="$CFLAGS -Wall -I$safecdir/include"
++            LDFLAGS="$LDFLAGS -L$safecdir/lib"
++            LIBS="$LIBS -lsafe_lib"
++])
+ 
+ AC_PREFIX_DEFAULT([/usr/local/est])
+ 
+ cp confdefs.h est_config.h
+ 
+-AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile java/jni/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
++AC_CONFIG_FILES([Makefile version java/jni/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
++AM_COND_IF([WITH_SYSTEM_LIBSAFEC],
++           [],
++           [AC_CONFIG_FILES([safe_c_stub/Makefile safe_c_stub/lib/Makefile])])
++
+ AC_OUTPUT
+-- 
+2.17.1
+
diff --git a/package/libest/0002-Compile-java-jni-only-if-configured-with-enable-jni.patch b/package/libest/0002-Compile-java-jni-only-if-configured-with-enable-jni.patch
new file mode 100644
index 0000000000..22ca7c794f
--- /dev/null
+++ b/package/libest/0002-Compile-java-jni-only-if-configured-with-enable-jni.patch
@@ -0,0 +1,47 @@
+From d4f742d8b1e9ffd8f686cc18d4602c04b2824897 Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Sun, 12 Jul 2020 20:27:37 +0000
+Subject: [PATCH] Compile java/jni only if configured with --enable-jni
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 5 +++--
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 82354d6..2aa4892 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -8,6 +8,10 @@ if ! ENABLE_CLIENT_ONLY
+ examples_extra = example/server example/proxy
+ endif
+ 
+-SUBDIRS = $(builtin_libsafec) src java/jni example/client example/client-simple example/client-brski $(examples_extra)
++if ENABLE_JNI
++libest_jni = java/jni
++endif
++
++SUBDIRS = $(builtin_libsafec) src $(libest_jni) example/client example/client-simple example/client-brski $(examples_extra)
+ 
+ EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
+diff --git a/configure.ac b/configure.ac
+index aebe3b3..e76ba35 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -216,9 +216,10 @@ AC_PREFIX_DEFAULT([/usr/local/est])
+ 
+ cp confdefs.h est_config.h
+ 
+-AC_CONFIG_FILES([Makefile version java/jni/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
++AC_CONFIG_FILES([Makefile version src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
+ AM_COND_IF([WITH_SYSTEM_LIBSAFEC],
+            [],
+            [AC_CONFIG_FILES([safe_c_stub/Makefile safe_c_stub/lib/Makefile])])
+-
++AM_COND_IF([ENABLE_JNI],
++           [AC_CONFIG_FILES([java/jni/Makefile])])
+ AC_OUTPUT
+-- 
+2.17.1
+
diff --git a/package/libest/0003-Ditch-examples-compilation.patch b/package/libest/0003-Ditch-examples-compilation.patch
new file mode 100644
index 0000000000..59d54b3a63
--- /dev/null
+++ b/package/libest/0003-Ditch-examples-compilation.patch
@@ -0,0 +1,47 @@
+From 746aeaedd22e8f716b85b31c96059d1d54ecbb46 Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Sun, 12 Jul 2020 20:34:33 +0000
+Subject: [PATCH] Ditch examples compilation
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ Makefile.am  | 6 +-----
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2aa4892..2d221d1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4,14 +4,10 @@ if ! WITH_SYSTEM_LIBSAFEC
+ builtin_libsafec = safe_c_stub
+ endif
+ 
+-if ! ENABLE_CLIENT_ONLY
+-examples_extra = example/server example/proxy
+-endif
+-
+ if ENABLE_JNI
+ libest_jni = java/jni
+ endif
+ 
+-SUBDIRS = $(builtin_libsafec) src $(libest_jni) example/client example/client-simple example/client-brski $(examples_extra)
++SUBDIRS = $(builtin_libsafec) src $(libest_jni)
+ 
+ EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
+diff --git a/configure.ac b/configure.ac
+index e76ba35..95f8805 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -216,7 +216,7 @@ AC_PREFIX_DEFAULT([/usr/local/est])
+ 
+ cp confdefs.h est_config.h
+ 
+-AC_CONFIG_FILES([Makefile version src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
++AC_CONFIG_FILES([Makefile version src/Makefile src/est/Makefile])
+ AM_COND_IF([WITH_SYSTEM_LIBSAFEC],
+            [],
+            [AC_CONFIG_FILES([safe_c_stub/Makefile safe_c_stub/lib/Makefile])])
+-- 
+2.17.1
+
diff --git a/package/libest/Config.in b/package/libest/Config.in
new file mode 100644
index 0000000000..e9ec18e243
--- /dev/null
+++ b/package/libest/Config.in
@@ -0,0 +1,32 @@
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
+config BR2_PACKAGE_LIBEST_LIBCURL
+	bool "libcurl support"
+	select BR2_PACKAGE_LIBCURL
+
+config BR2_PACKAGE_LIBEST_LIBURIPARSER
+	bool "liburiparser support"
+	select BR2_PACKAGE_LIBURIPARSER
+
+config BR2_PACKAGE_LIBEST_LIBSAFEC
+	bool "libsafec support"
+	select BR2_PACKAGE_SAFECLIB
+
+endif # BR2_PACKAGE_LIBEST
diff --git a/package/libest/libest.hash b/package/libest/libest.hash
new file mode 100644
index 0000000000..51dd1fccc0
--- /dev/null
+++ b/package/libest/libest.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256  324b3a2b16cd14ea4234d75fa90f08b29509bac9cd3795c44268e22f906ee0ad  r3.2.0.tar.gz
+sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
new file mode 100644
index 0000000000..5c939f96b9
--- /dev/null
+++ b/package/libest/libest.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libest
+#
+################################################################################
+
+LIBEST_VERSION = 3.2.0
+LIBEST_SOURCE = r$(LIBEST_VERSION).tar.gz
+LIBEST_SITE = https://github.com/cisco/libest/archive
+LIBEST_LICENSE = MIT
+LIBEST_LICENSE_FILES = LICENSE
+LIBEST_INSTALL_STAGING = YES
+LIBEST_AUTORECONF = YES
+LIBEST_DEPENDENCIES = openssl
+LIBEST_CONF_OPTS = --with-ssl-dir=$(STAGING_DIR)/usr \
+		$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthreads)
+
+ifeq ($(BR2_PACKAGE_LIBEST_LIBCURL),y)
+LIBEST_CONF_OPTS += --with-libcurl-dir=$(STAGING_DIR)/usr
+LIBEST_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEST_LIBURIPARSER),y)
+LIBEST_CONF_OPTS += --with-uriparser-dir=$(STAGING_DIR)/usr
+LIBEST_DEPENDENCIES += liburiparser
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEST_LIBSAFEC),y)
+LIBEST_CONF_OPTS += --with-system-libsafec
+LIBEST_DEPENDENCIES += safeclib
+endif
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
index 0000000000..8e59170baa
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
+Libs: -L${libdir} -lest
+Cflags: -I${includedir}/est
-- 
2.17.1
