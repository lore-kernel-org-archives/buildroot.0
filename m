From: Bastian Breit <basti171@gmail.com>
Date: Sat,  9 Feb 2019 22:53:51 +0100
Subject: [Buildroot] [PATCH] add library xmlsec1
Message-ID: <20190209215351.29395-1-basti171@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                  |  1 +
 package/libxmlsec1/COPYING         |  1 +
 package/libxmlsec1/Config.in       | 11 +++++++++++
 package/libxmlsec1/libxmlsec1.hash |  1 +
 package/libxmlsec1/libxmlsec1.mk   | 17 +++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/libxmlsec1/COPYING
 create mode 100644 package/libxmlsec1/Config.in
 create mode 100644 package/libxmlsec1/libxmlsec1.hash
 create mode 100644 package/libxmlsec1/libxmlsec1.mk

diff --git a/package/Config.in b/package/Config.in
index 29862c478c..18acfd9db8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1428,6 +1428,7 @@ menu "JSON/XML"
 	source "package/libxml2/Config.in"
 	source "package/libxmlpp/Config.in"
 	source "package/libxmlrpc/Config.in"
+	source "package/libxmlsec1/Config.in"
 	source "package/libxslt/Config.in"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
diff --git a/package/libxmlsec1/COPYING b/package/libxmlsec1/COPYING
new file mode 100644
index 0000000000..9f0da96c81
--- /dev/null
+++ b/package/libxmlsec1/COPYING
@@ -0,0 +1 @@
+prop lic do not copy
diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
new file mode 100644
index 0000000000..836d4db674
--- /dev/null
+++ b/package/libxmlsec1/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBXMLSEC1
+	bool "libxmlsec1"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_OPENSSL
+	help
+	XMLSec library provides C based implementation for major XML
+	Security standards:
+	- XML Signature Syntax and Processing
+	- XML Encryption Syntax and Processing
+	https://www.aleksey.com/xmlsec/
diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
new file mode 100644
index 0000000000..ce44e23ac5
--- /dev/null
+++ b/package/libxmlsec1/libxmlsec1.hash
@@ -0,0 +1 @@
+md5  508bee7e4f1b99f2d50aaa7d38ede56e  xmlsec1-1.2.27.tar.gz
diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
new file mode 100644
index 0000000000..6bf8944f1e
--- /dev/null
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -0,0 +1,17 @@
+LIBXMLSEC1_VERSION = 1.2.27
+LIBXMLSEC1_SOURCE = xmlsec1-${LIBXMLSEC1_VERSION}.tar.gz
+LIBXMLSEC1_SITE = http://www.aleksey.com/xmlsec/download
+LIBXMLSEC1_INSTALL_STAGING = YES
+LIBXMLSEC1_INSTALL_TARGET = YES
+LIBXMLSEC1_LICENSE = MIT
+LIBXMLSEC1_LICENSE_FILES = Copyright
+
+LIBXMLSEC1_CONF_OPTS += --disable-static
+LIBXMLSEC1_CONF_OPTS += --enable-crypto-dl=no
+LIBXMLSEC1_CONF_OPTS += --with-openssl=${STAGING_DIR}/usr
+LIBXMLSEC1_CONF_OPTS += --with-libxslt=no
+LIBXMLSEC1_CONF_OPTS += --with-gnutls=no
+LIBXMLSEC1_CONF_OPTS += --with-gcrypt=no
+LIBXMLSEC1_DEPENDENCIES = libxml2 libxslt openssl
+
+$(eval $(autotools-package))
-- 
2.17.1
