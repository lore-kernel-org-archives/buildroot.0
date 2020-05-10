From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:43:54 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libv4l: fix
 input_event related compile failure
Message-ID: <20200510203114.AB4D1913C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cc9fbe1f63bae6b8e2a273939608b7b1bb92de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Add two upstream patches fixing input_event time related
compile failures.

Fixes:

 - http://autobuild.buildroot.net/results/3883a948e30cfd235cfca1fb8646fe8032f5e18d

  keytable.c: In function 'test_event':
  keytable.c:1536:11: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
       ev[i].time.tv_sec, ev[i].time.tv_usec,
             ^~~~
             type
  keytable.c:1536:30: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
       ev[i].time.tv_sec, ev[i].time.tv_usec,
                                ^~~~
                                type

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd27ee0a58165b384cc81eb0bc337cf35f43a51e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-keytable-use-input_event-properly.patch   | 36 ++++++++++++++++++++++
 ...ble-add-compatibility-for-input_event_sec.patch | 35 +++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/package/libv4l/0002-keytable-use-input_event-properly.patch b/package/libv4l/0002-keytable-use-input_event-properly.patch
new file mode 100644
index 0000000000..624bf082bc
--- /dev/null
+++ b/package/libv4l/0002-keytable-use-input_event-properly.patch
@@ -0,0 +1,36 @@
+From a84fc5d02ffd7119b3e38b72339f5760991d14da Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Mon, 30 Mar 2020 14:24:34 -0700
+Subject: [PATCH] keytable: use input_event properly
+
+It does not use time_t under musl when time_t is 64-bit. The struct has
+compatibility defines. Instead of using time_t directly, use those
+defines.
+
+Fixes compilation under musl 1.2.0 under 32-bit OSes.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: Sean Young <sean@mess.org>
+
+[Upstream: https://git.linuxtv.org/v4l-utils.git/patch/?id=38f4ce74275ae4625463f7eec78764715a0b6246]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ utils/keytable/keytable.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
+index 6cb0217..318c064 100644
+--- a/utils/keytable/keytable.c
++++ b/utils/keytable/keytable.c
+@@ -1533,7 +1533,7 @@ static void test_event(struct rc_device *rc_dev, int fd)
+ 
+ 		for (i = 0; i < rd / sizeof(struct input_event); i++) {
+ 			printf(_("%ld.%06ld: event type %s(0x%02x)"),
+-				ev[i].time.tv_sec, ev[i].time.tv_usec,
++				ev[i].input_event_sec, ev[i].input_event_usec,
+ 				get_event_name(events_type, ev[i].type), ev[i].type);
+ 
+ 			switch (ev[i].type) {
+-- 
+2.26.2
+
diff --git a/package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch b/package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch
new file mode 100644
index 0000000000..65126789a3
--- /dev/null
+++ b/package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch
@@ -0,0 +1,35 @@
+From 986345e5673b1e68db513a4f72e6e79c74512a3b Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 7 Apr 2020 18:13:44 -0700
+Subject: [PATCH] keytable: add compatibility for input_event_sec
+
+Linux 4.16 added support for this macro. When it is not available,
+define it back to the previous value.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: Sean Young <sean@mess.org>
+
+[Upstream: https://git.linuxtv.org/v4l-utils.git/patch/?id=8b7e6ce9367fe09ca9398b5f3cc75bba2598b162]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ utils/keytable/keytable.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
+index 318c064..705867c 100644
+--- a/utils/keytable/keytable.c
++++ b/utils/keytable/keytable.c
+@@ -62,6 +62,10 @@ struct input_keymap_entry_v2 {
+ 	u_int8_t  scancode[32];
+ };
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
+ 
+ #define IR_PROTOCOLS_USER_DIR IR_KEYTABLE_USER_DIR "/protocols"
+ #define IR_PROTOCOLS_SYSTEM_DIR IR_KEYTABLE_SYSTEM_DIR "/protocols"
+-- 
+2.26.2
+
