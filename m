From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:26 -0000
Subject: [Buildroot] [git commit] libcurl: Allow selection of TLS package
 libcurl will use
Message-ID: <20181202071554.8785D80FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8b78e7e6a1cc15ab085f157250ed1ca04277129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of defaulting to OpenSSL, allow selection of package to use
through a choice in libcurl's config.  The default will be to select the
first enabled TLS provider in the same preference order as is used now,
i.e. no change from current behavior.

Some of the alternative libraries have advantages over OpenSSL in
certain areas.

For example, gnutls has vastly superior PKCS11 support.  One can use
client TLS private keys by supplying a PKCS11 URI instead of a private
key file name.  The TLS server cert trust store can be a PKCS11 URI,
e.g. configure libcurl with a ca-bundle of "pkcs11:model=p11-kit-trust".
Now server certs can be stored in a software and/or hardware HSM(s).
This doesn't work with OpenSSL.

However, some software only supports OpenSSL for TLS or other crypto
functions.  So it might be necessary to enable OpenSSL for that reason.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
[Peter: add BR2_PACKAGE_LIBCURL_TLS_SUPPORT and use it to hide choice &
	comment, explitly pass --without-foo if option is not enabled,
	only do .pc fixup if BR2_PACKAGE_LIBCURL_OPENSSL is enabled]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in  | 32 ++++++++++++++++++++++++++++++++
 package/libcurl/libcurl.mk | 35 ++++++++++++++++++++++++-----------
 2 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 21c2ee2b7f..9c62539e4d 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -19,4 +19,36 @@ config BR2_PACKAGE_LIBCURL_VERBOSE
 	help
 	  Enable verbose text strings
 
+config BR2_PACKAGE_LIBCURL_TLS_SUPPORT
+	bool
+	default y if BR2_PACKAGE_OPENSSL
+	default y if BR2_PACKAGE_GNUTLS
+	default y if BR2_PACKAGE_LIBNSS
+	default y if BR2_PACKAGE_MBEDTLS
+
+choice
+	prompt "SSL/TLS library to use"
+	depends on BR2_PACKAGE_LIBCURL_TLS_SUPPORT
+
+config BR2_PACKAGE_LIBCURL_OPENSSL
+	bool "OpenSSL"
+	depends on BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_LIBCURL_GNUTLS
+	bool "GnuTLS"
+	depends on BR2_PACKAGE_GNUTLS
+
+config BR2_PACKAGE_LIBCURL_LIBNSS
+	bool "NSS"
+	depends on BR2_PACKAGE_LIBNSS
+
+config BR2_PACKAGE_LIBCURL_MBEDTLS
+	bool "mbed TLS"
+	depends on BR2_PACKAGE_MBEDTLS
+
+endchoice
+
+comment "A TLS library is needed for SSL/TLS support"
+	depends on !BR2_PACKAGE_LIBCURL_TLS_SUPPORT
+
 endif
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 99a451b636..b6b8e0abc8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -19,7 +19,8 @@ LIBCURL_INSTALL_STAGING = YES
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
-	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug
+	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug \
+	--without-polarssl
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
@@ -35,7 +36,7 @@ endif
 
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
 # native stuff during the rest of configure when target == host.
@@ -44,19 +45,31 @@ LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
 LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
-else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
+else
+LIBCURL_CONF_OPTS += -without-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
+LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr --without-ssl
 LIBCURL_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_LIBNSS),y)
-LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
+else
+LIBCURL_CONF_OPTS += --without-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL_LIBNSS),y)
+LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr --without-ssl --without-gnutls
 LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
 LIBCURL_DEPENDENCIES += libnss
-else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr
+else
+LIBCURL_CONF_OPTS += --without-nss
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL_MBEDTLS),y)
+LIBCURL_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
+	--without-ssl --without-gnutls --without-nss
 LIBCURL_DEPENDENCIES += mbedtls
 else
-LIBCURL_CONF_OPTS += --without-ssl --without-gnutls \
-	--without-polarssl --without-nss --without-mbedtls
+LIBCURL_CONF_OPTS += --without-mbedtls
 endif
 
 ifeq ($(BR2_PACKAGE_C_ARES),y)
@@ -98,7 +111,7 @@ endif
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
-LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_DOT_PC)
+LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
 
 ifeq ($(BR2_PACKAGE_CURL),)
 define LIBCURL_TARGET_CLEANUP
