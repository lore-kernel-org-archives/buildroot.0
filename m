From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Mar 2020 20:12:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/evemu: fix build with kernels >=
 4.16
Message-ID: <20200324191212.2625-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/487dd5056ec0a977d55b23417d5db2664dcc91fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0002-evemu-Update-struct-input_event.patch | 110 ++++++++++++++++++
 ...-evemu.c-fix-build-with-kernels-4.16.patch |  52 +++++++++
 ...-evemu.c-fix-build-with-kernels-4.16.patch |  47 ++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 package/evemu/0002-evemu-Update-struct-input_event.patch
 create mode 100644 package/evemu/0003-src-evemu.c-fix-build-with-kernels-4.16.patch
 create mode 100644 package/evemu/0004-src-evemu.c-fix-build-with-kernels-4.16.patch

diff --git a/package/evemu/0002-evemu-Update-struct-input_event.patch b/package/evemu/0002-evemu-Update-struct-input_event.patch
new file mode 100644
index 0000000000..50fabaf4de
--- /dev/null
+++ b/package/evemu/0002-evemu-Update-struct-input_event.patch
@@ -0,0 +1,110 @@
+From 30973c0bc053b2198cafb1899a0843688d5bb541 Mon Sep 17 00:00:00 2001
+From: Deepa Dinamani <deepa.kernel@gmail.com>
+Date: Mon, 15 Jan 2018 17:18:49 -0800
+Subject: [PATCH] evemu: Update struct input_event
+
+The struct input_event is not y2038 safe.
+Update the struct according to the kernel patch:
+https://lkml.org/lkml/2018/1/6/324
+
+Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+[Retrieved from:
+https://gitlab.freedesktop.org/libevdev/evemu/-/commit/30973c0bc053b2198cafb1899a0843688d5bb541]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/evemu.c | 35 +++++++++++++++++++++++------------
+ 1 file changed, 23 insertions(+), 12 deletions(-)
+
+diff --git a/src/evemu.c b/src/evemu.c
+index a8a949b..c7ff561 100644
+--- a/src/evemu.c
++++ b/src/evemu.c
+@@ -771,7 +771,7 @@ int evemu_write_event(FILE *fp, const struct input_event *ev)
+ {
+ 	int rc;
+ 	rc = fprintf(fp, "E: %lu.%06u %04x %04x %04d	",
+-		     ev->time.tv_sec, (unsigned)ev->time.tv_usec,
++		     ev->input_event_sec, (unsigned)ev->input_event_usec,
+ 		     ev->type, ev->code, ev->value);
+ 	rc += write_event_desc(fp, ev);
+ 	return rc;
+@@ -800,13 +800,19 @@ int evemu_record(FILE *fp, int fd, int ms)
+ 		if (ret < 0)
+ 			return ret;
+ 		if (ret == sizeof(ev)) {
++			struct timeval tv;
+ 			long time;
+ 
++			tv.tv_sec = ev.input_event_sec;
++			tv.tv_usec = ev.input_event_usec;
++
+ 			if (offset == 0)
+-				offset = time_to_long(&ev.time) - 1;
++				offset = time_to_long(&tv) - 1;
+ 
+-			time = time_to_long(&ev.time);
+-			ev.time = long_to_time(time - offset);
++			time = time_to_long(&tv);
++			tv = long_to_time(time - offset);
++			ev.input_event_sec = tv.tv_sec;
++			ev.input_event_usec = tv.tv_usec;
+ 			evemu_write_event(fp, &ev);
+ 			fflush(fp);
+ 		}
+@@ -839,8 +845,8 @@ int evemu_read_event(FILE *fp, struct input_event *ev)
+ 		return -1;
+ 	}
+ 
+-	ev->time.tv_sec = sec;
+-	ev->time.tv_usec = usec;
++	ev->input_event_sec = sec;
++	ev->input_event_usec = usec;
+ 	ev->type = type;
+ 	ev->code = code;
+ 	ev->value = value;
+@@ -852,8 +858,8 @@ out:
+ 
+ int evemu_create_event(struct input_event *ev, int type, int code, int value)
+ {
+-	ev->time.tv_sec = 0;
+-	ev->time.tv_usec = 0;
++	ev->input_event_sec = 0;
++	ev->input_event_usec = 0;
+ 	ev->type = type;
+ 	ev->code = code;
+ 	ev->value = value;
+@@ -873,6 +879,7 @@ static inline unsigned long us2s(unsigned long us)
+ int evemu_read_event_realtime(FILE *fp, struct input_event *ev,
+ 			      struct timeval *evtime)
+ {
++	struct timeval tv;
+ 	unsigned long usec;
+ 	const unsigned long ERROR_MARGIN = 150; /* ?s */
+ 	int ret;
+@@ -882,14 +889,18 @@ int evemu_read_event_realtime(FILE *fp, struct input_event *ev,
+ 		return ret;
+ 
+ 	if (evtime) {
+-		if (evtime->tv_sec == 0 && evtime->tv_usec == 0)
+-			*evtime = ev->time;
+-		usec = time_to_long(&ev->time) - time_to_long(evtime);
++		if (evtime->tv_sec == 0 && evtime->tv_usec == 0) {
++			evtime->tv_sec = ev->input_event_sec;
++			evtime->tv_usec = ev->input_event_usec;
++		}
++		tv.tv_sec = ev->input_event_sec;
++		tv.tv_usec = ev->input_event_usec;
++		usec = time_to_long(&tv) - time_to_long(evtime);
+ 		if (usec > ERROR_MARGIN * 2) {
+ 			if (usec > s2us(10))
+ 				error(INFO, "Sleeping for %lds.\n", us2s(usec));
+ 			usleep(usec - ERROR_MARGIN);
+-			*evtime = ev->time;
++			*evtime = tv;
+ 		}
+ 	}
+ 
+-- 
+2.24.1
+
diff --git a/package/evemu/0003-src-evemu.c-fix-build-with-kernels-4.16.patch b/package/evemu/0003-src-evemu.c-fix-build-with-kernels-4.16.patch
new file mode 100644
index 0000000000..55221aca2c
--- /dev/null
+++ b/package/evemu/0003-src-evemu.c-fix-build-with-kernels-4.16.patch
@@ -0,0 +1,52 @@
+From fd204f628021c9bb13870a8c983d9c63e1a53ebb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 23 Mar 2020 11:04:11 +0100
+Subject: [PATCH] src/evemu.c: fix build with kernels >= 4.16
+
+Commit 30973c0b forgot to update all occurences of input_event, this
+will result in the following build failure with kernel >= 4.16:
+
+evemu.c: In function 'write_event_desc':
+evemu.c:753:23: error: 'const struct input_event' has no member named 'time'; did you mean 'type'?
+    time = millis(&ev->time);
+                       ^~~~
+                       type
+
+Fixes:
+ - http://autobuild.buildroot.org/results/487dd5056ec0a977d55b23417d5db2664dcc91fa
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/libevdev/evemu/-/commit/fd204f628021c9bb13870a8c983d9c63e1a53ebb]
+---
+ src/evemu.c | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/src/evemu.c b/src/evemu.c
+index c7ff561..42dbe1d 100644
+--- a/src/evemu.c
++++ b/src/evemu.c
+@@ -733,11 +733,6 @@ out:
+ 	return rc;
+ }
+ 
+-static inline unsigned long millis(const struct timeval *tv)
+-{
+-	return tv->tv_sec * 1000 + tv->tv_usec/1000;
+-}
+-
+ static int write_event_desc(FILE *fp, const struct input_event *ev)
+ {
+ 	int rc;
+@@ -750,7 +745,7 @@ static int write_event_desc(FILE *fp, const struct input_event *ev)
+ 				     libevdev_event_code_get_name(ev->type, ev->code),
+ 				     ev->value);
+ 		} else {
+-			time = millis(&ev->time);
++			time = ev->input_event_sec * 1000 + ev->input_event_usec/1000;
+ 			dt = time - last_ms;
+ 			last_ms = time;
+ 			rc = fprintf(fp, "# ------------ %s (%d) ---------- %+ldms\n",
+-- 
+2.24.1
+
diff --git a/package/evemu/0004-src-evemu.c-fix-build-with-kernels-4.16.patch b/package/evemu/0004-src-evemu.c-fix-build-with-kernels-4.16.patch
new file mode 100644
index 0000000000..0ff3ee8529
--- /dev/null
+++ b/package/evemu/0004-src-evemu.c-fix-build-with-kernels-4.16.patch
@@ -0,0 +1,47 @@
+From 1babf63444b7b7f3c84e2561fbdecd5fd5a0e36f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 24 Mar 2020 09:06:29 +0100
+Subject: [PATCH] src/evemu.c: fix build with kernels < 4.16
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 30973c0b fixed the build with kernels >= 4.16 but as a side
+effect, build with kernels < 4.16 is now failing on:
+
+evemu.c:892:18: error: ?struct input_event? has no member named ?input_event_usec?
+   tv.tv_usec = ev->input_event_usec;
+                  ^~
+
+Fix this error by defining input_event_sec and input_event_usec if
+needed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/libevdev/evemu/-/commit/1babf63444b7b7f3c84e2561fbdecd5fd5a0e36f]
+---
+ src/evemu.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/evemu.c b/src/evemu.c
+index 42dbe1d..2f457c1 100644
+--- a/src/evemu.c
++++ b/src/evemu.c
+@@ -63,6 +63,14 @@
+ 
+ #define SYSCALL(call) while (((call) == -1) && (errno == EINTR))
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#endif
++
++#ifndef input_event_usec
++#define input_event_usec time.tv_usec
++#endif
++
+ enum error_level {
+ 	INFO,
+ 	WARNING,
+-- 
+2.24.1
+
-- 
2.25.1
