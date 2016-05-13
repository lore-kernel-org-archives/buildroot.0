From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 13 May 2016 09:09:52 +0300
Subject: [Buildroot] [PATCH] libinput: remove unneeded patch
Message-ID: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The log_msg symbol conflict was fixed in libevdev commit e4c315fc1603 (Rename
symbols leaking from static library to avoid name clashes, 2014-08-18) that
was included in version 1.3. Remove the patch that used to fix this issue.

Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-rename-log_msg-to-libinput_log_msg.patch  | 77 ----------------------
 1 file changed, 77 deletions(-)
 delete mode 100644 package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch

diff --git a/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
deleted file mode 100644
index e36862a12da6..000000000000
--- a/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From bf4a4a4e2b0479322fe16c9e1f15f146daa893ee Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Thu, 21 Aug 2014 18:18:16 +0200
-Subject: [PATCH] rename log_msg to libinput_log_msg
-
-This fixes a conflict between libevdev and libinput on the definition
-of the log_msg() symbol.
-
-http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c6c6/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-[yann.morin.1998 at free.fr: rebase on-top of 0.6.0]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[ps.report at gmx.net: rebase on top of 0.7.0]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/libinput-private.h | 14 +++++++-------
- src/libinput.c         |  2 +-
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/libinput-private.h b/src/libinput-private.h
-index b36dc95..98f91b3 100644
---- a/src/libinput-private.h
-+++ b/src/libinput-private.h
-@@ -259,12 +259,12 @@
- 
- typedef void (*libinput_source_dispatch_t)(void *data);
- 
--#define log_debug(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
--#define log_info(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
--#define log_error(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
--#define log_bug_kernel(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
--#define log_bug_libinput(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__)
--#define log_bug_client(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__)
-+#define log_debug(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
-+#define log_info(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
-+#define log_error(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
-+#define log_bug_kernel(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
-+#define log_bug_libinput(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__)
-+#define log_bug_client(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__)
- 
- #define log_debug_ratelimit(li_, r_, ...) log_msg_ratelimit((li_), (r_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
- #define log_info_ratelimit(li_, r_, ...) log_msg_ratelimit((li_), (r_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
-@@ -281,7 +281,7 @@
- 	LIBINPUT_ATTRIBUTE_PRINTF(4, 5);
- 
- void
--log_msg(struct libinput *libinput,
-+libinput_log_msg(struct libinput *libinput,
- 	enum libinput_log_priority priority,
- 	const char *format, ...)
- 	LIBINPUT_ATTRIBUTE_PRINTF(3, 4);
-diff --git a/src/libinput.c b/src/libinput.c
-index 279cce0..5748e5e 100644
---- a/src/libinput.c
-+++ b/src/libinput.c
-@@ -155,7 +155,7 @@
- }
- 
- void
--log_msg(struct libinput *libinput,
-+libinput_log_msg(struct libinput *libinput,
- 	enum libinput_log_priority priority,
- 	const char *format, ...)
- {
-@@ -184,7 +184,7 @@
- 	va_end(args);
- 
- 	if (state == RATELIMIT_THRESHOLD)
--		log_msg(libinput,
-+		libinput_log_msg(libinput,
- 			priority,
- 			"WARNING: log rate limit exceeded (%d msgs per %dms). Discarding future messages.\n",
- 			ratelimit->burst,
--- 
-2.1.2
-
-- 
2.8.1
