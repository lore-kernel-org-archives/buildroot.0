From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 13:40:57 -0300
Subject: [Buildroot] [PATCH 4/6] libcurl: bump to version 7.30.0
In-Reply-To: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1368463259-18958-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And add support for other SSL backends such as gnutls, nss and polarssl.
Also add support for libidn and zlib.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl-01-CVE-2013-0249.patch | 65 --------------------------
 package/libcurl/libcurl-02-CVE-2013-1944.patch | 57 ----------------------
 package/libcurl/libcurl.mk                     | 26 ++++++++---
 3 files changed, 20 insertions(+), 128 deletions(-)
 delete mode 100644 package/libcurl/libcurl-01-CVE-2013-0249.patch
 delete mode 100644 package/libcurl/libcurl-02-CVE-2013-1944.patch

diff --git a/package/libcurl/libcurl-01-CVE-2013-0249.patch b/package/libcurl/libcurl-01-CVE-2013-0249.patch
deleted file mode 100644
index 7d2af2a..0000000
--- a/package/libcurl/libcurl-01-CVE-2013-0249.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From ee45a34907ffeb5fd95b0513040d8491d565b663 Mon Sep 17 00:00:00 2001
-From: Eldar Zaitov <kyprizel@volema.com>
-Date: Wed, 30 Jan 2013 23:22:27 +0100
-Subject: [PATCH] Curl_sasl_create_digest_md5_message: fix buffer overflow
-
-When negotiating SASL DIGEST-MD5 authentication, the function
-Curl_sasl_create_digest_md5_message() uses the data provided from the
-server without doing the proper length checks and that data is then
-appended to a local fixed-size buffer on the stack.
-
-This vulnerability can be exploited by someone who is in control of a
-server that a libcurl based program is accessing with POP3, SMTP or
-IMAP. For applications that accept user provided URLs, it is also
-thinkable that a malicious user would feed an application with a URL to
-a server hosting code targetting this flaw.
-
-Bug: http://curl.haxx.se/docs/adv_20130206.html
----
- lib/curl_sasl.c |   23 ++++++-----------------
- 1 file changed, 6 insertions(+), 17 deletions(-)
-
-diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
-index 57116b6..d07387d 100644
---- a/lib/curl_sasl.c
-+++ b/lib/curl_sasl.c
-@@ -346,9 +346,7 @@ CURLcode Curl_sasl_create_digest_md5_message(struct SessionHandle *data,
-     snprintf(&HA1_hex[2 * i], 3, "%02x", digest[i]);
- 
-   /* Prepare the URL string */
--  strcpy(uri, service);
--  strcat(uri, "/");
--  strcat(uri, realm);
-+  snprintf(uri, sizeof(uri), "%s/%s", service, realm);
- 
-   /* Calculate H(A2) */
-   ctxt = Curl_MD5_init(Curl_DIGEST_MD5);
-@@ -392,20 +390,11 @@ CURLcode Curl_sasl_create_digest_md5_message(struct SessionHandle *data,
-   for(i = 0; i < MD5_DIGEST_LEN; i++)
-     snprintf(&resp_hash_hex[2 * i], 3, "%02x", digest[i]);
- 
--  strcpy(response, "username=\"");
--  strcat(response, userp);
--  strcat(response, "\",realm=\"");
--  strcat(response, realm);
--  strcat(response, "\",nonce=\"");
--  strcat(response, nonce);
--  strcat(response, "\",cnonce=\"");
--  strcat(response, cnonce);
--  strcat(response, "\",nc=");
--  strcat(response, nonceCount);
--  strcat(response, ",digest-uri=\"");
--  strcat(response, uri);
--  strcat(response, "\",response=");
--  strcat(response, resp_hash_hex);
-+  snprintf(response, sizeof(response),
-+           "username=\"%s\",realm=\"%s\",nonce=\"%s\","
-+           "cnonce=\"%s\",nc=\"%s\",digest-uri=\"%s\",response=%s",
-+           userp, realm, nonce,
-+           cnonce, nonceCount, uri, resp_hash_hex);
- 
-   /* Base64 encode the reply */
-   return Curl_base64_encode(data, response, 0, outptr, outlen);
--- 
-1.7.10.4
-
diff --git a/package/libcurl/libcurl-02-CVE-2013-1944.patch b/package/libcurl/libcurl-02-CVE-2013-1944.patch
deleted file mode 100644
index 18d9c2d..0000000
--- a/package/libcurl/libcurl-02-CVE-2013-1944.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 3604fde3d3c9b0d0e389e079aecf470d123ba180 Mon Sep 17 00:00:00 2001
-From: YAMADA Yasuharu <yasuharu.yamada@access-company.com>
-Date: Thu, 11 Apr 2013 00:17:15 +0200
-Subject: [PATCH] cookie: fix tailmatching to prevent cross-domain leakage
-
-Cookies set for 'example.com' could accidentaly also be sent by libcurl
-to the 'bexample.com' (ie with a prefix to the first domain name).
-
-This is a security vulnerabilty, CVE-2013-1944.
-
-Bug: http://curl.haxx.se/docs/adv_20130412.html
----
- lib/cookie.c |   24 +++++++++++++++++++-----
- 1 file changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/lib/cookie.c b/lib/cookie.c
-index 4b9ec0b..a67204e 100644
---- a/lib/cookie.c
-+++ b/lib/cookie.c
-@@ -118,15 +118,29 @@ static void freecookie(struct Cookie *co)
-   free(co);
- }
- 
--static bool tailmatch(const char *little, const char *bigone)
-+static bool tailmatch(const char *cooke_domain, const char *hostname)
- {
--  size_t littlelen = strlen(little);
--  size_t biglen = strlen(bigone);
-+  size_t cookie_domain_len = strlen(cooke_domain);
-+  size_t hostname_len = strlen(hostname);
- 
--  if(littlelen > biglen)
-+  if(hostname_len < cookie_domain_len)
-     return FALSE;
- 
--  return Curl_raw_equal(little, bigone+biglen-littlelen) ? TRUE : FALSE;
-+  if(!Curl_raw_equal(cooke_domain, hostname+hostname_len-cookie_domain_len))
-+    return FALSE;
-+
-+  /* A lead char of cookie_domain is not '.'.
-+     RFC6265 4.1.2.3. The Domain Attribute says:
-+       For example, if the value of the Domain attribute is
-+       "example.com", the user agent will include the cookie in the Cookie
-+       header when making HTTP requests to example.com, www.example.com, and
-+       www.corp.example.com.
-+   */
-+  if(hostname_len == cookie_domain_len)
-+    return TRUE;
-+  if('.' == *(hostname + hostname_len - cookie_domain_len - 1))
-+    return TRUE;
-+  return FALSE;
- }
- 
- /*
--- 
-1.7.10.4
-
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f0236d9..39eef10 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,9 +4,12 @@
 #
 #############################################################
 
-LIBCURL_VERSION = 7.28.1
+LIBCURL_VERSION = 7.30.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
+LIBCURL_DEPENDENCIES = host-pkgconf \
+	$(if $(BR2_PACKAGE_ZLIB),zlib) \
+	$(if $(BR2_PACKAGE_LIBIDN),libidn)
 LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
@@ -15,23 +18,34 @@ LIBCURL_INSTALL_STAGING = YES
 # on non-MMU platforms. Moreover, this authentication method is
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
-LIBCURL_CONF_OPT = --disable-verbose --disable-manual \
-	--enable-hidden-symbols --disable-ntlm-wb
+LIBCURL_CONF_OPT = --disable-verbose --disable-manual --disable-ntlm-wb \
+	--enable-hidden-symbols --with-random=/dev/urandom
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
 # native stuff during the rest of configure when target == host.
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
+LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
 LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
-	--with-random=/dev/urandom \
 	--with-ca-path=/etc/ssl/certs
+LIBCURL_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBCURL_CONF_OPT += --with-gnutls=$(STAGING_DIR)/usr
+LIBCURL_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_POLARSSL),y)
+LIBCURL_CONF_OPT += --with-polarssl=$(STAGING_DIR)/usr
+LIBCURL_DEPENDENCIES += polarssl
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+LIBCURL_CONF_OPT += --with-nss=$(STAGING_DIR)/usr
+LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
+LIBCURL_DEPENDENCIES += libnss
 else
-LIBCURL_CONF_OPT += --without-ssl
+LIBCURL_CONF_OPT += --without-ssl --without-gnutls \
+	--without-polarssl --without-nss
 endif
 
 define LIBCURL_FIX_DOT_PC
-- 
1.8.1.5
