From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:27:06 +0200
Subject: [Buildroot] [git commit] package/libv4l: bump version to 1.20.0
Message-ID: <20200602212835.2DEFB7FD2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7cd1f0370871b4633c70b09003cac1aaeddaacf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed 0002-keytable-use-input_event-properly.patch
  (upstream [1])

- removed 0003-keytable-add-compatibility-for-input_event_sec.patch
  (upstream [2])

[1] https://git.linuxtv.org/v4l-utils.git/patch/?id=38f4ce74275ae4625463f7eec78764715a0b6246
[2] https://git.linuxtv.org/v4l-utils.git/patch/?id=8b7e6ce9367fe09ca9398b5f3cc75bba2598b162

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-keytable-use-input_event-properly.patch   | 36 ----------------------
 ...ble-add-compatibility-for-input_event_sec.patch | 35 ---------------------
 package/libv4l/libv4l.hash                         | 10 +++---
 package/libv4l/libv4l.mk                           |  2 +-
 4 files changed, 6 insertions(+), 77 deletions(-)

diff --git a/package/libv4l/0002-keytable-use-input_event-properly.patch b/package/libv4l/0002-keytable-use-input_event-properly.patch
deleted file mode 100644
index 624bf082bc..0000000000
--- a/package/libv4l/0002-keytable-use-input_event-properly.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a84fc5d02ffd7119b3e38b72339f5760991d14da Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Mon, 30 Mar 2020 14:24:34 -0700
-Subject: [PATCH] keytable: use input_event properly
-
-It does not use time_t under musl when time_t is 64-bit. The struct has
-compatibility defines. Instead of using time_t directly, use those
-defines.
-
-Fixes compilation under musl 1.2.0 under 32-bit OSes.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: Sean Young <sean@mess.org>
-
-[Upstream: https://git.linuxtv.org/v4l-utils.git/patch/?id=38f4ce74275ae4625463f7eec78764715a0b6246]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- utils/keytable/keytable.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
-index 6cb0217..318c064 100644
---- a/utils/keytable/keytable.c
-+++ b/utils/keytable/keytable.c
-@@ -1533,7 +1533,7 @@ static void test_event(struct rc_device *rc_dev, int fd)
- 
- 		for (i = 0; i < rd / sizeof(struct input_event); i++) {
- 			printf(_("%ld.%06ld: event type %s(0x%02x)"),
--				ev[i].time.tv_sec, ev[i].time.tv_usec,
-+				ev[i].input_event_sec, ev[i].input_event_usec,
- 				get_event_name(events_type, ev[i].type), ev[i].type);
- 
- 			switch (ev[i].type) {
--- 
-2.26.2
-
diff --git a/package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch b/package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch
deleted file mode 100644
index 65126789a3..0000000000
--- a/package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 986345e5673b1e68db513a4f72e6e79c74512a3b Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Tue, 7 Apr 2020 18:13:44 -0700
-Subject: [PATCH] keytable: add compatibility for input_event_sec
-
-Linux 4.16 added support for this macro. When it is not available,
-define it back to the previous value.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: Sean Young <sean@mess.org>
-
-[Upstream: https://git.linuxtv.org/v4l-utils.git/patch/?id=8b7e6ce9367fe09ca9398b5f3cc75bba2598b162]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- utils/keytable/keytable.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
-index 318c064..705867c 100644
---- a/utils/keytable/keytable.c
-+++ b/utils/keytable/keytable.c
-@@ -62,6 +62,10 @@ struct input_keymap_entry_v2 {
- 	u_int8_t  scancode[32];
- };
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
- 
- #define IR_PROTOCOLS_USER_DIR IR_KEYTABLE_USER_DIR "/protocols"
- #define IR_PROTOCOLS_SYSTEM_DIR IR_KEYTABLE_SYSTEM_DIR "/protocols"
--- 
-2.26.2
-
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 5b29d7d65a..e45dd576bd 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,9 +1,9 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.18.0.tar.bz2.asc
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256 6cb60d822eeed20486a03cc23e0fc65956fbc1e85e0c1a7477f68bbd9802880d  v4l-utils-1.18.0.tar.bz2
+sha256 956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7  v4l-utils-1.20.0.tar.bz2
 
 # Locally calculated
-sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
-sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
-sha256 34229b5aadfb768d0d083987cba54203a920904a3ec8320823c6125b9831acd1  lib/libv4l1/libv4l1-kernelcode-license.txt
+sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
+sha256  5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
+sha256  34229b5aadfb768d0d083987cba54203a920904a3ec8320823c6125b9831acd1  lib/libv4l1/libv4l1-kernelcode-license.txt
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index e095e3d7e1..7b61823cec 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.18.0
+LIBV4L_VERSION = 1.20.0
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
