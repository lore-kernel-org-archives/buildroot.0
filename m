From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 14:37:08 +0200
Subject: [Buildroot] [git commit] package/kodi: Support libcurl version 7.5.0
Message-ID: <20160724123726.A1B0C81D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56593fa8dac2419814d45aa2b9b78708b7d6594a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/bc3/bc392094b5b05f5f4b4ede5ab3a54200d6d33be5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...10-curl-support-version-7.5.0-and-upwards.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch b/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
new file mode 100644
index 0000000..74474f0
--- /dev/null
+++ b/package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
@@ -0,0 +1,50 @@
+From 93eb19334f4186ac75db2b946a3bcaf0b8a6adc2 Mon Sep 17 00:00:00 2001
+From: fritsch <peter.fruehberger@gmail.com>
+Date: Sat, 23 Jul 2016 21:34:05 +0200
+Subject: [PATCH] Curl: Support libcurl version 7.5.0
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Downloaded from upstream PR: https://github.com/xbmc/xbmc/pull/10160)
+---
+ xbmc/filesystem/CurlFile.h   | 6 ++++++
+ xbmc/filesystem/DllLibCurl.h | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/xbmc/filesystem/CurlFile.h b/xbmc/filesystem/CurlFile.h
+index b4f5046..81a5ae5 100644
+--- a/xbmc/filesystem/CurlFile.h
++++ b/xbmc/filesystem/CurlFile.h
+@@ -24,11 +24,17 @@
+ #include <map>
+ #include <string>
+ #include "utils/HttpHeader.h"
++#include <curl/curlver.h>
+ 
+ namespace XCURL
+ {
++#if LIBCURL_VERSION_NUM >= 0x073200
++  typedef struct Curl_easy CURL_HANDLE;
++  typedef struct Curl_multi CURLM;
++#else
+   typedef void CURL_HANDLE;
+   typedef void CURLM;
++#endif
+   struct curl_slist;
+ }
+ 
+diff --git a/xbmc/filesystem/DllLibCurl.h b/xbmc/filesystem/DllLibCurl.h
+index db97f92..3128999 100644
+--- a/xbmc/filesystem/DllLibCurl.h
++++ b/xbmc/filesystem/DllLibCurl.h
+@@ -52,7 +52,11 @@ namespace XCURL
+     virtual CURLMcode multi_fdset(CURLM *multi_handle, fd_set *read_fd_set, fd_set *write_fd_set, fd_set *exc_fd_set, int *max_fd)=0;
+     virtual CURLMcode multi_timeout(CURLM *multi_handle, long *timeout)=0;
+     virtual CURLMsg*  multi_info_read(CURLM *multi_handle, int *msgs_in_queue)=0;
++#if LIBCURL_VERSION_NUM >= 0x073200
++    virtual void multi_cleanup(CURLM * handle )=0;
++#else
+     virtual void multi_cleanup(CURL_HANDLE * handle )=0;
++#endif
+     virtual struct curl_slist* slist_append(struct curl_slist *, const char *)=0;
+     virtual void  slist_free_all(struct curl_slist *)=0;
+   };
