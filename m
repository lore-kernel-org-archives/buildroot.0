From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:54:46 +0200
Subject: [Buildroot] [git commit] package/uacme: don't allow ualpn with
 mbedTLS
Message-ID: <20200509113932.4BA3990FB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96c3b52132b41716ca445b4c73a1a8886c26e5ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ualpn requires mbedTLS to be configured and built with
MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION
which is not the default and can be a security risk.

Therefore make BR2_PACKAGE_UACME_UALPN depend on
BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS.

Fixes http://autobuild.buildroot.net/results/d241121f8155bad9b6b25c16234576abb7fc940b

See also

https://github.com/ndilieto/uacme/issues/23
https://github.com/ARMmbed/mbedtls/issues/3241
https://github.com/ARMmbed/mbedtls/pull/3243
http://lists.busybox.net/pipermail/buildroot/2020-April/281059.html
http://lists.busybox.net/pipermail/buildroot/2020-April/281108.html

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uacme/Config.in | 4 ++++
 package/uacme/uacme.mk  | 6 +++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e7..d693436115 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -19,6 +19,7 @@ if BR2_PACKAGE_UACME
 config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBEV
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
@@ -27,4 +28,7 @@ config BR2_PACKAGE_UACME_UALPN
 comment "ualpn needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
+comment "ualpn needs either OpenSSL or GnuTLS"
+	depends on !(BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS)
+
 endif
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 7e544fce79..be2aa60811 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -18,12 +18,12 @@ UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-UACME_CONF_OPTS += --with-mbedtls
-UACME_DEPENDENCIES += mbedtls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 UACME_CONF_OPTS += --with-openssl
 UACME_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+UACME_CONF_OPTS += --with-mbedtls
+UACME_DEPENDENCIES += mbedtls
 endif
 
 ifeq ($(BR2_PACKAGE_UACME_UALPN),y)
