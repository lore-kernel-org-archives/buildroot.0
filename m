From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 16:00:08 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/uacme: select openssl or gnutls with ualpn
Message-ID: <20200424140008.675730-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ualpn with mbedtls requires the activation of
MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION on mbedtls which can
be a security risk. So if the user selects ualpn, make sure that openssl
or gnutls are selected and used as the crypto library instead of mbedtls

Fixes:
 - http://autobuild.buildroot.org/results/5d42189299549cd655218e9e7cfcfa63e79f74ec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Yann E. Morin):
 - Do not use ualpn with mbedtls

 package/uacme/Config.in | 1 +
 package/uacme/uacme.mk  | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e7..5840ccd5f9 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
 	  challenge responder.
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 6df13eced6..b6488afebc 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -15,10 +15,12 @@ UACME_DEPENDENCIES = libcurl
 
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
+# ualpn requires MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION in mbedtls
+# which can be a security risk so don't use mbedtls if ualpn is requested
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+else ifeq ($(BR2_PACKAGE_MBEDTLS):$(BR2_PACKAGE_UACME_UALPN),y:)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.25.1
