Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA2BC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 07:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDD3F400D0;
	Sat, 13 Jul 2024 07:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jt4ML9Gcuce2; Sat, 13 Jul 2024 07:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6CCB40175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6CCB40175;
	Sat, 13 Jul 2024 07:32:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CF831BF27A
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 07:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18477844F9
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 07:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WCZjBusMAzO for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 07:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76F52844F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F52844F3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C89486197; Sat, 13 Jul 2024 07:32:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 09:30:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 709cc0f0001d7cc3977bddfee6ca0e6bab1e567b
X-Git-Newrev: 4fad6b3c58abd20c533b67b85658bc66d015110b
X-Patchwork-Hint: ignore
Message-Id: <20240713073206.5C89486197@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opengl/libegl: remove
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fad6b3c58abd20c533b67b85658bc66d015110b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since wayland 1.15 (upstream commit
549a5ea710f4da1a5749587176d39fef1ded4077), libwayland-egl.so is
provided by the wayland package, so there is no longer a question of
whether libwayland-egl.so is provided by the particular EGL
implementation. See the Wayland commit log:

    wayland-egl: import libwayland-egl.so frontend library from Mesa

    Currently the client-facing libwayland-egl API is defined by a header
    file shipped by Wayland, but the implementation is left to each vendor.

    This can cause collisions when multiple implementations are installed on
    the same system. Importing the implementation into Wayland with a stable
    and versioned driver-facing ABI allows multiple drivers to coexist on
    the same system.

    Pull the sample implementation from Mesa commit 677edff5cfd
    ("wayland-egl: rework and simplify wl_egl_window initialization")
    It has been used by the Mesa open source drivers, NVIDIA and others[1].

    v2: Reword commit message, rebase on top of newer Mesa.

    [1] https://github.com/thayama/wayland-egl

Consequently, we remove the BR2_PACKAGE_HAS_LIBEGL_WAYLAND
option. Packages that rely on BR2_PACKAGE_HAS_LIBGLES and
BR2_PACKAGE_WAYLAND are guaranteed to have libwayland-egl.so.

Note that this doesn't solve the problem that libwayland-egl.so will be
provided both by wayland itself and by by the implementation
(rockchip-mali, sunxi-mali-utgard, ...). Still, there is a dependency
from the implementation on wayland so at least it is predictable which
one will end up on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: remove remaining references in sway and sunxi-mali-utgard]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/cage/Config.in                      | 4 +---
 package/freescale-imx/imx-gpu-viv/Config.in | 1 -
 package/kodi/Config.in                      | 1 -
 package/libgtk3/Config.in                   | 8 ++++----
 package/mesa3d/Config.in                    | 1 -
 package/nvidia-driver/Config.in             | 1 -
 package/opengl/libegl/Config.in             | 4 ----
 package/sunxi-mali-utgard/Config.in         | 1 -
 package/sway/Config.in                      | 4 +---
 package/vte/Config.in                       | 6 +++---
 package/waffle/Config.in                    | 2 +-
 package/waylandpp/Config.in                 | 6 +++---
 package/weston/Config.in                    | 6 +++---
 package/weston/weston.mk                    | 2 +-
 package/wlroots/Config.in                   | 5 ++---
 package/wpebackend-fdo/Config.in            | 6 +++---
 package/wpewebkit/Config.in                 | 4 +---
 17 files changed, 23 insertions(+), 39 deletions(-)

diff --git a/package/cage/Config.in b/package/cage/Config.in
index 0844d6ff62..4f823c768c 100644
--- a/package/cage/Config.in
+++ b/package/cage/Config.in
@@ -1,6 +1,5 @@
-comment "cage needs udev, EGL w/ Wayland backend and OpenGL ES support"
+comment "cage needs udev, EGL and OpenGL ES support"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_UDEV
 
@@ -13,7 +12,6 @@ config BR2_PACKAGE_CAGE
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	select BR2_PACKAGE_WLROOTS
diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index b8dff8f9ab..0a1be6ec13 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -51,7 +51,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
 	select BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 
 endchoice
 
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1ba6932de9..25c5758b85 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -36,7 +36,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # waylandpp
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # waylandpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # waylandpp
 	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 34b8d49eb3..c07957076e 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -6,10 +6,10 @@ comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
-comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
+comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
+	depends on !BR2_PACKAGE_HAS_LIBEGL && \
 		!BR2_PACKAGE_HAS_LIBGL
 
 config BR2_PACKAGE_LIBGTK3
@@ -21,7 +21,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+	depends on BR2_PACKAGE_HAS_LIBEGL || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
@@ -69,7 +69,7 @@ comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ h
 config BR2_PACKAGE_LIBGTK3_WAYLAND
 	bool "Wayland GDK backend"
 	default y
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 459051b2db..b88f21935e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -356,7 +356,6 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
-	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_MESA3D_GBM
 	help
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index a8617a939b..e4a9dde0a0 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -26,7 +26,6 @@ config BR2_PACKAGE_NVIDIA_DRIVER_XORG
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_HAS_LIBGLES
 
 if BR2_PACKAGE_NVIDIA_DRIVER_XORG
diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
index a236998947..f46d09ed71 100644
--- a/package/opengl/libegl/Config.in
+++ b/package/opengl/libegl/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_HAS_LIBEGL
 	bool
 
-config BR2_PACKAGE_HAS_LIBEGL_WAYLAND
-	bool
-	depends on BR2_PACKAGE_HAS_LIBEGL
-
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	string
 	depends on BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
index f70a6f645c..49da7e5721 100644
--- a/package/sunxi-mali-utgard/Config.in
+++ b/package/sunxi-mali-utgard/Config.in
@@ -53,7 +53,6 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
 config BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
 	bool "wayland"
 	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
-	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_WAYLAND
 
diff --git a/package/sway/Config.in b/package/sway/Config.in
index 4f6d9fb215..d78f792c48 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_SWAY
 	depends on !BR2_STATIC_LIBS # wlroots
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
@@ -54,11 +53,10 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
 endif # BR2_PACKAGE_SWAY
 
-comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
+comment "sway needs systemd, udev, EGL and OpenGL ES support"
 	depends on !BR2_PACKAGE_SYSTEMD || \
 		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		!BR2_PACKAGE_HAS_LIBGLES
 
 comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
diff --git a/package/vte/Config.in b/package/vte/Config.in
index 45d627885f..8a231a21af 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+	depends on BR2_PACKAGE_HAS_LIBEGL || \
 		BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGTK3
@@ -31,9 +31,9 @@ comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		BR2_TOOLCHAIN_USES_MUSL
 
-comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
+comment "vte needs an OpenGL or an OpenGL-EGL backend"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
+	depends on !BR2_PACKAGE_HAS_LIBEGL && \
 		!BR2_PACKAGE_HAS_LIBGL
diff --git a/package/waffle/Config.in b/package/waffle/Config.in
index ad622e9582..79cb4ca2ed 100644
--- a/package/waffle/Config.in
+++ b/package/waffle/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_WAFFLE_SUPPORTS_GLX
 
 config BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND
 	bool
-	default y if BR2_PACKAGE_WAYLAND && BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	default y if BR2_PACKAGE_WAYLAND && BR2_PACKAGE_HAS_LIBEGL
 
 config BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL
 	bool
diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
index 86ca965056..0713884d3e 100644
--- a/package/waylandpp/Config.in
+++ b/package/waylandpp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WAYLANDPP
 	bool "waylandpp"
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -10,9 +10,9 @@ config BR2_PACKAGE_WAYLANDPP
 
 	  https://github.com/NilsBrause/waylandpp
 
-comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
+comment "waylandpp needs an OpenGL-EGL backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9, C++ support"
 	depends on BR2_PACKAGE_WAYLAND
-	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+	depends on !BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/weston/Config.in b/package/weston/Config.in
index e83eeb0f74..8af2d19173 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -195,7 +195,7 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
 	depends on BR2_USE_WCHAR # pango
 	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_PANGO
 	help
 	  This enables the installation of Weston's demo clients.
@@ -212,11 +212,11 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	  Note: Weston has two sets of clients. See also the weston
 	  "simple clients" option.
 
-comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "demo clients needs an OpenGL ES/EGL provider and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
-		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_PACKAGE_HAS_LIBEGL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index bd5a0550b1..9292ba14b6 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -49,7 +49,7 @@ else
 WESTON_CONF_OPTS += -Dimage-webp=false
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 WESTON_CONF_OPTS += -Drenderer-gl=true
 WESTON_DEPENDENCIES += libegl libgbm libgles
 ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 7622a3033b..67c1b53969 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -1,6 +1,6 @@
-comment "wlroots needs udev, EGL w/ Wayland backend and OpenGL ES support"
+comment "wlroots needs udev, EGL and OpenGL ES support"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_UDEV
 
@@ -14,7 +14,6 @@ config BR2_PACKAGE_WLROOTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_HWDATA_PNP_IDS
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 8a8c820c9b..9b4dd28741 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -1,5 +1,5 @@
-comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable Wayland backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and EGL support"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_WPEBACKEND_FDO
@@ -9,7 +9,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBWPE
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index e4b0320e1d..8016367058 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -27,8 +27,7 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
-		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
 
 config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
@@ -41,7 +40,6 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
