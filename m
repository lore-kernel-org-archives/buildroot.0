From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Jun 2017 17:42:17 +0200
Subject: [Buildroot] [PATCH] package/bdwgc: backport an upstream patch to
	fix musl build
Message-ID: <20170603154217.6053-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c9e/c9ec16635fbdb2d6ddf11e317bc537c111ea7050

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...-tv-is-unknown-error-in-brief_async_signa.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/bdwgc/0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch

diff --git a/package/bdwgc/0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch b/package/bdwgc/0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch
new file mode 100644
index 0000000..e17ed84
--- /dev/null
+++ b/package/bdwgc/0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch
@@ -0,0 +1,35 @@
+From 31eef02317d59b4d204624efbddaea641e861390 Mon Sep 17 00:00:00 2001
+From: Mikael Djurfeldt <mikael@djurfeldt.com>
+Date: Sun, 26 Feb 2017 20:09:56 +0100
+Subject: [PATCH] Fix 'size of tv is unknown' error in
+ brief_async_signal_safe_sleep (musl) (fix commits 62097c3, 9f48082)
+
+Include <sys/time.h> to get struct timeval defined and select() declared.
+
+* pthread_stop_world.c [GC_ENABLE_SUSPEND_THREAD]: Include sys/time.h
+before GC_brief_async_signal_safe_sleep definition.
+
+Upstream status: upstream
+commit ffad61d3bbe86c09ffe062dab393fcb0e4940580
+
+[Romain: backported to 7.6.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ pthread_stop_world.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pthread_stop_world.c b/pthread_stop_world.c
+index dad1fdc..8c76944 100644
+--- a/pthread_stop_world.c
++++ b/pthread_stop_world.c
+@@ -391,6 +391,7 @@ STATIC void GC_restart_handler(int sig)
+ #   ifndef GC_TIME_LIMIT
+ #     define GC_TIME_LIMIT 50
+ #   endif
++#   include <sys/time.h>
+ 
+     STATIC void GC_brief_async_signal_safe_sleep(void)
+     {
+-- 
+2.9.4
+
-- 
2.9.4
