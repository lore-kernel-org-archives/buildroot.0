From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Mon, 29 Apr 2019 22:55:11 +0200
Subject: [Buildroot] [PATCH 1/1] New package:
 https://github.com/ndilieto/uacme
Message-ID: <20190429205511.GA18242@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/Config.in  | 34 ++++++++++++++++++++++++++++++++++
 package/uacme/uacme.hash |  3 +++
 package/uacme/uacme.mk   | 29 +++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 package/uacme/Config.in
 create mode 100644 package/uacme/uacme.hash
 create mode 100644 package/uacme/uacme.mk

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
new file mode 100644
index 0000000..a84c4a6
--- /dev/null
+++ b/package/uacme/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_UACME
+	bool "uacme"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_TLS_SUPPORT
+	help
+	  uacme is a client for the ACMEv2 protocol described in
+	  RFC8555, written in plain C code with minimal dependencies
+	  (libcurl and GnuTLS or mbedTLS). The ACMEv2 protocol allows
+	  a Certificate Authority (https://letsencrypt.org is a
+	  popular one) and an applicant to automate the process of
+	  verification and certificate issuance.
+
+	  https://github.com/ndilieto/uacme
+
+if BR2_PACKAGE_UACME
+
+choice
+	prompt "SSL/TLS library to use"
+
+config BR2_PACKAGE_UACME_GNUTLS
+	bool "GnuTLS"
+	depends on BR2_PACKAGE_GNUTLS
+
+config BR2_PACKAGE_UACME_MBEDTLS
+	bool "mbed TLS"
+	depends on BR2_PACKAGE_MBEDTLS
+
+endchoice
+
+comment "uacme needs either GnuTLS or mbedTLS"
+	depends on !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_UACME_MBEDTLS
+
+endif
diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
new file mode 100644
index 0000000..d0e9fbf
--- /dev/null
+++ b/package/uacme/uacme.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	7de471fc4ce5bcc7071628a2d1e992fc6e30272909d4ce18b93e036eb48dfa5e	uacme-1.0.7.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
new file mode 100644
index 0000000..494656e
--- /dev/null
+++ b/package/uacme/uacme.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# uacme
+#
+################################################################################
+
+UACME_VERSION = upstream/1.0.7
+UACME_SOURCE = uacme-1.0.7.tar.gz
+UACME_SITE = git://github.com/ndilieto/uacme
+UACME_LICENSE = GPL-3.0+
+UACME_LICENSE_FILES = COPYING
+
+UACME_CONF_OPTS = --disable-maintainer-mode --disable-debug
+
+ifeq ($(BR2_PACKAGE_UACME_GNUTLS),y)
+UACME_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
+UACME_DEPENDENCIES += gnutls
+else
+UACME_CONF_OPTS += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_UACME_MBEDTLS),y)
+UACME_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
+UACME_DEPENDENCIES += mbedtls
+else
+UACME_CONF_OPTS += --without-mbedtls
+endif
+
+$(eval $(autotools-package))
-- 
2.1.4
