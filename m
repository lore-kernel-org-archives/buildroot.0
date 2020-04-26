From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 13:47:04 +0200
Subject: [Buildroot] [git commit] Revert "package/uacme: don't allow mbedtls
 with ualpn"
Message-ID: <20200426113318.27FE09084B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e057bbfaeba5e1de43293acdc23682720f7a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ed28a698e390adb4455089e6d22f10a00009ec80
which I applied locally fo testing, but forgot to reset before
continuing to work on other patches...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uacme/Config.in | 24 ------------------------
 package/uacme/uacme.mk  |  6 +++---
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index ba60d787f0..58b7c534e7 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -16,30 +16,6 @@ config BR2_PACKAGE_UACME
 
 if BR2_PACKAGE_UACME
 
-choice
-	prompt "Crypto Backend"
-	help
-	  Select crypto library to be used in uacme.
-
-config BR2_PACKAGE_UACME_GNUTLS
-	bool "gnutls"
-	depends on BR2_PACKAGE_GNUTLS
-
-config BR2_PACKAGE_UACME_MBEDTLS
-	bool "mbedtls"
-	depends on BR2_PACKAGE_MBEDTLS
-	depends on !BR2_PACKAGE_UACME_UALPN
-
-comment "mbedtls crypto backend unavailable with ualpn"
-	depends on BR2_PACKAGE_MBEDTLS
-	depends on BR2_PACKAGE_UACME_UALPN
-
-config BR2_PACKAGE_UACME_OPENSSL
-	bool "openssl"
-	depends on BR2_PACKAGE_OPENSSL
-
-endchoice
-
 config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 0fb00d6c90..7e544fce79 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -15,13 +15,13 @@ UACME_DEPENDENCIES = libcurl
 
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-ifeq ($(BR2_PACKAGE_UACME_GNUTLS),y)
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_UACME_MBEDTLS),y)
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
-else ifeq ($(BR2_PACKAGE_UACME_OPENSSL),y)
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 UACME_CONF_OPTS += --with-openssl
 UACME_DEPENDENCIES += openssl
 endif
