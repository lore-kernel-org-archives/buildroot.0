From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 20:12:04 +0200
Subject: [Buildroot] [git commit] package/libinput: fix build with libevdev
Message-ID: <20140825181225.90F379D4CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e05c6a791d11dbbd619e6be2ebb990cb21db0832
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevdev and libinput use the same function name (log_msg).
An easy fix is to rename one of the two functions.

Fixes:
http://autobuild.buildroot.net/results/b1e/b1ea94f09d6f7459e3d7794c4a62bbdbb53d5da6/build-end.log

[Thomas: slightly reword the patch description.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...put-01-rename-log_msg-to-libinput_log_msg.patch |   59 ++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
new file mode 100644
index 0000000..c10d8af
--- /dev/null
+++ b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
@@ -0,0 +1,59 @@
+From 89a3ae2de21e528b8feb80dbea3928d43982d3be Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 21 Aug 2014 18:18:16 +0200
+Subject: [PATCH 1/1] rename log_msg to libinput_log_msg
+
+This fixes a conflict between libevdev and libinput on the definition
+of the log_msg() symbol.
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
