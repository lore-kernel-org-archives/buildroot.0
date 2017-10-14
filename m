From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Oct 2017 14:26:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libcurl: bump to version
	7.55.1
Message-ID: <20171014150059.6C50E81002@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65883534171c1605a7edbb8eb081d4b10f74336d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Drop upstream patch.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3f6c10df674b7cc7a854fb0099ebeb926d162975)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-curl-system.h-support-more-architectures.patch | 47 ----------------------
 package/libcurl/libcurl.hash                       |  5 ++-
 package/libcurl/libcurl.mk                         |  2 +-
 3 files changed, 4 insertions(+), 50 deletions(-)

diff --git a/package/libcurl/0001-curl-system.h-support-more-architectures.patch b/package/libcurl/0001-curl-system.h-support-more-architectures.patch
deleted file mode 100644
index 94d9a2a..0000000
--- a/package/libcurl/0001-curl-system.h-support-more-architectures.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7d84bd820ef412d251b643a4faced105668f4ebd Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 11 Aug 2017 18:52:37 +0200
-Subject: [PATCH] curl/system.h: support more architectures
-
-The long list of architectures in include/curl/system.h is annoying to
-maintain, and needs to be extended for each and every architecture to
-support.
-
-Instead, let's rely on the __SIZEOF_LONG__ define of the gcc compiler
-(we are in the GNUC condition anyway), which tells us if long is 4
-bytes or 8 bytes.
-
-This fixes the build of libcurl 7.55.0 on architectures such as
-OpenRISC or ARC.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/curl/system.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/include/curl/system.h b/include/curl/system.h
-index 79abf8f..0e13075 100644
---- a/include/curl/system.h
-+++ b/include/curl/system.h
-@@ -403,7 +403,7 @@
- #  if !defined(__LP64__) && (defined(__ILP32__) || \
-       defined(__i386__) || defined(__ppc__) || defined(__arm__) || \
-       defined(__sparc__) || defined(__mips__) || defined(__sh__) || \
--      defined(__XTENSA__))
-+      defined(__XTENSA__) || (defined(__SIZEOF_LONG__) && __SIZEOF_LONG__ == 4))
- #    define CURL_SIZEOF_LONG           4
- #    define CURL_TYPEOF_CURL_OFF_T     long long
- #    define CURL_FORMAT_CURL_OFF_T     "lld"
-@@ -412,7 +412,8 @@
- #    define CURL_SUFFIX_CURL_OFF_T     LL
- #    define CURL_SUFFIX_CURL_OFF_TU    ULL
- #  elif defined(__LP64__) || \
--        defined(__x86_64__) || defined(__ppc64__) || defined(__sparc64__)
-+        defined(__x86_64__) || defined(__ppc64__) || defined(__sparc64__) || \
-+        (defined(__SIZEOF_LONG__) && __SIZEOF_LONG__ == 8)
- #    define CURL_SIZEOF_LONG           8
- #    define CURL_TYPEOF_CURL_OFF_T     long
- #    define CURL_FORMAT_CURL_OFF_T     "ld"
--- 
-2.9.4
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 6d49b67..571526a 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.55.0.tar.xz.asc
-sha256 cdd58522f8607fd4e871df79d73acb3155075e2134641e5adab12a0962df059d  curl-7.55.0.tar.xz
+# https://curl.haxx.se/download/curl-7.55.1.tar.xz.asc
+sha256 3eafca6e84ecb4af5f35795dee84e643d5428287e88c041122bb8dac18676bb7  curl-7.55.1.tar.xz
+sha256 cbcf511f5702f7baf5424193a792bc9c18fab22bcbec2e6a587598389dc632c2  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index dd0ccbf..64110cc 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.55.0
+LIBCURL_VERSION = 7.55.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
