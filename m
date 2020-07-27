From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 21:17:54 +0200
Subject: [Buildroot] [git commit] package/systemd: bump version to 245.7
Message-ID: <20200727191311.6932781F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2f79735f6d64911853d0defe970660fadb4e257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop upstream patch

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-build-with-libmicrohttpd-0.9.71.patch | 71 ----------------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)

diff --git a/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch b/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch
deleted file mode 100644
index 7c1cfe939b..0000000000
--- a/package/systemd/0001-Fix-build-with-libmicrohttpd-0.9.71.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From d17eabb1052e7c8c432331a7a782845e36164f01 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Tue, 30 Jun 2020 09:56:10 +0200
-Subject: [PATCH] =?UTF-8?q?Fix=20build=20with=20=C2=B5httpd=200.9.71?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The return type of callbacks was changed from int to an enum.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded from upstream commit
- https://github.com/systemd/systemd/commit/d17eabb1052e7c8c432331a7a782845e36164f01]
----
- src/journal-remote/journal-gatewayd.c    | 4 ++--
- src/journal-remote/journal-remote-main.c | 2 +-
- src/journal-remote/microhttpd-util.h     | 6 ++++++
- 3 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/journal-remote/journal-gatewayd.c b/src/journal-remote/journal-gatewayd.c
-index 5177e0d1577..3ab7c98b0b5 100644
---- a/src/journal-remote/journal-gatewayd.c
-+++ b/src/journal-remote/journal-gatewayd.c
-@@ -349,7 +349,7 @@ static int request_parse_range(
-         return 0;
- }
- 
--static int request_parse_arguments_iterator(
-+static mhd_result request_parse_arguments_iterator(
-                 void *cls,
-                 enum MHD_ValueKind kind,
-                 const char *key,
-@@ -796,7 +796,7 @@ static int request_handler_machine(
-         return MHD_queue_response(connection, MHD_HTTP_OK, response);
- }
- 
--static int request_handler(
-+static mhd_result request_handler(
-                 void *cls,
-                 struct MHD_Connection *connection,
-                 const char *url,
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 69a111afead..f82d188a8c6 100644
---- a/src/journal-remote/journal-remote-main.c
-+++ b/src/journal-remote/journal-remote-main.c
-@@ -253,7 +253,7 @@ static int process_http_upload(
-         return mhd_respond(connection, MHD_HTTP_ACCEPTED, "OK.");
- };
- 
--static int request_handler(
-+static mhd_result request_handler(
-                 void *cls,
-                 struct MHD_Connection *connection,
-                 const char *url,
-diff --git a/src/journal-remote/microhttpd-util.h b/src/journal-remote/microhttpd-util.h
-index d90c6bbd4f1..4ca9a5c4f16 100644
---- a/src/journal-remote/microhttpd-util.h
-+++ b/src/journal-remote/microhttpd-util.h
-@@ -47,6 +47,12 @@
- #  define MHD_create_response_from_fd_at_offset64 MHD_create_response_from_fd_at_offset
- #endif
- 
-+#if MHD_VERSION >= 0x00097002
-+#  define mhd_result enum MHD_Result
-+#else
-+#  define mhd_result int
-+#endif
-+
- void microhttpd_logger(void *arg, const char *fmt, va_list ap) _printf_(2, 0);
- 
- /* respond_oom() must be usable with return, hence this form. */
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 64ba6405b0..a90a54ab56 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  f58424fd2d105503f836ff7d099d762901fb40347de993fce7373d65ff640f5b  systemd-245.6.tar.gz
+sha256  5770df29a89e8249bb4fbdc2018e2ea7bbb4fd01425cc03ece338f04a1d80c7f  systemd-245.7.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92  README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b94dc37761..107fcbe66a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 245.6
+SYSTEMD_VERSION = 245.7
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
