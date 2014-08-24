From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 24 Aug 2014 18:53:05 +0200
Subject: [Buildroot] [PATCH 2/3] package/libinput: fix build with libevdev
In-Reply-To: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>
References: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1408899186-28542-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libevdev and libinput use the same function name (log_msg).
An easy fix is to rename one of the two functions.

Fixes:
http://autobuild.buildroot.net/results/b1e/b1ea94f09d6f7459e3d7794c4a62bbdbb53d5da6/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...put-01-rename-log_msg-to-libinput_log_msg.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch

diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
new file mode 100644
index 0000000..55604b5
--- /dev/null
+++ b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
@@ -0,0 +1,58 @@
+From 89a3ae2de21e528b8feb80dbea3928d43982d3be Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 21 Aug 2014 18:18:16 +0200
+Subject: [PATCH 1/1] rename log_msg to libinput_log_msg
+
+This fix conflicts between libevdev and libinput
+
+http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c6c6/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/libinput-private.h | 14 +++++++-------
+ src/libinput.c         |  2 +-
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/libinput-private.h b/src/libinput-private.h
+index f9d2f87..ac1e1c4 100644
+--- a/src/libinput-private.h
++++ b/src/libinput-private.h
+@@ -81,15 +81,15 @@ typedef void (*libinput_source_dispatch_t)(void *data);
+ 
+ struct libinput_source;
+ 
+-#define log_debug(...) log_msg(LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
+-#define log_info(...) log_msg(LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
+-#define log_error(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
+-#define log_bug_kernel(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
+-#define log_bug_libinput(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
+-#define log_bug_client(...) log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
++#define log_debug(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
++#define log_info(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
++#define log_error(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, __VA_ARGS__)
++#define log_bug_kernel(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "kernel bug: " __VA_ARGS__)
++#define log_bug_libinput(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__);
++#define log_bug_client(...) libinput_log_msg(LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__);
+ 
+ void
+-log_msg(enum libinput_log_priority priority, const char *format, ...);
++libinput_log_msg(enum libinput_log_priority priority, const char *format, ...);
+ 
+ int
+ libinput_init(struct libinput *libinput,
+diff --git a/src/libinput.c b/src/libinput.c
+index eec9efb..4e3f6fa 100644
+--- a/src/libinput.c
++++ b/src/libinput.c
+@@ -110,7 +110,7 @@ static struct log_data log_data = {
+ };
+ 
+ void
+-log_msg(enum libinput_log_priority priority, const char *format, ...)
++libinput_log_msg(enum libinput_log_priority priority, const char *format, ...)
+ {
+ 	va_list args;
+ 
+-- 
+1.9.3
+
-- 
1.9.3
