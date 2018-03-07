From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Wed,  7 Mar 2018 21:15:57 +0100
Subject: [Buildroot] [PATCH next v8 1/2] libkrb5: New package
Message-ID: <1520453758-27666-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libkrb5/Config.in    | 13 ++++++++++
 package/libkrb5/libkrb5.hash |  2 ++
 package/libkrb5/libkrb5.mk   | 56 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/libkrb5/Config.in
 create mode 100644 package/libkrb5/libkrb5.hash
 create mode 100644 package/libkrb5/libkrb5.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d09102..f0554e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -115,6 +115,7 @@ F:	package/ktap/
 
 N:	Andr? Hentschel <nerv@dawncrow.de>
 F:	package/azure-iot-sdk-c/
+F:	package/libkrb5/
 F:	package/openal/
 F:	package/p7zip/
 F:	package/wine/
diff --git a/package/Config.in b/package/Config.in
index 6abbb43..74592e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1382,6 +1382,7 @@ menu "Networking"
 	source "package/libhttpparser/Config.in"
 	source "package/libidn/Config.in"
 	source "package/libiscsi/Config.in"
+	source "package/libkrb5/Config.in"
 	source "package/libldns/Config.in"
 	source "package/libmaxminddb/Config.in"
 	source "package/libmbus/Config.in"
diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
new file mode 100644
index 0000000..89911b4
--- /dev/null
+++ b/package/libkrb5/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBKRB5
+	bool "libkrb5"
+	# needs fork()
+	depends on BR2_USE_MMU
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
index 0000000..59552d7
--- /dev/null
+++ b/package/libkrb5/libkrb5.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	faeb125f83b0fb4cdb2f99f088140631bb47d975982de0956d18c85842969e08	krb5-1.16.tar.gz
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
new file mode 100644
index 0000000..1f1108a
--- /dev/null
+++ b/package/libkrb5/libkrb5.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# libkrb5
+#
+################################################################################
+
+LIBKRB5_VERSION_MAJOR = 1.16
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR)
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
+LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
+LIBKRB5_SUBDIR = src
+LIBKRB5_LICENSE = MIT
+LIBKRB5_LICENSE_FILES = NOTICE
+LIBKRB5_INSTALL_STAGING = YES
+
+# The configure script uses AC_TRY_RUN tests to check for those values,
+# which doesn't work in a cross-compilation scenario. Therefore,
+# we feed the configure script with the correct answer for those tests
+LIBKRB5_CONF_ENV = \
+	ac_cv_printf_positional=yes \
+	ac_cv_func_regcomp=yes \
+	krb5_cv_attr_constructor_destructor=yes,yes
+
+# Never use the host packages
+LIBKRB5_CONF_OPTS = \
+	--without-system-db \
+	--without-system-et \
+	--without-system-ss \
+	--without-system-verto
+
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+LIBKRB5_CONF_OPTS += --with-ldap
+LIBKRB5_DEPENDENCIES += openldap
+else
+LIBKRB5_CONF_OPTS += --without-ldap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+LIBKRB5_CONF_OPTS += --with-libedit
+LIBKRB5_DEPENDENCIES += libedit
+else
+LIBKRB5_CONF_OPTS += --without-libedit
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LIBKRB5_CONF_OPTS += --with-readline
+LIBKRB5_DEPENDENCIES += readline
+else
+LIBKRB5_CONF_OPTS += --without-readline
+endif
+
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBKRB5_CONF_OPTS += --disable-thread-support
+endif
+
+$(eval $(autotools-package))
-- 
2.7.4
