From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  9 Apr 2021 23:38:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhttpserver: bump to version
 0.18.2
Message-ID: <20210409213832.3399233-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...patibility-with-libmicrohttpd-0.9.71.patch | 240 ------------------
 package/libhttpserver/libhttpserver.hash      |   2 +-
 package/libhttpserver/libhttpserver.mk        |   2 +-
 3 files changed, 2 insertions(+), 242 deletions(-)
 delete mode 100644 package/libhttpserver/0001-Compatibility-with-libmicrohttpd-0.9.71.patch

diff --git a/package/libhttpserver/0001-Compatibility-with-libmicrohttpd-0.9.71.patch b/package/libhttpserver/0001-Compatibility-with-libmicrohttpd-0.9.71.patch
deleted file mode 100644
index f982ee7a82..0000000000
--- a/package/libhttpserver/0001-Compatibility-with-libmicrohttpd-0.9.71.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-From cfcd8a8f73aa337e8f45d287a79cd9b8e5c51dcd Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 5 Jul 2020 11:42:23 +0200
-Subject: [PATCH] Compatibility with libmicrohttpd 0.9.71
-
-From the libmicrohttpd 0.9.71 release notes:
-
-Furthermore, the release introduces an 'enum MHD_Result' instead of
-defines for MHD_YES/MHD_NO. This is intended to make it easier to check
-for certain API misuse bugs by providing better types (not everything is
-an 'int').  While this does NOT change the binary API, this change
-_will_ cause compiler warnings for all legacy code -- until 'int' is
-replaced with 'enum MHD_Result'
-
-Patch sent upstream: https://github.com/etr/libhttpserver/pull/199
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/http_request.cpp            |  6 +++---
- src/httpserver/http_request.hpp |  6 +++---
- src/httpserver/http_utils.hpp   |  4 ++++
- src/httpserver/webserver.hpp    | 14 +++++++-------
- src/webserver.cpp               | 22 +++++++++++++---------
- 5 files changed, 30 insertions(+), 22 deletions(-)
-
-diff --git a/src/http_request.cpp b/src/http_request.cpp
-index 5703663..be342c7 100644
---- a/src/http_request.cpp
-+++ b/src/http_request.cpp
-@@ -88,7 +88,7 @@ const std::string http_request::get_connection_value(const std::string& key, enu
-     return header_c;
- }
- 
--int http_request::build_request_header(
-+MHD_Result http_request::build_request_header(
-         void *cls,
-         enum MHD_ValueKind kind,
-         const char *key,
-@@ -189,7 +189,7 @@ const std::string http_request::get_querystring() const
-     return querystring;
- }
- 
--int http_request::build_request_args(
-+MHD_Result http_request::build_request_args(
-         void *cls,
-         enum MHD_ValueKind kind,
-         const char *key,
-@@ -204,7 +204,7 @@ int http_request::build_request_args(
-     return MHD_YES;
- }
- 
--int http_request::build_request_querystring(
-+MHD_Result http_request::build_request_querystring(
-         void *cls,
-         enum MHD_ValueKind kind,
-         const char *key,
-diff --git a/src/httpserver/http_request.hpp b/src/httpserver/http_request.hpp
-index 139272b..62e5275 100644
---- a/src/httpserver/http_request.hpp
-+++ b/src/httpserver/http_request.hpp
-@@ -247,15 +247,15 @@ class http_request
- 
-         unescaper_ptr unescaper = 0x0;
- 
--        static int build_request_header(void *cls, enum MHD_ValueKind kind,
-+        static MHD_Result build_request_header(void *cls, enum MHD_ValueKind kind,
-                 const char *key, const char *value
-         );
- 
--        static int build_request_args(void *cls, enum MHD_ValueKind kind,
-+        static MHD_Result build_request_args(void *cls, enum MHD_ValueKind kind,
-                 const char *key, const char *value
-         );
- 
--        static int build_request_querystring(void *cls, enum MHD_ValueKind kind,
-+        static MHD_Result build_request_querystring(void *cls, enum MHD_ValueKind kind,
-                 const char *key, const char *value
-         );
- 
-diff --git a/src/httpserver/http_utils.hpp b/src/httpserver/http_utils.hpp
-index 9ad89b4..a812197 100644
---- a/src/httpserver/http_utils.hpp
-+++ b/src/httpserver/http_utils.hpp
-@@ -53,6 +53,10 @@
- 
- #define DEFAULT_MASK_VALUE 0xFFFF
- 
-+#if MHD_VERSION < 0x00097002
-+typedef int MHD_Result;
-+#endif
-+
- namespace httpserver {
- 
- typedef void(*unescaper_ptr)(std::string&);
-diff --git a/src/httpserver/webserver.hpp b/src/httpserver/webserver.hpp
-index 1ff472b..661b6ee 100644
---- a/src/httpserver/webserver.hpp
-+++ b/src/httpserver/webserver.hpp
-@@ -195,14 +195,14 @@ class webserver
-                 enum MHD_RequestTerminationCode toe
-         );
- 
--        static int answer_to_connection
-+        static MHD_Result answer_to_connection
-         (
-             void* cls, MHD_Connection* connection,
-             const char* url, const char* method,
-             const char* version, const char* upload_data,
-             size_t* upload_data_size, void** con_cls
-         );
--        static int post_iterator
-+        static MHD_Result post_iterator
-         (
-             void *cls,
-             enum MHD_ValueKind kind,
-@@ -219,25 +219,25 @@ class webserver
-             void **con_cls, int upgrade_socket
-         );
- 
--        int requests_answer_first_step(MHD_Connection* connection,
-+        MHD_Result requests_answer_first_step(MHD_Connection* connection,
-                 struct details::modded_request* mr
-         );
- 
--        int requests_answer_second_step(MHD_Connection* connection,
-+        MHD_Result requests_answer_second_step(MHD_Connection* connection,
-             const char* method, const char* version, const char* upload_data,
-             size_t* upload_data_size, struct details::modded_request* mr
-         );
- 
--        int finalize_answer(MHD_Connection* connection,
-+        MHD_Result finalize_answer(MHD_Connection* connection,
-                 struct details::modded_request* mr, const char* method
-         );
- 
--        int complete_request(MHD_Connection* connection,
-+        MHD_Result complete_request(MHD_Connection* connection,
-                 struct details::modded_request* mr,
-                 const char* version, const char* method
-         );
- 
--        friend int policy_callback (void *cls,
-+        friend MHD_Result policy_callback (void *cls,
-                 const struct sockaddr* addr, socklen_t addrlen
-         );
-         friend void error_log(void* cls, const char* fmt, va_list ap);
-diff --git a/src/webserver.cpp b/src/webserver.cpp
-index a3104e9..3340eb0 100644
---- a/src/webserver.cpp
-+++ b/src/webserver.cpp
-@@ -75,6 +75,10 @@
- #define SOCK_CLOEXEC 02000000
- #endif
- 
-+#if MHD_VERSION < 0x00097002
-+typedef int MHD_Result;
-+#endif
-+
- using namespace std;
- 
- namespace httpserver
-@@ -82,7 +86,7 @@ namespace httpserver
- 
- using namespace http;
- 
--int policy_callback (void *, const struct sockaddr*, socklen_t);
-+MHD_Result policy_callback (void *, const struct sockaddr*, socklen_t);
- void error_log(void*, const char*, va_list);
- void* uri_log(void*, const char*);
- void access_log(webserver*, string);
-@@ -421,7 +425,7 @@ void webserver::disallow_ip(const string& ip)
-     allowances.erase(ip);
- }
- 
--int policy_callback (void *cls, const struct sockaddr* addr, socklen_t addrlen)
-+MHD_Result policy_callback (void *cls, const struct sockaddr* addr, socklen_t addrlen)
- {
-     if(!(static_cast<webserver*>(cls))->ban_system_enabled) return MHD_YES;
- 
-@@ -468,7 +472,7 @@ size_t unescaper_func(void * cls, struct MHD_Connection *c, char *s)
-     return std::string(s).size();
- }
- 
--int webserver::post_iterator (void *cls, enum MHD_ValueKind kind,
-+MHD_Result webserver::post_iterator (void *cls, enum MHD_ValueKind kind,
-     const char *key,
-     const char *filename,
-     const char *content_type,
-@@ -522,7 +526,7 @@ const std::shared_ptr<http_response> webserver::internal_error_page(details::mod
-     }
- }
- 
--int webserver::requests_answer_first_step(
-+MHD_Result webserver::requests_answer_first_step(
-         MHD_Connection* connection,
-         struct details::modded_request* mr
- )
-@@ -574,7 +578,7 @@ int webserver::requests_answer_first_step(
-     return MHD_YES;
- }
- 
--int webserver::requests_answer_second_step(
-+MHD_Result webserver::requests_answer_second_step(
-     MHD_Connection* connection, const char* method,
-     const char* version, const char* upload_data,
-     size_t* upload_data_size, struct details::modded_request* mr
-@@ -597,7 +601,7 @@ int webserver::requests_answer_second_step(
-     return MHD_YES;
- }
- 
--int webserver::finalize_answer(
-+MHD_Result webserver::finalize_answer(
-         MHD_Connection* connection,
-         struct details::modded_request* mr,
-         const char* method
-@@ -731,10 +735,10 @@ int webserver::finalize_answer(
-     mr->dhrs->decorate_response(raw_response);
-     to_ret = mr->dhrs->enqueue_response(connection, raw_response);
-     MHD_destroy_response(raw_response);
--    return to_ret;
-+    return (MHD_Result) to_ret;
- }
- 
--int webserver::complete_request(
-+MHD_Result webserver::complete_request(
-         MHD_Connection* connection,
-         struct details::modded_request* mr,
-         const char* version,
-@@ -750,7 +754,7 @@ int webserver::complete_request(
-     return finalize_answer(connection, mr, method);
- }
- 
--int webserver::answer_to_connection(void* cls, MHD_Connection* connection,
-+MHD_Result webserver::answer_to_connection(void* cls, MHD_Connection* connection,
-     const char* url, const char* method,
-     const char* version, const char* upload_data,
-     size_t* upload_data_size, void** con_cls
--- 
-2.26.2
-
diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index 038e9f6b77..19ad63bde2 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c830cb40b448a44cfc9000713aefff15d4ab1f6ebd6b47280a3cb64cb020f326  libhttpserver-0.18.1.tar.gz
+sha256  1dfe548ac2add77fcb6c05bd00222c55650ffd02b209f4e3f133a6e3eb29c89d  libhttpserver-0.18.2.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 37943bc497..bd3ecbd416 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 0.18.1
+LIBHTTPSERVER_VERSION = 0.18.2
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
-- 
2.30.2
