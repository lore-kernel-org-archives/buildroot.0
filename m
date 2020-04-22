From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Apr 2020 21:20:58 +0200
Subject: [Buildroot] [PATCH 2/3] package/uacme: allow selection of crypto
 backend
In-Reply-To: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
Message-ID: <20200422192059.790299-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uacme/Config.in | 19 +++++++++++++++++++
 package/uacme/uacme.mk  |  6 +++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e7..c27727d8c7 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -16,6 +16,25 @@ config BR2_PACKAGE_UACME
 
 if BR2_PACKAGE_UACME
 
+choice
+	prompt "Crypto Backend"
+	help
+	  Select crypto library to be used in uacme.
+
+config BR2_PACKAGE_UACME_GNUTLS
+	bool "gnutls"
+	depends on BR2_PACKAGE_GNUTLS
+
+config BR2_PACKAGE_UACME_MBEDTLS
+	bool "mbedtls"
+	depends on BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_UACME_OPENSSL
+	bool "openssl"
+	depends on BR2_PACKAGE_OPENSSL
+
+endchoice
+
 config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 61d3f11ca1..470c608bb1 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -15,13 +15,13 @@ UACME_DEPENDENCIES = libcurl
 
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ifeq ($(BR2_PACKAGE_UACME_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+else ifeq ($(BR2_PACKAGE_UACME_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+else ifeq ($(BR2_PACKAGE_UACME_OPENSSL),y)
 UACME_CONF_OPTS += --with-openssl
 UACME_DEPENDENCIES += openssl
 endif
-- 
2.25.1
