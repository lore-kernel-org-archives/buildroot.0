From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 23:13:54 +0200
Subject: [Buildroot] [git commit] libinput: fix build for older kernel
	headers
Message-ID: <20140602211715.0F7C79CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54b3fd46f51d7c24e65b3ee638fd1d72807da57f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provide a fallback definition for KEY_MICMUTE (which was added in 3.1) and
fix the fallback definition for KEY_LIGHTS_TOGGLE (which was added in 3.10).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...dev.c-use-correct-fallback-value-for-KEY_.patch |   29 +++++++++++++++++
 ...dev.c-provide-fallback-definition-for-KEY.patch |   34 ++++++++++++++++++++
 2 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/package/libinput/libinput-0001-libinput-evdev.c-use-correct-fallback-value-for-KEY_.patch b/package/libinput/libinput-0001-libinput-evdev.c-use-correct-fallback-value-for-KEY_.patch
new file mode 100644
index 0000000..6eb9d8d
--- /dev/null
+++ b/package/libinput/libinput-0001-libinput-evdev.c-use-correct-fallback-value-for-KEY_.patch
@@ -0,0 +1,29 @@
+From d9b39d4e517a08350800cf253f7434cf4b865b81 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 2 Jun 2014 23:02:21 +0200
+Subject: [PATCH 1/2] libinput: evdev.c: use correct fallback value for
+ KEY_LIGHTS_TOGGLE
+
+The kernel defines KEY_LIGHTS_TOGGLE as 0x21e, not 0x160 (which is KEY_OK).
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/evdev.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/evdev.c b/src/evdev.c
+index ed5749e..3053764 100644
+--- a/src/evdev.c
++++ b/src/evdev.c
+@@ -42,7 +42,7 @@
+ #define DEFAULT_AXIS_STEP_DISTANCE li_fixed_from_int(10)
+ 
+ #ifndef KEY_LIGHTS_TOGGLE
+-#define KEY_LIGHTS_TOGGLE 0x160
++#define KEY_LIGHTS_TOGGLE 0x21e
+ #endif
+ 
+ void
+-- 
+2.0.0.rc2
+
diff --git a/package/libinput/libinput-0002-libinput-evdev.c-provide-fallback-definition-for-KEY.patch b/package/libinput/libinput-0002-libinput-evdev.c-provide-fallback-definition-for-KEY.patch
new file mode 100644
index 0000000..0941796
--- /dev/null
+++ b/package/libinput/libinput-0002-libinput-evdev.c-provide-fallback-definition-for-KEY.patch
@@ -0,0 +1,34 @@
+From 1e2ea4883175fe3eecee95d81d1f94f22299e518 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 2 Jun 2014 23:04:33 +0200
+Subject: [PATCH 2/2] libinput: evdev.c: provide fallback definition for
+ KEY_MICMUTE
+
+KEY_MICMUTE was added relatively recently (3.1 with 33009557bd: Add
+KEY_MICMUTE and enable it on Lenovo X220), so provide a fallback definition
+similar to how we do it for KEY_LIGHTS_TOGGLE to fix compilation with older
+toolchains.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/evdev.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/evdev.c b/src/evdev.c
+index 3053764..d32ece3 100644
+--- a/src/evdev.c
++++ b/src/evdev.c
+@@ -41,6 +41,10 @@
+ 
+ #define DEFAULT_AXIS_STEP_DISTANCE li_fixed_from_int(10)
+ 
++#ifndef KEY_MICMUTE
++#define KEY_MICMUTE 0xf8
++#endif
++
+ #ifndef KEY_LIGHTS_TOGGLE
+ #define KEY_LIGHTS_TOGGLE 0x21e
+ #endif
+-- 
+2.0.0.rc2
+
