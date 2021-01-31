From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:14:29 +0100
Subject: [Buildroot] [git commit] package/brltty: bump to version 6.3
Message-ID: <20210131215423.E489785670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df56b4d7ab4ba2847150822ea712efd1747308fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop second patch (already in version)
- Update hash of README, FrankAudiodata added and update in year:
  https://github.com/brltty/brltty/commit/76852b0214edea71ce36a1f8a905294a164e7f34
  https://github.com/brltty/brltty/commit/fdf19475c9b13125c2b7cb09e7d4c18bdf308e97
  https://github.com/brltty/brltty/commit/8f040b2ab8913b182fb87e3bcfa1f315235120cd
  https://github.com/brltty/brltty/commit/90fd84da90e2354d27a12fbe47728a5491fe8e72
- Update indentation in hash file (two spaces)

https://brltty.app/doc/ChangeLog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fix-input_event-time-related-compile-fail.patch | 52 ----------------------
 package/brltty/brltty.hash                         |  6 +--
 package/brltty/brltty.mk                           |  2 +-
 3 files changed, 4 insertions(+), 56 deletions(-)

diff --git a/package/brltty/0002-fix-input_event-time-related-compile-fail.patch b/package/brltty/0002-fix-input_event-time-related-compile-fail.patch
deleted file mode 100644
index 249d420ca9..0000000000
--- a/package/brltty/0002-fix-input_event-time-related-compile-fail.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 43390f9906a8c663872e0eab56c1173032d1bd6c Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Sun, 7 Jun 2020 12:58:38 +0200
-Subject: [PATCH] fix input_event time related compile fail
-
-./system_linux.c: In function 'writeInputEvent':
-./system_linux.c:962:23: error: 'struct input_event' has no member named 'time'; did you mean 'type'?
-   gettimeofday(&event.time, NULL);
-                       ^~~~
-                       type
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- Programs/system_linux.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/Programs/system_linux.c b/Programs/system_linux.c
-index a97ee7ff6..77052d32f 100644
---- a/Programs/system_linux.c
-+++ b/Programs/system_linux.c
-@@ -40,6 +40,14 @@
- #ifdef HAVE_LINUX_INPUT_H
- #include <linux/input.h>
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#endif
-+
-+#ifndef input_event_usec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #include "kbd_keycodes.h"
- 
- LINUX_KEY_MAP(xt00) = {
-@@ -957,9 +965,12 @@ int
- writeInputEvent (UinputObject *uinput, uint16_t type, uint16_t code, int32_t value) {
- #ifdef HAVE_LINUX_UINPUT_H
-   struct input_event event;
-+  struct timeval tv;
- 
-   memset(&event, 0, sizeof(event));
--  gettimeofday(&event.time, NULL);
-+  gettimeofday(&tv, NULL);
-+  event.input_event_sec = tv.tv_sec;
-+  event.input_event_usec = tv.tv_usec;
-   event.type = type;
-   event.code = code;
-   event.value = value;
--- 
-2.20.1
-
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index d4f87c42f2..504b0d802a 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 4a28e3f1879aee9082f9ce4100fd4053be47add7f8ab0f2af6d6a20590934b62 brltty-6.1.tar.xz
-sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f LICENSE-LGPL
-sha256 9ac2af461c3f5c1640601d607a299c7cb9fe3d2f9974bf671af46601e4f9198f README
+sha256  b256df8f86b4d6a597cfe982cc5a7c831915de37cfece683ddb02b2329256a8a  brltty-6.3.tar.xz
+sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
+sha256  da78e60359a86eeefb6d6e02bc47d386ece10ae45309d998981157c3746724ab  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 3924fa0c1a..602750c9b8 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.1
+BRLTTY_VERSION = 6.3
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
