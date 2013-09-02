From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 21:42:41 +0200
Subject: [Buildroot] [git commit] libcurl: up revision to 7.32.0
Message-ID: <20130902213321.9B81D9B6B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9093cc451c702c3b16fb704f524398abda85c2d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updating revision of libcurl to version 7.32.0

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl-01-CVE-2013-0249.patch |   65 ------------------------
 package/libcurl/libcurl-02-CVE-2013-1944.patch |   57 ---------------------
 package/libcurl/libcurl-03-CVE-2013-2174.patch |   38 --------------
 package/libcurl/libcurl.mk                     |    4 +-
 4 files changed, 2 insertions(+), 162 deletions(-)

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
diff --git a/package/libcurl/libcurl-03-CVE-2013-2174.patch b/package/libcurl/libcurl-03-CVE-2013-2174.patch
deleted file mode 100644
index 673431f..0000000
--- a/package/libcurl/libcurl-03-CVE-2013-2174.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 6032f0ff672f09babf69d9d42bcde6eb9eeb5bea Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Sun, 19 May 2013 23:24:29 +0200
-Subject: [PATCH] Curl_urldecode: no peeking beyond end of input buffer
-
-Security problem: CVE-2013-2174
-
-If a program would give a string like "%" to curl_easy_unescape(), it
-would still consider the % as start of an encoded character. The
-function then not only read beyond the buffer but it would also deduct
-the *unsigned* counter variable for how many more bytes there's left to
-read in the buffer by two, making the counter wrap. Continuing this, the
-function would go on reading beyond the buffer and soon writing beyond
-the allocated target buffer...
-
-Bug: http://curl.haxx.se/docs/adv_20130622.html
-Reported-by: Timo Sirainen
----
- lib/escape.c |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/lib/escape.c b/lib/escape.c
-index 6a26cf8..aa7db2c 100644
---- a/lib/escape.c
-+++ b/lib/escape.c
-@@ -159,7 +159,8 @@ CURLcode Curl_urldecode(struct SessionHandle *data,
- 
-   while(--alloc > 0) {
-     in = *string;
--    if(('%' == in) && ISXDIGIT(string[1]) && ISXDIGIT(string[2])) {
-+    if(('%' == in) && (alloc > 2) &&
-+       ISXDIGIT(string[1]) && ISXDIGIT(string[2])) {
-       /* this is two hexadecimal digits following a '%' */
-       char hexstr[3];
-       char *ptr;
--- 
-1.7.10.4
-
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 56f13ba..d5012b6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.28.1
+LIBCURL_VERSION = 7.32.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_LICENSE = ICS
@@ -27,7 +27,7 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
-LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
+LIBCURL_CONF_OPT += --with-ssl \
 	--with-random=/dev/urandom \
 	--with-ca-path=/etc/ssl/certs
 else
