From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:43:38 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/brltty: fix
 input_event related compile failure
Message-ID: <20200712214112.9907986A01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66f6e1451f5c2c2134c963e380d70722475b7ff4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Add a patch to fix input_event time related compile failure. The problem
is reported and fixed upstream.

Fixes:
http://autobuild.buildroot.net/results/7c5278c0ff2b2d8f88803e256803b31a75904efe/build-end.log

./system_linux.c: In function 'writeInputEvent':
./system_linux.c:962:23: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
   gettimeofday(&event.time, NULL);
                       ^~~~
                       type

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 69e8b09c4f4b5ede4183f6aa85ee481dd0d866ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-input_event-time-related-compile-fail.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/brltty/0002-fix-input_event-time-related-compile-fail.patch b/package/brltty/0002-fix-input_event-time-related-compile-fail.patch
new file mode 100644
index 0000000000..249d420ca9
--- /dev/null
+++ b/package/brltty/0002-fix-input_event-time-related-compile-fail.patch
@@ -0,0 +1,52 @@
+From 43390f9906a8c663872e0eab56c1173032d1bd6c Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Sun, 7 Jun 2020 12:58:38 +0200
+Subject: [PATCH] fix input_event time related compile fail
+
+./system_linux.c: In function 'writeInputEvent':
+./system_linux.c:962:23: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
+   gettimeofday(&event.time, NULL);
+                       ^~~~
+                       type
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ Programs/system_linux.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Programs/system_linux.c b/Programs/system_linux.c
+index a97ee7ff6..77052d32f 100644
+--- a/Programs/system_linux.c
++++ b/Programs/system_linux.c
+@@ -40,6 +40,14 @@
+ #ifdef HAVE_LINUX_INPUT_H
+ #include <linux/input.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#endif
++
++#ifndef input_event_usec
++#define input_event_usec time.tv_usec
++#endif
++
+ #include "kbd_keycodes.h"
+ 
+ LINUX_KEY_MAP(xt00) = {
+@@ -957,9 +965,12 @@ int
+ writeInputEvent (UinputObject *uinput, uint16_t type, uint16_t code, int32_t value) {
+ #ifdef HAVE_LINUX_UINPUT_H
+   struct input_event event;
++  struct timeval tv;
+ 
+   memset(&event, 0, sizeof(event));
+-  gettimeofday(&event.time, NULL);
++  gettimeofday(&tv, NULL);
++  event.input_event_sec = tv.tv_sec;
++  event.input_event_usec = tv.tv_usec;
+   event.type = type;
+   event.code = code;
+   event.value = value;
+-- 
+2.20.1
+
