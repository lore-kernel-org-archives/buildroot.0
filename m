Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63EBCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DCCE82AB9;
	Sun, 31 May 2026 17:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNaD_2Vm0Fuk; Sun, 31 May 2026 17:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AFC082C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780250281;
	bh=quo4js/Fj8RmWzkeoBUUVlCh8EDPTR8z8BpkcmrCqTs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DkScEsiLtT6jsEMo2wglB0DZ9xm/9/lgkmqInlN+/s4ZbBZiv5KhQugqSoK48j2JH
	 0vtM+lH8k2ErRjpSsr3HcGtWITkKw8fmFQQVq1Z2AAt/H0T5wlpq2aAyeyKqaAzOXE
	 mViCsXaxLr6OWE0uVMUesTVJpFT701LzpNvgPVmyDG/HChWFQoA7CjabM5xSd3uLub
	 tSHGlFky0Jb0lqfSsmmQpuMlaGfXkOeh1YD0NVu17KwYE1cM4ewnFaHAIaNdwyw6XV
	 hPOGAsYf3D1KUnTc8d3csNEBeSVi0XprjkbTvyhlCpm7pnAQ7NPASlwnNlXCC3SPOh
	 L5oMqKNdOGZ/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AFC082C61;
	Sun, 31 May 2026 17:58:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8652AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F402682C61
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LPZ-5huksA9 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E48D182D96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48D182D96
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E48D182D96
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:57:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6C03A4C2C3F;
 Sun, 31 May 2026 19:57:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39430)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTkQ8-000000001uf-38bG;
 Sun, 31 May 2026 17:57:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2026 19:57:56 +0200
Message-ID: <20260531175756.1682979-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780250276;
 bh=H32fTKPxHGDqPgn9ednPrr2M2zmykzjkvSjnjdc9rwI=;
 h=From:To:Cc:Subject:Date:From;
 b=dcAhnpwgz0iPM+8XZLXMDSQi2lyZ0IB6znflGn4XXsP/+VwzdVUJqiL9QZFxdMhyO
 q25zixvwB4QpU8A386SMvEsoXnTf+8LNZ+ag/qYRJ0iIeJl7Fs6TPVkVvQxLdcmk06
 eZ/Fpl3MfEIzoF889JkyN19WxKVgp60EQO5IqfA6+EByYjkFAvG9i18EAVLEexG/TR
 RquUjz9IfPcRtwxbB8mDtVCQ/y+DJo2juLMe3SmW7iaqitE2eZYl/ETX9W8Y1i7Nul
 f75QzJ1tD5+dZyQy2oxZd2EjwwU18WK8YP+LfpVVzZFseBeZVeISOgpYXKDxAcTAg5
 7GWMEUbEIX9rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dcAhnpwg
Subject: [Buildroot] [PATCH/next 1/1] package/weston: bump version to 15.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lore.freedesktop.org/wayland-devel/aespQ3LKAOy5O3Hx@xpredator/T/#u

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d75285f87704c195b5b608f5d03c2d6bb73b6001

with the exception of bootlin-aarch64-glibc-old:

  ../shared/client-buffer-util.c:31:27: fatal error: linux/dma-buf.h:
   No such file or directory

This error is not introduced by this bump, weston 15.0.0 shows the same
error: https://gitlab.com/bkuhls/buildroot/-/commits/284ee6da92fba0f075876209c534e99f54060afd

 ...guard-surface-output-creation-with-b.patch | 151 ------------------
 package/weston/weston.hash                    |   6 +-
 package/weston/weston.mk                      |   2 +-
 3 files changed, 4 insertions(+), 155 deletions(-)
 delete mode 100644 package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch

diff --git a/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch b/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
deleted file mode 100644
index 8d88730336..0000000000
--- a/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 60e0ec39183f932b7b4ba60070a5b2ac64b42d30 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Thu, 5 Mar 2026 17:29:06 +0100
-Subject: [PATCH] vulkan-renderer: guard surface output creation with backend
- defines
-
-Fix compilation errors when compiling with x11 or wayland backends
-disabled or not available.
-
-Fixes: 8f56d03d ("libweston: Vulkan renderer")
-
-Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/ba10e6d81462fc8628dd340ba9404e13745eae18
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- .../vulkan-renderer-internal.h                | 17 ++++++++++----
- libweston/renderer-vulkan/vulkan-renderer.c   | 22 +++++++++++++++----
- 2 files changed, 31 insertions(+), 8 deletions(-)
-
-diff --git a/libweston/renderer-vulkan/vulkan-renderer-internal.h b/libweston/renderer-vulkan/vulkan-renderer-internal.h
-index aadfc6e4..f8604227 100644
---- a/libweston/renderer-vulkan/vulkan-renderer-internal.h
-+++ b/libweston/renderer-vulkan/vulkan-renderer-internal.h
-@@ -35,17 +35,21 @@
- #include <stdbool.h>
- #include <time.h>
- 
--#include <wayland-util.h>
- #include <vulkan/vulkan.h>
- #include "shared/helpers.h"
- #include "libweston/libweston.h"
- #include "libweston/libweston-internal.h"
--#include <xcb/xcb.h>
- 
--#define VK_USE_PLATFORM_XCB_KHR
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- #define VK_USE_PLATFORM_WAYLAND_KHR
- #include <vulkan/vulkan_wayland.h>
-+#endif
-+
-+#if defined(BUILD_X11_COMPOSITOR)
-+#define VK_USE_PLATFORM_XCB_KHR
-+#include <xcb/xcb.h>
- #include <vulkan/vulkan_xcb.h>
-+#endif
- 
- #define MAX_NUM_IMAGES 5
- #define MAX_CONCURRENT_FRAMES 2
-@@ -173,10 +177,15 @@ struct vulkan_renderer {
- 	struct wl_list pipeline_list;
- 	struct dmabuf_allocator *allocator;
- 
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	PFN_vkCreateWaylandSurfaceKHR create_wayland_surface;
--	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
- 	PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR get_wayland_presentation_support;
-+#endif
-+
-+#if defined(BUILD_X11_COMPOSITOR)
-+	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
- 	PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR get_xcb_presentation_support;
-+#endif
- 
- 	PFN_vkGetImageMemoryRequirements2KHR get_image_memory_requirements2;
- 	PFN_vkGetMemoryFdPropertiesKHR get_memory_fd_properties;
-diff --git a/libweston/renderer-vulkan/vulkan-renderer.c b/libweston/renderer-vulkan/vulkan-renderer.c
-index 9f701913..b15eff46 100644
---- a/libweston/renderer-vulkan/vulkan-renderer.c
-+++ b/libweston/renderer-vulkan/vulkan-renderer.c
-@@ -303,16 +303,20 @@ static const struct vulkan_extension_table vulkan_inst_ext_table[] = {
- 		.name = VK_KHR_SURFACE_EXTENSION_NAME,
- 		.flag = EXTENSION_KHR_SURFACE,
- 	},
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	{
- 		.name = VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME,
- 		.flag = EXTENSION_KHR_WAYLAND_SURFACE,
- 		.instance_dep = EXTENSION_KHR_SURFACE,
- 	},
-+#endif
-+#if defined(BUILD_X11_COMPOSITOR)
- 	{
- 		.name = VK_KHR_XCB_SURFACE_EXTENSION_NAME,
- 		.flag = EXTENSION_KHR_XCB_SURFACE,
- 		.instance_dep = EXTENSION_KHR_SURFACE,
- 	},
-+#endif
- };
- 
- /* Keep in sync with vulkan-renderer-internal.h. */
-@@ -3455,9 +3459,12 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
- 	struct vulkan_renderer *vr = get_renderer(ec);
- 	struct vulkan_output_state *vo = get_output_state(output);
- 	VkResult result;
--	VkBool32 supported;
-+	VkBool32 supported = 0;
- 	assert(vulkan_instance_has(vr, EXTENSION_KHR_SURFACE));
- 
-+	vo->swapchain.surface = VK_NULL_HANDLE;
-+
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	if (options->wayland_display && options->wayland_surface) {
- 		assert(vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE));
- 
-@@ -3472,7 +3479,10 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
- 		result = vr->create_wayland_surface(vr->inst, &wayland_surface_create_info, NULL,
- 						    &vo->swapchain.surface);
- 		check_vk_success(result, "vkCreateWaylandSurfaceKHR");
--	} else if (options->xcb_connection && options->xcb_window) {
-+	}
-+#endif
-+#if defined(BUILD_X11_COMPOSITOR)
-+	if (options->xcb_connection && options->xcb_window) {
- 		assert(vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE));
- 
- 		supported = vr->get_xcb_presentation_support(vr->phys_dev, 0, options->xcb_connection, options->xcb_visualid);
-@@ -3486,9 +3496,9 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
- 		result = vr->create_xcb_surface(vr->inst, &xcb_surface_create_info, NULL,
- 						&vo->swapchain.surface);
- 		check_vk_success(result, "vkCreateXcbSurfaceKHR");
--	} else {
--		assert(0);
- 	}
-+#endif
-+	assert(vo->swapchain.surface != VK_NULL_HANDLE);
- 
- 	vkGetPhysicalDeviceSurfaceSupportKHR(vr->phys_dev, 0, vo->swapchain.surface, &supported);
- 	assert(supported);
-@@ -4190,15 +4200,19 @@ load_instance_proc(struct vulkan_renderer *vr, const char *func, void *proc_ptr)
- static void
- vulkan_renderer_setup_instance_extensions(struct vulkan_renderer *vr)
- {
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	if (vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE)) {
- 		load_instance_proc(vr, "vkCreateWaylandSurfaceKHR", &vr->create_wayland_surface);
- 		load_instance_proc(vr, "vkGetPhysicalDeviceWaylandPresentationSupportKHR", &vr->get_wayland_presentation_support);
- 	}
-+#endif
- 
-+#if defined(BUILD_X11_COMPOSITOR)
- 	if (vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE)) {
- 		load_instance_proc(vr, "vkCreateXcbSurfaceKHR", &vr->create_xcb_surface);
- 		load_instance_proc(vr, "vkGetPhysicalDeviceXcbPresentationSupportKHR", &vr->get_xcb_presentation_support);
- 	}
-+#endif
- }
- 
- static void
--- 
-2.43.0
-
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 24f0f08bab..b002942696 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/
-sha256  58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973  weston-15.0.0.tar.xz
-sha512  1196db00b473f036ba290e1073729c2b9e29ac061d9687b30dfad14e3b139313d3ca9c8000838e1b9c39713e96a2c544ec05d80bafad0b8ea1d1f380befa250d  weston-15.0.0.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/aespQ3LKAOy5O3Hx@xpredator/T/#u
+sha256  551d039bfb0c837ba5a4d027cdb8ee16bded0eedb789821f8025d8a64b791f6d  weston-15.0.1.tar.xz
+sha512  555731ddfaf7e3ef9bf43be682e20338ee207b434a72011b730c9b0ebde4daeaeb9cc9d09a707c32798f0184a55144f64e818551efe7e71413876e45e3cb3523  weston-15.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e160c89477..5caf5903d1 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 15.0.0
+WESTON_VERSION = 15.0.1
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
