From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 13:29:45 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/gnutls: drop
 unrecognized option
Message-ID: <20210403110951.767BA8A285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f731dae4e90bb4a7a2db990671d6bbea1028bf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

crywrap has been dropped since version 3.6.12 and
https://github.com/gnutls/gnutls/commit/c991b5223140e4ef311afac0f25272e602238826

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 580f1fccc73b6d8fe13d086bdd0fae2088ac0e52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/Config.in |  2 --
 package/gnutls/gnutls.mk | 14 --------------
 2 files changed, 16 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 15b930b6bd..cd853d1e74 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -23,8 +23,6 @@ config BR2_PACKAGE_GNUTLS_OPENSSL
 
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
-	select BR2_PACKAGE_ARGP_STANDALONE \
-		if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Install GnuTLS command line tools for various cryptographic
 	  tasks.
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 9f53150004..c8ee45338d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -46,20 +46,6 @@ GNUTLS_CONF_OPTS += \
 	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
 	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
 
-# Consider crywrap as part of tools because it needs WCHAR, and it's so too
-ifeq ($(BR2_PACKAGE_GNUTLS_TOOLS),)
-GNUTLS_CONF_OPTS += --disable-crywrap
-endif
-
-# Prerequisite for crywrap
-ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-GNUTLS_LIBS += -largp
-GNUTLS_DEPENDENCIES += argp-standalone
-endif
-
-# libidn support for nommu must exclude the crywrap wrapper (uses fork)
-GNUTLS_CONF_OPTS += $(if $(BR2_USE_MMU),,--disable-crywrap)
-
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
