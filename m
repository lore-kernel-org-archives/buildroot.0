Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A41CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9EF60E0E;
	Sun,  5 Oct 2025 13:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tq2nWF0saTdL; Sun,  5 Oct 2025 13:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90EB760E1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90EB760E1C;
	Sun,  5 Oct 2025 13:25:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD5C226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 812B74129C
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4S8cUI03Ey7L for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDB86411FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB86411FC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB86411FC
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:25:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e5b7dfeb0so16284995e9.1
 for <buildroot@buildroot.org>; Sun, 05 Oct 2025 06:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759670701; x=1760275501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eozwT2Ij6lRMvw8aTxYFztmMCMNYHyDvJ6p1kJl4+0M=;
 b=W03Kq4yt8jwJa2O8llaxDQIyQ4X90uspwhr8fVOM9FbPx/Wh1oCd6YCY8Sz4+3Q6mP
 0bZ/CWsXZIe4y1d9nkM0dgMHNVTDugaMN/E1B8ihpMHnSbL9uQEycaIsp4vCY5K8lIvW
 9dy92pIXQa/sCpjKA/gaGxEwS/VEGZlAjVhKkARSqkxeOuUhKboyo1O3Ve6lmUuEi1Kh
 plPmfpK7Pqt+HTuMfxKPA8MfkN6JVqordO68irPIuxDehPayc0GtkZJvuAzUmnCFbBvf
 CL6G5PpGk9dRu+PcDKZnsggfPkjIe3dIxv/bNzyUlDZq4FXvuK47MEhZv14uw3uClNqn
 i2zQ==
X-Gm-Message-State: AOJu0YxRYe9DqY/FGYvCaSxkWjdYPey6XdSLloFqbPW5FdaPhTaRkWyN
 RXem4cWlX0YvyuYgqwavdlypBuoCak7sleiijYv/i9p6wjftBBRDV2xv
X-Gm-Gg: ASbGncvgvkUnq/XQ9AmEoY+NB8GP8tjYEcxGBJm0cHj0ZrOzpXhW9Vyhue/Bgr2ALSJ
 PpZ4ZH4aPZMnQtNdKIneBxIpnYUyXDXkxCZ3+n+z5uEcOaGFT8/CEEmmO87O/RvQXFkJJupS1R5
 oDx6OMox0bjj2ON9gRxjDSDC7cW+e1IpIm6QQa/wiRhpoWc114gy8lGsXs+7cOjIAAuWb991zxg
 wRN6/lzY6FswFcDP4Gox0NuyPdjO2aN+tE2c2aF7EQ+vhSjuDbst4lj9rdPXUTzgmkRrVaiYowm
 u2REbGwYU3fcSZ0icjFeYaFPlEvJ4aMbI3qoa/5Y6vB+1ZT7MBITJEakU3jZBUlGOzW40MtIJVP
 kmJAQd86YNoqdNuZcrcJk18wL2x3Kho+jT91vz7a2QQkIIN/M
X-Google-Smtp-Source: AGHT+IFxKUK/Exqb6lwg5uDQlqA9IhCb2tf18ab7PIMCBOV9GXle/YUtrHPBTXehIDFTKcLWNU4oPQ==
X-Received: by 2002:a05:600c:138d:b0:46e:506b:20c5 with SMTP id
 5b1f17b1804b1-46e7114425amr55016895e9.26.1759670700670; 
 Sun, 05 Oct 2025 06:25:00 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e61a020a3sm213932005e9.10.2025.10.05.06.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 06:24:59 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 05 Oct 2025 15:24:44 +0200
MIME-Version: 1.0
Message-Id: <20251005-waffle-v1-3-4aab4f497a8a@gmail.com>
References: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
In-Reply-To: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7236; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=82HciiQI/1b5BXsrEOYnfAKwxYCpk13yleDjEP1Nyvs=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBo4nGmbRh+r6IY45lJwCT6yjg9g0u9Wrsr/7woi
 tmuMlxq6CiJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaOJxpgAKCRDnIYpo1BLC
 tRTmD/48qZwv9dIb0U2h0DKZpu9Jgip9wFG7jT8Oh6Ic+cPKGUOy6mRULTQ4JSeFJu10r0Qgqtc
 Qiwgu35Ndt+5z1wKwEKDJzLJ0D/+FGeVWzQsm5jjF44SYiPb+z4qfeoLre2Qc44xk/B3501qHwx
 ZhxO0JQEMU8FRB95kP3w0W7C9xjYVI+b+hdROnP47oTVJkft+sgkfZBLuVmrXWdYbdGXE4eQkQT
 9KqN+GXEObAV6KCxhTujuCZeaQgjSgyPVEe197e+jY822XdHtd9WT0t8G5pAYluM1DjCMF1FDmH
 UKZ8Nl1Kb5X3xqCEZJrelI9q05lvwQUPKuwBm5Aa1mJgBrJlgQiBhhnpRg0UU11zNbtM6CgYLsO
 gbkBmzEQFCcYWPnNJH7+6Vn0kehHP8GEe//obU+4HyWGLUmmXHZ8HVViFJE4sRqraxS1hrj6LVi
 6DU/4QFzLjj404RCo5RiFcfsUhO5MWBW+g+vzEGGR1G6DIz/p7i9cTRfjDcpp0Vqwzz4bIPM0sZ
 dc2HnLm5vLTgHTDpioa9qlDBaQF/jJgtKWlc3yQwuAs8ZfO3gRg1VpBgaQEsZuFDyV69F5VrkbZ
 leSwOBnTQUE9ICijsO9POLycxsIuxCIqmxnxqb2HRZm3xSS98xwrnNTfshbSNmrgInHrvTnYLbF
 L7uYqS77G/2n65Q==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759670701; x=1760275501; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eozwT2Ij6lRMvw8aTxYFztmMCMNYHyDvJ6p1kJl4+0M=;
 b=DW+4+XP3TsS86f9bAc8Fbp1SuDaB4/m9YFzLbpmTr2U2/AQ7AfAqMOF9/EJX3x49lS
 FKor/oJ0JHZYcyXKOMWNwMzOeF/r9fvP4HwXXNq40Bp8TIwCYByFHDIAUmG2yEQtQfse
 U5aTyApyFGAvLGaDVGAqur/lMn3zRaylMdXL2rhKs7kZx6LkBHbUI7QYUBuh1SDfTVxL
 /r90YqSqn3CWVXNeIN00XdJ3tJDX61BPBUbd0uDU4xKvo2SLCS8TYLQmgV1sfGBcmxm3
 VIpdlmEPfanx30ElUckuMJdy9Pe8VyQnlboBgTyGj/XrV9NTN0p6FrJHAx7uoowcqlJp
 9uoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DW+4+XP3
Subject: [Buildroot] [PATCH 3/4] package/waffle: remove patches
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

Patches make no longer sense since they are either merged or related to
deprecated cmake build.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 ...rd-cflags-from-.pc-files-to-waffle-cflags.patch | 42 ---------------
 ...02-wayland-fix-build-against-version-1-20.patch | 59 ----------------------
 package/waffle/0003-drop-C-dependency.patch        | 46 -----------------
 3 files changed, 147 deletions(-)

diff --git a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch b/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
deleted file mode 100644
index b2a1294f24da581268031ab0ca753291b0997e17..0000000000000000000000000000000000000000
--- a/package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8b0ae49c8bea78df73c3ecae0059d54a95c561fa Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 24 Dec 2017 00:11:45 +0100
-Subject: [PATCH] cmake: forward cflags from *.pc files to waffle cflags
-
-When building mesa egl without x11 and gles2 the headers need a
-EGL_NO_X11 define to avoid including X11 headers.
-
-This define EGL_NO_X11 is lost while building waffle
-since CFLAGS defined by pc files are not used.
-
-EGL_NO_X11 is defined in CFLAGS from egl.pc.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/111]
----
- src/waffle/CMakeLists.txt | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/waffle/CMakeLists.txt b/src/waffle/CMakeLists.txt
-index d76e029..2ff72c8 100644
---- a/src/waffle/CMakeLists.txt
-+++ b/src/waffle/CMakeLists.txt
-@@ -5,6 +5,14 @@
- add_definitions(
-     -DWAFFLE_API_VERSION=${waffle_api_version}
-     -DWAFFLE_API_EXPERIMENTAL
-+    ${egl_CFLAGS}
-+    ${gbm_CFLAGS}
-+    ${gl_CFLAGS}
-+    ${GLEXT_CFLAGS}
-+    ${libudev_CFLAGS}
-+    ${wayland-client_CFLAGS}
-+    ${wayland-egl_CFLAGS}
-+    ${x11-xcb_CFLAGS}
-     )
- 
- include_directories(
--- 
-2.14.3
-
diff --git a/package/waffle/0002-wayland-fix-build-against-version-1-20.patch b/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
deleted file mode 100644
index d3b66180ec443150bfbf58b011c3075b934bae6e..0000000000000000000000000000000000000000
--- a/package/waffle/0002-wayland-fix-build-against-version-1-20.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 2c33597245bb74f19104f0a858cd40e80b26991d Mon Sep 17 00:00:00 2001
-From: Philipp Zabel <p.zabel@pengutronix.de>
-Date: Fri, 17 Dec 2021 13:46:40 +0100
-Subject: [PATCH] wayland: fix build against version 1.20
-
-Wayland 1.20 introduces two new symbols wl_proxy_marshal_flags and
-wl_proxy_marshal_array_flags, which need to be wrapped as well.
-
-Closes: https://gitlab.freedesktop.org/mesa/waffle/-/issues/76
-Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
-[Retrieved from:
-https://gitlab.freedesktop.org/mesa/waffle/-/commit/2c33597245bb74f19104f0a858cd40e80b26991d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/waffle/wayland/wayland_sym.h     | 18 ++++++++++++++++++
- src/waffle/wayland/wayland_wrapper.h |  2 ++
- 2 files changed, 20 insertions(+)
-
-diff --git a/src/waffle/wayland/wayland_sym.h b/src/waffle/wayland/wayland_sym.h
-index 3d48625..4c6ac8d 100644
---- a/src/waffle/wayland/wayland_sym.h
-+++ b/src/waffle/wayland/wayland_sym.h
-@@ -26,3 +26,21 @@ WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor,
- WAFFLE_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor_versioned,
-                    (struct wl_proxy *proxy, uint32_t opcode,
-                     const struct wl_interface *interface, uint32_t version, ...))
-+
-+WAFFLE_WAYLAND_SYM(struct wl_proxy *,
-+                   wl_proxy_marshal_flags,
-+                   (struct wl_proxy * p,
-+                    uint32_t opcode,
-+                    const struct wl_interface *interface,
-+                    uint32_t version,
-+                    uint32_t flags,
-+                    ...))
-+
-+WAFFLE_WAYLAND_SYM(struct wl_proxy *,
-+                   wl_proxy_marshal_array_flags,
-+                   (struct wl_proxy * p,
-+                    uint32_t opcode,
-+                    const struct wl_interface *interface,
-+                    uint32_t version,
-+                    uint32_t flags,
-+                    union wl_argument *args))
-diff --git a/src/waffle/wayland/wayland_wrapper.h b/src/waffle/wayland/wayland_wrapper.h
-index 4af2f64..6addf4f 100644
---- a/src/waffle/wayland/wayland_wrapper.h
-+++ b/src/waffle/wayland/wayland_wrapper.h
-@@ -65,5 +65,7 @@ struct wl_display;
- #define wl_proxy_marshal (*wfl_wl_proxy_marshal)
- #define wl_proxy_marshal_constructor (*wfl_wl_proxy_marshal_constructor)
- #define wl_proxy_marshal_constructor_versioned (*wfl_wl_proxy_marshal_constructor_versioned)
-+#define wl_proxy_marshal_flags (*wfl_wl_proxy_marshal_flags)
-+#define wl_proxy_marshal_array_flags (*wfl_wl_proxy_marshal_array_flags)
- 
- #include <wayland-client-protocol.h>
--- 
-GitLab
-
diff --git a/package/waffle/0003-drop-C-dependency.patch b/package/waffle/0003-drop-C-dependency.patch
deleted file mode 100644
index 89c0cd09f20a182565cf309f0626e45d9c359486..0000000000000000000000000000000000000000
--- a/package/waffle/0003-drop-C-dependency.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a54a5d086c5f7e0751f68ac1a2942d8077922ebc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Aug 2022 16:18:22 +0200
-Subject: [PATCH] drop C++ dependency
-
-C++ dependency has been added for nacl backend which has been added by
-https://gitlab.freedesktop.org/mesa/waffle/-/commit/6ca943584e593aec2bd4f9c66d91859e63e02d61
-and dropped by
-https://gitlab.freedesktop.org/mesa/waffle/-/commit/a7c7152b054e6d2b9af36ed9db9a0df44731b279
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- CMakeLists.txt            | 2 +-
- src/waffle/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index acece86..04ea68c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -23,7 +23,7 @@
- # OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--project(waffle1 C CXX)
-+project(waffle1 C)
- 
- cmake_minimum_required(VERSION 2.8.12)
- 
-diff --git a/src/waffle/CMakeLists.txt b/src/waffle/CMakeLists.txt
-index 8014b51..276f276 100644
---- a/src/waffle/CMakeLists.txt
-+++ b/src/waffle/CMakeLists.txt
-@@ -238,7 +238,7 @@ include_directories(
-     ${XCB_INCLUDE_DIRS}
-     )
- 
--add_library(${waffle_libname} SHARED ${waffle_sources} ${waffle_cxx_sources})
-+add_library(${waffle_libname} SHARED ${waffle_sources})
- 
- # Debian's packaging system emits warnings if wflinfo directly links to any
- # library that it doesn't directly use. Silence the warnings by annotating
--- 
-2.35.1
-

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
