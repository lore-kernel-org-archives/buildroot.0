From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 17 Sep 2020 08:36:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 1.4.14
Message-ID: <20200917063655.927560-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch which is included in the new version.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...dapt-streamproxy-to-newer-microhttpd.patch | 106 ------------------
 package/upmpdcli/upmpdcli.hash                |   4 +-
 package/upmpdcli/upmpdcli.mk                  |   2 +-
 3 files changed, 3 insertions(+), 109 deletions(-)
 delete mode 100644 package/upmpdcli/0001-Adapt-streamproxy-to-newer-microhttpd.patch

diff --git a/package/upmpdcli/0001-Adapt-streamproxy-to-newer-microhttpd.patch b/package/upmpdcli/0001-Adapt-streamproxy-to-newer-microhttpd.patch
deleted file mode 100644
index 55c691b86a..0000000000
--- a/package/upmpdcli/0001-Adapt-streamproxy-to-newer-microhttpd.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 4fd8a07b560dcd4ad5706684d512d33707de3da0 Mon Sep 17 00:00:00 2001
-From: Jean-Francois Dockes <jf@dockes.org>
-Date: Fri, 3 Jul 2020 19:26:37 +0200
-Subject: [PATCH] Adapt streamproxy to newer microhttpd where results are now
- an enum
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded from upstream commit
- https://framagit.org/medoc92/upmpdcli/-/commit/4fd8a07b560dcd4ad5706684d512d33707de3da0]
----
- src/mediaserver/cdplugins/streamproxy.cpp | 23 ++++++++++++++---------
- 1 file changed, 14 insertions(+), 9 deletions(-)
-
-diff --git a/src/mediaserver/cdplugins/streamproxy.cpp b/src/mediaserver/cdplugins/streamproxy.cpp
-index abc57915..8d283834 100644
---- a/src/mediaserver/cdplugins/streamproxy.cpp
-+++ b/src/mediaserver/cdplugins/streamproxy.cpp
-@@ -28,6 +28,11 @@
- #include <fcntl.h>
- #include <microhttpd.h>
- 
-+
-+#if MHD_VERSION < 0x00097002
-+typedef int MHD_Result;
-+#endif
-+
- #include <mutex>
- #include <condition_variable>
- #include <unordered_map>
-@@ -155,7 +160,7 @@ public:
-     ~Internal();
-     bool startMHD();
- 
--    int answerConn(
-+    MHD_Result answerConn(
-         struct MHD_Connection *connection, const char *url, 
-         const char *method, const char *version, 
-         const char *upload_data, size_t *upload_data_size,
-@@ -202,7 +207,7 @@ StreamProxy::Internal::Internal(int _listenport, UrlTransFunc _urltrans)
- }
- 
- 
--static int answer_to_connection(
-+static MHD_Result answer_to_connection(
-     void *cls, struct MHD_Connection *conn, 
-     const char *url, const char *method, const char *version, 
-     const char *upload_data, size_t *upload_data_size,
-@@ -214,7 +219,7 @@ static int answer_to_connection(
-         return internal->answerConn(
-             conn, url, method, version, upload_data, upload_data_size, con_cls);
-     } else {
--        return -1;
-+        return MHD_NO;
-     }
- }
- 
-@@ -238,8 +243,8 @@ static int print_out_key (void *cls, enum MHD_ValueKind kind,
- }
- #endif /* PRINT_KEYS */
- 
--static int mapvalues_cb(void *cls, enum MHD_ValueKind kind, 
--                        const char *key, const char *value)
-+static MHD_Result mapvalues_cb(void *cls, enum MHD_ValueKind kind, 
-+                               const char *key, const char *value)
- {
-     unordered_map<string,string> *mp = (unordered_map<string,string> *)cls;
-     if (mp) {
-@@ -307,7 +312,7 @@ static bool processRange(struct MHD_Connection *mhdconn, uint64_t& offset)
-     return true;
- }
- 
--int StreamProxy::Internal::answerConn(
-+MHD_Result StreamProxy::Internal::answerConn(
-     struct MHD_Connection *mhdconn, const char *_url,
-     const char *method, const char *version, 
-     const char *upload_data, size_t *upload_data_size,
-@@ -352,7 +357,7 @@ int StreamProxy::Internal::answerConn(
-                 return MHD_NO;
-             }
-             MHD_add_response_header (response, "Location", url.c_str());
--            int ret = MHD_queue_response(mhdconn, 302, response);
-+            MHD_Result ret = MHD_queue_response(mhdconn, 302, response);
-             MHD_destroy_response(response);
-             return ret;
-         }
-@@ -393,7 +398,7 @@ int StreamProxy::Internal::answerConn(
-         int code = httpcode ? httpcode : MHD_HTTP_INTERNAL_SERVER_ERROR;
-         struct MHD_Response *response =
-             MHD_create_response_from_buffer(0, 0, MHD_RESPMEM_PERSISTENT);
--        int ret = MHD_queue_response(mhdconn, code, response);
-+        MHD_Result ret = MHD_queue_response(mhdconn, code, response);
-         MHD_destroy_response(response);
-         LOGINF("StreamProxy::answerConn (1): return with http code: " <<
-                code << endl);
-@@ -434,7 +439,7 @@ int StreamProxy::Internal::answerConn(
-     if (reader->fetcher->fetchDone(&fetchcode, &httpcode)) {
-         code = httpcode ? httpcode : MHD_HTTP_INTERNAL_SERVER_ERROR;
-     }
--    int ret = MHD_queue_response(mhdconn, code, response);
-+    MHD_Result ret = MHD_queue_response(mhdconn, code, response);
-     MHD_destroy_response(response);
-     return ret;
- }
--- 
-GitLab
-
diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 83fb5cf967..68ea707e53 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.12.tar.gz.sha256:
-sha256  bffc78c140ad688987894ea5a1e162e6dcbc7dcae7d2cc322a894f5ea2a2f53b  upmpdcli-1.4.12.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.14.tar.gz.sha256:
+sha256  e3d90dedee6a942acc049324ca81b7f008d217d386a3e2590a2ca5670cc9df05  upmpdcli-1.4.14.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 1315022ee8..6531b90ee9 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.4.12
+UPMPDCLI_VERSION = 1.4.14
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.28.0
