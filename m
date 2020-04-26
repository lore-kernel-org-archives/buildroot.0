From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 13:31:34 +0200
Subject: [Buildroot] [git commit] package/uacme: don't allow mbedtls with
 ualpn
Message-ID: <20200426113131.2AFB98156D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed28a698e390adb4455089e6d22f10a00009ec80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ualpn with mbedtls requires the activation of
MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION on mbedtls which can
be a security risk.

So let the user explicitly choose the crypto library by copy/pasting
behavior of libssh and don't allow the user to select mbedtls with ualpn

Fixes:
 - http://autobuild.buildroot.org/results/5d42189299549cd655218e9e7cfcfa63e79f74ec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uacme/Config.in | 24 ++++++++++++++++++++++++
 package/uacme/uacme.mk  |  6 +++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e7..ba60d787f0 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -16,6 +16,30 @@ config BR2_PACKAGE_UACME
 
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
+	depends on !BR2_PACKAGE_UACME_UALPN
+
+comment "mbedtls crypto backend unavailable with ualpn"
+	depends on BR2_PACKAGE_MBEDTLS
+	depends on BR2_PACKAGE_UACME_UALPN
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
index 7e544fce79..0fb00d6c90 100644
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
