From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Fri,  2 Feb 2018 18:39:00 +0100
Subject: [Buildroot] [PATCH v5 1/2] libkrb5: New package
Message-ID: <1517593141-26017-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libkrb5/Config.in    | 15 +++++++++++++++
 package/libkrb5/libkrb5.hash |  2 ++
 package/libkrb5/libkrb5.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/libkrb5/Config.in
 create mode 100644 package/libkrb5/libkrb5.hash
 create mode 100644 package/libkrb5/libkrb5.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9048d45..a8fa9ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -111,6 +111,7 @@ F:	package/ktap/
 
 N:	Andr? Hentschel <nerv@dawncrow.de>
 F:	package/azure-iot-sdk-c/
+F:	package/libkrb5/
 F:	package/openal/
 F:	package/p7zip/
 F:	package/wine/
diff --git a/package/Config.in b/package/Config.in
index 9a6b199..86042f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1374,6 +1374,7 @@ menu "Networking"
 	source "package/libhttpparser/Config.in"
 	source "package/libidn/Config.in"
 	source "package/libiscsi/Config.in"
+	source "package/libkrb5/Config.in"
 	source "package/libldns/Config.in"
 	source "package/libmaxminddb/Config.in"
 	source "package/libmbus/Config.in"
diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
new file mode 100644
index 0000000..bdddd2e
--- /dev/null
+++ b/package/libkrb5/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBKRB5
+	bool "libkrb5"
+	# needs fork()
+	depends on BR2_USE_MMU
+	# static libs are not supported on all platforms
+	depends on !(BR2_STATIC_LIBS && (BR2_ARM_CPU_ARMV7M || BR2_m68k))
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
index 0000000..3cb64d6
--- /dev/null
+++ b/package/libkrb5/libkrb5.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libkrb5
+#
+################################################################################
+
+LIBKRB5_VERSION = 1.16
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/1.16
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
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBKRB5_CONF_OPTS += --disable-thread-support
+endif
+
+$(eval $(autotools-package))
-- 
2.7.4
