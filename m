From: David Bender <codehero@gmail.com>
Date: Thu, 22 Jan 2015 14:18:54 -0500
Subject: [Buildroot] [PATCH 1/1] new package: openldap
Message-ID: <1421954334-10021-1-git-send-email-codehero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bender <codehero@gmail.com>
---
 package/Config.in                                  |    1 +
 package/openldap/Config.in                         |   17 +++++
 .../openldap/openldap-0000-fix_cross_strip.patch   |   67 ++++++++++++++++++++
 package/openldap/openldap.mk                       |   33 ++++++++++
 4 files changed, 118 insertions(+), 0 deletions(-)
 create mode 100644 package/openldap/Config.in
 create mode 100644 package/openldap/openldap-0000-fix_cross_strip.patch
 create mode 100644 package/openldap/openldap.mk

diff --git a/package/Config.in b/package/Config.in
index 266de13..edfdd69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -870,6 +870,7 @@ menu "Networking"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
 	source "package/omniorb/Config.in"
+	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
diff --git a/package/openldap/Config.in b/package/openldap/Config.in
new file mode 100644
index 0000000..a42420d
--- /dev/null
+++ b/package/openldap/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_OPENLDAP
+	bool "openldap"
+	help
+		The OpenLDAP library. Currently only supports LDAP client functionality.
+
+		http://www.openldap.org/
+
+if BR2_PACKAGE_OPENLDAP
+
+config BR2_PACKAGE_OPENLDAP_LDAPS
+	bool "Enable ldaps"
+	default y
+	select BR2_PACKAGE_OPENSSL
+	help
+		Use OpenSSL encryption
+
+endif
diff --git a/package/openldap/openldap-0000-fix_cross_strip.patch b/package/openldap/openldap-0000-fix_cross_strip.patch
new file mode 100644
index 0000000..9550c0b
--- /dev/null
+++ b/package/openldap/openldap-0000-fix_cross_strip.patch
@@ -0,0 +1,67 @@
+diff -rupN openldap-2.4.40/build/shtool openldap-2.4.40-br/build/shtool
+--- openldap-2.4.40/build/shtool	2014-09-18 21:48:49.000000000 -0400
++++ openldap-2.4.40-br/build/shtool	2015-01-21 13:21:35.689829372 -0500
+@@ -981,7 +981,7 @@ install )
+             if [ ".$opt_t" = .yes ]; then
+                 echo "strip $dsttmp" 1>&2
+             fi
+-            strip $dsttmp || shtool_exit $?
++						$STRIP $dsttmp || shtool_exit $?
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
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
new file mode 100644
index 0000000..01764d3
--- /dev/null
+++ b/package/openldap/openldap.mk
@@ -0,0 +1,33 @@
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
+OPENLDAP_DEPENDENCIES =
+OPENLDAP_CONF_ENV = ac_cv_func_memcmp_working=yes STRIP=$(TARGET_STRIP)
+OPENLDAP_MAKE_ENV = STRIP=$(TARGET_STRIP)
+
+ifeq ($(BR2_PACKAGE_OPENLDAP_LDAPS),y)
+OPENLDAP_DEPENDENCIES += openssl
+endif
+
+OPENLDAP_CONF_OPTS = \
+	--enable-syslog \
+	--disable-proctitle \
+	--disable-slapd \
+	--enable-dynamic \
+	--with-yielding-select \
+	--without-threads \
+	--with-mp=longlong \
+	--exec-prefix=/ \
+	--includedir=$(STAGING_DIR)/usr/include \
+	--sysconfdir=/etc
+
+$(eval $(autotools-package))
-- 
1.7.8.6
