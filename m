From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 09:38:53 +0200
Subject: [Buildroot] [git commit] package/kodi: Update upstream patch to
	support libcurl >= 7.50.1
Message-ID: <20160805074115.2D1EA82260@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb1a30a3d92c8ddbcc295cb48226604d6d881e25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An updated patch was committed to Kodi after Curl added a fix to address
the original problem:
https://github.com/curl/curl/commit/d6604524ad24daf4581efbe0020da058d2b3af84

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...10-curl-support-version-7.5.0-and-upwards.patch | 56 ++++++++--------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch b/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
index 74474f0..b6743ae 100644
--- a/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
+++ b/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
@@ -1,50 +1,34 @@
-From 93eb19334f4186ac75db2b946a3bcaf0b8a6adc2 Mon Sep 17 00:00:00 2001
+From 7d3c70b163bc67aeb1fdef8fd2347b39f311c584 Mon Sep 17 00:00:00 2001
 From: fritsch <peter.fruehberger@gmail.com>
-Date: Sat, 23 Jul 2016 21:34:05 +0200
-Subject: [PATCH] Curl: Support libcurl version 7.5.0
+Date: Sun, 24 Jul 2016 20:24:07 +0200
+Subject: [PATCH] Curl: Adjust multi_cleanup method which returns CURLMcode
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(Downloaded from upstream PR: https://github.com/xbmc/xbmc/pull/10160)
+(backported from upstream commit:
+ https://github.com/xbmc/xbmc/commit/2a8d3e7f6cffea52740b8392a3be8ec251d5ff70)
 ---
- xbmc/filesystem/CurlFile.h   | 6 ++++++
- xbmc/filesystem/DllLibCurl.h | 4 ++++
- 2 files changed, 10 insertions(+)
+ xbmc/filesystem/DllLibCurl.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/xbmc/filesystem/CurlFile.h b/xbmc/filesystem/CurlFile.h
-index b4f5046..81a5ae5 100644
---- a/xbmc/filesystem/CurlFile.h
-+++ b/xbmc/filesystem/CurlFile.h
-@@ -24,11 +24,17 @@
- #include <map>
- #include <string>
- #include "utils/HttpHeader.h"
-+#include <curl/curlver.h>
- 
- namespace XCURL
- {
-+#if LIBCURL_VERSION_NUM >= 0x073200
-+  typedef struct Curl_easy CURL_HANDLE;
-+  typedef struct Curl_multi CURLM;
-+#else
-   typedef void CURL_HANDLE;
-   typedef void CURLM;
-+#endif
-   struct curl_slist;
- }
- 
 diff --git a/xbmc/filesystem/DllLibCurl.h b/xbmc/filesystem/DllLibCurl.h
-index db97f92..3128999 100644
+index db97f92..9e78a91 100644
 --- a/xbmc/filesystem/DllLibCurl.h
 +++ b/xbmc/filesystem/DllLibCurl.h
-@@ -52,7 +52,11 @@ namespace XCURL
+@@ -52,7 +52,7 @@ namespace XCURL
      virtual CURLMcode multi_fdset(CURLM *multi_handle, fd_set *read_fd_set, fd_set *write_fd_set, fd_set *exc_fd_set, int *max_fd)=0;
      virtual CURLMcode multi_timeout(CURLM *multi_handle, long *timeout)=0;
      virtual CURLMsg*  multi_info_read(CURLM *multi_handle, int *msgs_in_queue)=0;
-+#if LIBCURL_VERSION_NUM >= 0x073200
-+    virtual void multi_cleanup(CURLM * handle )=0;
-+#else
-     virtual void multi_cleanup(CURL_HANDLE * handle )=0;
-+#endif
+-    virtual void multi_cleanup(CURL_HANDLE * handle )=0;
++    virtual CURLMcode multi_cleanup(CURLM * handle )=0;
      virtual struct curl_slist* slist_append(struct curl_slist *, const char *)=0;
      virtual void  slist_free_all(struct curl_slist *)=0;
    };
+@@ -77,7 +77,7 @@ namespace XCURL
+     DEFINE_METHOD5(CURLMcode, multi_fdset, (CURLM *p1, fd_set *p2, fd_set *p3, fd_set *p4, int *p5))
+     DEFINE_METHOD2(CURLMcode, multi_timeout, (CURLM *p1, long *p2))
+     DEFINE_METHOD2(CURLMsg*,  multi_info_read, (CURLM *p1, int *p2))
+-    DEFINE_METHOD1(void, multi_cleanup, (CURLM *p1))
++    DEFINE_METHOD1(CURLMcode, multi_cleanup, (CURLM *p1))
+     DEFINE_METHOD2(struct curl_slist*, slist_append, (struct curl_slist * p1, const char * p2))
+     DEFINE_METHOD1(void, slist_free_all, (struct curl_slist * p1))
+     DEFINE_METHOD1(const char *, easy_strerror, (CURLcode p1))
