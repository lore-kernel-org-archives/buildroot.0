From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 31 Mar 2021 20:15:52 +0300
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version 7.76.0
Message-ID: <ab738226f00b0f533fbcd1afa6e1b57a47928956.1617210952.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2021-22890: TLS 1.3 session ticket proxy host mixup (since 7.63.0)

CVE-2021-22876: Automatic referer leaks credentials (since 7.1.1)

This version adds optional dependency on libgsasl.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 368b8f67f13e..1906834e7a31 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.75.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.76.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  fe0c49d8468249000bda75bcfdf9e30ff7e9a86d35f1a21f428d79c389d55675  curl-7.75.0.tar.xz
+sha256  6302e2d75c59cdc6b35ce3fbe716481dd4301841bbb5fd71854653652a014fc8  curl-7.76.0.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6a9a5a3d3e6a..b02a9263512a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.75.0
+LIBCURL_VERSION = 7.76.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -126,6 +126,13 @@ else
 LIBCURL_CONF_OPTS += --without-nghttp2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGSASL),y)
+LIBCURL_DEPENDENCIES += libgsasl
+LIBCURL_CONF_OPTS += --with-gsasl
+else
+LIBCURL_CONF_OPTS += --without-gsasl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT),y)
 LIBCURL_CONF_OPTS += --enable-cookies
 else
-- 
2.30.2
