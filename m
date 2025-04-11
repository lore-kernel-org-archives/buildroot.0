Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF28C369A8
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C7C40818;
	Fri, 11 Apr 2025 10:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydxdIvBST9YX; Fri, 11 Apr 2025 10:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0543A4239C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0543A4239C;
	Fri, 11 Apr 2025 10:45:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04647138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B35B46F5FA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mi32fXgVO3GX for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693A2610B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 693A2610B7
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 676E58212B; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:27 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 68feea01df4359375044bc5e1a74fa72b88bf09d
X-Git-Newrev: 611c49acf3513d910dc156878b6456661e3eb71d
X-Patchwork-Hint: ignore
Message-Id: <20250411104450.676E58212B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/mesa3d-demos: fix
 build failure on musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=611c49acf3513d910dc156878b6456661e3eb71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Patch has been on upstream main for close to 2 years.

The "uint" use was introduced with [1] and [2], released with
mesa3d-demos 9.0.0 from March 2023, and added to Buildroot with commit
80304d9911 "package/mesa3d-demos: bump version to 9.0.0". The affected
code is built only if Wayland and Vulkan support are enabled, that is:

BR2_PACKAGE_LIBDECOR=y
BR2_PACKAGE_VULKAN_LOADER=y
BR2_PACKAGE_WAYLAND=y

[1] https://gitlab.freedesktop.org/mesa/demos/-/commit/813ebef7671f0e54d1b55be9e15ae5586b2b9eb1
[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/5aaa7faeb4de9497535738830e6ebb8f10071877

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cf4f2f858d13aa8be1fc3d3215df66e64e7b57e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...3-vulkan-wsi-use-unsigned-instead-of-uint.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch b/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch
new file mode 100644
index 0000000000..160dc9010d
--- /dev/null
+++ b/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch
@@ -0,0 +1,68 @@
+From 3f4d5ff34e061f3d47b9cf28bff2fc588d8c5326 Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Thu, 23 Mar 2023 21:18:56 +0000
+Subject: [PATCH] vulkan/wsi: use unsigned instead of uint
+
+uint is not a standard type name and fails to build against musl libc
+
+Reviewed-by: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Upstream: https://gitlab.freedesktop.org/mesa/demos/-/commit/3f4d5ff34e061f3d47b9cf28bff2fc588d8c5326
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ src/vulkan/wsi/wayland.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/vulkan/wsi/wayland.c b/src/vulkan/wsi/wayland.c
+index 444d2bb81..5958d283a 100644
+--- a/src/vulkan/wsi/wayland.c
++++ b/src/vulkan/wsi/wayland.c
+@@ -128,7 +128,7 @@ dispatch_key(xkb_keycode_t xkb_key, enum wl_keyboard_key_state state)
+ }
+ 
+ static void
+-handle_key(uint key, enum wl_keyboard_key_state state)
++handle_key(unsigned key, enum wl_keyboard_key_state state)
+ {
+    xkb_keycode_t xkb_key = key + 8;
+    struct itimerspec timer = {0};
+@@ -151,15 +151,15 @@ handle_key(uint key, enum wl_keyboard_key_state state)
+ }
+ 
+ static void
+-key(void *data, struct wl_keyboard *keyboard, uint serial,
+-    uint time, uint key, enum wl_keyboard_key_state state)
++key(void *data, struct wl_keyboard *keyboard, unsigned serial,
++    unsigned time, unsigned key, enum wl_keyboard_key_state state)
+ {
+    handle_key(key, state);
+ }
+ 
+ static void
+-modifiers(void *data, struct wl_keyboard *keyboard, uint serial,
+-    uint mods_depressed, uint mods_latched, uint mods_locked, uint group)
++modifiers(void *data, struct wl_keyboard *keyboard, unsigned serial,
++    unsigned mods_depressed, unsigned mods_latched, unsigned mods_locked, unsigned group)
+ {
+    xkb_state_update_mask(keyboard_data.xkb_state, mods_depressed, mods_latched,
+                          mods_locked, 0, 0, group);
+@@ -184,7 +184,7 @@ keymap(void *data, struct wl_keyboard *keyboard,
+ }
+ 
+ static void
+-enter(void *data, struct wl_keyboard *keyboard, uint serial,
++enter(void *data, struct wl_keyboard *keyboard, unsigned serial,
+       struct wl_surface *surface, struct wl_array *keys)
+ {
+    uint32_t *key;
+@@ -194,7 +194,7 @@ enter(void *data, struct wl_keyboard *keyboard, uint serial,
+ }
+ 
+ static void
+-leave(void *data, struct wl_keyboard *keyboard, uint serial,
++leave(void *data, struct wl_keyboard *keyboard, unsigned serial,
+       struct wl_surface *surface)
+ {
+    struct itimerspec timer = {0};
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
