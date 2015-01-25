From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 20:09:06 +0100
Subject: [Buildroot] [PATCH] package/openldap: new package
Message-ID: <1422212946-14460-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Bender <codehero@gmail.com>

Signed-off-by: David Bender <codehero@gmail.com>
[yann.morin.1998 at free.fr:
  - remove ldaps config option, use build-time dependencies
  - add dependencies against openssl/gnutls/libnss as appropriate
  - fix mis-detected tls support when openssl is enabled
  - fix strip at install time
  - cleanup configure arguments
  - fix help entry
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                           |  1 +
 package/openldap/0001-fix_cross_strip.patch | 74 +++++++++++++++++++++++++++++
 package/openldap/0002-fix-bignum.patch      | 38 +++++++++++++++
 package/openldap/Config.in                  |  9 ++++
 package/openldap/openldap.mk                | 58 ++++++++++++++++++++++
 5 files changed, 180 insertions(+)
 create mode 100644 package/openldap/0001-fix_cross_strip.patch
 create mode 100644 package/openldap/0002-fix-bignum.patch
 create mode 100644 package/openldap/Config.in
 create mode 100644 package/openldap/openldap.mk

diff --git a/package/Config.in b/package/Config.in
index 0f6addc..c5852b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -873,6 +873,7 @@ menu "Networking"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
 	source "package/omniorb/Config.in"
+	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
diff --git a/package/openldap/0001-fix_cross_strip.patch b/package/openldap/0001-fix_cross_strip.patch
new file mode 100644
index 0000000..ed4964e
--- /dev/null
+++ b/package/openldap/0001-fix_cross_strip.patch
@@ -0,0 +1,74 @@
+Fix stripping when cross-compiling
+
+Probably-Signed-off-by: Dave Bender <bender@benegon.com>
+[yann.morin.1998 at free.fr: patch was made by Dave, but he
+ forgot his SoB line, so I added it]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -rupN openldap-2.4.40/build/shtool openldap-2.4.40-br/build/shtool
+--- openldap-2.4.40/build/shtool	2014-09-18 21:48:49.000000000 -0400
++++ openldap-2.4.40-br/build/shtool	2015-01-21 13:21:35.689829372 -0500
+@@ -981,7 +981,7 @@ install )
+             if [ ".$opt_t" = .yes ]; then
+                 echo "strip $dsttmp" 1>&2
+             fi
+-            strip $dsttmp || shtool_exit $?
++            $STRIP $dsttmp || shtool_exit $?
+         fi
+         if [ ".$opt_o" != . ]; then
+             if [ ".$opt_t" = .yes ]; then
+diff -rupN openldap-2.4.40/build/top.mk openldap-2.4.40-br/build/top.mk
+--- openldap-2.4.40/build/top.mk	2014-09-18 21:48:49.000000000 -0400
++++ openldap-2.4.40-br/build/top.mk	2015-01-21 13:23:41.027810097 -0500
+@@ -59,7 +59,7 @@ INSTALL_PROGRAM = $(INSTALL)
+ INSTALL_DATA = $(INSTALL) -m 644
+ INSTALL_SCRIPT = $(INSTALL)
+ 
+-STRIP = -s
++STRIP_OPTS = -s
+ 
+ LINT = lint
+ 5LINT = 5lint
+diff -rupN openldap-2.4.40/clients/tools/Makefile.in openldap-2.4.40-br/clients/tools/Makefile.in
+--- openldap-2.4.40/clients/tools/Makefile.in	2014-09-18 21:48:49.000000000 -0400
++++ openldap-2.4.40-br/clients/tools/Makefile.in	2015-01-21 13:23:35.827727946 -0500
+@@ -120,7 +120,7 @@ install-local:	FORCE
+ 	-$(MKDIR) $(DESTDIR)$(bindir)
+ 	@(								\
+ 	    for prg in $(PROGRAMS); do					\
+-		$(LTINSTALL) $(INSTALLFLAGS) $(STRIP) -m 755 $$prg$(EXEEXT)	\
++		$(LTINSTALL) $(INSTALLFLAGS) $(STRIP_OPTS) -m 755 $$prg$(EXEEXT)	\
+ 		    $(DESTDIR)$(bindir);				\
+ 	    done							\
+ 	)
+diff -rupN openldap-2.4.40/configure.in openldap-2.4.40-br/configure.in
+--- openldap-2.4.40/configure.in	2014-09-18 21:48:49.000000000 -0400
++++ openldap-2.4.40-br/configure.in	2015-01-16 15:50:48.874816786 -0500
+@@ -669,6 +669,15 @@ if test -z "${AR}"; then
+ 	fi
+ fi
+ 
++if test -z "${STRIP}"; then
++	AC_CHECK_PROGS(STRIP,strip,missing)
++
++	if test "${STRIP}" = "missing" ; then
++		AC_MSG_ERROR([Unable to locate strip(1) or suitable replacement.  Check PATH or set STRIP.])
++	fi
++fi
++
++
+ AC_LIBTOOL_WIN32_DLL
+ AC_LIBTOOL_DLOPEN
+ AC_PROG_LIBTOOL
+diff -rupN openldap-2.4.40/servers/slapd/Makefile.in openldap-2.4.40-br/servers/slapd/Makefile.in
+--- openldap-2.4.40/servers/slapd/Makefile.in	2015-01-16 15:04:52.507473256 -0500
++++ openldap-2.4.40-br/servers/slapd/Makefile.in	2015-01-16 15:05:02.299627229 -0500
+@@ -378,7 +378,7 @@ install-local-srv: install-slapd install
+ install-slapd: FORCE
+ 	-$(MKDIR) $(DESTDIR)$(libexecdir)
+ 	-$(MKDIR) $(DESTDIR)$(localstatedir)/run
+-	$(LTINSTALL) $(INSTALLFLAGS) $(STRIP) -m 755 \
++	$(LTINSTALL) $(INSTALLFLAGS) $(STRIP_OPTS) -m 755 \
+ 		slapd$(EXEEXT) $(DESTDIR)$(libexecdir)
+ 	@for i in $(SUBDIRS); do \
+ 	    if test -d $$i && test -f $$i/Makefile ; then \
diff --git a/package/openldap/0002-fix-bignum.patch b/package/openldap/0002-fix-bignum.patch
new file mode 100644
index 0000000..d3dc88f
--- /dev/null
+++ b/package/openldap/0002-fix-bignum.patch
@@ -0,0 +1,38 @@
+configure: correctly detect bignum
+
+Building with bignum is currently not possible, since we're checking
+ol_with_tls against a value it is never assigned in any case.
+
+Since bignum is from openssl, and openssl is the preferred TLS
+implementation, if the bignum headers are found, it means we do have
+TLS and it is opensl.
+
+So, keep the check for the bignum header, but check against ol_link_tls
+which means that openssl is enabled when we find the bignum headers.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
+--- openldap-2.4.40.orig/configure	2014-09-19 03:48:49.000000000 +0200
++++ openldap-2.4.40/configure	2015-01-25 18:44:54.216879362 +0100
+@@ -23478,7 +23478,7 @@
+ 
+ 	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
+ 		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
+-		test "$ol_with_tls" = "found" ; then
++		test "$ol_link_tls" = "yes" ; then
+ 		ol_with_mp=bignum
+ 
+ $as_echo "#define USE_MP_BIGNUM 1" >>confdefs.h
+diff -durN openldap-2.4.40.orig/configure.in openldap-2.4.40/configure.in
+--- openldap-2.4.40.orig/configure.in	2014-09-19 03:48:49.000000000 +0200
++++ openldap-2.4.40/configure.in	2015-01-25 18:44:37.628676446 +0100
+@@ -2367,7 +2367,7 @@
+ 	AC_CHECK_HEADERS(openssl/crypto.h)
+ 	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
+ 		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
+-		test "$ol_with_tls" = "found" ; then
++		test "$ol_link_tls" = "yes" ; then
+ 		ol_with_mp=bignum
+ 		AC_DEFINE(USE_MP_BIGNUM,1,[define to use OpenSSL BIGNUM for MP])
+ 	elif test $ol_with_mp = bignum ; then
diff --git a/package/openldap/Config.in b/package/openldap/Config.in
new file mode 100644
index 0000000..eb1634b
--- /dev/null
+++ b/package/openldap/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENLDAP
+	bool "openldap"
+	help
+	  OpenLDAP Software is an open source implementation of
+	  the Lightweight Directory Access Protocol.
+
+	  This only installs client-side support.
+
+	  http://www.openldap.org/
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
new file mode 100644
index 0000000..332b2c4
--- /dev/null
+++ b/package/openldap/openldap.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# openldap
+#
+################################################################################
+
+OPENLDAP_VERSION = 2.4.40
+OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
+OPENLDAP_SITE = ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release
+OPENLDAP_LICENSE = OpenLDAP Public License
+OPENLDAP_LICENSE_FILES = LICENSE
+OPENLDAP_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENLDAP_TLS = openssl
+OPENLDAP_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+OPENLDAP_TLS = gnutls
+OPENLDAP_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+OPENLDAP_TLS = moznss
+OPENLDAP_DEPENDENCIES += libnss
+OPENLDAP_CPPFLAGS = \
+	-I$(STAGING_DIR)/usr/include/nss \
+	-I$(STAGING_DIR)/usr/include/nspr
+else
+OPENLDAP_TLS = no
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENLDAP_MP = bignum
+OPENLDAP_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GMP),y)
+OPENLDAP_MP = gmp
+OPENLDAP_DEPENDENCIES += gmp
+else
+OPENLDAP_MP = longlong
+endif
+
+OPENLDAP_CONF_ENV = ac_cv_func_memcmp_working=yes
+
+OPENLDAP_CONF_OPTS += \
+	--enable-syslog \
+	--disable-proctitle \
+	--disable-slapd \
+	--with-yielding-select \
+	--sysconfdir=/etc \
+	--enable-dynamic=$(if $(BR2_STATIC_LIBS),no,yes) \
+	--with-tls=$(OPENLDAP_TLS) \
+	--with-mp=$(OPENLDAP_MP) \
+	CPPFLAGS="$(TARGET_CPPFLAGS) $(OPENLDAP_CPPFLAGS)"
+
+# Somehow, ${STRIP} does not percolates through to the shtool script
+# used to install the executables; thus, that script tries to run the
+# executable it is supposed to install, resulting in an error.
+OPENLDAP_MAKE_ENV = STRIP="$(TARGET_STRIP)"
+
+$(eval $(autotools-package))
-- 
1.9.1
