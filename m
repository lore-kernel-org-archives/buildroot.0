From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:23:41 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libcurl: security
 bump to version 7.76.0
Message-ID: <20210404090020.7FA4F8B545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f09d62641268928589f71e7e374ae85f92b9f85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

CVE-2021-22890: TLS 1.3 session ticket proxy host mixup (since 7.63.0)

CVE-2021-22876: Automatic referer leaks credentials (since 7.1.1)

This version adds optional dependency on libgsasl.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ab6d38ab8fb9461db8a189fb3efa2c13dfa5dc2f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 368b8f67f1..1906834e7a 100644
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
index 37606a5ff3..5e2e84b9b2 100644
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
@@ -117,6 +117,13 @@ else
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
