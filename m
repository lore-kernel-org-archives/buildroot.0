From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  8 Dec 2014 20:37:07 +0100
Subject: [Buildroot] [PATCH 1/2] libinput: bump version to 0.7.0
Message-ID: <1418067428-20116-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for a detailed list of changes.

Additional renamed (and rebased) the single patch.

[1] http://lists.freedesktop.org/archives/wayland-devel/2014-December/018750.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0001-rename-log_msg-to-libinput_log_msg.patch  | 63 ++++++++++++++++++++
 ...put-01-rename-log_msg-to-libinput_log_msg.patch | 67 ----------------------
 package/libinput/libinput.mk                       |  2 +-
 3 files changed, 64 insertions(+), 68 deletions(-)
 create mode 100644 package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
 delete mode 100644 package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch

diff --git a/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
new file mode 100644
index 0000000..433b29e
--- /dev/null
+++ b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
@@ -0,0 +1,63 @@
+From bf4a4a4e2b0479322fe16c9e1f15f146daa893ee Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 21 Aug 2014 18:18:16 +0200
+Subject: [PATCH] rename log_msg to libinput_log_msg
+
+This fixes a conflict between libevdev and libinput on the definition
+of the log_msg() symbol.
+
+http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c6c6/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+[yann.morin.1998 at free.fr: rebase on-top of 0.6.0]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[ps.report at gmx.net: rebase on top of 0.7.0]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/libinput-private.h | 14 +++++++-------
+ src/libinput.c         |  2 +-
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/libinput-private.h b/src/libinput-private.h
+index b36dc95..98f91b3 100644
+--- a/src/libinput-private.h
++++ b/src/libinput-private.h
+@@ -179,15 +179,15 @@ struct libinput_event_listener {
+ typedef void (*libinput_source_dispatch_t)(void *data);
+ 
+ 
+-#define log_debug(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
+-#define log_info(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
+-#define log_error(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
+-#define log_bug_kernel(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
+-#define log_bug_libinput(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__)
+-#define log_bug_client(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__)
++#define log_debug(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
++#define log_info(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
++#define log_error(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
++#define log_bug_kernel(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
++#define log_bug_libinput(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__)
++#define log_bug_client(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__)
+ 
+ void
+-log_msg(struct libinput *libinput,
++libinput_log_msg(struct libinput *libinput,
+ 	enum libinput_log_priority priority,
+ 	const char *format, ...);
+ 
+diff --git a/src/libinput.c b/src/libinput.c
+index 279cce0..5748e5e 100644
+--- a/src/libinput.c
++++ b/src/libinput.c
+@@ -107,7 +107,7 @@ log_msg_va(struct libinput *libinput,
+ }
+ 
+ void
+-log_msg(struct libinput *libinput,
++libinput_log_msg(struct libinput *libinput,
+ 	enum libinput_log_priority priority,
+ 	const char *format, ...)
+ {
+-- 
+2.1.2
+
diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
deleted file mode 100644
index 2ada150..0000000
--- a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 89a3ae2de21e528b8feb80dbea3928d43982d3be Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Thu, 21 Aug 2014 18:18:16 +0200
-Subject: [PATCH 1/1] rename log_msg to libinput_log_msg
-
-This fixes a conflict between libevdev and libinput on the definition
-of the log_msg() symbol.
-
-http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c6c6/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-[yann.morin.1998 at free.fr: rebase on-top of 0.6.0]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- src/libinput-private.h | 14 +++++++-------
- src/libinput.c         |  2 +-
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/libinput-private.h b/src/libinput-private.h
-index f9d2f87..ac1e1c4 100644
---- a/src/libinput-private.h
-+++ b/src/libinput-private.h
-@@ -116,15 +116,15 @@ typedef void (*libinput_source_dispatch_t)(void *data);
- typedef void (*libinput_source_dispatch_t)(void *data);
- 
- 
--#define log_debug(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
--#define log_info(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
--#define log_error(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
--#define log_bug_kernel(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
--#define log_bug_libinput(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
--#define log_bug_client(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
-+#define log_debug(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
-+#define log_info(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
-+#define log_error(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
-+#define log_bug_kernel(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
-+#define log_bug_libinput(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
-+#define log_bug_client(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
- 
- void
--log_msg(struct libinput *libinput,
-+libinput_log_msg(struct libinput *libinput,
- 	enum libinput_log_priority priority,
- 	const char *format, ...);
- 
- void
--log_msg(struct libinput *libinput,
-+libinput_log_msg(struct libinput *libinput,
- 	enum libinput_log_priority priority,
- 	const char *format, ...);
- 
-diff --git a/src/libinput.c b/src/libinput.c
-index eec9efb..4e3f6fa 100644
---- a/src/libinput.c
-+++ b/src/libinput.c
-@@ -110,7 +110,7 @@ static struct log_data log_data = {
- }
- 
- void
--log_msg(struct libinput *libinput,
-+libinput_log_msg(struct libinput *libinput,
- 	enum libinput_log_priority priority,
- 	const char *format, ...)
- {
--- 
-1.9.3
-
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 2ea30ed..bf4537b 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.6.0
+LIBINPUT_VERSION = 0.7.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
-- 
2.1.2
