Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C274F436A8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 14:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D3C40DA8;
	Fri, 17 Apr 2026 14:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xh57xLk_SUR0; Fri, 17 Apr 2026 14:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8AF540DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776435774;
	bh=1/HOccWakbWNhL70jYpcpQ+1jGGoL2ohm5CcaGbON0A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUGUNYmkAcMTGJdwY2Tp0MA/ztUbmV3O8Jvj1FStZJ3+we19RBNzIdA1hzBEjfOPI
	 3QrP/SU58sUGj+sQx1m7p4/SaA2eMzmRRWbo8D0ShSkuni/S5viu3PxrfchrKkDJY8
	 g8vXmrohp+g3/oyPP/VKo7jgOYWTKcwxkLJYIRdwpeWWGmcToiiOVlLqxYWppmvMiM
	 3ICmyCyy9VL7pfP+F4Vple5venCHIdKedX6yNwyDxgtSGoHZwRxrTiqeB4D7C7Szcx
	 4FYs958dv5Ep08QH0RnvZTThveTElcccp+V5QlEYItgibh8AYPkKgho+sGOU9jANJz
	 m3Iz2cJB+lk4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8AF540DA4;
	Fri, 17 Apr 2026 14:22:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4F6270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4346F405CC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAPd4btxuVwa for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 14:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71178401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71178401A2
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71178401A2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:22:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so6946865e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776435769; x=1777040569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NpoEYNnqr5Kj9l1lRaOZbXP/wqxBm9QhAWOg3Eph81k=;
 b=L5FhUTzUGRN6Tvibvjt5/zbSFabULFCbB+OHzZWUJ6kWfrTFIYJvS/TMBWm1/zlOLH
 HOWOS6McWyUsF5ubraQpPLeoSwmq4AAYnc0THvsjQpYEIjZMnIHZ6wGToUI4Z3DE6uRa
 7fTTj4sHbPsspgZflndM142BXGKrX+dFReNVNT1xTIN3nbEO7pZYHxRAiMdzV9Z6x99K
 eNFzVvSYmssJemSBrvka75Y0/XzpQUw+8Is1IjM8i4tvYwr7RJm/n/8tZiPMlJio1dfF
 GZN+F2vXsdtZxn4hqXD4L4zljU9HTBztFIZWu5z4lSYg16IGSp+e6usk9+Iu58clqQkd
 9W3g==
X-Gm-Message-State: AOJu0YyhqhbIx0oQwk4unRbFcWyvP4p2wSu82jrowSfh8YR+67O16p6g
 AQ1LUwZLRaTiKlD/3wuuuXDibEPQogihfmhv9u03OyIHy5Ot9p9k0jYpt8fyaA==
X-Gm-Gg: AeBDievA2w+lIq8zXjGG9dEGx1/zepLDHMxii6hYOb7JlQY4tYgsXp39bbxRjq+cn4M
 akjrSFtpEQ3phVL43eNy/7S2xoO2I8nUE2M6VReMEN37mBoSozWjGMc79q4US7jb9qvuxL+FwNt
 e9s7DJ+IrU3eCfZKszypX7er0QySYmj0BNT6Z3XDEelytZIxTAiq28gA2UgJUAC1e/JU+m70nUK
 CBCz1DaX9sVQC0biT+M9RazLFBPvtRaysxgtJc1uB8qma6/VgEDnZRprAeytThAQ+zmthX35Gyb
 5efonqViL/oyovx6/Zv7DbStutVL2oMAZ2QclzBQEEufcOGWqkg2dmDg05eSr22EbLDApEpYPtb
 deZZ665CpaeJiXTC158WotzJHHOQZt/CMntYkDUqsV+iiK0MourUom9LYgUYYrjTNQne87w+DYy
 q7BFCM6ddGEDBMpr0zxFYIUYkMRJvuK4M9kFczgnO008MSEkW4/S2vC9o/aFmd6lJks0Si9Y0ag
 SBtJaa/KjCobM57x85OTAZAYBfMl5U8GRXiwg7ErzoeJe15b6QjBNiwwbS9gau52SdbDjpykQ8D
 pwYFSaCQvDaqiq02pgM=
X-Received: by 2002:a05:600c:3110:b0:487:243f:dc3e with SMTP id
 5b1f17b1804b1-488fb739cf6mr42468035e9.6.1776435768908; 
 Fri, 17 Apr 2026 07:22:48 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm55355665e9.2.2026.04.17.07.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 07:22:48 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Fri, 17 Apr 2026 16:22:44 +0200
Message-ID: <20260417142244.18803-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417142244.18803-1-thomas@devoogdt.com>
References: <20260417142244.18803-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/2] package/weston: bump to 15.0.0
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Announcement:

- 14.0.91: https://lore.freedesktop.org/wayland-devel/aUkQG3KWNC3drDYd@xpredator/T/#u
- 14.0.92: https://lore.freedesktop.org/wayland-devel/aWUJ7MMZmM5yrhSx@xpredator/T/#u
- 14.0.93: https://lore.freedesktop.org/wayland-devel/aW3jJBLBT_UXv1RT@xpredator/T/#u
- 14.0.94: https://lore.freedesktop.org/wayland-devel/aXcyB9n8QaRyFRxw@xpredator/T/#u
- 14.0.95: https://lore.freedesktop.org/wayland-devel/aYHCEa_-Q_v16WNn@xpredator/T/#u
- 14.0.96: https://lore.freedesktop.org/wayland-devel/aY9Vp5A3S-FpQbjC@xpredator/T/#u
- 14.0.97: https://lore.freedesktop.org/wayland-devel/aY9gbvuzD41IaNfo@xpredator/T/#u
- 15.0.0:  https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/T/#u

Changes:

- Support for renderer-vulkan, and shell-lua has been added.

- Some features, drm-screencast-vaapi, shell-fullscreen, and screenshare
  are now deprecated, but kept for this release.

- 0001-build-Allow-libdisplay-info-0.3.0.patch is dropped as it is upstream.

- 0001-vulkan-renderer-guard-surface-output-creation-with-b.patch has been added
  to fix a dependency on <xcb/xcb.h>, which is already upstream.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...01-build-Allow-libdisplay-info-0.3.0.patch |  37 -----
 ...guard-surface-output-creation-with-b.patch | 151 ++++++++++++++++++
 package/weston/Config.in                      |  17 ++
 package/weston/weston.hash                    |   6 +-
 package/weston/weston.mk                      |  28 +++-
 5 files changed, 192 insertions(+), 47 deletions(-)
 delete mode 100644 package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
 create mode 100644 package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch

diff --git a/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch b/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
deleted file mode 100644
index d97d1a9bf41..00000000000
--- a/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 83b49400c1dfb72e3019267fd03f165d0bffec76 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Mon, 6 Oct 2025 15:20:26 +0200
-Subject: [PATCH] build: Allow libdisplay-info 0.3.0
-
-This is a backport of the change in upstream commit
-683eabb61ec43a270f2e3ed67c63bbe3754b1214 "build: Allow libdisplay-info 0.3.0"
-[1], applying the loosened version limit to the DRM backend only. The dependency
-definition was moved to the top level meson.build in [2], and the lower bound
-increased in [3].
-
-[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214
-[2] https://gitlab.freedesktop.org/wayland/weston/-/commit/76e659f45edd23a8b1b253a93316ec73c709bc71
-[3] https://gitlab.freedesktop.org/wayland/weston/-/commit/82c5b386d860a479ed5a157f4dde58ffe202b948
-
-Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214 (backported)
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- libweston/backend-drm/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
-index 002669e6..a8f2ea59 100644
---- a/libweston/backend-drm/meson.build
-+++ b/libweston/backend-drm/meson.build
-@@ -4,7 +4,7 @@ endif
- 
- dep_libdisplay_info = dependency(
- 	'libdisplay-info',
--	version: ['>= 0.1.1', '< 0.3.0'],
-+	version: ['>= 0.1.1', '< 0.4.0'],
- 	fallback: ['display-info', 'di_dep'],
- 	default_options: [
- 		'werror=false',
--- 
-2.51.0
-
diff --git a/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch b/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
new file mode 100644
index 00000000000..8d887303360
--- /dev/null
+++ b/package/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
@@ -0,0 +1,151 @@
+From 60e0ec39183f932b7b4ba60070a5b2ac64b42d30 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Thu, 5 Mar 2026 17:29:06 +0100
+Subject: [PATCH] vulkan-renderer: guard surface output creation with backend
+ defines
+
+Fix compilation errors when compiling with x11 or wayland backends
+disabled or not available.
+
+Fixes: 8f56d03d ("libweston: Vulkan renderer")
+
+Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/ba10e6d81462fc8628dd340ba9404e13745eae18
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ .../vulkan-renderer-internal.h                | 17 ++++++++++----
+ libweston/renderer-vulkan/vulkan-renderer.c   | 22 +++++++++++++++----
+ 2 files changed, 31 insertions(+), 8 deletions(-)
+
+diff --git a/libweston/renderer-vulkan/vulkan-renderer-internal.h b/libweston/renderer-vulkan/vulkan-renderer-internal.h
+index aadfc6e4..f8604227 100644
+--- a/libweston/renderer-vulkan/vulkan-renderer-internal.h
++++ b/libweston/renderer-vulkan/vulkan-renderer-internal.h
+@@ -35,17 +35,21 @@
+ #include <stdbool.h>
+ #include <time.h>
+ 
+-#include <wayland-util.h>
+ #include <vulkan/vulkan.h>
+ #include "shared/helpers.h"
+ #include "libweston/libweston.h"
+ #include "libweston/libweston-internal.h"
+-#include <xcb/xcb.h>
+ 
+-#define VK_USE_PLATFORM_XCB_KHR
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ #define VK_USE_PLATFORM_WAYLAND_KHR
+ #include <vulkan/vulkan_wayland.h>
++#endif
++
++#if defined(BUILD_X11_COMPOSITOR)
++#define VK_USE_PLATFORM_XCB_KHR
++#include <xcb/xcb.h>
+ #include <vulkan/vulkan_xcb.h>
++#endif
+ 
+ #define MAX_NUM_IMAGES 5
+ #define MAX_CONCURRENT_FRAMES 2
+@@ -173,10 +177,15 @@ struct vulkan_renderer {
+ 	struct wl_list pipeline_list;
+ 	struct dmabuf_allocator *allocator;
+ 
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	PFN_vkCreateWaylandSurfaceKHR create_wayland_surface;
+-	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
+ 	PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR get_wayland_presentation_support;
++#endif
++
++#if defined(BUILD_X11_COMPOSITOR)
++	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
+ 	PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR get_xcb_presentation_support;
++#endif
+ 
+ 	PFN_vkGetImageMemoryRequirements2KHR get_image_memory_requirements2;
+ 	PFN_vkGetMemoryFdPropertiesKHR get_memory_fd_properties;
+diff --git a/libweston/renderer-vulkan/vulkan-renderer.c b/libweston/renderer-vulkan/vulkan-renderer.c
+index 9f701913..b15eff46 100644
+--- a/libweston/renderer-vulkan/vulkan-renderer.c
++++ b/libweston/renderer-vulkan/vulkan-renderer.c
+@@ -303,16 +303,20 @@ static const struct vulkan_extension_table vulkan_inst_ext_table[] = {
+ 		.name = VK_KHR_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_SURFACE,
+ 	},
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	{
+ 		.name = VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_WAYLAND_SURFACE,
+ 		.instance_dep = EXTENSION_KHR_SURFACE,
+ 	},
++#endif
++#if defined(BUILD_X11_COMPOSITOR)
+ 	{
+ 		.name = VK_KHR_XCB_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_XCB_SURFACE,
+ 		.instance_dep = EXTENSION_KHR_SURFACE,
+ 	},
++#endif
+ };
+ 
+ /* Keep in sync with vulkan-renderer-internal.h. */
+@@ -3455,9 +3459,12 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 	struct vulkan_renderer *vr = get_renderer(ec);
+ 	struct vulkan_output_state *vo = get_output_state(output);
+ 	VkResult result;
+-	VkBool32 supported;
++	VkBool32 supported = 0;
+ 	assert(vulkan_instance_has(vr, EXTENSION_KHR_SURFACE));
+ 
++	vo->swapchain.surface = VK_NULL_HANDLE;
++
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	if (options->wayland_display && options->wayland_surface) {
+ 		assert(vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE));
+ 
+@@ -3472,7 +3479,10 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 		result = vr->create_wayland_surface(vr->inst, &wayland_surface_create_info, NULL,
+ 						    &vo->swapchain.surface);
+ 		check_vk_success(result, "vkCreateWaylandSurfaceKHR");
+-	} else if (options->xcb_connection && options->xcb_window) {
++	}
++#endif
++#if defined(BUILD_X11_COMPOSITOR)
++	if (options->xcb_connection && options->xcb_window) {
+ 		assert(vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE));
+ 
+ 		supported = vr->get_xcb_presentation_support(vr->phys_dev, 0, options->xcb_connection, options->xcb_visualid);
+@@ -3486,9 +3496,9 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 		result = vr->create_xcb_surface(vr->inst, &xcb_surface_create_info, NULL,
+ 						&vo->swapchain.surface);
+ 		check_vk_success(result, "vkCreateXcbSurfaceKHR");
+-	} else {
+-		assert(0);
+ 	}
++#endif
++	assert(vo->swapchain.surface != VK_NULL_HANDLE);
+ 
+ 	vkGetPhysicalDeviceSurfaceSupportKHR(vr->phys_dev, 0, vo->swapchain.surface, &supported);
+ 	assert(supported);
+@@ -4190,15 +4200,19 @@ load_instance_proc(struct vulkan_renderer *vr, const char *func, void *proc_ptr)
+ static void
+ vulkan_renderer_setup_instance_extensions(struct vulkan_renderer *vr)
+ {
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	if (vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE)) {
+ 		load_instance_proc(vr, "vkCreateWaylandSurfaceKHR", &vr->create_wayland_surface);
+ 		load_instance_proc(vr, "vkGetPhysicalDeviceWaylandPresentationSupportKHR", &vr->get_wayland_presentation_support);
+ 	}
++#endif
+ 
++#if defined(BUILD_X11_COMPOSITOR)
+ 	if (vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE)) {
+ 		load_instance_proc(vr, "vkCreateXcbSurfaceKHR", &vr->create_xcb_surface);
+ 		load_instance_proc(vr, "vkGetPhysicalDeviceXcbPresentationSupportKHR", &vr->get_xcb_presentation_support);
+ 	}
++#endif
+ }
+ 
+ static void
+-- 
+2.43.0
+
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 614fef6bcc0..774b75d5fbd 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -144,6 +144,14 @@ comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
+config BR2_PACKAGE_WESTON_VULKAN
+	bool "Vulkan support"
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_VULKAN_LOADER
+
+comment "Vulkan support needs gbm"
+	depends on !BR2_PACKAGE_HAS_LIBGBM
+
 # Weston needs at least one shell; this can be one of the bundled ones,
 # below, of from a third-party package, which should then select this.
 config BR2_PACKAGE_WESTON_HAS_SHELL
@@ -168,6 +176,15 @@ config BR2_PACKAGE_WESTON_SHELL_KIOSK
 	default y
 	select BR2_PACKAGE_WESTON_HAS_SHELL
 
+config BR2_PACKAGE_WESTON_SHELL_LUA
+	bool "lua shell"
+	default y
+	depends on BR2_PACKAGE_LUA_5_4
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
+comment "lua shell needs a Lua >= 5.4"
+	depends on !BR2_PACKAGE_LUA_5_4
+
 config BR2_PACKAGE_WESTON_SCREENSHARE
 	bool "screenshare"
 	default y
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index cd2a82508d4..24f0f08bab4 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2025-April/044158.html
-sha256  b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac  weston-14.0.2.tar.xz
-sha512  e8214ec893e6c3ae94eb3c92feba104b0201843e9143f726a3e9a4d396d02523c94da706c1348cf934bc339fb1a4bc1fecdb865f0ea914115fd346d9eda091f5  weston-14.0.2.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/
+sha256  58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973  weston-15.0.0.tar.xz
+sha512  1196db00b473f036ba290e1073729c2b9e29ac061d9687b30dfad14e3b139313d3ca9c8000838e1b9c39713e96a2c544ec05d80bafad0b8ea1d1f380befa250d  weston-15.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 57869b7e63f..e160c89477d 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 14.0.2
+WESTON_VERSION = 15.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -70,6 +70,13 @@ WESTON_CONF_OPTS += \
 	-Dbackend-pipewire=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_VULKAN),y)
+WESTON_CONF_OPTS += -Drenderer-vulkan=true
+WESTON_DEPENDENCIES += host-python-glslang libgbm vulkan-loader
+else
+WESTON_CONF_OPTS += -Drenderer-vulkan=false
+endif
+
 WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
 
 ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
@@ -115,10 +122,10 @@ WESTON_CONF_OPTS += -Dxwayland=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVA),y)
-WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=true
+WESTON_CONF_OPTS += -Ddeprecated-backend-drm-screencast-vaapi=true
 WESTON_DEPENDENCIES += libva
 else
-WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=false
+WESTON_CONF_OPTS += -Ddeprecated-backend-drm-screencast-vaapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
@@ -149,9 +156,9 @@ WESTON_CONF_OPTS += -Dshell-desktop=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_SHELL_FULLSCREEN),y)
-WESTON_CONF_OPTS += -Dshell-fullscreen=true
+WESTON_CONF_OPTS += -Ddeprecated-shell-fullscreen=true
 else
-WESTON_CONF_OPTS += -Dshell-fullscreen=false
+WESTON_CONF_OPTS += -Ddeprecated-shell-fullscreen=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_SHELL_IVI),y)
@@ -166,10 +173,17 @@ else
 WESTON_CONF_OPTS += -Dshell-kiosk=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_LUA),y)
+WESTON_DEPENDENCIES += lua
+WESTON_CONF_OPTS += -Dshell-lua=true
+else
+WESTON_CONF_OPTS += -Dshell-lua=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_SCREENSHARE),y)
-WESTON_CONF_OPTS += -Dscreenshare=true
+WESTON_CONF_OPTS += -Ddeprecated-screenshare=true
 else
-WESTON_CONF_OPTS += -Dscreenshare=false
+WESTON_CONF_OPTS += -Ddeprecated-screenshare=false
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
