From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 14:01:42 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/lirc-tools: fix build with musl 1.2.0
Message-ID: <20200421120142.3320986-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/fdb67297e551c5422fc5f4e058463876682b07f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add autobuilder link

 ...devinput.c-fix-build-with-musl-1.2.0.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch

diff --git a/package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch b/package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
new file mode 100644
index 0000000000..e4c02cf458
--- /dev/null
+++ b/package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
@@ -0,0 +1,42 @@
+From 74909db0342c7aff29e15972c9928f3bef56d5a6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Apr 2020 12:14:13 +0200
+Subject: [PATCH] plugins/devinput.c: fix build with musl 1.2.0
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ plugins/devinput.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/plugins/devinput.c b/plugins/devinput.c
+index 77828b44..e5a52e42 100644
+--- a/plugins/devinput.c
++++ b/plugins/devinput.c
+@@ -51,6 +51,10 @@
+ #define LONG(x) ((x) / BITS_PER_LONG)
+ #define test_bit(bit, array)    ((array[LONG(bit)] >> OFF(bit)) & 1)
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
+ 
+ static const logchannel_t logchannel = LOG_DRIVER;
+ 
+@@ -458,7 +462,7 @@ char* devinput_rec(struct ir_remote* remotes)
+ 		return 0;
+ 	}
+ 
+-	log_trace("time %ld.%06ld  type %d  code %d  value %d", event.time.tv_sec, event.time.tv_usec, event.type,
++	log_trace("time %ld.%06ld  type %d  code %d  value %d", event.input_event_sec, event.input_event_usec, event.type,
+ 		  event.code, event.value);
+ 
+ 	value = (unsigned)event.value;
+-- 
+2.25.1
+
-- 
2.25.1
