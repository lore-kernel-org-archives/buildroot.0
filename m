From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2020 14:17:28 +0200
Subject: [Buildroot] [git commit] package/systemd: fix build with
 libmicrohttpd 0.9.71
Message-ID: <20200705121540.5576E86332@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3a50eeae2ed661415e99ca0d0f26ee8dc6d40bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Fix-build-with-libmicrohttpd-0.9.71.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch b/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch
new file mode 100644
index 0000000000..7c1cfe939b
--- /dev/null
+++ b/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch
@@ -0,0 +1,71 @@
+From d17eabb1052e7c8c432331a7a782845e36164f01 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 30 Jun 2020 09:56:10 +0200
+Subject: [PATCH] =?UTF-8?q?Fix=20build=20with=20=C2=B5httpd=200.9.71?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The return type of callbacks was changed from int to an enum.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded from upstream commit
+ https://github.com/systemd/systemd/commit/d17eabb1052e7c8c432331a7a782845e36164f01]
+---
+ src/journal-remote/journal-gatewayd.c    | 4 ++--
+ src/journal-remote/journal-remote-main.c | 2 +-
+ src/journal-remote/microhttpd-util.h     | 6 ++++++
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/journal-remote/journal-gatewayd.c b/src/journal-remote/journal-gatewayd.c
+index 5177e0d1577..3ab7c98b0b5 100644
+--- a/src/journal-remote/journal-gatewayd.c
++++ b/src/journal-remote/journal-gatewayd.c
+@@ -349,7 +349,7 @@ static int request_parse_range(
+         return 0;
+ }
+ 
+-static int request_parse_arguments_iterator(
++static mhd_result request_parse_arguments_iterator(
+                 void *cls,
+                 enum MHD_ValueKind kind,
+                 const char *key,
+@@ -796,7 +796,7 @@ static int request_handler_machine(
+         return MHD_queue_response(connection, MHD_HTTP_OK, response);
+ }
+ 
+-static int request_handler(
++static mhd_result request_handler(
+                 void *cls,
+                 struct MHD_Connection *connection,
+                 const char *url,
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index 69a111afead..f82d188a8c6 100644
+--- a/src/journal-remote/journal-remote-main.c
++++ b/src/journal-remote/journal-remote-main.c
+@@ -253,7 +253,7 @@ static int process_http_upload(
+         return mhd_respond(connection, MHD_HTTP_ACCEPTED, "OK.");
+ };
+ 
+-static int request_handler(
++static mhd_result request_handler(
+                 void *cls,
+                 struct MHD_Connection *connection,
+                 const char *url,
+diff --git a/src/journal-remote/microhttpd-util.h b/src/journal-remote/microhttpd-util.h
+index d90c6bbd4f1..4ca9a5c4f16 100644
+--- a/src/journal-remote/microhttpd-util.h
++++ b/src/journal-remote/microhttpd-util.h
+@@ -47,6 +47,12 @@
+ #  define MHD_create_response_from_fd_at_offset64 MHD_create_response_from_fd_at_offset
+ #endif
+ 
++#if MHD_VERSION >= 0x00097002
++#  define mhd_result enum MHD_Result
++#else
++#  define mhd_result int
++#endif
++
+ void microhttpd_logger(void *arg, const char *fmt, va_list ap) _printf_(2, 0);
+ 
+ /* respond_oom() must be usable with return, hence this form. */
