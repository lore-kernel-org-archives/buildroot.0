From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2015 00:26:35 +0100
Subject: [Buildroot] [PATCH/next 05/13] package/libinput: bump version to
	1.1.0
In-Reply-To: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447457203-27816-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also rebased 0001-rename-log_msg-to-libinput_log_msg.patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-rename-log_msg-to-libinput_log_msg.patch  | 24 +++++++++++++++++-----
 package/libinput/libinput.hash                     |  4 ++--
 package/libinput/libinput.mk                       |  2 +-
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
index 433b29e..e36862a 100644
--- a/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
+++ b/package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch
@@ -22,9 +22,9 @@ diff --git a/src/libinput-private.h b/src/libinput-private.h
 index b36dc95..98f91b3 100644
 --- a/src/libinput-private.h
 +++ b/src/libinput-private.h
-@@ -179,15 +179,15 @@ struct libinput_event_listener {
- typedef void (*libinput_source_dispatch_t)(void *data);
+@@ -259,12 +259,12 @@
  
+ typedef void (*libinput_source_dispatch_t)(void *data);
  
 -#define log_debug(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
 -#define log_info(li_, ...) log_msg((li_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
@@ -39,17 +39,22 @@ index b36dc95..98f91b3 100644
 +#define log_bug_libinput(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "libinput bug: " __VA_ARGS__)
 +#define log_bug_client(li_, ...) libinput_log_msg((li_), LIBINPUT_LOG_PRIORITY_ERROR, "client bug: " __VA_ARGS__)
  
+ #define log_debug_ratelimit(li_, r_, ...) log_msg_ratelimit((li_), (r_), LIBINPUT_LOG_PRIORITY_DEBUG, __VA_ARGS__)
+ #define log_info_ratelimit(li_, r_, ...) log_msg_ratelimit((li_), (r_), LIBINPUT_LOG_PRIORITY_INFO, __VA_ARGS__)
+@@ -281,7 +281,7 @@
+ 	LIBINPUT_ATTRIBUTE_PRINTF(4, 5);
+ 
  void
 -log_msg(struct libinput *libinput,
 +libinput_log_msg(struct libinput *libinput,
  	enum libinput_log_priority priority,
- 	const char *format, ...);
- 
+ 	const char *format, ...)
+ 	LIBINPUT_ATTRIBUTE_PRINTF(3, 4);
 diff --git a/src/libinput.c b/src/libinput.c
 index 279cce0..5748e5e 100644
 --- a/src/libinput.c
 +++ b/src/libinput.c
-@@ -107,7 +107,7 @@ log_msg_va(struct libinput *libinput,
+@@ -155,7 +155,7 @@
  }
  
  void
@@ -58,6 +63,15 @@ index 279cce0..5748e5e 100644
  	enum libinput_log_priority priority,
  	const char *format, ...)
  {
+@@ -184,7 +184,7 @@
+ 	va_end(args);
+ 
+ 	if (state == RATELIMIT_THRESHOLD)
+-		log_msg(libinput,
++		libinput_log_msg(libinput,
+ 			priority,
+ 			"WARNING: log rate limit exceeded (%d msgs per %dms). Discarding future messages.\n",
+ 			ratelimit->burst,
 -- 
 2.1.2
 
diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 299a28f..18bd4a7 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-July/023184.html
-sha256	69a97da47ef8fa9debadaa8ee11005b9b5183bd2b87c5aa7827b7c388a5acc5d	libinput-0.19.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-October/025065.html
+sha256	673186ea2a0d2b695afaa9758834f9217b175774d9ae222e1b43ff63c663f582	libinput-1.1.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 175e04f..8b51b2b 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.19.0
+LIBINPUT_VERSION = 1.1.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
-- 
2.6.2
