From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon, 20 Nov 2017 22:32:28 +0100
Subject: [Buildroot] [PATCH v4 1/2] libkrb5: New package
Message-ID: <1511213549-1878-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libkrb5/Config.in    | 11 +++++++++++
 package/libkrb5/libkrb5.hash |  2 ++
 package/libkrb5/libkrb5.mk   | 22 ++++++++++++++++++++++
 5 files changed, 37 insertions(+)
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
index 0000000..22a2546
--- /dev/null
+++ b/package/libkrb5/libkrb5.mk
@@ -0,0 +1,22 @@
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
+# Add sane assumptions about cross-compiling
+LIBKRB5_CONF_ENV = \
+	ac_cv_printf_positional=yes \
+	ac_cv_func_regcomp=yes \
+	krb5_cv_attr_constructor_destructor=yes,yes
+
+$(eval $(autotools-package))
-- 
2.7.4
