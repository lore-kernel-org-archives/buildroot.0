From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:52:48 +0200
Subject: [Buildroot] [git commit] package/cog: fix segfaults on null
 xkb_data keymap/state
Message-ID: <20200329194403.2B35F8907A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75fbc58f3f485e3e13d741e934fb5c5f8989006c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
Program terminated with signal SIGSEGV, Segmentation fault.
#0  xkb_state_key_get_layout (state=state at entry=0x0, kc=kc at entry=50) at ../src/state.c:217

Program terminated with signal SIGSEGV, Segmentation fault.
#0  XkbKey (kc=kc at entry=45, keymap=0x0) at ../src/keymap.h:430

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...xkb_data.state-is-not-null-before-calling.patch | 30 ++++++++++++++++++++++
 ...xkb_data.keymap-is-not-null-before-callin.patch | 30 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch b/package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
new file mode 100644
index 0000000000..48918001e9
--- /dev/null
+++ b/package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
@@ -0,0 +1,30 @@
+From 575ef199984ae4e8510ed36f8b1ae1babdff8ea9 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 26 Mar 2020 07:48:19 -0600
+Subject: [PATCH] fdo: ensure xkb_data.state is not null before calling
+ xkb_state_key_get_one_sym (#192)
+
+[james.hilliard1 at gmail.com: backport from upstream commit
+575ef199984ae4e8510ed36f8b1ae1babdff8ea9]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ platform/cog-platform-fdo.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/platform/cog-platform-fdo.c b/platform/cog-platform-fdo.c
+index 043f91d..93ff255 100644
+--- a/platform/cog-platform-fdo.c
++++ b/platform/cog-platform-fdo.c
+@@ -919,6 +919,9 @@ capture_app_key_bindings (uint32_t keysym,
+ static void
+ handle_key_event (uint32_t key, uint32_t state, uint32_t time)
+ {
++    if (xkb_data.state == NULL)
++        return;
++
+     uint32_t keysym = xkb_state_key_get_one_sym (xkb_data.state, key);
+     uint32_t unicode = xkb_state_key_get_utf32 (xkb_data.state, key);
+ 
+-- 
+2.20.1
+
diff --git a/package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch b/package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch
new file mode 100644
index 0000000000..58842bb15c
--- /dev/null
+++ b/package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch
@@ -0,0 +1,30 @@
+From 817f6c9dafd5ad23722eae0a8f43ba9211f37c95 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 26 Mar 2020 07:49:05 -0600
+Subject: [PATCH] fdo: ensure xkb_data.keymap is not null before calling
+ xkb_keymap_key_repeats (#193)
+
+[james.hilliard1 at gmail.com: backport from upstream commit
+817f6c9dafd5ad23722eae0a8f43ba9211f37c95]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ platform/cog-platform-fdo.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/platform/cog-platform-fdo.c b/platform/cog-platform-fdo.c
+index 93ff255..ecc05e9 100644
+--- a/platform/cog-platform-fdo.c
++++ b/platform/cog-platform-fdo.c
+@@ -990,7 +990,8 @@ keyboard_on_key (void *data,
+         memset (&wl_data.keyboard.repeat_data,
+                 0x00,
+                 sizeof (wl_data.keyboard.repeat_data));
+-    } else if (state == WL_KEYBOARD_KEY_STATE_PRESSED
++    } else if (xkb_data.keymap != NULL
++               && state == WL_KEYBOARD_KEY_STATE_PRESSED
+                && xkb_keymap_key_repeats (xkb_data.keymap, key)) {
+         if (wl_data.keyboard.repeat_data.event_source)
+             g_source_remove (wl_data.keyboard.repeat_data.event_source);
+-- 
+2.20.1
+
