From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 18:39:44 +0100
Subject: [Buildroot] [git commit] package/cog: add patch fixing cog segfault
Message-ID: <20200218172804.B5EC68E41E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=285e54cfdea294284e1f7c53adfe0b46190ec609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
Thread 1 "cog" received signal SIGSEGV, Segmentation fault.
xkb_state_update_mask (state=0x0, base_mods=0, latched_mods=0, locked_mods=0, base_group=base_group at entry=0, latched_group=latched_group at entry=0, locked_group=0) at ../src/state.c:814
814	    prev_components = state->components;

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...xkb_data.state-is-not-null-before-calling.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch b/package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
new file mode 100644
index 0000000000..4e8d4ad121
--- /dev/null
+++ b/package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
@@ -0,0 +1,30 @@
+From 9f1f1e64b65e6680d5cdedf5a3b753ef85fc01f4 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 18 Feb 2020 01:20:50 -0700
+Subject: [PATCH] fdo: ensure xkb_data.state is not null before calling
+ xkb_state_update_mask (#180)
+
+[james.hilliard1 at gmail.com: backport from upstream commit
+9f1f1e64b65e6680d5cdedf5a3b753ef85fc01f4]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ platform/cog-platform-fdo.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/platform/cog-platform-fdo.c b/platform/cog-platform-fdo.c
+index 36177fc..e6f1cb5 100644
+--- a/platform/cog-platform-fdo.c
++++ b/platform/cog-platform-fdo.c
+@@ -894,6 +894,9 @@ keyboard_on_modifiers (void *data,
+                        uint32_t mods_locked,
+                        uint32_t group)
+ {
++    if (xkb_data.state == NULL)
++        return;
++
+     xkb_state_update_mask (xkb_data.state,
+                            mods_depressed,
+                            mods_latched,
+-- 
+2.20.1
+
