From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 May 2013 10:58:25 -0300
Subject: [Buildroot] [PATCH] libcurl: add security patch for CVE-2013-1944
Message-ID: <1368280705-5839-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...3-0249.patch => libcurl-01-CVE-2013-0249.patch} |  0
 package/libcurl/libcurl-02-CVE-2013-1944.patch     | 57 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 rename package/libcurl/{libcurl-cve-2013-0249.patch => libcurl-01-CVE-2013-0249.patch} (100%)
 create mode 100644 package/libcurl/libcurl-02-CVE-2013-1944.patch

diff --git a/package/libcurl/libcurl-cve-2013-0249.patch b/package/libcurl/libcurl-01-CVE-2013-0249.patch
similarity index 100%
rename from package/libcurl/libcurl-cve-2013-0249.patch
rename to package/libcurl/libcurl-01-CVE-2013-0249.patch
diff --git a/package/libcurl/libcurl-02-CVE-2013-1944.patch b/package/libcurl/libcurl-02-CVE-2013-1944.patch
new file mode 100644
index 0000000..18d9c2d
--- /dev/null
+++ b/package/libcurl/libcurl-02-CVE-2013-1944.patch
@@ -0,0 +1,57 @@
+From 3604fde3d3c9b0d0e389e079aecf470d123ba180 Mon Sep 17 00:00:00 2001
+From: YAMADA Yasuharu <yasuharu.yamada@access-company.com>
+Date: Thu, 11 Apr 2013 00:17:15 +0200
+Subject: [PATCH] cookie: fix tailmatching to prevent cross-domain leakage
+
+Cookies set for 'example.com' could accidentaly also be sent by libcurl
+to the 'bexample.com' (ie with a prefix to the first domain name).
+
+This is a security vulnerabilty, CVE-2013-1944.
+
+Bug: http://curl.haxx.se/docs/adv_20130412.html
+---
+ lib/cookie.c |   24 +++++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 4b9ec0b..a67204e 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -118,15 +118,29 @@ static void freecookie(struct Cookie *co)
+   free(co);
+ }
+ 
+-static bool tailmatch(const char *little, const char *bigone)
++static bool tailmatch(const char *cooke_domain, const char *hostname)
+ {
+-  size_t littlelen = strlen(little);
+-  size_t biglen = strlen(bigone);
++  size_t cookie_domain_len = strlen(cooke_domain);
++  size_t hostname_len = strlen(hostname);
+ 
+-  if(littlelen > biglen)
++  if(hostname_len < cookie_domain_len)
+     return FALSE;
+ 
+-  return Curl_raw_equal(little, bigone+biglen-littlelen) ? TRUE : FALSE;
++  if(!Curl_raw_equal(cooke_domain, hostname+hostname_len-cookie_domain_len))
++    return FALSE;
++
++  /* A lead char of cookie_domain is not '.'.
++     RFC6265 4.1.2.3. The Domain Attribute says:
++       For example, if the value of the Domain attribute is
++       "example.com", the user agent will include the cookie in the Cookie
++       header when making HTTP requests to example.com, www.example.com, and
++       www.corp.example.com.
++   */
++  if(hostname_len == cookie_domain_len)
++    return TRUE;
++  if('.' == *(hostname + hostname_len - cookie_domain_len - 1))
++    return TRUE;
++  return FALSE;
+ }
+ 
+ /*
+-- 
+1.7.10.4
+
-- 
1.8.1.5
